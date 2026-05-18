import pytest
from httpx import AsyncClient
from app.main import app

@pytest.mark.asyncio
async def test_health():
    async with AsyncClient(app=app, base_url="http://test") as ac:
        response = await ac.get("/health")
    assert response.status_code == 200
    assert response.json()["status"] == "ok"

@pytest.mark.asyncio
async def test_generate_tryon():
    async with AsyncClient(app=app, base_url="http://test") as ac:
        response = await ac.post("/api/v1/tryon/generate", json={
            "user_photo_url": "https://example.com/user.jpg",
            "clothing_photo_url": "https://example.com/dress.jpg",
            "clothing_description": "vestido floral"
        })
    assert response.status_code == 200
    data = response.json()
    assert "id" in data
    assert "fit_assessment" in data
    assert "rating" in data

@pytest.mark.asyncio
async def test_feed():
    async with AsyncClient(app=app, base_url="http://test") as ac:
        response = await ac.get("/api/v1/tryon/feed")
    assert response.status_code == 200
    assert isinstance(response.json(), list)
