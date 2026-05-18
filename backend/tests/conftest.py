import os
import subprocess
import sys
import time

import pytest
import requests

BASE_URL = "http://127.0.0.1:18766"


def _wait_for_server(url: str, timeout: int = 15) -> bool:
    for _ in range(timeout * 10):
        try:
            r = requests.get(f"{url}/health", timeout=0.5)
            if r.status_code == 200:
                return True
        except requests.ConnectionError:
            time.sleep(0.1)
    return False


@pytest.fixture(scope="session")
def api_url():
    """Starts the app in a subprocess and yields the base URL."""
    env = os.environ.copy()
    env["JWT_SECRET"] = "test-secret-e2e-provadoria"
    env["DATABASE_URL"] = "sqlite:///./test_e2e.db"
    env["PYTHONPATH"] = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

    proc = subprocess.Popen(
        [sys.executable, "-m", "uvicorn", "tests.e2e_server:app", "--host", "127.0.0.1", "--port", "18766"],
        env=env,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )

    if not _wait_for_server(BASE_URL):
        proc.terminate()
        out, err = proc.communicate(timeout=5)
        raise RuntimeError(f"Server failed to start:\n{err.decode()}")

    yield BASE_URL

    proc.terminate()
    try:
        proc.wait(timeout=5)
    except subprocess.TimeoutExpired:
        proc.kill()
        proc.wait()

    # Cleanup test database
    db_path = os.path.join(os.path.dirname(os.path.dirname(__file__)), "test_e2e.db")
    if os.path.exists(db_path):
        os.remove(db_path)


@pytest.fixture
def auth_token(api_url):
    """Returns a valid Bearer token for an anonymous user."""
    r = requests.post(f"{api_url}/api/v1/auth/anonymous")
    assert r.status_code == 200
    data = r.json()
    assert "token" in data
    return data["token"]
