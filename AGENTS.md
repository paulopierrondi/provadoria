# AGENTS.md — ProvadorIA

## Contexto

ProvadorIA é um app iOS de virtual try-on com IA.
O usuario tira uma foto de si mesmo e uploada uma foto de qualquer roupa (de loja, Instagram, Shein, etc.).
A IA gera uma imagem realista mostrando como aquela roupa ficaria no corpo do usuario.

Tem feed social da comunidade onde usuarios compartilham seus try-ons, reviews e links de compra.

## Stack

- **iOS**: SwiftUI, Combine, Async/Await, PhotoPicker, ShareSheet
- **Backend**: Python 3.11, FastAPI, PostgreSQL, SQLAlchemy
- **AI**: OpenAI GPT-4o Vision + inpainting/DALL-E 3 para virtual try-on
- **Deploy**: Railway (backend), App Store Connect (iOS)
- **Landing**: HTML/CSS/JS estático

## Estrutura de Diretórios

```
provadoria/
├── ios/                    # App iOS SwiftUI
│   └── ProvadorIA/
├── backend/                # API FastAPI
│   ├── app/
│   │   ├── api/
│   │   ├── core/
│   │   ├── models/
│   │   ├── schemas/
│   │   └── services/
│   ├── tests/
│   └── alembic/
├── landing/                # Landing page
├── .brain/
└── docs/
```

## Convencoes

- SwiftUI puro, sem Storyboards.
- ViewModels com `@MainActor` e `@Observable`.
- Backend async/await, Pydantic v2, SQLAlchemy 2.0.
- Commits em PT-BR, convencional.

## Secrets

- `OPENAI_API_KEY` — backend only.
- `DATABASE_URL`
- `JWT_SECRET`

## Monetizacao

- Freemium: 5 try-ons/dia gratis.
- Premium: try-ons ilimitados + try-on em video (quando disponivel) + feed exclusivo.
- Preco: R$ 14,90/mes ou R$ 89,90/ano.
- Affiliate: links de compra com comissao (Shein, C&A, Renner, etc.).

## TikTok Strategy

- Hook: "Experimentei 50 roupas sem sair de casa"
- Formatos: try-on surpresa, "minha IA me vestiu com roupa do Shein", reacoes.
- CTA: "Baixa e veja como fica em voce".
