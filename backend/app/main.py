from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import HTMLResponse, FileResponse
from fastapi.staticfiles import StaticFiles
import os

from app.api import routes
from app.core.config import settings
from app.models.tryon import Base, engine

app = FastAPI(title=settings.APP_NAME, version="0.1.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Create tables on startup (for dev/Railway without migrations)
Base.metadata.create_all(bind=engine)

app.include_router(routes.router, prefix="/api/v1")

# Static files for landing and legal pages
static_dir = os.path.join(os.path.dirname(__file__), "static")
if os.path.exists(static_dir):
    app.mount("/static", StaticFiles(directory=static_dir), name="static")

@app.get("/", response_class=HTMLResponse)
async def landing():
    index_path = os.path.join(static_dir, "index.html")
    if os.path.exists(index_path):
        with open(index_path, "r", encoding="utf-8") as f:
            return f.read()
    return "<h1>ProvadorIA</h1><p>Experimente roupas com IA.</p>"

@app.get("/privacy", response_class=HTMLResponse)
async def privacy():
    privacy_path = os.path.join(static_dir, "privacy.html")
    if os.path.exists(privacy_path):
        with open(privacy_path, "r", encoding="utf-8") as f:
            return f.read()
    return "<h1>Política de Privacidade</h1><p>© 2026 ProvadorIA</p>"

@app.get("/terms", response_class=HTMLResponse)
async def terms():
    terms_path = os.path.join(static_dir, "terms.html")
    if os.path.exists(terms_path):
        with open(terms_path, "r", encoding="utf-8") as f:
            return f.read()
    return "<h1>Termos de Uso</h1><p>© 2026 ProvadorIA</p>"

@app.get("/support", response_class=HTMLResponse)
async def support():
    support_path = os.path.join(static_dir, "support.html")
    if os.path.exists(support_path):
        with open(support_path, "r", encoding="utf-8") as f:
            return f.read()
    return "<h1>Suporte</h1><p>pierrondi@gmail.com</p>"

@app.get("/health")
async def health():
    return {"status": "ok"}
