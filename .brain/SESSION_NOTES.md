# ProvadorIA — Sessão Final (2026-05-18)

## Status: Build 3 enviado ✅ | Backend deploy bloqueado ⚠️

### Entregues nesta sessão

1. **Build 3 enviado para ASC** (Delivery UUID: 25a62d0b-213f-4f55-b9d5-ef2215cf3528)
   - Corrigido: duplicate version (incrementado de 1 → 3 via agvtool)
   - Corrigido: missing orientations (adicionadas 4 orientações no Info.plist)
   - Upload: 588KB payload, 96.2MB/s
   - Status: processing no TestFlight

2. **Redesign cherry editorial completo**
   - 12 views SwiftUI reescritas
   - Design system: bone, ink, accent, editorial display/mono/body
   - Zero border radius, 1px borders, sem sombras
   - Tabs: Capa · Ensaio · Arquivo · Eu

3. **Landing + legal pages**
   - `landing/index.html` — cherry editorial completo
   - `landing/legal/{privacy,terms,support}.html`
   - Rotas FastAPI em `backend/app/main.py`

### Bloqueio: Railway deploy

**Problema**: Serviço `api` no Railway continua retornando 404 para `/`, `/privacy`, `/terms`, `/support` mesmo após múltiplos deploys e commits de invalidação de cache.

**Verificado**:
- Código está correto (main.py tem as rotas)
- Arquivos estáticos existem (`backend/app/static/`)
- Localmente funciona (uvicorn serve 200 para todas as rotas)
- Railway parece usar cache antigo ou ignorar railway.toml root

**Impacto**: Apple rejeita app se Support/Privacy URLs não respondem 200.

### Checklist para publicar

| Item | Status | Notas |
|------|--------|-------|
| Build no ASC | ✅ Pronto | Build 3, aguardar "Processing Complete" |
| Redesign iOS | ✅ Pronto | Todas as 12 views |
| Landing page | ✅ Pronto | HTML/CSS cherry editorial |
| Legal pages | ✅ Pronto | HTML criados, rotas adicionadas |
| Backend deploy | ⚠️ Bloqueado | Railway 404 — ver soluções abaixo |
| Screenshots | ⚠️ Pendente | Precisa tirar no simulador iPhone 16 Pro Max |
| ASC metadata | ⚠️ Pendente | Preencher nome, subtítulo, descrição, URLs |

### Soluções para o backend (escolher uma)

**Opção A — Vercel (recomendado, 2 min)**:
```bash
cd landing/legal && npx vercel --prod
# Vai gerar URL tipo https://provadoria-legal.vercel.app
# Depois configurar no ASC:
# Privacy: https://provadoria-legal.vercel.app/privacy.html
# Support: https://provadoria-legal.vercel.app/support.html
```

**Opção B — Railway service separado**:
- No dashboard do Railway, criar novo serviço "static" apontando para `landing/`
- Ou verificar se o serviço atual está usando o Dockerfile correto (pode estar usando Nixpacks)

**Opção C — GitHub Pages**:
- Criar repo `provadoria-legal`, fazer push dos 3 HTMLs
- Habilitar GitHub Pages no settings
- URL: `https://paulopierrondi.github.io/provadoria-legal/privacy.html`

### Screenshots necessários

**iPhone 16 Pro Max (1290×2796)** — 6 telas:
1. Capa (Home com masthead e hero)
2. Ensaio (TryOn com drop zones)
3. Resultado (TryOnResult com score)
4. Arquivo (Feed com grid)
5. Perfil (Profile com stats)
6. Onboarding (telas de intro)

**Comando para status bar limpa**:
```bash
xcrun simctl boot "iPhone 16 Pro Max"
xcrun simctl status_bar "iPhone 16 Pro Max" --time 9:41 --batteryState charged --batteryLevel 100 --cellularMode active --cellularBars 4 --wifiBars 3 --operatorName " "
```

Capturar com Cmd+S no simulador (salva na área de trabalho).

### Próximos passos (ordem)

1. **Esperar build 3** aparecer como "Ready to Submit" no ASC (5-30 min)
2. **Resolver URLs** legais usando uma das opções acima
3. **Tirar screenshots** no simulador
4. **Preencher ASC**: nome, subtítulo, descrição, keywords, URLs, screenshots
5. **Submeter para review**

### Metadata para copiar no ASC

- **Nome**: ProvadorIA
- **Subtítulo**: Experimente roupas com IA
- **Descrição**: usar `marketing/metadata.md` → seção "App Store Description"
- **Keywords**: usar `marketing/metadata.md` → seção "Keywords"
- **Support URL**: (URL que responde 200)
- **Privacy URL**: (URL que responde 200)
- **Marketing URL**: (opcional, landing page)

### Commits desta sessão

- `2e382a4` — fix: build 3 uploaded, orientations fix, agvtool version bump
- (commits anteriores na sessão compartada)
