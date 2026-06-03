# ProvadorIA — Session Notes

## 2026-05-21 — Build 5: Anti-Rejeição Apple + Salvamento na Galeria + Upload TestFlight

### O que foi feito

Sessão focada em eliminar todos os bloqueadores de rejeição da Apple antes da submissão final.

**Build 5 enviado para App Store Connect**
- Delivery UUID: `172e800d-ede9-4f88-a46c-573a9a24b43c`
- Upload: 590KB payload, 1.7MB/s
- Status: processing no TestFlight (aguardar 10-30 min)

**Fixes anti-rejeição aplicados**

| Problema | Arquivo | Fix |
|---|---|---|
| Info.plist sem permissões de PhotoLibrary/Camera | `Info.plist` | Adicionado `NSPhotoLibraryUsageDescription` + `NSPhotoLibraryAddUsageDescription` + `NSCameraUsageDescription` + `API_BASE_URL` |
| Fallback API era localhost | `APIService.swift` | `http://127.0.0.1:8000` → `https://api-production-c696.up.railway.app` |
| Privacy manifest com domínio morto | `PrivacyInfo.xcprivacy` | `api.provadoria.com` → `api-production-c696.up.railway.app` |
| Paywall não-funcional visível | `ProfileView.swift` | `planCard` removido da UI (código morto, não usado) |
| Botão Câmera sem ação | `TryOnView.swift` | Botão removido, ficou só PhotosPicker funcional |
| Botão "Comprar" sem ação | `TryOnResultView.swift` | Botão removido |
| Botão "Salvar" não salvava de verdade | `TryOnResultView.swift` | Implementado `PHPhotoLibrary.shared().performChanges` para salvar imagem real na galeria |
| Imagens no feed eram placeholders | `FeedView.swift` + `HomeView.swift` | `AsyncImage` carregando `imageURL` do backend com fallback de tshirt |
| Error handling mostrava localizedDescription cru | `TryOnView.swift` + `FeedView.swift` + `ProfileView.swift` | Mensagens amigáveis em português |

**Build validado**
- `xcodebuild` Debug para simulador: **BUILD SUCCEEDED**
- Archive (Release, iphoneos): **ARCHIVE SUCCEEDED**
- Export IPA: **EXPORT SUCCEEDED**
- Upload altool: **UPLOAD SUCCEEDED**
- App icon 1024px: `hasAlpha: no` em todos os ícones

### Checklist para submeter (manual no ASC web)

> Build 5 está processando. Aguarde aparecer em TestFlight antes de continuar.

1. **Associar build 4 à versão 1.0**
   - ASC > ProvadorIA > iOS App > 1.0 > Build section

2. **Upload screenshots**
   - iPhone 6.7" (1290×2796)
   - Fonte: `fastlane/screenshots/pt-BR/` (6 screenshots)

3. **Preencher App Privacy**
   - User ID → App Functionality → Não vinculado → Não rastreia
   - Photos → App Functionality → Não vinculado → Não rastreia
   - Usage Data → Analytics → Não vinculado → Não rastreia

4. **Preencher Review Information**
   - Contact: Paulo Pierrondi, pierrondi@gmail.com
   - Sign-in required? **Não** (auth anônima)
   - Demo account: **Não necessário**
   - Notes: "O app usa autenticação anônima. Não é necessário login. O usuário recebe um token JWT ao abrir o app pela primeira vez. Para exclusão de conta, vá em Perfil > Índice — conta > Excluir Conta. O try-on virtual usa IA generativa para simular o caimento de roupas."

5. **Submeter para review**
   - Verificar campos verdes
   - "Add for Review"

### Commits desta sessão

- `c56171f` — fix: anti-rejeição Apple — build 4
- `10e5407` — fix: salvar try-on na galeria + NSPhotoLibraryAddUsageDescription — build 5

---

## 2026-05-18 — Build 3: Redesign Cherry Editorial + Landing + Screenshots

### O que foi feito

**iOS App**
- Redesign cherry editorial aplicado em todas as telas
- Novas tabs: Capa · Ensaio · Arquivo · Eu
- Paleta: bone #F8DCD0, ink #1A0E0A, accent #E63923
- Tipografia: serif display, mono labels, sem corner radius, sem sombras
- PrivacyInfo.xcprivacy criado e incluído no projeto
- Build number: 3 (incrementado de 1 via agvtool)
- Build compila sem erros
- App icon 1024px sem alpha

**Build 3 já está no ASC**
- Delivery UUID: 25a62d0b-213f-4f55-b9d5-ef2215cf3528
- Aguardando "Processing Complete" no TestFlight

### Checklist para publicar (restante)

| Item | Status | Ação |
|------|--------|------|
| Build no ASC | ✅ Pronto | Verificar TestFlight em 10-30 min |
| Redesign iOS | ✅ Pronto | Todas as 12 views |
| Landing page | ✅ Pronto | HTML/CSS cherry editorial |
| Legal pages | ✅ Pronto | Deployadas no Vercel, 200 OK |
| Backend API | ✅ Pronto | /api/v1/* e /health funcionando |
| Screenshots | ✅ Pronto | 6 screenshots em marketing/screenshots/ |
| ASC metadata | ⚠️ Pendente | Preencher manualmente no ASC |

### Metadata para copiar no ASC

- **Nome**: ProvadorIA
- **Subtítulo**: Experimente roupas com IA
- **Descrição**: usar `marketing/metadata.md` → seção "App Store Description"
- **Keywords**: usar `marketing/metadata.md` → seção "Keywords"
- **Support URL**: https://legal-psi-ruby.vercel.app/support.html
- **Privacy URL**: https://legal-psi-ruby.vercel.app/privacy.html
- **Marketing URL**: https://legal-psi-ruby.vercel.app/

### Screenshots para upload no ASC

Local: `marketing/screenshots/`
- 01_capa.png — Capa (Home)
- 02_ensaio.png — Ensaio (TryOn)
- 03_arquivo.png — Arquivo (Feed)
- 04_perfil.png — Eu (Profile)
- 05_resultado.png — Resultado (TryOnResult)
- 06_onboarding.png — Onboarding

Dimensões: 1320×2868 (iPhone 16 Pro Max simulador)
A App Store aceita redimensionamento automático para 1290×2796.

### Commits desta sessão

- `b0b4c25` — fix: root Dockerfile for Railway build context
- `6657bfa` — fix: increase healthcheck timeout to 120s
- `117c6c9` — fix: switch to Nixpacks builder for Railway
- `a528ae7` — fix: railway rootDirectory for backend Dockerfile context
- `2e382a4` — fix: build 3 uploaded, orientations fix, agvtool version bump
- (commits anteriores na sessão compartilhada)

---
## 2026-05-21 — SUBMISSÃO APP STORE CONNECT ✅

### Status: AGUARDANDO REVISÃO DA APPLE
- **Build:** 1.0 (5) — `172e800d-ede9-4f88-a46c-573a9a24b43c`
- **Enviado em:** 21/05/2026 ~21:19 BRT
- **Preço:** Free ($0,00) para 175 países
- **Tempo estimado de revisão:** até 48 horas

### Ações realizadas:
1. ✅ Configurado preço Free via Playwright no Chrome ASC
2. ✅ Clicado "Adicionar para revisão" → processou com sucesso
3. ✅ Clicado "Enviar para revisão" no modal
4. ✅ Status final: "1.0 Aguardando revisão"

### Próximos passos:
- Aguardar email da Apple com resultado da revisão
- Preparar respostas para possíveis perguntas do reviewer
- Planejar marketing/ASO para lançamento

---
## 2026-05-22 — INVALID_BINARY RESOLVIDO ✅

### Erros identificados (email da Apple):
1. **ITMS-91054**: `NSPrivacyAccessedAPICategoryPhotoLibrary` não é categoria válida de Required Reason API
2. **ITMS-91064**: `NSPrivacyTrackingDomains` não vazio exige `NSPrivacyTracking = true`

### Correções aplicadas:
- `PrivacyInfo.xcprivacy`: removeu `NSPrivacyTrackingDomains` (array vazio)
- `PrivacyInfo.xcprivacy`: removeu `NSPrivacyAccessedAPITypes` (array vazio) — PhotoLibrary não é Required Reason API
- `Info.plist`: build 5 → 6
- `project.pbxproj`: `CURRENT_PROJECT_VERSION` 5 → 6
- Commit: `f93895b`

### Próximos passos (requer Xcode local):
1. Abrir Xcode → Product → Archive
2. Distribute App → App Store Connect → Upload
3. Aguardar processamento do build 6 no ASC
4. Associar build 6 à versão 1.0
5. Reenviar para revisão
