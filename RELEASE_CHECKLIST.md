# ProvadorIA — Release Checklist (2026-05-18)

## ✅ PRONTO

### iOS App
- [x] Redesign cherry editorial aplicado em todas as telas
- [x] Novas tabs: Capa · Ensaio · Arquivo · Eu
- [x] Paleta: bone #F8DCD0, ink #1A0E0A, accent #E63923
- [x] Tipografia: serif display, mono labels, sem corner radius, sem sombras
- [x] PrivacyInfo.xcprivacy criado e incluído no projeto
- [x] Build number: 3 (incrementado de 1 via agvtool)
- [x] Build compila sem erros
- [x] App icon 1024px sem alpha
- [x] **Build 3 enviado para App Store Connect com sucesso**
  - Delivery UUID: 25a62d0b-213f-4f55-b9d5-ef2215cf3528
  - Upload: 588KB payload, 96.2MB/s
  - Status: processing no TestFlight

### Landing + Legal Pages
- [x] `landing/index.html` — cherry editorial completo
- [x] `landing/legal/{privacy,terms,support}.html` — páginas legais
- [x] **Deployado no Vercel** — responde 200
  - Privacy: https://legal-psi-ruby.vercel.app/privacy.html
  - Terms: https://legal-psi-ruby.vercel.app/terms.html
  - Support: https://legal-psi-ruby.vercel.app/support.html

### Backend API
- [x] API funciona normalmente (`/api/v1/*` e `/health` respondem 200)
- [x] Railway deploy do serviço `api` está com problema de healthcheck (não bloqueia)

### Screenshots
- [x] 6 screenshots tirados no simulador iPhone 16 Pro Max (1320×2868)
  - `01_capa.png` — Home com masthead, hero, edições recentes
  - `02_ensaio.png` — TryOn com drop zones, progress steps
  - `03_arquivo.png` — Feed com grid, filter chips, scores
  - `04_perfil.png` — Profile com stats, premium card, index
  - `05_resultado.png` — Resultado com hero dark, score, análise
  - `06_onboarding.png` — Onboarding final (Cai perfeito)

### Marketing
- [x] `marketing/metadata.md` com copy, keywords, ASO

## 🚀 PRÓXIMOS PASSOS PARA PUBLICAR

```bash
# 1. Verificar build no ASC (esperar 5-30 min após upload)
# App Store Connect > Apps > ProvadorIA > TestFlight > Build 3

# 2. Preencher ASC metadata
# Nome: ProvadorIA
# Subtítulo: Experimente roupas com IA
# Descrição/Keywords: copiar de marketing/metadata.md
# Support URL: https://legal-psi-ruby.vercel.app/support.html
# Privacy URL: https://legal-psi-ruby.vercel.app/privacy.html
# Marketing URL: https://legal-psi-ruby.vercel.app/

# 3. Upload screenshots
# iPhone 6.7" (1290×2796) — usar os 6 screenshots em marketing/screenshots/
# A Apple aceita redimensionamento automático

# 4. Submeter para review
```

## 📁 Arquivos alterados principais
- `ios/ProvadorIA/Views/*.swift` — todas as telas redesenhadas
- `ios/ProvadorIA/Utils/Extensions.swift` — design system cherry
- `ios/ProvadorIA/Info.plist` — build 3, orientations
- `landing/index.html` — landing page nova
- `landing/legal/*.html` — privacy, terms, support
- `backend/app/main.py` — rotas para servir páginas legais
- `marketing/metadata.md` — copy e ASO
- `marketing/screenshots/*.png` — 6 screenshots
