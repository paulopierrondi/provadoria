# ProvadorIA — Sessão de Redesign + Preparação ASC

**Data**: 2026-05-18
**Objetivo**: Aplicar redesign cherry editorial, validar checklists, criar materiais de marketing, preparar para publicação no ASC

## O que foi entregue

### 1. Redesign iOS completo (Cherry Editorial)
- **Extensions.swift**: Nova paleta cherry (bone, paper, ink, mid, line, accent, accentDeep), tipografia editorial (serif display, mono labels), novos modifiers e button styles
- **ContentView.swift**: Novo tab bar com labels "Capa · Ensaio · Arquivo · Eu"
- **HomeView.swift**: Masthead editorial, hero com accent gradient, "Próximo ensaio", lista de edições recentes
- **TryOnView.swift**: Tela "Ensaio" com eyebrow, H1 serif, progress steps, drop zone, dicas numeradas
- **TryOnResultView.swift**: Tela hero dark (ink bg), cover masthead, nota gigante, score rows, análise, dicas, ocasiões
- **FeedView.swift**: "Arquivo" com filter chips, grid 2 colunas de mini-capas
- **ProfileView.swift**: "Eu" com header editorial, stats, plan card ink, índice numerado
- **TryOnCardView.swift**: Card editorial com bordas 1px, sem sombras, sem corner radius
- **OnboardingView.swift**: Onboarding editorial com serif italic headlines
- **EmptyStateView, ErrorStateView, ShimmerLoadingView, ReviewsView**: Atualizados para cherry
- **ProvadorIAApp.swift**: Sem preferredColorScheme, usa cherryBone para nav/tab appearance

### 2. Landing page reescrita
- HTML/CSS completo em `landing/index.html` com design editorial cherry
- Nav fixa, hero split, marquee de marcas, método 3 colunas, showcase grid, stack, pricing, FAQ, footer ink
- Fontes: Instrument Serif, Inter, JetBrains Mono
- Sem corner radius, sem sombras, bordas 1px

### 3. Legal pages criadas
- `landing/legal/privacy.html`
- `landing/legal/terms.html`
- `landing/legal/support.html`
- Também copiadas para `backend/app/static/` com rotas FastAPI

### 4. Privacy manifest
- `ios/ProvadorIA/PrivacyInfo.xcprivacy` criado e incluído no projeto via xcodegen
- Declara PhotoLibrary usage e tracking domains

### 5. Build e projeto
- Build number: 2 (incrementado de 1)
- Version: 1.0.0
- Projeto regenerado com xcodegen
- Build compila com sucesso (apenas warnings de actor isolation)
- App icon 1024px sem alpha: OK

### 6. Marketing materials
- `marketing/metadata.md` com copy, keywords, ASO
- Screenshots de referência copiados para `marketing/screenshots/`

### 7. Commit
- `be6a0ea` — feat: cherry editorial redesign + privacy manifest + legal pages + build 2
- `bb6674f` — fix: invalidate docker cache for backend deploy
- `d3b7fc5` — fix: invalidate root docker cache

## Bloqueios encontrados

### Railway deploy não reflete código novo
- Serviço "api" no Railway continua servindo versão antiga mesmo após múltiplos deploys
- As rotas `/privacy`, `/terms`, `/support`, `/` retornam 404 no ambiente production
- Localmente (uvicorn) todas as rotas funcionam perfeitamente
- Possíveis causas: cache de Docker layers, configuração de serviço não usando railway.toml, ou healthcheck impedindo rollout
- **Ação necessária**: Resolver deploy do backend antes de submeter para review da Apple

### URLs públicas
- `https://api-production-c696.up.railway.app/privacy` → 404 (precisa ser 200)
- `https://api-production-c696.up.railway.app/terms` → 404 (precisa ser 200)
- `https://api-production-c696.up.railway.app/support` → 404 (precisa ser 200)
- `https://api-production-c696.up.railway.app/` → 404 (precisa ser 200)

## Checklist pré-publicação (status)

### iOS App Preflight
- [x] Bundle ID correto: com.paulopierrondi.provadoria
- [x] Version/build atualizados: 1.0.0 / 2
- [x] Privacy manifest incluso
- [x] App icon 1024px sem alpha
- [x] Build compila
- [ ] Backend online com landing + legal pages respondendo 200
- [ ] Screenshots finais em dimensões corretas
- [ ] Upload do build para ASC
- [ ] Metadata, screenshots, descricao preenchidos no ASC
- [ ] Demo account configurado (se necessario)

### Screenshots
- [ ] iPhone 6.7" (1290x2796) — 6 screenshots
- [ ] iPhone 6.5" (1242x2688) — 6 screenshots
- [ ] iPad 12.9" (2048x2732) — 6 screenshots (opcional)

### ASO
- [x] Título, subtítulo, keywords, descrição, what's new
- [ ] Screenshots compostos com headline + device frame

## Próximos passos para publicar hoje

1. **Resolver deploy do backend**
   - Opção A: Verificar no dashboard do Railway se o serviço "api" está usando o Dockerfile correto
   - Opção B: Fazer deploy manual das páginas legais em outro host (Vercel, Netlify, GitHub Pages)
   - Opção C: Usar `railway deploy` com `--no-cache` ou similar

2. **Tirar screenshots no simulador**
   - Rodar app no iPhone 16 Pro Max (simulador)
   - Status bar: 9:41, bateria 100%, sinal cheio
   - Capturar 6 telas: Capa, Ensaio, Resultado, Arquivo, Perfil, Onboarding
   - Recomendo usar `xcrun simctl status_bar` para configurar status bar limpa

3. **Upload do build**
   - `cd ios && ./release.sh`
   - Verificar build aparece como VALID no ASC
   - Anexar build à versão 1.0

4. **Preencher ASC metadata**
   - Nome: ProvadorIA
   - Subtítulo: Experimente roupas com IA
   - Descrição: usar copy de `marketing/metadata.md`
   - Keywords: usar lista do metadata
   - Support URL: https://api-production-c696.up.railway.app/support (ou outra que responda 200)
   - Privacy URL: https://api-production-c696.up.railway.app/privacy
   - Marketing URL: https://api-production-c696.up.railway.app/
   - Screenshots: upload por locale e device class

5. **Submeter para review**
   - Confirmar todas as URLs respondem 200
   - Confirmar demo account funciona (se aplicável)
   - Preencher App Review Information
   - Enviar para review

## Decisões importantes

- **Design**: Paleta cherry (bone #F8DCD0, ink #1A0E0A, accent #E63923) aplicada em todo o app
- **Tipografia**: SF Pro para UI, New York (system serif) para display, SF Mono para labels
- **Sem corner radius**: Magazine = esquinas vivas. Exceções: avatar redondo, status bar, home indicator
- **Sem sombras**: Hierarquia vem de tipografia + cor + espaço
- **Tabs renomeadas**: Capa / Ensaio / Arquivo / Eu (em vez de Início / Try-On / Feed / Perfil)
- **Landing**: Reescrita do zero em HTML/CSS estático, não Next.js/Astro
