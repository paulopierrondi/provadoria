import os
import json
import base64
from typing import List, Optional
import google.generativeai as genai
from app.core.config import settings

genai.configure(api_key=settings.GEMINI_API_KEY)

model_vision = genai.GenerativeModel("gemini-2.5-flash-image")
model_text = genai.GenerativeModel("gemini-3-flash-preview")

async def generate_tryon(user_photo_b64: str, clothing_photo_b64: str, clothing_description: Optional[str]) -> dict:
    """Gera um virtual try-on usando Gemini Flash com visao."""
    
    prompt = f"""Voce e um estilista virtual. Analise a foto da pessoa e a foto da roupa.
Descricao da roupa: {clothing_description or 'Nao fornecida'}.

Retorne APENAS um JSON valido com este formato:
{{
    "description": "Descricao do look final em portugues do Brasil",
    "fit_assessment": "Como a roupa ficaria no corpo da pessoa (caimento, tamanho, proporcao)",
    "style_tips": ["Dica 1", "Dica 2"],
    "occasions": ["Ocasiao 1", "Ocasiao 2"],
    "rating": 8.5
}}
"""
    
    user_image = base64.b64decode(user_photo_b64)
    clothing_image = base64.b64decode(clothing_photo_b64)
    
    response = model_vision.generate_content([
        {"mime_type": "image/jpeg", "data": user_image},
        {"mime_type": "image/jpeg", "data": clothing_image},
        prompt
    ])
    
    text = response.text.strip()
    if text.startswith("```"):
        text = text.strip("`").strip()
        if text.lower().startswith("json"):
            text = text[4:].strip()
    
    result = json.loads(text)
    
    return {
        **result,
        "image_url": "https://placehold.co/1024x1024/1a1a1a/ffffff?text=Try-On+IA",
    }

async def analyze_clothing(image_b64: str) -> dict:
    """Analisa uma peca de roufa a partir da foto."""
    
    image_data = base64.b64decode(image_b64)
    prompt = """Analise esta peca de roupa. Retorne apenas JSON valido:
{"name": "Nome da peca", "category": "top|bottom|dress|shoes|accessory|outerwear", "color": "Cor principal", "pattern": "Padrao", "style": "Casual|Formal|Esportivo|etc", "season": "Verão|Inverno|Todo ano"}"""
    
    response = model_vision.generate_content([
        {"mime_type": "image/jpeg", "data": image_data},
        prompt
    ])
    
    text = response.text.strip()
    if text.startswith("```"):
        text = text.strip("`").strip()
        if text.lower().startswith("json"):
            text = text[4:].strip()
    return json.loads(text)
