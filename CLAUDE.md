# CLAUDE.md — ProvadorIA

## Projeto

ProvadorIA — App iOS de virtual try-on com IA e feed social.

## Comandos Uteis

```bash
# Backend
cd backend
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload --port 8001

# iOS
cd ios/ProvadorIA
open ProvadorIA.xcodeproj

# Landing
cd landing
python -m http.server 8081
```

## Decisoes Arquiteturais

- FastAPI async com streaming de respostas da OpenAI.
- Imagens armazenadas em S3/R2 (Cloudflare).
- iOS usa `URLSession` async + `AsyncImage` cache.
- Auth com JWT + Apple Sign In.

## Estado Atual

- Scaffolding inicial.
