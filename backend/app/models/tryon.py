from sqlalchemy import Column, String, Integer, DateTime, Text, Float, ForeignKey, create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, relationship
from datetime import datetime
from app.core.config import settings

Base = declarative_base()
# Fallback to SQLite if DATABASE_URL is not a valid postgres URL (e.g. Railway without DB yet)
_db_url = settings.DATABASE_URL
if not _db_url or _db_url.startswith("postgresql://user:pass@localhost"):
    _db_url = "sqlite:///./provadoria.db"
engine = create_engine(_db_url, connect_args={"check_same_thread": False} if _db_url.startswith("sqlite") else {})
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

class User(Base):
    __tablename__ = "users"
    
    id = Column(String, primary_key=True, index=True)
    created_at = Column(DateTime, default=datetime.utcnow)
    
    tryons = relationship("TryOn", back_populates="user", cascade="all, delete-orphan")
    votes = relationship("Vote", back_populates="user", cascade="all, delete-orphan")
    reviews = relationship("Review", back_populates="user", cascade="all, delete-orphan")

class TryOn(Base):
    __tablename__ = "tryons"
    
    id = Column(String, primary_key=True, index=True)
    user_id = Column(String, ForeignKey("users.id"), nullable=False)
    image_url = Column(String, nullable=True)
    description = Column(Text, nullable=False)
    fit_assessment = Column(Text, nullable=False)
    style_tips = Column(Text, nullable=True)  # JSON array as string
    occasions = Column(Text, nullable=True)  # JSON array as string
    rating = Column(Float, nullable=False)
    votes = Column(Integer, default=0)
    created_at = Column(DateTime, default=datetime.utcnow)
    
    user = relationship("User", back_populates="tryons")
    vote_records = relationship("Vote", back_populates="tryon", cascade="all, delete-orphan")
    review_records = relationship("Review", back_populates="tryon", cascade="all, delete-orphan")

class Vote(Base):
    __tablename__ = "votes"
    
    id = Column(String, primary_key=True, index=True)
    user_id = Column(String, ForeignKey("users.id"), nullable=False)
    tryon_id = Column(String, ForeignKey("tryons.id"), nullable=False)
    created_at = Column(DateTime, default=datetime.utcnow)
    
    user = relationship("User", back_populates="votes")
    tryon = relationship("TryOn", back_populates="vote_records")

class Review(Base):
    __tablename__ = "reviews"
    
    id = Column(String, primary_key=True, index=True)
    user_id = Column(String, ForeignKey("users.id"), nullable=False)
    tryon_id = Column(String, ForeignKey("tryons.id"), nullable=False)
    rating = Column(Integer, nullable=False)
    comment = Column(Text, nullable=True)
    created_at = Column(DateTime, default=datetime.utcnow)
    
    user = relationship("User", back_populates="reviews")
    tryon = relationship("TryOn", back_populates="review_records")

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
