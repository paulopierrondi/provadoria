"""
End-to-end tests for ProvadorIA backend.
Run with: pytest tests/test_e2e.py -v
"""
import requests


class TestAuth:
    def test_anonymous_auth_returns_token(self, api_url):
        r = requests.post(f"{api_url}/api/v1/auth/anonymous")
        assert r.status_code == 200
        data = r.json()
        assert "user_id" in data
        assert "token" in data
        assert data["user_id"].startswith("anon:")
        assert isinstance(data["token"], str) and len(data["token"]) > 10

    def test_unauthenticated_access_fails(self, api_url):
        # Generate try-on without token
        r = requests.post(f"{api_url}/api/v1/tryon/generate", json={"clothing_description": "vestido"})
        assert r.status_code == 401

        # Vote without token
        r = requests.post(f"{api_url}/api/v1/tryon/vote", params={"tryon_id": "fake-id"})
        assert r.status_code == 401

        # Create review without token
        r = requests.post(f"{api_url}/api/v1/reviews", json={"tryon_id": "fake-id", "rating": 5})
        assert r.status_code == 401

        # Delete account without token
        r = requests.delete(f"{api_url}/api/v1/users/me")
        assert r.status_code == 401

        # Invalid token
        headers = {"Authorization": "Bearer invalidtoken"}
        r = requests.post(
            f"{api_url}/api/v1/tryon/generate",
            headers=headers,
            json={"clothing_description": "vestido"},
        )
        assert r.status_code == 401


class TestTryOn:
    def test_generate_try_on_authenticated_without_photos(self, api_url, auth_token):
        headers = {"Authorization": f"Bearer {auth_token}"}
        payload = {
            "clothing_description": "vestido floral verão",
        }
        r = requests.post(f"{api_url}/api/v1/tryon/generate", headers=headers, json=payload)
        assert r.status_code == 200
        data = r.json()
        assert "id" in data
        assert "description" in data
        assert "fit_assessment" in data
        assert "style_tips" in data
        assert isinstance(data["style_tips"], list)
        assert "occasions" in data
        assert isinstance(data["occasions"], list)
        assert "rating" in data
        assert isinstance(data["rating"], float)
        assert data["votes"] == 0


class TestFeed:
    def test_feed_returns_list(self, api_url):
        r = requests.get(f"{api_url}/api/v1/tryon/feed")
        assert r.status_code == 200
        data = r.json()
        assert isinstance(data, list)

    def test_feed_pagination(self, api_url):
        r = requests.get(f"{api_url}/api/v1/tryon/feed?limit=5&offset=0")
        assert r.status_code == 200
        data = r.json()
        assert isinstance(data, list)
        assert len(data) <= 5


class TestVotes:
    def test_vote_tryon(self, api_url, auth_token):
        headers = {"Authorization": f"Bearer {auth_token}"}

        # First generate a try-on
        r = requests.post(
            f"{api_url}/api/v1/tryon/generate",
            headers=headers,
            json={"clothing_description": "camisa social"},
        )
        assert r.status_code == 200
        tryon_id = r.json()["id"]

        # Vote on it
        r = requests.post(f"{api_url}/api/v1/tryon/vote", headers=headers, params={"tryon_id": tryon_id})
        assert r.status_code == 200
        data = r.json()
        assert data["success"] is True
        assert data["votes"] >= 1

    def test_vote_same_tryon_twice_fails(self, api_url, auth_token):
        headers = {"Authorization": f"Bearer {auth_token}"}

        # Generate a try-on
        r = requests.post(
            f"{api_url}/api/v1/tryon/generate",
            headers=headers,
            json={"clothing_description": "calça jeans"},
        )
        assert r.status_code == 200
        tryon_id = r.json()["id"]

        # First vote
        r = requests.post(f"{api_url}/api/v1/tryon/vote", headers=headers, params={"tryon_id": tryon_id})
        assert r.status_code == 200

        # Second vote should fail
        r = requests.post(f"{api_url}/api/v1/tryon/vote", headers=headers, params={"tryon_id": tryon_id})
        assert r.status_code == 400

    def test_vote_nonexistent_tryon_fails(self, api_url, auth_token):
        headers = {"Authorization": f"Bearer {auth_token}"}
        r = requests.post(
            f"{api_url}/api/v1/tryon/vote",
            headers=headers,
            params={"tryon_id": "nonexistent-tryon-id"},
        )
        assert r.status_code == 404


class TestReviews:
    def test_create_review(self, api_url, auth_token):
        headers = {"Authorization": f"Bearer {auth_token}"}

        # Generate a try-on to review
        r = requests.post(
            f"{api_url}/api/v1/tryon/generate",
            headers=headers,
            json={"clothing_description": "jaqueta de couro"},
        )
        assert r.status_code == 200
        tryon_id = r.json()["id"]

        # Create a review
        payload = {"tryon_id": tryon_id, "rating": 5, "comment": "Adorei o caimento!"}
        r = requests.post(f"{api_url}/api/v1/reviews", headers=headers, json=payload)
        assert r.status_code == 200
        data = r.json()
        assert "id" in data
        assert data["tryon_id"] == tryon_id
        assert data["rating"] == 5
        assert data["comment"] == "Adorei o caimento!"

    def test_fetch_reviews(self, api_url, auth_token):
        headers = {"Authorization": f"Bearer {auth_token}"}

        # Generate a try-on
        r = requests.post(
            f"{api_url}/api/v1/tryon/generate",
            headers=headers,
            json={"clothing_description": "saia midi"},
        )
        assert r.status_code == 200
        tryon_id = r.json()["id"]

        # Create a review
        requests.post(
            f"{api_url}/api/v1/reviews",
            headers=headers,
            json={"tryon_id": tryon_id, "rating": 4, "comment": "Muito bom"},
        )

        # Fetch reviews
        r = requests.get(f"{api_url}/api/v1/reviews/{tryon_id}")
        assert r.status_code == 200
        data = r.json()
        assert isinstance(data, list)
        assert len(data) >= 1
        assert data[0]["tryon_id"] == tryon_id
        assert data[0]["rating"] == 4

    def test_create_review_unauthenticated_fails(self, api_url):
        payload = {"tryon_id": "fake-id", "rating": 5}
        r = requests.post(f"{api_url}/api/v1/reviews", json=payload)
        assert r.status_code == 401


class TestAccountDeletion:
    def test_delete_account(self, api_url):
        # Create a fresh user
        r = requests.post(f"{api_url}/api/v1/auth/anonymous")
        assert r.status_code == 200
        token = r.json()["token"]
        headers = {"Authorization": f"Bearer {token}"}

        # Delete account
        r = requests.delete(f"{api_url}/api/v1/users/me", headers=headers)
        assert r.status_code == 200
        assert r.json()["success"] is True

        # Subsequent requests with the same token should fail
        r = requests.post(
            f"{api_url}/api/v1/tryon/generate",
            headers=headers,
            json={"clothing_description": "teste"},
        )
        assert r.status_code == 401
