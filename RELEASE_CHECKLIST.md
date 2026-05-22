# ProvadorIA — Release Checklist (2026-05-21)

## ✅ PRONTO

### iOS App
- [x] Redesign cherry editorial aplicado em todas as telas
- [x] Novas tabs: Capa · Ensaio · Arquivo · Eu
- [x] Paleta: bone #F8DCD0, ink #1A0E0A, accent #E63923
- [x] Tipografia: serif display, mono labels, sem corner radius, sem sombras
- [x] PrivacyInfo.xcprivacy criado e incluído no projeto
- [x] Build number: 4 (incrementado de 3)
- [x] Build compila sem erros
- [x] App icon 1024px sem alpha
- [x] **Build 4 enviado para App Store Connect com sucesso**
  - Delivery UUID: 8a7a2559-9f0a-4e95-be52-6a97dbdad0b9
  - Upload: 577KB payload, 116.3MB/s
  - Status: processing no TestFlight

### Fixes anti-rejeição (build 4)
- [x] Info.plist: NSPhotoLibraryUsageDescription + NSCameraUsageDescription + API_BASE_URL produção
- [x] APIService.swift: fallback de localhost para `https://api-production-c696.up.railway.app`
- [x] PrivacyInfo.xcprivacy: domínio corrigido para `api-production-c696.up.railway.app`
- [x] ProfileView.swift: paywall não-funcional removido da UI
- [x] TryOnView.swift: botão Câmera sem ação removido
- [x] TryOnResultView.swift: botão "Comprar" sem ação removido
- [x] FeedView.swift + HomeView.swift: AsyncImage para carregar imagens reais do backend
- [x] Error handling: `localizedDescription` removido das mensagens exibidas ao usuário

### Landing + Legal Pages
- [x] `landing/index.html` — cherry editorial completo
- [x] `landing/legal/{privacy,terms,support}.html` — páginas legais
- [x] **Deployado no Vercel** — responde 200
  - Privacy: https://legal-psi-ruby.vercel.app/privacy.html
  - Terms: https://legal-psi-ruby.vercel.app/terms.html
  - Support: https://legal-psi-ruby.vercel.app/support.html

### Backend API
- [x] API produção online (`https://api-production-c696.up.railway.app/health` = 200)
- [x] Railway deploy do serviço `api` está com problema de healthcheck (não bloqueia)

### Screenshots
- [x] 6 screenshots tirados no simulador iPhone 16 Pro Max (1320×2868)
  - `01_capa.png` — Home com masthead, hero, edições recentes
  - `02_ensaio.png` — TryOn com drop zones, progress steps
  - `03_arquivo.png` — Feed com grid, filter chips, scores
  - `04_perfil.png` — Profile com stats, index
  - `05_resultado.png` — Resultado com hero dark, score, análise
  - `06_onboarding.png` — Onboarding final (Cai perfeito)

### Marketing
- [x] `marketing/metadata.md` com copy, keywords, ASO

## 🚀 PRÓXIMOS PASSOS PARA PUBLICAR (manual no ASC web)

> ⚠️ Build 4 está processando no ASC. Aguarde 10-30 minutos para aparecer.

1. **Associar build 4 à versão 1.0**
   - App Store Connect > Apps > ProvadorIA > iOS App > 1.0
   - Build section → selecionar build 4

2. **Upload screenshots**
   - iPhone 6.7" (1290×2796) — usar os 6 screenshots em `fastlane/screenshots/pt-BR/`
   - A Apple aceita redimensionamento automático para outros tamanhos

3. **Preencher App Privacy**
   - App Store Connect > App Privacy
   - Dados: User ID (App Functionality, Não), Photos (App Functionality, Não), Usage Data (Analytics, Não)
   - NÃO rastreia usuários

4. **Preencher Review Information**
   - Contact: Paulo Pierrondi, pierrondi@gmail.com
   - Sign-in required? **Não** (autenticação anônima)
   - Demo account: **Não necessário**
   - Notes: "O app usa autenticação anônima. Não é necessário login. O usuário recebe um token JWT ao abrir o app pela primeira vez. Para exclusão de conta, vá em Perfil > Índice — conta > Excluir Conta. O try-on virtual usa IA generativa para simular o caimento de roupas."

5. **Verificar metadata**
   - Nome: ProvadorIA
   - Subtítulo: Experimente roupas com IA
   - Support URL: https://legal-psi-ruby.vercel.app/support.html
   - Privacy URL: https://legal-psi-ruby.vercel.app/privacy.html
   - Marketing URL: https://provadoria-landing.vercel.app

6. **Submeter para review**
   - Confirmar que todos os campos obrigatórios estão verdes
   - Clicar em "Add for Review"

## 📁 Arquivos alterados nesta sessão
- `ios/ProvadorIA/Info.plist` — build 4, permissões, API_BASE_URL
- `ios/ProvadorIA/Services/APIService.swift` — fallback produção
- `ios/ProvadorIA/PrivacyInfo.xcprivacy` — domínio correto
- `ios/ProvadorIA/Views/ProfileView.swift` — paywall removido
- `ios/ProvadorIA/Views/TryOnView.swift` — botão câmera removido
- `ios/ProvadorIA/Views/TryOnResultView.swift` — botão comprar removido
- `ios/ProvadorIA/Views/FeedView.swift` — AsyncImage + error amigável
- `ios/ProvadorIA/Views/HomeView.swift` — AsyncImage + error amigável
- `ios/project.yml` — build 4
- `ios/ProvadorIA.xcodeproj/project.pbxproj` — build 4
