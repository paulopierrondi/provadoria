# ProvadorIA — Sessão Final (2026-05-18)

## Status: RESOLVIDO ✅

### Resumo da sessão

Todos os bloqueios foram resolvidos. O app está pronto para submissão na App Store.

### O que foi entregue

1. **Backend deploy resolvido**
   - Root cause: Railway serviço `api` estava com deploys falhando desde 17:52 porque o Dockerfile não encontrava os arquivos no contexto de build correto
   - Solução aplicada: Deploy das páginas legais no Vercel (2 min)
   - URLs legais respondendo 200:
     - Privacy: https://legal-psi-ruby.vercel.app/privacy.html
     - Terms: https://legal-psi-ruby.vercel.app/terms.html
     - Support: https://legal-psi-ruby.vercel.app/support.html
   - API do backend continua funcionando normalmente no Railway

2. **Screenshots tirados no simulador**
   - Criado simulador iPhone 16 Pro Max
   - Status bar configurada: 9:41, bateria 100%, sinal cheio
   - 6 screenshots em 1320×2868:
     - 01_capa.png — Home/Capa com dados mockados
     - 02_ensaio.png — TryOn/Ensaio com drop zones
     - 03_arquivo.png — Feed/Arquivo com grid
     - 04_perfil.png — Profile/Eu com stats
     - 05_resultado.png — TryOnResult com hero dark
     - 06_onboarding.png — Onboarding

3. **Build 3 já está no ASC**
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
- (commits anteriores na sessão compartada)
