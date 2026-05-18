"""End-to-end tests for ProvadorIA backend API."""
import requests
import pytest

BASE_URL = "https://api-production-c696.up.railway.app"


class TestAuth:
    def test_anonymous_auth_returns_token(self):
        resp = requests.post(f"{BASE_URL}/api/v1/auth/anonymous")
        assert resp.status_code == 200
        data = resp.json()
        assert "token" in data
        assert "user_id" in data
        assert data["token"].startswith("eyJ")

    def test_anonymous_auth_creates_different_users(self):
        resp1 = requests.post(f"{BASE_URL}/api/v1/auth/anonymous")
        resp2 = requests.post(f"{BASE_URL}/api/v1/auth/anonymous")
        assert resp1.json()["user_id"] != resp2.json()["user_id"]


class TestTryOn:
    @pytest.fixture
    def token(self):
        resp = requests.post(f"{BASE_URL}/api/v1/auth/anonymous")
        return resp.json()["token"]

    def test_generate_tryon_without_photos(self, token):
        resp = requests.post(
            f"{BASE_URL}/api/v1/tryon/generate",
            headers={"Authorization": f"Bearer {token}"},
            json={"clothing_description": "Camisa social azul"}
        )
        assert resp.status_code == 200
        data = resp.json()
        assert "id" in data
        assert "description" in data
        assert "fit_assessment" in data
        assert "style_tips" in data
        assert "occasions" in data
        assert "rating" in data

    def test_generate_tryon_unauthenticated_fails(self):
        resp = requests.post(
            f"{BASE_URL}/api/v1/tryon/generate",
            json={"clothing_description": "Test"}
        )
        assert resp.status_code == 401

    def test_feed_returns_list(self, token):
        # Generate a try-on first
        requests.post(
            f"{BASE_URL}/api/v1/tryon/generate",
            headers={"Authorization": f"Bearer {token}"},
            json={"clothing_description": "Vestido vermelho"}
        )
        resp = requests.get(f"{BASE_URL}/api/v1/tryon/feed")
        assert resp.status_code == 200
        data = resp.json()
        assert isinstance(data, list)

    def test_vote_tryon(self, token):
        # Generate a try-on first
        gen = requests.post(
            f"{BASE_URL}/api/v1/tryon/generate",
            headers={"Authorization": f"Bearer {token}"},
            json={"clothing_description": "Jaqueta de couro"}
        )
        tryon_id = gen.json()["id"]
        resp = requests.post(
            f"{BASE_URL}/api/v1/tryon/vote?tryon_id={tryon_id}",
            headers={"Authorization": f"Bearer {token}"}
        )
        assert resp.status_code == 200
        data = resp.json()
        assert data["success"] is True
        assert data["votes"] >= 1


class TestReviews:
    @pytest.fixture
    def token(self):
        resp = requests.post(f"{BASE_URL}/api/v1/auth/anonymous")
        return resp.json()["token"]

    def test_create_review(self, token):
        # Generate a try-on first
        gen = requests.post(
            f"{BASE_URL}/api/v1/tryon/generate",
            headers={"Authorization": f"Bearer {token}"},
            json={"clothing_description": "Calça jeans"}
        )
        tryon_id = gen.json()["id"]
        resp = requests.post(
            f"{BASE_URL}/api/v1/reviews",
            headers={"Authorization": f"Bearer {token}"},
            json={"tryon_id": tryon_id, "rating": 5, "comment": "Adorei o look!"}
        )
        assert resp.status_code == 200
        data = resp.json()
        assert "id" in data
        assert data["rating"] == 5

    def test_fetch_reviews(self, token):
        # Generate a try-on and review
        gen = requests.post(
            f"{BASE_URL}/api/v1/tryon/generate",
            headers={"Authorization": f"Bearer {token}"},
            json={"clothing_description": "Blazer cinza"}
        )
        tryon_id = gen.json()["id"]
        requests.post(
            f"{BASE_URL}/api/v1/reviews",
            headers={"Authorization": f"Bearer {token}"},
            json={"tryon_id": tryon_id, "rating": 4, "comment": "Muito bom"}
        )
        resp = requests.get(f"{BASE_URL}/api/v1/reviews/{tryon_id}")
        assert resp.status_code == 200
        data = resp.json()
        assert isinstance(data, list)
        assert len(data) >= 1


class TestAccountDeletion:
    @pytest.fixture
    def token(self):
        resp = requests.post(f"{BASE_URL}/api/v1/auth/anonymous")
        return resp.json()["token"]

    def test_delete_account(self, token):
        resp = requests.delete(
            f"{BASE_URL}/api/v1/users/me",
            headers={"Authorization": f"Bearer {token}"}
        )
        assert resp.status_code == 200
        data = resp.json()
        assert data["success"] is True

    def test_delete_account_unauthenticated_fails(self):
        resp = requests.delete(f"{BASE_URL}/api/v1/users/me")
        assert resp.status_code == 401


class TestHealth:
    def test_health_endpoint(self):
        resp = requests.get(f"{BASE_URL}/health")
        assert resp.status_code == 200
        assert resp.json()["status"] == "ok"
