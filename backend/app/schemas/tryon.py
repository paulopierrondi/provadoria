from pydantic import BaseModel
from typing import Optional, List
from datetime import datetime

class TryOnCreate(BaseModel):
    user_photo_url: str
    clothing_photo_url: str
    clothing_description: Optional[str] = None

class TryOnResponse(BaseModel):
    id: str
    image_url: str
    description: str
    fit_assessment: str
    style_tips: List[str]
    occasions: List[str]
    rating: float
    votes: int = 0
    created_at: datetime

class ClothingAnalysis(BaseModel):
    name: str
    category: str
    color: str
    pattern: str
    style: str
    season: str

class ReviewCreate(BaseModel):
    tryon_id: str
    rating: int
    comment: Optional[str] = None

class ReviewResponse(BaseModel):
    id: str
    tryon_id: str
    rating: int
    comment: Optional[str]
    created_at: datetime
