from fastapi import APIRouter, HTTPException
from typing import List
from app.schemas.tryon import TryOnCreate, TryOnResponse, ClothingAnalysis, ReviewCreate, ReviewResponse
from app.services.ai_service import generate_tryon, analyze_clothing

router = APIRouter()

tryons_db = []
reviews_db = []

@router.post("/tryon/generate", response_model=TryOnResponse)
async def create_tryon(payload: TryOnCreate):
    """Gera um virtual try-on com IA."""
    try:
        # Em producao, baixar as imagens das URLs e converter para base64
        result = await generate_tryon(
            "",  # user_photo_b64 sera processado
            "",  # clothing_photo_b64 sera processado
            payload.clothing_description
        )
        tryon = TryOnResponse(
            id=str(len(tryons_db) + 1),
            image_url=result["image_url"],
            description=result["description"],
            fit_assessment=result["fit_assessment"],
            style_tips=result["style_tips"],
            occasions=result["occasions"],
            rating=result["rating"],
            votes=0,
            created_at="2026-05-17T22:00:00",
        )
        tryons_db.append(tryon)
        return tryon
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.post("/clothing/analyze", response_model=ClothingAnalysis)
async def analyze_clothing_endpoint(image_b64: str):
    """Analisa uma peca de roupa a partir da imagem."""
    try:
        return await analyze_clothing(image_b64)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/tryon/feed", response_model=List[TryOnResponse])
async def get_feed(limit: int = 20, offset: int = 0):
    """Feed social de try-ons."""
    return tryons_db[offset:offset + limit]

@router.post("/tryon/vote")
async def vote_tryon(tryon_id: str):
    """Vota em um try-on."""
    for t in tryons_db:
        if t.id == tryon_id:
            t.votes += 1
            return {"success": True, "votes": t.votes}
    raise HTTPException(status_code=404, detail="Try-on not found")

@router.post("/reviews", response_model=ReviewResponse)
async def create_review(payload: ReviewCreate):
    """Cria uma review de um try-on."""
    review = ReviewResponse(
        id=str(len(reviews_db) + 1),
        tryon_id=payload.tryon_id,
        rating=payload.rating,
        comment=payload.comment,
        created_at="2026-05-17T22:00:00",
    )
    reviews_db.append(review)
    return review

@router.get("/reviews/{tryon_id}")
async def get_reviews(tryon_id: str):
    """Retorna reviews de um try-on."""
    return [r for r in reviews_db if r.tryon_id == tryon_id]
