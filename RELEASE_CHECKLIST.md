# ProvadorIA — Release Checklist (2026-05-18)

## ✅ PRONTO

### iOS App
- [x] Redesign cherry editorial aplicado em todas as telas
- [x] Novas tabs: Capa · Ensaio · Arquivo · Eu
- [x] Paleta: bone #F8DCD0, ink #1A0E0A, accent #E63923
- [x] Tipografia: serif display, mono labels, sem corner radius, sem sombras
- [x] PrivacyInfo.xcprivacy criado e incluído no bundle
- [x] Build number: 3 (incrementado do 1 já enviado)
- [x] Build compila sem erros
- [x] App icon 1024px sem alpha
- [x] **Build 3 enviado para App Store Connect com sucesso**
  - Delivery UUID: 25a62d0b-213f-4f55-b9d5-ef2215cf3528
  - Upload: 588KB, 96.2MB/s
  - Status: processing (verificar em 10-30 min no ASC)

### Landing Page
- [x] HTML/CSS completo reescrito com design editorial cherry
- [x] Nav, hero, marquee, método, showcase, stack, pricing, FAQ, footer

### Legal Pages
- [x] privacy.html, terms.html, support.html criados
- [x] Rotas FastAPI adicionadas no backend
- [x] Python HTTP server criado para servir páginas estáticas

### Marketing
- [x] Metadata com copy, keywords, ASO
- [x] Screenshots de referência do handoff copiados

## ⚠️ PENDENTE (bloqueia submissão)

### 1. Backend deploy
**Problema**: Railway não está servindo as novas rotas (`/privacy`, `/terms`, `/support`, `/`)
**Impacto**: Apple rejeita se URLs de privacy/support não respondem 200
**URLs afetadas**:
- `https://api-production-c696.up.railway.app/privacy` → 404
- `https://api-production-c696.up.railway.app/terms` → 404
- `https://api-production-c696.up.railway.app/support` → 404
- `https://api-production-c696.up.railway.app/` → 404

**Solução recomendada**: Deployar `landing/legal/*.html` em outro host que responda 200:
```bash
# Opção A: Vercel (mais rápido)
cd landing/legal && npx vercel --prod

# Opção B: Netlify
cd landing/legal && npx netlify deploy --prod --dir=.

# Opção C: GitHub Pages
# Criar repo separado com os 3 HTMLs e index.html
```

Depois atualizar ASC metadata com as novas URLs.

### 2. Screenshots da App Store
**Status**: Apenas referências do handoff (255×540)
**Necessário**: 6 screenshots em dimensões exatas:
- iPhone 6.7": 1290×2796 (iPhone 16 Pro Max)
- iPhone 6.5": 1242×2688 (iPhone 14 Plus)
**Ação**: Rodar app no simulador, configurar status bar, capturar 6 telas
```bash
xcrun simctl status_bar "iPhone 16 Pro Max" --time 9:41 --batteryState charged --batteryLevel 100 --cellularMode active --cellularBars 4
```
Capturar: Capa, Ensaio, Resultado, Arquivo, Perfil, Onboarding

### 3. Preencher ASC metadata
- Nome: ProvadorIA
- Subtítulo: Experimente roupas com IA
- Descrição/Keywords: ver `marketing/metadata.md`
- Support/Privacy/Marketing URLs: apontar para URLs que respondem 200
- Screenshots: upload por locale e device class

## 🚀 COMANDOS PARA FECHAR HOJE

```bash
# 1. Verificar build no ASC (esperar 5-10 min após upload)
# App Store Connect > Apps > ProvadorIA > TestFlight > Build 3

# 2. Resolver URLs legais (escolher uma opção acima)
# Verificar com:
curl -sS -o /dev/null -w '%{http_code}\n' "https://SUA-URL/privacy"

# 3. Tirar screenshots no simulador
# iPhone 16 Pro Max, status bar limpa, 6 telas

# 4. Preencher ASC metadata e submeter para review
```

## 📁 Arquivos alterados principais
- `ios/ProvadorIA/Views/*.swift` — todas as telas redesenhadas
- `ios/ProvadorIA/Utils/Extensions.swift` — design system cherry
- `ios/ProvadorIA/Info.plist` — build 3, orientations
- `landing/index.html` — landing page nova
- `landing/legal/*.html` — privacy, terms, support
- `backend/app/main.py` — rotas para servir páginas legais
- `marketing/metadata.md` — copy e ASO
