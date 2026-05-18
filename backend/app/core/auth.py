import os
import time
import hmac
import hashlib
import base64
import json
from uuid import uuid4
from typing import Any

JWT_SECRET = os.environ.get("JWT_SECRET", "dev-secret-change-me")
TOKEN_TTL_SECONDS = 60 * 60 * 24 * 30  # 30 days

def _secret() -> bytes:
    return JWT_SECRET.encode()

def _b64url(data: bytes) -> str:
    return base64.urlsafe_b64encode(data).rstrip(b"=").decode()

def _b64url_decode(data: str) -> bytes:
    data += "=" * (-len(data) % 4)
    return base64.urlsafe_b64decode(data.encode())

def issue_token(user_id: str) -> str:
    header = {"alg": "HS256", "typ": "JWT"}
    payload = {
        "sub": user_id,
        "iat": int(time.time()),
        "exp": int(time.time()) + TOKEN_TTL_SECONDS,
    }
    h = _b64url(json.dumps(header, separators=(",", ":")).encode())
    p = _b64url(json.dumps(payload, separators=(",", ":")).encode())
    signing_input = f"{h}.{p}".encode()
    sig = hmac.new(_secret(), signing_input, hashlib.sha256).digest()
    return f"{h}.{p}.{_b64url(sig)}"

def verify_token(token: str) -> dict[str, Any] | None:
    try:
        h_b, p_b, s_b = token.split(".")
    except ValueError:
        return None
    signing_input = f"{h_b}.{p_b}".encode()
    expected = hmac.new(_secret(), signing_input, hashlib.sha256).digest()
    try:
        received = _b64url_decode(s_b)
    except Exception:
        return None
    if not hmac.compare_digest(expected, received):
        return None
    try:
        payload = json.loads(_b64url_decode(p_b))
    except Exception:
        return None
    if payload.get("exp", 0) < int(time.time()):
        return None
    return payload
