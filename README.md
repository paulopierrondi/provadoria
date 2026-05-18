# ProvadorIA

Experimente qualquer roupa em você com IA antes de comprar.

## O que é

ProvadorIA é um app iOS de virtual try-on com IA generativa.
O usuário tira uma foto de si mesmo e faz upload de uma foto de qualquer roupa.
A IA (Gemini Flash multi-modal) gera uma imagem realista mostrando como a roupa ficaria no corpo do usuário,
junto com avaliação de caimento, dicas de estilo e nota.

O app inclui feed social da comunidade, reviews e links de compra afiliados.

## Stack

- **iOS**: SwiftUI, async/await, PhotoPicker, ShareSheet
- **Backend**: Python 3.11, FastAPI, PostgreSQL
- **AI**: Google Gemini 2.0 Flash (visão multi-imagem)
- **Deploy**: Railway (Docker), App Store Connect
- **Landing**: HTML/CSS/JS estático

## Estrutura

```
provadoria/
├── ios/ProvadorIA/        # App iOS SwiftUI
├── backend/               # API FastAPI
│   ├── app/
│   │   ├── api/routes.py
│   │   ├── core/config.py
│   │   ├── schemas/tryon.py
│   │   └── services/ai_service.py
│   ├── Dockerfile
│   └── requirements.txt
├── landing/               # Landing page
└── .brain/                # Contexto do projeto
```

## Como rodar local

### Backend

```bash
cd backend
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env
# Edite .env com GEMINI_API_KEY
uvicorn app.main:app --reload --port 8001
```

### iOS

```bash
cd ios/ProvadorIA
open ProvadorIA.xcodeproj
```

### Landing

```bash
cd landing
python -m http.server 8081
```

## Deploy

### Railway

1. Crie um projeto no Railway.
2. Configure as variáveis de ambiente (`GEMINI_API_KEY`, `DATABASE_URL`, `JWT_SECRET`).
3. Deploy via Dockerfile (`railway.toml` já configurado).

### App Store

1. Configure App Store Connect com bundle ID `com.paulopierrondi.provadoria`.
2. Build e archive via Xcode.
3. Upload via Transporter ou Xcode.

## Monetização

- Freemium: 5 try-ons/dia grátis.
- Premium: try-ons ilimitados + try-on em vídeo (futuro).
- R$ 14,90/mês ou R$ 89,90/ano.
- Affiliate links: Shein, C&A, Renner (Lomadee/Awin).

## TikTok Strategy

- Hook: "Experimentei 50 roupas sem sair de casa"
- Formatos: try-on surpresa, "minha IA me vestiu com roupa do Shein", reações.
- CTA: "Baixa e veja como fica em você".

## Licença

Proprietário — Paulo Pierrondi.
