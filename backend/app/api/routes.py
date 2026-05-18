from fastapi import APIRouter, HTTPException, Depends, Header
from typing import List, Optional
from uuid import uuid4
from datetime import datetime
import json

from app.schemas.tryon import TryOnCreate, TryOnResponse, ClothingAnalysis, ReviewCreate, ReviewResponse
from app.services.ai_service import generate_tryon, analyze_clothing
from app.models.tryon import get_db, User, TryOn, Vote, Review
from app.core.auth import issue_token, verify_token
from sqlalchemy.orm import Session

router = APIRouter()

def get_current_user(authorization: Optional[str] = Header(None), db: Session = Depends(get_db)) -> User:
    if not authorization or not authorization.startswith("Bearer "):
        raise HTTPException(status_code=401, detail="Missing authorization header")
    token = authorization.split(" ")[1]
    payload = verify_token(token)
    if not payload:
        raise HTTPException(status_code=401, detail="Invalid or expired token")
    user = db.query(User).filter(User.id == payload["sub"]).first()
    if not user:
        raise HTTPException(status_code=401, detail="User not found")
    return user

@router.post("/auth/anonymous")
async def anonymous_session(db: Session = Depends(get_db)):
    user_id = f"anon:{uuid4().hex}"
    user = User(id=user_id)
    db.add(user)
    db.commit()
    db.refresh(user)
    token = issue_token(user_id)
    return {"user_id": user_id, "token": token}

@router.post("/tryon/generate", response_model=TryOnResponse)
async def create_tryon(payload: TryOnCreate, user: User = Depends(get_current_user), db: Session = Depends(get_db)):
    try:
        result = await generate_tryon("", "", payload.clothing_description)
        tryon_id = str(uuid4())
        tryon = TryOn(
            id=tryon_id,
            user_id=user.id,
            image_url=result.get("image_url", ""),
            description=result["description"],
            fit_assessment=result["fit_assessment"],
            style_tips=json.dumps(result.get("style_tips", [])),
            occasions=json.dumps(result.get("occasions", [])),
            rating=result["rating"],
            votes=0,
            created_at=datetime.utcnow()
        )
        db.add(tryon)
        db.commit()
        db.refresh(tryon)
        
        return TryOnResponse(
            id=tryon.id,
            image_url=tryon.image_url,
            description=tryon.description,
            fit_assessment=tryon.fit_assessment,
            style_tips=json.loads(tryon.style_tips) if tryon.style_tips else [],
            occasions=json.loads(tryon.occasions) if tryon.occasions else [],
            rating=tryon.rating,
            votes=tryon.votes,
            created_at=tryon.created_at
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.post("/clothing/analyze", response_model=ClothingAnalysis)
async def analyze_clothing_endpoint(image_b64: str, db: Session = Depends(get_db)):
    try:
        return await analyze_clothing(image_b64)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/tryon/feed", response_model=List[TryOnResponse])
async def get_feed(limit: int = 20, offset: int = 0, db: Session = Depends(get_db)):
    tryons = db.query(TryOn).order_by(TryOn.created_at.desc()).offset(offset).limit(limit).all()
    return [
        TryOnResponse(
            id=t.id,
            image_url=t.image_url,
            description=t.description,
            fit_assessment=t.fit_assessment,
            style_tips=json.loads(t.style_tips) if t.style_tips else [],
            occasions=json.loads(t.occasions) if t.occasions else [],
            rating=t.rating,
            votes=t.votes,
            created_at=t.created_at
        )
        for t in tryons
    ]

@router.post("/tryon/vote")
async def vote_tryon(tryon_id: str, user: User = Depends(get_current_user), db: Session = Depends(get_db)):
    tryon = db.query(TryOn).filter(TryOn.id == tryon_id).first()
    if not tryon:
        raise HTTPException(status_code=404, detail="Try-on not found")
    existing = db.query(Vote).filter(Vote.user_id == user.id, Vote.tryon_id == tryon_id).first()
    if existing:
        raise HTTPException(status_code=400, detail="Already voted")
    vote = Vote(id=str(uuid4()), user_id=user.id, tryon_id=tryon_id)
    db.add(vote)
    tryon.votes += 1
    db.commit()
    return {"success": True, "votes": tryon.votes}

@router.post("/reviews", response_model=ReviewResponse)
async def create_review(payload: ReviewCreate, user: User = Depends(get_current_user), db: Session = Depends(get_db)):
    review = Review(
        id=str(uuid4()),
        user_id=user.id,
        tryon_id=payload.tryon_id,
        rating=payload.rating,
        comment=payload.comment,
        created_at=datetime.utcnow()
    )
    db.add(review)
    db.commit()
    db.refresh(review)
    return ReviewResponse(
        id=review.id,
        tryon_id=review.tryon_id,
        rating=review.rating,
        comment=review.comment,
        created_at=review.created_at
    )

@router.get("/reviews/{tryon_id}")
async def get_reviews(tryon_id: str, db: Session = Depends(get_db)):
    reviews = db.query(Review).filter(Review.tryon_id == tryon_id).order_by(Review.created_at.desc()).all()
    return [
        ReviewResponse(
            id=r.id,
            tryon_id=r.tryon_id,
            rating=r.rating,
            comment=r.comment,
            created_at=r.created_at
        )
        for r in reviews
    ]

@router.delete("/users/me")
async def delete_account(user: User = Depends(get_current_user), db: Session = Depends(get_db)):
    db.delete(user)
    db.commit()
    return {"success": True}
