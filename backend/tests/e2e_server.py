"""
E2E test server launcher.
Patches AI service calls before importing the FastAPI app so tests run fast
and don't require real Gemini API keys.
"""
import sys
from pathlib import Path

# Ensure app is importable
sys.path.insert(0, str(Path(__file__).parent.parent))


async def mock_generate_tryon(user_photo_b64, clothing_photo_b64, clothing_description):
    return {
        "description": clothing_description or "Try-on de teste",
        "fit_assessment": "Caimento excelente, valoriza a silhueta.",
        "style_tips": ["Combine com acessórios minimalistas", "Use em ocasiões casuais"],
        "occasions": ["Casual", "Encontro"],
        "rating": 8.5,
        "image_url": "https://placehold.co/1024x1024/1a1a1a/ffffff?text=Try-On+E2E",
    }


async def mock_analyze_clothing(image_b64):
    return {
        "name": "Vestido Teste",
        "category": "dress",
        "color": "azul",
        "pattern": "liso",
        "style": "Casual",
        "season": "Verão",
    }


# Apply patches before app import
import app.services.ai_service as ai_module

ai_module.generate_tryon = mock_generate_tryon
ai_module.analyze_clothing = mock_analyze_clothing

from app.main import app  # noqa: E402
