# ProvadorIA — Release Checklist (2026-05-18)

## ✅ PRONTO

### iOS App
- [x] Redesign cherry editorial aplicado em todas as telas
- [x] Novas tabs: Capa · Ensaio · Arquivo · Eu
- [x] Paleta: bone #F8DCD0, ink #1A0E0A, accent #E63923
- [x] Tipografia: serif display, mono labels, sem corner radius, sem sombras
- [x] PrivacyInfo.xcprivacy criado e incluído no bundle
- [x] Build number: 2 (incrementado de 1)
- [x] Build compila sem erros
- [x] App icon 1024px sem alpha

### Landing Page
- [x] HTML/CSS completo reescrito com design editorial cherry
- [x] Nav, hero, marquee, método, showcase, stack, pricing, FAQ, footer

### Legal Pages
- [x] privacy.html, terms.html, support.html criados
- [x] Rotas FastAPI adicionadas no backend

### Marketing
- [x] Metadata com copy, keywords, ASO
- [x] Screenshots de referência do handoff copiados

## ⚠️ PENDENTE (bloqueia submissão)

### 1. Backend deploy
**Problema**: Railway não está servindo as novas rotas (`/privacy`, `/terms`, `/support`, `/`)
**Impacto**: Apple rejeita se URLs de privacy/support não respondem 200
**Ação**: Verificar dashboard do Railway ou fazer deploy das páginas legais em outro host (Vercel/Netlify)

### 2. Screenshots da App Store
**Status**: Apenas referências do handoff (255×540)
**Necessário**: 6 screenshots em dimensões exatas:
- iPhone 6.7": 1290×2796
- iPhone 6.5": 1242×2688
**Ação**: Rodar no simulador iPhone 16 Pro Max, configurar status bar (9:41, 100%), capturar telas

### 3. Upload do build
**Comando**: `cd ios && ./release.sh`
**Pré-requisito**: Resolver item 1 (URLs no ar)

### 4. Preencher ASC metadata
- Nome: ProvadorIA
- Subtítulo: Experimente roupas com IA
- Descrição: ver `marketing/metadata.md`
- Keywords: ver `marketing/metadata.md`
- Support/Privacy/Marketing URLs: apontar para URLs que respondem 200

## 🚀 COMANDOS PARA FECHAR HOJE

```bash
# 1. Verificar build
xcodebuild -project ios/ProvadorIA.xcodeproj -scheme ProvadorIA -configuration Release -destination 'generic/platform=iOS' build

# 2. Upload build
cd ios && ./release.sh

# 3. Verificar build no ASC (esperar 5-10 min)
# Ir em App Store Connect > Apps > ProvadorIA > TestFlight

# 4. Preencher metadata e screenshots no ASC
# App Store Connect > Apps > ProvadorIA > App Store > v1.0

# 5. Submeter para review
```

## 📁 Arquivos alterados principais
- `ios/ProvadorIA/Utils/Extensions.swift`
- `ios/ProvadorIA/ContentView.swift`
- `ios/ProvadorIA/Views/*.swift` (todas as telas)
- `ios/ProvadorIA/ProvadorIAApp.swift`
- `ios/ProvadorIA/PrivacyInfo.xcprivacy` (novo)
- `landing/index.html`
- `landing/legal/*.html` (novo)
- `backend/app/main.py`
- `backend/app/static/*.html` (novo)
- `marketing/metadata.md` (novo)
