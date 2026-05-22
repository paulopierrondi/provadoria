# Project Brain Context

Generated: `2026-05-22 09:47:44`
Tool: `sync`
Local Obsidian vault: `/Users/paulopierrondi/Documents/Obsidian Vault`
Repository: `/Users/paulopierrondi/Downloads/provadoria`

This is a non-secret snapshot of the local Obsidian second brain for this repository.

## Required Agent Workflow

1. Read the repo instruction file for your agent: `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, or `KIMI.md`. For Google Antigravity, read both `AGENTS.md` and `GEMINI.md`.
2. Read this file before planning work.
3. If local vault access exists, prefer the live Obsidian notes over this snapshot.
4. If running in cloud without local vault access, use this file as the project memory source.
5. Select the relevant best-practice notes and checklists: app/web quality, screenshots, marketing creative/video, frontend, backend/API, web, iOS, Android, AI, release and security.
6. Never store real API keys or secrets in Markdown. Store only inventory metadata.
7. Capture reusable development lessons in the Learning Inbox or `.brain/SESSION_NOTES.md` when the vault is unavailable.
8. After meaningful work, update the live Obsidian project note or append durable context to `.brain/SESSION_NOTES.md`.

## Required Checklist Snapshot

## 04_Areas/Coding/Best Practices/Development Best Practices Hub.md

---
type: best-practices-hub
tags:
  - best-practices
  - coding
  - learning-loop
---
# Development Best Practices Hub

Este e o hub vivo de melhores praticas de desenvolvimento.

## Como usar

Antes de implementar, revisar ou desenhar arquitetura, escolha os guias relevantes:

- App/Web quality: [[04_Areas/Coding/Best Practices/App Web Quality Best Practices]]
- Mobile opening motion: [[04_Areas/Coding/Best Practices/Mobile App Opening Motion Standard]]
- Mobile privacy/consent: [[04_Areas/Coding/Best Practices/Mobile App Privacy Consent Standard]]
- iOS QA/TestFlight closure: [[04_Areas/Coding/Best Practices/iOS Functional QA And TestFlight Closure Standard]]
- Web/Next/React: [[04_Areas/Coding/Best Practices/Web Next React Best Practices]]
- Frontend UI/UX: [[04_Areas/Coding/Best Practices/Frontend UI UX Best Practices]]
- Backend/API: [[04_Areas/Coding/Best Practices/Backend API Best Practices]]
- Database/Data: [[04_Areas/Coding/Best Practices/Database Data Best Practices]]
- Mobile/iOS: [[04_Areas/Coding/Best Practices/Mobile iOS Best Practices]]
- Android: [[04_Areas/Coding/Best Practices/Android App Best Practices]]
- Python/Data tools: [[04_Areas/Coding/Best Practices/Python Data Best Practices]]
- AI/LLM apps: [[04_Areas/Coding/Best Practices/AI LLM Best Practices]]
- DevOps/Railway: [[04_Areas/Coding/Best Practices/DevOps Railway Best Practices]]
- Testing/QA: [[04_Areas/Coding/Best Practices/Testing QA Best Practices]]
- Agent workflow: [[04_Areas/Coding/Best Practices/Agent Workflow Best Practices]]
- Security baseline: [[04_Areas/Coding/Checklists/Security Checklist]]
- Platform checklists: [[04_Areas/Coding/Checklists/Project Checklist Hub]]

## Como aprender automaticamente

Todo coder deve registrar aprendizados reutilizaveis em:

- [[04_Areas/Coding/Best Practices/Learning Inbox]]
- [[04_Areas/Coding/Best Practices/Patterns To Promote]]

Aprendizado reutilizavel e algo que deve guiar projetos futuros:

- erro recorrente;
- comando canonico melhor;
- convencao de plataforma;
- decisao de arquitetura que se repetiu;
- checklist que faltava;
- risco de seguranca percebido;
- padrao de deploy ou rollback;
- regra de UX/design que melhorou resultado;
- falha visual detectada por screenshot ou viewport;
- regra de store readiness para App Store ou Google Play.

## Regra para agentes

Quando uma sessao terminar, perguntar internamente:

- "Isto ensina algo reutilizavel?"
- "Algum checklist deve ganhar item novo?"
- "Alguma pratica antiga deve ser corrigida?"
- "Isso vale para uma plataforma especifica ou para todos os projetos?"

Se sim, registrar no Learning Inbox ou em `.brain/SESSION_NOTES.md` quando o vault nao estiver acessivel.

## Promocao

Itens do Learning Inbox viram melhores praticas quando:

- aconteceram em mais de um projeto;
- evitaram bug, retrabalho, custo ou risco;
- melhoraram qualidade visual, seguranca, performance ou deploy;
- foram confirmados por teste, build, deploy ou revisao.

## Links

- [[04_Areas/Coding/AI Coding Operating System]]
- [[04_Areas/Coding/Checklists/Project Checklist Hub]]
- [[04_Areas/Coding/Checklists/App Web Preflight Checklist]]
- [[04_Areas/Coding/Checklists/Screenshots Visual QA Checklist]]
- [[99_System/AI Agent Vault Policy]]
- [[99_System/Security And Secrets Policy]]

## 04_Areas/Coding/Best Practices/App Web Quality Best Practices.md

---
type: best-practices
platform: app-web-quality
tags:
  - best-practices
  - apps
  - web
  - screenshots
  - quality
---
# App Web Quality Best Practices

## Principio

Qualidade de app/web e uma combinacao de produto, design, estado, performance, acessibilidade, privacy, store readiness e evidencia visual. **Qualidade sempre sobe. Nunca degrada conscientemente.** Cada release, cada tela, cada screenshot, cada copy substituida deve estar igual ou melhor que a versao anterior. Se um deliverable parece pior que o anterior, ou pior que o competidor, e nao-aceitavel; refazer.

## O padrao Paulo

- Construir a experiencia real primeiro.
- Evitar landing generica quando o pedido e app/ferramenta.
- Todo app precisa nascer com identidade publica completa: icone final forte, landing page publica de padrao superior e links legais vivos. Isso e parte do produto, nao acabamento.
- App icon nunca pode ser placeholder. Antes de review, TestFlight, launch, deck ou paid campaign, validar o icone dentro do build/app instalado, no asset catalog completo da plataforma e na landing/favicons/OG image.
- Landing page publica nunca pode ser resposta JSON, pagina generica ou placeholder. `GET /` deve entregar HTML responsivo, branded, com proposta de valor clara, visual real do produto, CTA, links de suporte/privacy/terms e metadata social/SEO.
- Interfaces operacionais devem ser claras, densas e rapidas.
- Apps consumer podem ser mais expressivos, mas ainda precisam de fluxo obvio.
- Todo app mobile deve ter uma pequena animacao de abertura contextual ao dominio do app, antes de privacidade/auth/home, sem parecer splash generico e sem atrasar o uso.
- Em app iOS, modificacao significativa so fecha depois de teste funcional no app instalado e upload do novo build para TestFlight/App Store Connect, salvo excecao explicita.
- Screenshots sao deliverable de primeira classe, nao "depois". Submission, release, post, deck, anuncio ou pagina nova so e "feito" quando os arquivos finais artisticos existem, validados e registrados.
- Privacidade e consentimento tambem sao deliverable de primeira classe. Todo app novo precisa ter tela padrao de primeira abertura, links legais vivos e tracking desligado por padrao antes de qualquer SDK/evento de marketing.
- Toda tela importante precisa lidar com loading, erro, vazio e permissao.
- Classificar cada screenshot por finalidade antes da QA final: produto real, store review, marketing, deck preview, teste visual ou dependencia. Screenshot de `node_modules`, fixture ou snapshot de pacote nao prova qualidade do app.

## Privacy and consent

Regra maxima: app sem clareza de privacidade nao esta pronto para TestFlight externo, review, campanha ou launch.

Padrao:
- Primeiro launch deve explicar uso funcional de dados, oferecer links legais e permitir continuar sem tracking.
- Tracking entre apps/sites, IDFA, ads SDK, MMP e medicao de marketing ficam desligados por padrao e exigem decisao explicita de produto.
- Se nao houver tracking, remover SDKs de ads/attribution, SKAdNetwork IDs e chaves client-side do binario final.
- Se houver tracking, ATT/privacy labels/termos/eventos precisam estar coerentes antes do upload.
- Screenshot da tela de consentimento por idioma principal vira evidencia obrigatoria do release.

Guia canonico: [[04_Areas/Coding/Best Practices/Mobile App Privacy Consent Standard]]

## Opening motion

Regra maxima: todo app mobile precisa de uma assinatura curta de abertura, contextual ao produto, local/offline e respeitando acessibilidade.

Padrao:
- Launch screen nativo fica estatico; a animacao acontece dentro do app apos o primeiro frame.
- A animacao usa a metafora real do produto: musica, financas, devocional, escola, saude, foto/video, SaaS etc.
- Primeiro uso pode durar ate `1.6s`; cold start recorrente deve ser mais curto, idealmente `0.4s-0.9s`; nunca passar de `2s`.
- Deve respeitar Reduce Motion e nao depender de backend.
- Nao pode inicializar tracking, ads SDK ou medicao de marketing antes do consentimento aplicavel.
- Evidencia visual da animacao deve ser registrada na nota do projeto quando houver release visual/mobile.

Guia canonico: [[04_Areas/Coding/Best Practices/Mobile App Opening Motion Standard]]

## iOS QA and TestFlight closure

Regra maxima: para app iOS, "feito" nao significa apenas codigo compilando. Significa app testado, build incrementado, archive/export feito e upload TestFlight concluido.

Padrao:
- Ao fechar mudanca iOS significativa, testar no app instalado: cold start/opening motion, privacy/consent, auth/demo ou anonimo, Home, navegacao principal, feature alterada, links legais e APIs relevantes.
- Incrementar build number antes do archive.
- Usar lane/script existente (`bundle exec fastlane local_beta`, `npm run ios:upload` ou equivalente).
- Confirmar upload para App Store Connect/TestFlight e registrar se esta processing ou `VALID`.
- Atualizar vault e Linear com build/version, comandos, artefatos visuais e riscos.
- TestFlight upload tem
...[truncated]

## 04_Areas/Coding/Best Practices/Recent App Web Screenshot Learnings.md

---
type: learning-review
area: app-web-quality
tags:
  - screenshots
  - visual-qa
  - apps
  - web
  - learning-loop
---
# Recent App Web Screenshot Learnings

Consolidado das criacoes e artefatos recentes encontrados no workspace.

## Fontes observadas

- `pierrondi-ia/docs/marketing/campaigns/.../buildinpublic-stats-1080x1350.png`
- `ppt_engine/workspace/.../*.preview.png`
- `fashioncore/apps/ios/fastlane/screenshots/en-US/*_1284x2778.png`
- `fifa2026bolao/artifacts/review/*iphone*.png`
- `fifa2026bolao/artifacts/review/*ipad*.png`
- `servicenow-agent-army/marketing/video-*`
- `pierrondi-ia/test-results`
- `pierrondi-ia/tmp/ui-review`

## Aprendizados promovidos

- Screenshot de review/store precisa provar plataforma e tamanho, nao apenas "parece bonito".
- App Store/Google Play pedem conjuntos diferentes de evidencia: phone, tablet/large screen quando aplicavel, idioma, dark/light e ausencia de dados sensiveis.
- Imagens de marketing precisam nascer no formato de destino: feed, story, deck, landing, preview e video nao devem reaproveitar crop por acidente.
- Screenshots de UI precisam capturar estado real: loading, empty, erro, permissao, auth, pagamento, onboarding e sucesso.
- Render preview de deck/documento/site e uma forma de teste visual; se nao renderizou, nao esta pronto.
- `node_modules`, package fixtures e snapshots de dependencias nao contam como evidencia do produto.
- O vault deve registrar paths e decisao de qualidade, nao copiar imagens sensiveis nem inflar a memoria com dumps.

## Regra operacional

Quando um agente mexer em app/web visual:

- usar [[04_Areas/Coding/Checklists/Screenshots Visual QA Checklist]];
- registrar os paths de evidencia na nota do projeto;
- transformar falhas recorrentes em item de checklist;
- nao anexar screenshot com segredo, PII, token, cookie ou ambiente de producao exposto.

## Destinos

- [[04_Areas/Coding/Best Practices/App Web Quality Best Practices]]
- [[04_Areas/Coding/Checklists/App Web Preflight Checklist]]
- [[04_Areas/Coding/Checklists/Screenshots Visual QA Checklist]]

## 04_Areas/Coding/Best Practices/Android App Best Practices.md

---
type: best-practices
platform: android
tags:
  - best-practices
  - android
  - google-play
---
# Android App Best Practices

## Principios

- Android nao e apenas "iOS portado": respeitar back navigation, intents, permissions, density, large screens e lifecycle.
- Estado do usuario deve sobreviver background, rotacao e navegacao.
- Permissoes perigosas precisam ser minimizadas e pedidas no contexto certo.
- Data safety e privacy policy precisam bater com codigo e SDKs.

## UI

- Usar Material 3 quando estiver no stack.
- Touch targets e fontes precisam escalar.
- Layouts devem funcionar em phone, tablet e foldable quando relevante.
- Dark mode precisa ser intencional, nao acidental.

## Arquitetura

- Segredos nunca entram no APK/AAB.
- Offline e rede ruim precisam de estado explicito.
- Background work deve usar APIs apropriadas e respeitar bateria.
- Analytics/crash SDKs devem estar no inventario de privacy.

## Release

- Version code/name atualizados.
- App Bundle com signing correto.
- Store listing honesta.
- Test track antes de producao.
- Data safety atualizado a cada novo SDK/coleta.

## Links

- [[04_Areas/Coding/Checklists/Android App Preflight Checklist]]
- [[04_Areas/Coding/Best Practices/App Web Quality Best Practices]]

## 04_Areas/Coding/Best Practices/Agent Workflow Best Practices.md

---
type: best-practices
platform: agents
tags:
  - best-practices
  - agents
  - codex
  - claude
  - kimi
  - gemini
  - cursor
---
# Agent Workflow Best Practices

## Principios

- Primeiro ler memoria; depois planejar; depois editar.
- Agente nao deve pedir segredo que pode ser acessado via provider/CLI.
- Mudancas devem ser pequenas, verificaveis e registradas.
- Aprendizado reutilizavel deve voltar para o vault.
- Quando houver subagentes, manter ownership claro e nao duplicar o mesmo escopo de escrita.
- Antes de promover um padrao, diferenciar lição madura de caso puntual com dependencias de plataforma.
- Para trabalhos paralelos, cada worker precisa de escopo disjunto, nao pode reverter edits de outros e deve aceitar que a base do codigo nao esta isolada.
- Background Coders ativos sao Codex, Claude Code, Kimi CLI, Gemini CLI e Google Antigravity. Cursor Background Agent fica dormente, salvo ativacao explicita do Paulo.
- `GEMINI.md` deve ficar em paridade operacional com `AGENTS.md`; Gemini CLI usa essa memoria e Antigravity tambem deve conseguir ler `AGENTS.md` + `GEMINI.md`.
- Antigravity deve operar com Project folders explicitos. Se o vault nao estiver no Project, usar `.brain/PROJECT_CONTEXT.md` ou pedir acesso ao vault antes de assumir contexto vivo.

## Inicio

- Rodar/usar `brain-preflight`.
- Ler `.brain/PROJECT_CONTEXT.md`.
- Ler nota do projeto e AI history.
- Ler best practices e checklists relevantes.
- Confirmar comandos canonicos.
- Para background work, confirmar `.brain/BACKGROUND_CODER_CONTEXT.md`, owner (`codex`, `claude`, `kimi`, `gemini` ou `antigravity`), issue/tarefa unica, artefato esperado e stop condition.

## Durante

- Preservar mudancas do usuario.
- Evitar refactor fora do escopo.
- Usar ferramentas seguras para secrets: Railway, provider env vars, 1Password/Keychain.
- Nao imprimir env completo.
- Nao pedir a nenhum background coder para operar secrets, deploy, App Store/TestFlight, paid ads, social publishing, migrations de producao ou multi-repo changes sem aprovacao explicita.

## Fim

- Atualizar nota do projeto.
- Atualizar `.brain/SESSION_NOTES.md` se sem vault.
- Registrar aprendizado em [[04_Areas/Coding/Best Practices/Learning Inbox]] quando reutilizavel.
- Sugerir promocao para best practice quando padrao aparecer de novo.
- Se a entrega veio de background coder, registrar owner, handoff aceito/rejeitado e atualizar Linear apenas depois de validação local.

## Aprendizados locais

- Adicionar aqui comportamento que melhorou entregas dos coders.

- 2026-05-21: Cursor Background Agent deve entrar no Hub como worker remoto de branch/PR pequeno, nunca como integrador final. Ele usa snapshots `.brain` e `.cursor/rules`; Codex/Claude local valida e Obsidian/Linear registram a realidade.
- 2026-05-21: Paulo decidiu nao abrir Cursor por ora. Background work deve ficar embutido nos coders atuais: Kimi para volume/triagem, Codex para patch/integracao, Claude Code para complexidade/compliance, Gemini CLI para validacao independente/MCP/terminal e Antigravity para orquestracao/browser/worktree/artefatos. Cursor fica dormente.
- 2026-05-21: Gemini CLI e Google Antigravity entram como coders ativos no Hub. Gemini cobre validacao independente/MCP/terminal com `GEMINI.md`; Antigravity cobre orquestracao agent-first, browser/Chrome, worktrees, subagentes e artefatos com `AGENTS.md` + `GEMINI.md`.

## 04_Areas/Coding/Checklists/Project Checklist Hub.md

---
type: checklist-hub
tags:
  - checklist
  - coding
  - security
---
# Project Checklist Hub

Este e o hub obrigatorio de checklists para todos os projetos.

## Uso por agentes

Antes de implementar, revisar ou fazer deploy, o agente deve escolher os checklists relevantes:

- Preflight essencial app/web: [[04_Areas/Coding/Checklists/App Web Preflight Checklist]]
- Visual QA/screenshots: [[04_Areas/Coding/Checklists/Screenshots Visual QA Checklist]]
- Frontend: [[04_Areas/Coding/Checklists/Frontend Checklist]]
- Backend/API: [[04_Areas/Coding/Checklists/Backend API Checklist]]
- Web/Next/Node: [[04_Areas/Coding/Checklists/Platform Web Next Node Checklist]]
- Web app quality: [[04_Areas/Coding/Checklists/Web App Preflight Checklist]]
- Mobile/iOS: [[04_Areas/Coding/Checklists/Platform Mobile iOS Checklist]]
- iOS app quality: [[04_Areas/Coding/Checklists/iOS App Preflight Checklist]]
- iOS QA/TestFlight closure: [[04_Areas/Coding/Best Practices/iOS Functional QA And TestFlight Closure Standard]]
- App Store Connect upload: [[04_Areas/Coding/Checklists/App Store Connect Upload Runbook]]
- **🚨 Apple reject resolution (LEITURA OBRIGATÓRIA antes de tocar em qualquer reject):** [[04_Areas/Coding/Checklists/Apple Reject Resolution Audit Checklist]]
- Android app quality: [[04_Areas/Coding/Checklists/Android App Preflight Checklist]]
- Python/Data: [[04_Areas/Coding/Checklists/Platform Python Data Checklist]]
- IA/LLM: [[04_Areas/Coding/Checklists/AI Integrations Checklist]]
- Deploy/Release: [[04_Areas/Coding/Checklists/Release Deploy Checklist]]
- Seguranca: [[04_Areas/Coding/Checklists/Security Checklist]]
- Secrets/API keys: [[04_Areas/Coding/Checklists/Secrets And API Keys Register]]
- Apple/App Store Connect: [[04_Areas/Coding/Checklists/Apple Developer And App Store Connect Inventory]]
- Railway variables: [[04_Areas/Coding/Checklists/Railway Secrets Inventory]]

## Regra dura

O vault guarda inventario, decisoes e referencias. O vault **nao guarda valores reais** de API keys, tokens, senhas, cookies, private keys, refresh tokens ou credenciais de producao.

## Start gate para qualquer projeto

- [ ] Identificar plataforma: web, mobile, backend, IA, data, infra.
- [ ] Abrir nota do projeto em `02_Projects`.
- [ ] Abrir `.brain/PROJECT_CONTEXT.md` quando existir.
- [ ] Rodar `brain-linear-sync` ou ler [[04_Areas/Coding/Linear/Linear Git Sync Report]] para estado Git/local.
- [ ] Para roadmap, bug, status, prioridade, release, sprint/cycle, automacao ou backlog cleanup, ler o projeto/issue vivo no Linear via conector quando disponivel.
- [ ] Selecionar checklists relevantes deste hub.
- [ ] Para app, site, tela, fluxo visual ou store submission, abrir [[04_Areas/Coding/Checklists/App Web Preflight Checklist]].
- [ ] Para mudanca visual, planejar screenshots com [[04_Areas/Coding/Checklists/Screenshots Visual QA Checklist]].
- [ ] Verificar riscos e decisoes antigas.
- [ ] Confirmar onde secrets reais devem ficar.
- [ ] Para iOS/App Store, abrir o inventario Apple antes de pedir IDs ou chaves.
- [ ] Para mudanca iOS significativa, planejar QA funcional instalada e upload TestFlight no fechamento.
- [ ] Definir comandos de lint, test e build.

## Finish gate para qualquer projeto

- [ ] Atualizar nota do projeto.
- [ ] Atualizar Linear quando a realidade da issue/projeto mudou; se nao for apropriado alterar status, registrar proposta clara em [[04_Areas/Coding/Linear/Linear Cleanup Backlog]] ou na nota do projeto.
- [ ] Nao fechar, arquivar, relabelar, reatribuir ou mover issues em massa sem proposta e aprovacao explicita.
- [ ] Atualizar inventario de env vars/secrets sem valores reais.
- [ ] Atualizar inventario Apple quando houver mudanca de Issuer ID, Team ID, Key ID, APNS, IAP ou signing.
- [ ] Registrar comandos rodados.
- [ ] Para iOS significativo, registrar TestFlight build/version/status ou excecao explicita.
- [ ] Registrar paths dos screenshots relevantes ou motivo de nao capturar.
- [ ] Registrar riscos, decisoes e proximos passos.
- [ ] Confirmar que nenhum segredo foi escrito em Markdown, logs, commits ou screenshots.
- [ ] Se isto foi automacao/rotina/job/cloud runner, enviar email final para `pierrondi@gmail.com` conforme [[99_System/Automation Email Policy]].

## Referencias externas

- Apple HIG: https://developer.apple.com/design/human-interface-guidelines
- Apple App Review Guidelines: https://developer.apple.com/app-store/review/guidelines/
- Android Core App Quality: https://developer.android.com/docs/quality-guidelines/core-app-quality
- Android technical quality: https://developer.android.com/quality/technical
- Google Play Developer Program Policy: https://support.google.com/googleplay/android-developer/answer/16933379
- Web Vitals: https://web.dev/articles/vitals
- WCAG 2.2: https://www.w3.org/TR/WCAG22/
- OWASP Top 10 2021: https://owasp.org/Top10/2021/
- OWASP API Security Top 10 2023: https://owasp.org/API-Security/
- OWASP ASVS: https://owasp.org/www-project-application-security-
...[truncated]

## 04_Areas/Coding/Checklists/App Web Preflight Checklist.md

---
type: preflight-checklist
area: app-web-quality
tags:
  - preflight
  - apps
  - web
  - ios
  - android
  - quality
---
# App Web Preflight Checklist

Este e o preflight mais importante antes de criar, alterar ou revisar qualquer app, web app, site, tela, fluxo, release, screenshot ou submission.

## 0. Classificar o trabalho

- [ ] Tipo: web app, site, iOS, Android, cross-platform, backend-for-frontend, landing, dashboard, game, marketing page.
- [ ] Plataforma alvo primaria definida.
- [ ] Plataforma secundaria definida.
- [ ] Usuario alvo e momento de uso definidos.
- [ ] Fluxo principal em uma frase.
- [ ] Risco principal: design, dados, auth, pagamento, store review, performance, privacy, AI, deploy.

## 0.1 Regra maxima de ads tracking

> Todo app novo ou em uso precisa ter tracking de aquisicao e performance de ads como requisito de produto, nao como tarefa de marketing posterior.

- [ ] Mobile app: TikTok App Events SDK ou MMP equivalente planejado/implementado quando o app puder receber TikTok/Meta/social paid.
- [ ] iOS: SKAN/AdServices/ATT/App Privacy/PrivacyInfo revisados e com um unico owner de conversion value.
- [ ] Web/PWA/landing: TikTok Pixel + Events API/UTM capture planejado/implementado quando houver trafego pago/social.
- [ ] Evento de funil minimo definido: app open/install, onboarding completed, ativacao principal, paywall viewed, trial/purchase started, purchase/subscription completed.
- [ ] Reporting central definido: app, channel, campaign, spend, impressions, clicks/taps, installs/leads, CPA/CPT e receita/trial quando existir.
- [ ] Test Events ou equivalente documentado antes de qualquer campanha paga, budget scale, creative refresh pago ou paid launch.
- [ ] Segredos ficam em secret manager/build env/provider env; vault registra somente nomes de env vars e local de armazenamento.

## 1. Ler memoria e padroes

- [ ] Nota do projeto em `02_Projects`.
- [ ] `.brain/PROJECT_CONTEXT.md`.
- [ ] AI history do projeto.
- [ ] `brain-linear-sync` rodado ou [[04_Areas/Coding/Linear/Linear Git Sync Report]] lido.
- [ ] Linear issue/projeto vivo lido via conector quando o trabalho for roadmap, bug, release, status, prioridade, sprint/cycle, backlog ou automacao.
- [ ] [[04_Areas/Coding/Best Practices/Development Best Practices Hub]]
- [ ] [[04_Areas/Coding/Best Practices/Frontend UI UX Best Practices]]
- [ ] [[04_Areas/Coding/Checklists/Project Checklist Hub]]
- [ ] [[04_Areas/Coding/Checklists/Screenshots Visual QA Checklist]]
- [ ] [[04_Areas/Coding/Checklists/Security Checklist]]

## 2. Plataforma

- [ ] Web: [[04_Areas/Coding/Checklists/Web App Preflight Checklist]]
- [ ] iOS: [[04_Areas/Coding/Checklists/iOS App Preflight Checklist]]
- [ ] Android: [[04_Areas/Coding/Checklists/Android App Preflight Checklist]]
- [ ] Backend/API: [[04_Areas/Coding/Checklists/Backend API Checklist]]
- [ ] AI/LLM: [[04_Areas/Coding/Checklists/AI Integrations Checklist]]
- [ ] Release/deploy: [[04_Areas/Coding/Checklists/Release Deploy Checklist]]

## 3. Produto e UX

- [ ] Primeira tela mostra valor real, nao placeholder ou marketing vazio.
- [ ] Todo app tem identidade publica pronta: icone final forte, landing page publica superior e links legais vivos.
- [ ] Mobile app tem opening motion contextual ao dominio do produto, curto, offline, sem spinner generico e sem bloquear o uso.
- [ ] `GET /` do dominio publico entrega landing HTML responsiva, nao JSON cru, pagina vazia ou placeholder.
- [ ] Landing inclui nome do app, promessa clara, visual real/screenshot, CTA, support/privacy/terms, favicon/app icon e Open Graph/Twitter metadata.
- [ ] Fluxo principal tem inicio, acao, feedback, erro e conclusao.
- [ ] Se for app iOS com mudanca significativa, fechamento inclui QA funcional no app instalado e upload TestFlight/App Store Connect.
- [ ] Estados vazios, loading, erro, offline e permissao negada foram tratados.
- [ ] Usuario consegue recuperar de erro sem perder trabalho.
- [ ] Copy esta em idioma correto e nao promete o que app nao entrega.
- [ ] Nenhum texto explica funcionalidade que a UI deveria tornar obvia.

## 4. Qualidade visual

> **Regra zero:** screenshots para loja, marketing ou release sao deliverable de primeira classe, sempre "super awesome", sempre iguais ou melhores que a versao anterior. Ver [[04_Areas/Coding/Checklists/Screenshots Visual QA Checklist]] e [[04_Areas/Coding/Best Practices/App Web Quality Best Practices]].

- [ ] App icon foi validado como final, forte e reconhecivel; nao e placeholder, template cru ou asset generico.
- [ ] App icon esta consistente entre build instalado, App Store/Play, landing, favicon e OG image.
- [ ] Screenshot desktop e mobile foram capturados quando ha mudanca visual.
- [ ] Opening motion mobile foi capturado em screenshot/video curto e o path foi registrado quando houve mudanca de app/release.
- [ ] Para store submission: 6 screenshots composed por idioma e device class, no formato exato (App Store 6.9" = 1320x2868). Sem composer brandado e
...[truncated]

## 04_Areas/Coding/Checklists/Screenshots Visual QA Checklist.md

---
type: checklist
area: visual-qa
tags:
  - screenshots
  - visual-qa
  - quality
---
# Screenshots Visual QA Checklist

> **Regra zero — sempre awesome, nunca degrada.** Toda screenshot destinada a loja, marketing, post, deck ou capa de release e deliverable de primeira classe. Sai composta, brandada, no formato exato do destino, em todos os idiomas relevantes. Nao existe "screenshot ok pra primeira versao". Cada nova versao deve ser igual ou melhor que a anterior — degradacao visual e regressao e bloqueia release.

## Quando capturar

- [ ] Mudanca visual em tela, componente, landing, dashboard ou app.
- [ ] Novo fluxo de onboarding, auth, pagamento, upload, IA ou deploy.
- [ ] Submission App Store/Google Play — **bloqueador**: sem 6 telas finais composed em cada idioma + device class, nao submete.
- [ ] Resubmission apos rejeicao Apple/Google — refazer set inteiro se o build mudou de jeito visivel.
- [ ] Lancamento de feature consumer — pelo menos 1 hero shot artistico para post/release notes.
- [ ] Bug visual, overflow ou responsividade.
- [ ] Antes/depois de refactor de UI — comparar lado-a-lado.
- [ ] Marketing post, anuncio, deck, video preview — formato e dimensoes do canal final, nao reaproveitar de outro lugar.

## Viewports

- [ ] Mobile estreito.
- [ ] Mobile alto.
- [ ] Tablet quando aplicavel.
- [ ] Desktop padrao.
- [ ] Desktop largo quando layout for responsivo.
- [ ] Light/dark mode quando suportado.

## "Super awesome" para store/marketing — checklist obrigatorio

- [ ] Composicao branded: brand gradient/textura + headline tipografica + frame de device realista + footer com wordmark/logo.
- [ ] Headline tipografica forte (display font, peso 800+, tamanho >= 100px no 1320px), idealmente com gradient sutil.
- [ ] Eyebrow curta acima do headline (uppercase, letter-spacing alto, cor accent da marca).
- [ ] Subhead em uma linha que explica o beneficio.
- [ ] Frame de device com bezel realista, Dynamic Island/notch correto, side buttons, drop shadow.
- [ ] Screenshot interna mostra produto em uso real, com dados de demo plausiveis (nao login, nao splash, nao tela vazia).
- [ ] Resolucao EXATA do destino:
  - iPhone 6.9": 1320x2868
  - iPhone 6.7": 1290x2796
  - iPhone 6.5": 1242x2688
  - iPhone 5.5": 1242x2208
  - iPad 13": 2064x2752
  - iPad 12.9": 2048x2732
  - Instagram feed: 1080x1350
  - Instagram story: 1080x1920
  - LinkedIn post: 1200x627
- [ ] Status bar: 9:41, bateria 100%, sinal cheio, sem operadora estranha. `xcrun simctl status_bar` ou device fisico ja configurado.
- [ ] Por idioma do mercado (minimo pt-BR + en-US para Brasil/global; adicionar es-MX/es-AR/pt-PT conforme distribuicao).
- [ ] Storytelling: 6 screenshots = arco (hook -> mecanica -> payoff -> social -> monetizacao -> upgrade).
- [ ] Comparada lado-a-lado com a versao anterior: igual ou melhor. Nunca pior.
- [ ] Comparada lado-a-lado com competidor direto: aguenta sem parecer pior.

## O que reprova

- [ ] Texto cortado.
- [ ] Texto ou controles sobrepostos.
- [ ] Botao muda tamanho no hover/loading.
- [ ] Cards dentro de cards sem motivo.
- [ ] Hero generico sem produto/objeto real.
- [ ] Imagem escura, cortada ou decorativa quando deveria explicar produto.
- [ ] Loading/empty/error com layout quebrado.
- [ ] Conteudo principal abaixo da dobra sem sinal visual.
- [ ] Cores muito monocromaticas sem hierarquia.
- [ ] Screenshot cru de simulator/device enviado para loja ou marketing sem composicao.
- [ ] Screenshot em idioma errado para o mercado.
- [ ] Apenas tela de login, splash ou title art (Apple Guideline 2.3.3 reprova).
- [ ] Resolucao aproximada (1290x2796 enviado como 6.9" e errado — Apple aceita mas perde fidelidade).
- [ ] Reaproveitar screenshot de release anterior sem comparar — risco de regressao silenciosa.
- [ ] Screenshot de dependencia, fixture ou `node_modules` tratado como prova do app.

## Evidencia

- [ ] Paths dos screenshots registrados na nota do projeto.
- [ ] Cada screenshot de QA tem interpretacao humana registrada: o que passou, o que falhou, se bloqueia release e qual e o proximo passo.
- [ ] Screenshot em simulador/device compartilhado com outros apps/agentes nao conta como evidencia final sem confirmar bundle/app/processo.
- [ ] Para iOS/App Store, a evidencia final precisa mostrar produto real em uso, nao apenas login/tour; login/tour conta somente como evidencia auxiliar.
- [ ] Push/ASC ficam bloqueados ate todos os fluxos core terem screenshot ou video curto com resultado pass/fail registrado.
- [ ] Se screenshot contem dado sensivel, nao anexar ao vault; registrar apenas que foi verificado.
- [ ] Falhas visuais viram item no projeto ou Learning Inbox.

## Pipeline canonico — HTML composer + Playwright

Para produzir screenshots "super awesome" reusavel entre projetos:

```
project/marketing/
  composer/
    template.html      # brand gradient + headline + frame + footer
    manifest.json      # {shots: [{id, raw, pt:{eyebrow,headline,subhead}, en:{...}}, ...]}
    render.mjs         #
...[truncated]

## 04_Areas/Coding/Checklists/Web App Preflight Checklist.md

---
type: preflight-checklist
platform: web
tags:
  - preflight
  - web
  - quality
---
# Web App Preflight Checklist

## UX

- [ ] O primeiro viewport mostra produto, estado real ou tarefa principal.
- [ ] Navegacao principal e retorno sao claros.
- [ ] Estados empty/loading/error/success existem.
- [ ] Forms preservam dados em erro.
- [ ] Tabelas/listas funcionam em mobile ou tem alternativa.
- [ ] Conteudo real nao depende de lorem ipsum/placeholder.

## Web performance

- [ ] LCP target: ate 2.5s quando medido em experiencia real.
- [ ] INP target: ate 200ms.
- [ ] CLS target: ate 0.1.
- [ ] Imagens com dimensoes, lazy loading quando adequado e formatos corretos.
- [ ] Fontes nao bloqueiam render sem motivo.
- [ ] JS pesado foi evitado ou code-split.

## Accessibility

- [ ] WCAG 2.2 como alvo de referencia.
- [ ] Focus nao fica escondido.
- [ ] Target size/touch target aceitavel.
- [ ] Drag-and-drop tem alternativa.
- [ ] Autenticacao acessivel.
- [ ] Ajuda consistente em fluxos complexos.

## Technical

- [ ] SEO/metadata quando pagina publica.
- [ ] Canonical/robots/sitemap quando relevante.
- [ ] CSP, CORS e security headers considerados.
- [ ] API client nao carrega secrets.
- [ ] Error boundaries/logging sem PII.
- [ ] Analytics respeitam consent/privacy.

## Visual QA

- [ ] Screenshot desktop.
- [ ] Screenshot mobile.
- [ ] Screenshot de estado de erro/loading se mudou fluxo.
- [ ] Sem overflow horizontal.
- [ ] Sem texto sobrepondo UI.

## Referencias

- Web Vitals: https://web.dev/articles/vitals
- WCAG 2.2: https://www.w3.org/TR/WCAG22/

## 04_Areas/Coding/Checklists/iOS App Preflight Checklist.md

---
type: preflight-checklist
platform: ios
tags:
  - preflight
  - ios
  - app-store
  - quality
---
# iOS App Preflight Checklist

## Produto e UX

- [ ] App segue convencoes iOS/HIG em navegacao, controles, gestos e feedback.
- [ ] App tem opening motion contextual ao dominio, implementado apos LaunchScreen estatico, curto e sem bloquear o uso.
- [ ] Fluxo principal funciona em device/simulador.
- [ ] Fluxos core e feature alterada foram testados no app instalado antes do fechamento.
- [ ] Safe area, Dynamic Type, dark mode e orientacao foram considerados.
- [ ] Permissoes aparecem no momento certo e explicam valor ao usuario.
- [ ] Offline/network slow nao quebra estado.
- [ ] Nenhum segredo real embutido no app.

## App Store review

- [ ] App nao tem placeholders, telas vazias ou conteudo temporario.
- [ ] App icon e final, forte, reconhecivel e consistente com a landing/App Store; nao e placeholder.
- [ ] App icon esta completo no asset catalog/build final da plataforma, nao apenas como PNG 1024 isolado.
- [ ] Backend esta online para review.
- [ ] URL raiz publica (`GET /`) entrega landing HTML responsiva de padrao superior, nao JSON cru.
- [ ] Landing tem nome do app, promessa clara, screenshots/visual real, CTA, suporte, privacy, terms, favicon/app icon e metadata social.
- [ ] Demo account ou demo mode existe quando login e necessario.
- [ ] Se login e necessario, Apple Sign-In e criacao de conta por e-mail foram testados em producao ou build release-like.
- [ ] App Review Information contem usuario demo e senha no App Store Connect; senha nao foi registrada no vault.
- [ ] Metadata, screenshots, descricao e notas de review batem com o app real.
- [ ] Support URL, Privacy URL e Terms URL retornam `200 text/html` antes da submissao.
- [ ] Se o dominio do produto nao estiver pronto, usar `https://www.pierrondi.dev/apps/<app-slug>/support`, `/privacy` e `/terms` como fallback oficial.
- [ ] Gate de release registrado no vault antes de push/upload: comandos, build number, simulator/device, screenshots, pass/fail humano, blockers e decisao final.
- [ ] Se houver outro chat/agente/processo trabalhando no app, usar simulador/device isolado ou registrar conflito; screenshot de device compartilhado nao conta como evidencia final sem confirmar app/bundle/processo.
- [ ] Push/ASC bloqueados se qualquer fluxo core abrir web indevidamente, mostrar app errado, ficar preso em login sem demo account/demo mode, tiver texto truncado, placeholder visual ou acao principal nao validada.
- [ ] Fluxos nativos minimos testados no app instalado: Auth/demo, Home, Planner/AI planner, Coach, Devotional, Records e Settings/sign-out.
- [ ] IAP/subscriptions estao visiveis, funcionais e explicados.
- [ ] Privacy policy e App Privacy Details batem com SDKs e coleta real.
- [ ] Opening motion nao inicializa tracking/ads/marketing antes de consentimento e respeita Reduce Motion.
- [ ] Privacy manifest (`PrivacyInfo.xcprivacy`) bate com dominios reais usados em producao.
- [ ] UGC tem report, block, moderation e contato quando aplicavel.
- [ ] Kids, saude, financeiro, sorteios/jogos, IA ou conteudo sensivel foram revisados.

## Build

- [ ] Bundle ID correto.
- [ ] Version/build number atualizados.
- [ ] Entitlements/capabilities revisados.
- [ ] Signing/provisioning ok.
- [ ] Archive/test build validado.
- [ ] Crash/logs revisados.
- [ ] Para upload/TestFlight/App Store Connect API, [[04_Areas/Coding/Checklists/Apple Developer And App Store Connect Inventory]] foi conferido.
- [ ] Para upload/TestFlight/App Store Connect API, [[04_Areas/Coding/Checklists/App Store Connect Upload Runbook]] foi seguido.
- [ ] `APP_STORE_CONNECT_ISSUER_ID` usa identificador nao-secreto do inventario; `.p8`, shared secrets e certificados ficam em secret manager/provider env vars.
- [ ] Large app icon 1024px nao tem alpha (`sips -g hasAlpha ...` retorna `no`).
- [ ] Asset catalog de AppIcon tem todos os slots/tamanhos exigidos pelo build alvo ou usa configuracao universal comprovadamente aceita pelo Xcode/App Store; validar no app instalado/TestFlight, nao so no arquivo fonte.
- [ ] Build number foi incrementado antes de novo upload.
- [ ] Upload nao sera considerado concluido ate App Store Connect mostrar build processing/`VALID`.
- [ ] Ao fechar mudanca iOS significativa, novo build foi enviado ao TestFlight/App Store Connect ou excecao explicita foi registrada.

## Screenshots

- [ ] Screenshots mostram valor real do app.
- [ ] Sem dados sensiveis.
- [ ] Textos localizados corretamente.
- [ ] Dispositivos/tamanhos exigidos foram cobertos.
- [ ] Idiomas suportados tem screenshots separados no `fastlane/screenshots/<locale>`.
- [ ] Dimensoes dos screenshots foram validadas por script.

## Fechamento TestFlight

- [ ] [[04_Areas/Coding/Best Practices/iOS Functional QA And TestFlight Closure Standard]] foi seguido.
- [ ] Comando de upload usado foi registrado.
- [ ] IPA/archive/dSYM path registrado quando aplicavel.
- [ ] Status App Store Connect regis
...[truncated]

## 04_Areas/Coding/Checklists/Android App Preflight Checklist.md

---
type: preflight-checklist
platform: android
tags:
  - preflight
  - android
  - google-play
  - quality
---
# Android App Preflight Checklist

## Produto e UX

- [ ] App segue Core App Quality e padroes Android.
- [ ] App tem opening motion contextual ao dominio, curto, offline e coerente com Material/brand.
- [ ] Material 3/Compose ou sistema visual escolhido foi aplicado consistentemente.
- [ ] Back navigation funciona e nao perde dados.
- [ ] Estado e restaurado ao voltar do background.
- [ ] Layout funciona em diferentes tamanhos, densidades, orientacoes e fontes.
- [ ] Foldables/tablets foram considerados se o app se beneficiar.
- [ ] Permissoes perigosas sao pedidas so quando ligadas ao caso de uso principal.

## Technical quality

- [ ] Startup, scroll, transicoes e memoria aceitaveis.
- [ ] Opening motion respeita animator duration scale/acessibilidade e nao bloqueia o app por mais de 2s.
- [ ] Crash-free e ANR considerados.
- [ ] Offline/network slow tratado.
- [ ] WorkManager/background work usado de forma apropriada.
- [ ] Battery/network usage nao abusivo.
- [ ] Nenhum segredo real embutido no APK/AAB.

## Google Play

- [ ] Privacy policy publica e dentro do app quando necessario.
- [ ] Data safety section consistente com coleta real e SDKs terceiros.
- [ ] Permissions declaration coerente.
- [ ] Content rating completo.
- [ ] Store listing sem claims enganosos.
- [ ] Account deletion e data deletion quando aplicavel.
- [ ] Test track/review notes preparados.

## Build/release

- [ ] Application ID correto.
- [ ] Version code/name atualizados.
- [ ] Release signing configurado.
- [ ] Android App Bundle pronto.
- [ ] ProGuard/R8 rules revisadas.
- [ ] Smoke test em device/emulator.

## Screenshots

- [ ] Phone screenshots.
- [ ] Tablet/large screen screenshots se aplicavel.
- [ ] Sem dados sensiveis.
- [ ] UI legivel em light/dark mode.

## Referencias

- Android Core App Quality: https://developer.android.com/docs/quality-guidelines/core-app-quality
- Android technical quality: https://developer.android.com/quality/technical
- Google Play policies: https://support.google.com/googleplay/android-developer/answer/16933379

## Fonte verificada

- `2026-05-18`: Android Core App Quality consultado; pagina oficial indica ultimo update em `2026-04-08 UTC`.

## 04_Areas/Coding/Checklists/Security Checklist.md

---
type: checklist
area: security
tags:
  - checklist
  - security
---
# Security Checklist

## Baseline

- [ ] Nenhum segredo real em Markdown, commits, screenshots, logs ou issues.
- [ ] `.env`, private keys, certificates e service account files estao no `.gitignore`.
- [ ] `.env.example` existe quando util, sem valores reais.
- [ ] Dependencias novas foram revisadas.
- [ ] Input externo e validado no servidor.
- [ ] Output sensivel nao e exposto ao cliente.

## OWASP web

- [ ] Broken access control: checar autorizacao por recurso.
- [ ] Cryptographic failures: nao armazenar senha/token em claro.
- [ ] Injection: usar queries parametrizadas e sanitizacao apropriada.
- [ ] Insecure design: revisar abusos obvios do fluxo.
- [ ] Security misconfiguration: headers, CORS, debug e permissao.
- [ ] Vulnerable components: revisar dependencias.
- [ ] Auth failures: sessoes, reset, MFA quando aplicavel.
- [ ] Integrity failures: supply chain, builds, webhooks assinados.
- [ ] Logging/monitoring: eventos criticos sem secrets.
- [ ] SSRF: validar URLs externas e metadata endpoints.

## API

- [ ] BOLA/BFLA: usuario nao acessa objeto/funcoes de outro usuario.
- [ ] Rate limit por user/IP/token.
- [ ] Object properties sensiveis nao aceitam mass assignment.
- [ ] Excessive data exposure evitada.
- [ ] Webhooks e callbacks validam assinatura.
- [ ] Consumo de APIs externas tem timeout, retry e allowlist quando possivel.

## Mobile/client

- [ ] Nenhum segredo real embutido no app.
- [ ] Chaves publicas client-side sao tratadas como publicas.
- [ ] Deep links e callbacks validam destino.
- [ ] Storage local nao guarda token sensivel sem protecao adequada.

## IA

- [ ] Prompt injection e tool abuse foram considerados.
- [ ] Modelo nao recebe segredo real.
- [ ] Output de IA nao executa acao destrutiva sem validacao.
- [ ] Logs de IA redigem PII e secrets.

## Antes de finalizar

- [ ] Rodar busca por padroes de segredo antes de commit quando houver risco.
- [ ] Atualizar [[04_Areas/Coding/Checklists/Secrets And API Keys Register]] se env vars mudaram.
- [ ] Registrar risco residual na nota do projeto.

## 04_Areas/Coding/Checklists/Secrets And API Keys Register.md

---
type: secrets-register
tags:
  - checklist
  - secrets
  - api-keys
  - security
---
# Secrets And API Keys Register

Este arquivo e inventario. Ele **nao guarda valores reais**.

## Regra

Guardar aqui:

- nome da env var;
- fornecedor;
- projeto;
- ambiente;
- onde o valor real esta guardado;
- data de rotacao;
- dono/responsavel;
- risco e escopo.

Nao guardar aqui:

- API key real;
- token;
- senha;
- cookie;
- private key;
- refresh token;
- service account JSON;
- arquivo `.p8`, `.pem`, `.key`, `.p12`, `.mobileprovision` ou equivalente.

## Locais recomendados para valor real

- 1Password ou outro password manager com referencias seguras, por exemplo `op://Developer/OpenAI/api-key`.
- Apple Passwords / iCloud Keychain para senhas/passkeys humanas.
- Apple Keychain local como fallback local.
- GitHub Actions Secrets.
- Vercel/Railway/Netlify/Fly/Render environment variables.
- AWS/GCP/Azure secret manager.
- `.env.local` apenas local, sem commit.

## Modelo de uso

Ver [[99_System/Credential Vault Operating Model]].

- Valor real nunca entra neste arquivo.
- Referencia segura pode entrar, por exemplo `op://vault/item/field`.
- Provider env var pode entrar, por exemplo `Railway Variables -> project/service -> OPENAI_API_KEY`.
- Se `op`/secret manager nao existir no ambiente, deixar acao humana clara em vez de pedir key em chat.
- Intake local seguro disponivel em `/Users/paulopierrondi/.local/bin/brain-secret-intake`; ele pede o valor no prompt do Apple Keychain, sem passar segredo por argumento de shell.
- Intake por arquivo temporario disponivel em `/Users/paulopierrondi/.second-brain-secrets.env`; importar com `/Users/paulopierrondi/.local/bin/brain-secret-intake import /Users/paulopierrondi/.second-brain-secrets.env --delete`.

## Checklist para nova API key

- [ ] Existe env var com nome claro.
- [ ] Valor real esta em secret manager, nao no vault.
- [ ] `.env.example` foi atualizado sem valor real.
- [ ] Se usado arquivo temporario de intake, ele foi apagado apos importacao.
- [ ] Escopo/permissao minima.
- [ ] Ambiente separado: dev/staging/prod.
- [ ] Rotacao/revogacao planejada.
- [ ] Quem usa a key esta documentado.
- [ ] Logs nao imprimem a key.
- [ ] Client nao recebe segredo server-side.

## Incidente de exposicao - 2026-05-19

Valores reais de credenciais foram colados em chat em `2026-05-19`. Tratar como comprometidos. Nenhum valor real deve ser copiado para o vault.

Registro canonico: [[99_System/Secret Exposure Incident - 2026-05-19]].

| Area | Referencias afetadas | Onde o valor novo deve ficar | Status |
| --- | --- | --- | --- |
| Google Gemini | `GEMINI_API_KEY` | 1Password/Apple Keychain + provider env vars | **ROTATE_REQUIRED** - exposta em chat 2026-05-19 |
| ElevenLabs / Eventlabs | `ELEVENLABS_API_KEY`, `EVENTLABS_API_KEY` | 1Password/Apple Keychain + provider env vars | **ROTATE_REQUIRED** - exposta em chat 2026-05-19 |
| Pexels | `PEXELS_API_KEY` | 1Password/Apple Keychain + provider env vars | **ROTATE_REQUIRED** - exposta em chat 2026-05-19 |
| Creatomate | `CREATOMATE_API_KEY` | 1Password/Apple Keychain + provider env vars | **ROTATE_REQUIRED** - exposta em chat 2026-05-19 |
| YourVersion | `YOURVERSION_API_KEY` | 1Password/Apple Keychain + provider env vars | **ROTATE_REQUIRED** - exposta em chat 2026-05-19 |
| Linear | `LINEAR_API_KEY` | 1Password/Apple Keychain + local automation env | **ROTATE_REQUIRED** - exposta em chat 2026-05-19 |
| Railway | `RAILWAY_ACCOUNT_TOKEN`, `RAILWAY_PPT_TOKEN`, `RAILWAY_PIERRONDI_IA_TOKEN`, `RAILWAY_CSDM_TOKEN` | 1Password/Apple Keychain + Railway/GitHub Actions as needed | **ROTATE_REQUIRED** - exposta em chat 2026-05-19 |
| Cantus mobile | test user password | Apple Passwords/1Password; nao Markdown | **ROTATE_REQUIRED** - exposta em chat 2026-05-19 |
| Apple App Store Connect | API key metadata/private key file | Apple Developer Portal + local secure `.p8` path | **VERIFY_AND_ROTATE_IF_PRIVATE_KEY_EXPOSED** |

## Inventario

| Projeto | Env var | Fornecedor | Ambientes | Onde esta o valor real | Escopo | Rotacao | Dono | Status |
|---|---|---|---|---|---|---|---|---|
| _template_ | `OPENAI_API_KEY` | OpenAI | local/staging/prod | 1Password + provider env vars | server-side model calls | trimestral ou incidente | Paulo | planned |
| global-ios | `APP_STORE_CONNECT_ISSUER_ID` | Apple App Store Connect | local/CI/provider env | [[04_Areas/Coding/Checklists/Apple Developer And App Store Connect Inventory]] | identificador nao-secreto para ASC API/TestFlight/upload; private key `.p8` fica fora do vault | n/a salvo troca de conta Apple | Paulo | **ativo** — registrado 2026-05-15 |
| global-ios | `ASC_KEY_ID` / `APP_STORE_CONNECT_KEY_ID` | Apple App Store Connect | local/CI/provider env | [[04_Areas/Coding/Checklists/Apple Developer And App Store Connect Inventory]] | identificador nao-secreto da API key (`95ULBVD2BW`); `.p8` fica fora do vault | n/a salvo rotacao da API key | Paulo | **ativo** — confirmado 2026-05-15 |
| global-ios | `
...[truncated]

## 04_Areas/Marketing/Marketing MOC.md

---
type: moc
area: marketing
tags:
  - marketing
  - creative-os
  - video
  - pierrondi-dev
---
# Marketing MOC

Este e o centro de operacao para criativos, videos curtos, campanhas, legendas, voz, distribuicao social e aprendizado de marketing.

## Pierrondi.dev

- [[04_Areas/Marketing/Pierrondi.dev Creative Video OS]]
- [[04_Areas/Marketing/Creative Forge UGC Video Production OS]]  ← local UGC ad pipeline, M5 Max, ~$0.02/peça
- [[04_Areas/Marketing/Social Video Ad Trends 2026]]  ← hook templates + formats que estão batendo · revalidar a cada 6 semanas
- [[04_Areas/Marketing/ElevenLabs Voice And Subtitle Workflow]]
- [[04_Areas/Marketing/Social Video Platform Specs 2026]]
- [[04_Areas/Marketing/Creative QA Checklist]]
- [[04_Areas/Marketing/Creative Prompt Starters]]
- [[04_Areas/Marketing/Creative Learning Loop]]
- [[04_Areas/Marketing/Marketing Growth Backlog]]
- [[04_Areas/Marketing/Creative Pipeline Secrets Inventory]]

## App Marketing / ASA

- [[04_Areas/Marketing/Soro SEO App Distribution OS]]
- [[04_Areas/Marketing/Soro SEO Automation - Claude Code Runbook]]
- [[04_Areas/Marketing/Soro SEO Automation - Kimi Runbook]]
- [[04_Areas/Marketing/Ready App Campaign Factory Procedure]]
- [[04_Areas/Marketing/Ready Apps Sales Effectiveness Scorecard]]
- [[04_Areas/Marketing/Apple Connect Ready Apps Campaign Matrix]]
- [[04_Areas/Marketing/App Marketing Intelligence OS]]
- [[04_Areas/Marketing/iOS App Paid Growth Execution OS]]
- [[04_Areas/Marketing/Apple Ads ASA Tuning Runbook]]
- [[04_Areas/Marketing/App Marketing Metrics Inventory]]
- [[04_Areas/Marketing/App Marketing Daily Tuning Report]]
- [[04_Areas/Marketing/App Marketing Tuning Backlog]]
- [[04_Areas/Marketing/TikTok Financial Ads Compliance Runbook]]

## Product / Revenue

- [[04_Areas/Product/Product Revenue MOC]]
- [[04_Areas/Product/Nightly Opportunity Engine]]
- [[04_Areas/Product/Nightly Opportunity Report]]

## Projeto

- [[02_Projects/pierrondi-ia]]
- Repo: `/Users/paulopierrondi/Downloads/pierrondi-ia`
- Studio: `/studio/videos`, `/studio/creatives`, `/studio/creatives/factory`, `/studio/campaigns`, `/studio/topics`, `/studio/approvals`, `/studio/health`

## Regra

### Regra de ouro — LinkedIn

- **Ate Paulo dizer explicitamente o contrario, LinkedIn e canal exclusivo de ServiceNow.**
- Nao criar, agendar, aprovar, publicar ou sugerir LinkedIn sobre temas genericos de IA, n8n, WhatsApp, freelancing, automacao para PMEs, produto digital, apps consumer, lifestyle ou build-in-public.
- Temas permitidos para LinkedIn: ServiceNow, Now Assist, AI Agents na ServiceNow, CSDM, CMDB, ITSM/ITOM/SPM, Workflow Data Fabric, AI Control Tower, K26, arquitetura de plataforma ServiceNow, demos ServiceNow, Bradesco/FSI quando apropriado.
- Qualquer excecao precisa de confirmacao explicita do Paulo no momento da execucao. Silencio, ambiguidade ou backlog antigo nao autoriza excecao.
- Antes de agendar/publicar LinkedIn, verificar fila futura e bloquear conteudo fora de ServiceNow.

Todo pedido de criativo deve gerar um pacote, nao apenas uma peca:

- brief;
- roteiro;
- voz;
- legendas;
- visual/b-roll;
- versoes por canal;
- copy de publicacao;
- QA;
- aprendizado/metricas.

### Regra de ouro — Video ads para qualquer app

- Todo ad de app, UGC ou nao UGC, deve passar pelo fluxo nativo `Creative Video Factory` do Pierrondi IA Studio antes de geracao, upload ou publicacao.
- Tela canonica: `/studio/creatives/factory`.
- API canonica: `/api/marketing-os/content-factory/creative-video`.
- Engine canonica: `/Users/paulopierrondi/Downloads/pierrondi-ia/lib/marketing-os/content-factory/creative-video-factory.ts`.
- O app standalone `creative-video-factory` e os artefatos do `investcoach_ai` sao biblioteca/prototipo historico, nao a fonte de verdade.
- Primeiro perguntar e registrar: canal principal (`TikTok`, `Instagram`, `LinkedIn`, `YouTube`), objetivo, pago/organico, tela real do app, hook dos 2 primeiros segundos e angulo de venda.
- Sempre que possivel, capturar demo real via Xcode/iOS Simulator antes de usar b-roll generico. A prova de produto deve vir antes de UGC, avatar, Veo ou Pexels.
- O pacote minimo por ad group pago e 4 videos: app real/problema, IA/interface, feature proof, trust/compliance.
- Stack premium preferida: demo real do produto + Veo/Gemini para b-roll + ElevenLabs para voz + Pexels como fallback/complemento.
- Para LinkedIn, manter a regra existente: canal exclusivo de ServiceNow salvo excecao explicita do Paulo.

### Regra de ouro — Paid marketing

- Apple Ads / ASA, Meta, TikTok, YouTube, LinkedIn Ads ou qualquer canal pago podem gerar diagnostico e recomendacao diaria.
- Nenhum agente pode pausar, aumentar budget, mudar bid, criar campanha, publicar criativo pago ou alterar target CPA sem aprovacao explicita do Paulo.
- O vault guarda metricas agregadas, decisoes e hipoteses; segredos de API/OAuth ficam fora do vault.
- Para apps financeiros ou IA financeira no TikTok, `TikTok Financial Ads Compliance Runbook` e preflight obrigatori
...[truncated]

## 04_Areas/Marketing/Pierrondi.dev Creative Video OS.md

---
type: operating-system
area: marketing
project: pierrondi-ia
tags:
  - pierrondi-dev
  - creative-os
  - video
  - social
---
# Pierrondi.dev Creative Video OS

## Objetivo

Criar criativos e videos de marketing de alta qualidade para Pierrondi.dev e produtos do portfolio, com um workflow repetivel para LinkedIn, YouTube Shorts, TikTok, Instagram/Reels e campanhas pagas.

O output bom nao e "um video". E um pacote de campanha com roteiro, voz, legendas, assets, variacoes por canal, QA e aprendizado.

## Regra de ouro — LinkedIn

- **LinkedIn fica 100% restrito a ServiceNow ate Paulo dizer explicitamente o contrario.**
- Nao usar LinkedIn para campanhas genericas de IA, n8n, WhatsApp, automacao para PME, freelancing, produto digital, apps consumer ou build-in-public.
- LinkedIn pode usar apenas: ServiceNow, Now Assist, AI Agents na ServiceNow, CSDM, CMDB, ITSM/ITOM/SPM, Workflow Data Fabric, AI Control Tower, K26, arquitetura/demos ServiceNow e Bradesco/FSI quando fizer sentido.
- Se um roteiro/copy/video nao passa nesse filtro, gerar para outro canal ou deixar como rascunho nao agendado; nunca agendar/publicar em LinkedIn.

## Fonte de verdade no repo

- Repo: `/Users/paulopierrondi/Downloads/pierrondi-ia`
- Creative Video Factory: `/Users/paulopierrondi/Downloads/pierrondi-ia/docs/marketing-os/creative-video-factory.md`
- Studio: `/studio/creatives/factory`
- API: `/api/marketing-os/content-factory/creative-video`
- Engine: `/Users/paulopierrondi/Downloads/pierrondi-ia/lib/marketing-os/content-factory/creative-video-factory.ts`
- Creative engine runbook: `/Users/paulopierrondi/Downloads/pierrondi-ia/docs/marketing/creative-engine-test-runbook.md`
- Criativos curados: `/Users/paulopierrondi/Downloads/pierrondi-ia/assets/creatives/post-images/`
- Background videos: `/Users/paulopierrondi/Downloads/pierrondi-ia/assets/video-backgrounds/`
- API force video: `/api/marketing-os/force-video`
- Preflight: `/api/marketing-os/video/preflight`

## Regra de ouro — Creative Video Factory

- Todo pedido de video para TikTok, Instagram/Reels, YouTube Shorts, LinkedIn, UGC ou app ads deve passar por `/studio/creatives/factory`.
- A API canonica e `/api/marketing-os/content-factory/creative-video`; novos apps e coders devem chamar esse endpoint, nao criar pipelines standalone.
- O standalone `creative-video-factory` e os assets do InvestCoach ficam como biblioteca/prototipo historico.
- Perguntar sempre: canal, objetivo, pago/organico, tela real do app, hook dos 2 primeiros segundos e angulo de venda.
- Para ad group pago, planejar no minimo 4 videos: app real/problema, IA/interface, feature proof e trust/compliance.
- Sempre que possivel, usar Xcode/iOS Simulator para demo real antes de Veo, Pexels, avatar ou stock.
- Stack premium: demo real + Veo/Gemini para b-roll + ElevenLabs para voz + Pexels como fallback/complemento.
- Apps financeiros: vender organizacao, clareza, educacao e controle; nunca oportunidade financeira, lucro, renda extra, retorno, enriquecimento ou compra/venda de ativos.

## Pipeline atual

1. Brief do tema, publico, oferta e canal.
2. Script generator cria hook, corpo, CTA, b-roll keywords e UTMs.
3. Agent council revisa clareza, promessa, risco, canal e qualidade.
4. ElevenLabs gera voz com timestamps.
5. Captions convertem timestamps em palavras e ASS karaoke.
6. Visual usa criativos curados primeiro, background videos depois, Pexels como fallback.
7. Render FFmpeg local gera MP4 1080x1920.
8. Creatomate fica como backend premium opcional.
9. QA valida duracao, audio, legenda, safe zone, black frames, CTA, links e formato.
10. Publicacao fica em draft/review/approval antes de ir para canal externo.
11. Metricas entram no aprendizado para remix.

## Regra de qualidade

- Primeiro frame precisa explicar por que parar o scroll.
- Primeiros 2 segundos precisam ter tese, contraste ou prova.
- O roteiro precisa soar falado, nao escrito.
- Legenda precisa ser legivel sem audio e sem cobrir UI do canal.
- Voz precisa combinar com o canal: LinkedIn mais autoridade, TikTok/Reels mais ritmo, YouTube Shorts mais clareza e retenção.
- B-roll precisa reforcar a ideia; se for generico, melhor usar screen/product proof.
- Cada peca precisa ter um unico CTA.
- Nao publicar sem approval quando houver canal externo.

## Formatos canonicos

- Master vertical: MP4 H.264/AAC, 1080x1920, 30fps, 9:16.
- Feed vertical/crop: 1080x1350, 4:5.
- Square fallback: 1080x1080, 1:1.
- LinkedIn professional cut: 9:16 ou 4:5, com SRT sidecar quando possivel.
- Shorts/TikTok/Reels: 9:16, legendas burned-in, safe zones respeitadas.

## Duracao recomendada por intencao

- Prova rapida: 12-20s.
- Hook + tese + CTA: 20-35s.
- Mini tutorial: 35-60s.
- Story/problem-solution: 45-90s.
- YouTube Shorts longo: ate 3 min quando a historia realmente precisa, mas evitar se houver risco de musica/Content ID.

## Assets primeiro, IA depois

O pipeline deve consultar assets curados antes de gerar asset novo:

- imagem/post: `assets/creatives/po
...[truncated]

## 04_Areas/Marketing/ElevenLabs Voice And Subtitle Workflow.md

---
type: workflow
area: marketing
tags:
  - elevenlabs
  - subtitles
  - captions
  - tts
  - video
---
# ElevenLabs Voice And Subtitle Workflow

## Objetivo

Gerar voz natural e legendas sincronizadas para videos de marketing, sem perder qualidade, acessibilidade ou controle de seguranca.

## Fluxo recomendado

1. Escrever roteiro falado, curto e com pausas naturais.
2. Escolher voz por objetivo: founder, autoridade tecnica, energia social, corporate ou analitica.
3. Gerar TTS no ElevenLabs usando endpoint com timestamps.
4. Salvar audio como asset do render, nunca em Markdown.
5. Converter timestamps por caractere para timings por palavra.
6. Gerar dois tipos de legenda:
   - ASS burned-in karaoke para Shorts/TikTok/Reels.
   - SRT sidecar para YouTube e LinkedIn.
7. Renderizar MP4 1080x1920 com FFmpeg local.
8. Rodar QA de sincronia, legibilidade e safe zone.
9. Registrar no projeto: voice slug, roteiro, caminhos de assets, render ID e aprendizados.

## ElevenLabs no repo

- Adapter: `/Users/paulopierrondi/Downloads/pierrondi-ia/lib/marketing-os/voice/elevenlabs.ts`
- Captions: `/Users/paulopierrondi/Downloads/pierrondi-ia/lib/marketing-os/video/captions.ts`
- Env vars:
  - `ELEVENLABS_API_KEY`
  - `ELEVENLABS_PAULO_VOICE_ID`
  - `JARVIS_ELEVENLABS_VOICE_ID`
  - `ELEVENLABS_DEFAULT_VOICE_ID`

## Regras de roteiro para voz

- Escrever como fala: frases curtas, sem paragrafo longo.
- Evitar siglas sem explicar na primeira vez.
- Colocar pausa onde o video precisa respirar.
- Nao pedir "voz viral"; pedir emocao operacional: calmo, urgente, professoral, provocativo, executivo, founder-led.
- Para PT-BR: revisar acentos, nomes proprios, pronuncia de siglas e palavras inglesas.
- Para EN: evitar literalismo do portugues; reescrever a ideia.

## Legendas

### Burned-in

Use em TikTok, Reels e Shorts quando a retencao depende de ler sem audio.

- 1 ou 2 linhas.
- Janela curta de 3 a 5 palavras.
- Contraste forte e outline.
- Nao ocupar topo com hooks longos.
- Evitar rodape baixo: UI do TikTok/Reels/Shorts cobre a area inferior.
- Usar highlights com parcimonia: uma palavra ativa por vez e suficiente.

### Sidecar

Use como arquivo separado quando a plataforma aceita closed captions.

- YouTube: SRT e VTT sao formatos aceitos; SRT UTF-8 e o default simples.
- LinkedIn: usar SRT simples; nao depender de cor, fonte ou markup.
- Manter o SRT master junto do render e registrar o path.

## Conversao de timing

ElevenLabs retorna `alignment` e `normalized_alignment` com timestamps por caractere. O pipeline deve:

1. preferir `normalized_alignment` quando texto foi normalizado;
2. agrupar caracteres nao-espaco em palavras;
3. usar inicio do primeiro caractere e fim do ultimo;
4. snapar cortes para limites de palavra;
5. validar que o ultimo timestamp fica perto da duracao real do audio.

## QA de voz

- [ ] Voz nao parece leitura monotona.
- [ ] Nomes proprios e termos tecnicos corretos.
- [ ] Pacing cabe no tempo alvo.
- [ ] Sem respiracao, riso ou tag textual renderizada por acidente.
- [ ] Audio sem clipping.
- [ ] Legenda bate com a fala.
- [ ] CTA falado e visivel.
- [ ] Sem uso de voz clonada sem consentimento.

## Referencias oficiais

- ElevenLabs timestamps API: https://elevenlabs.io/docs/api-reference/text-to-speech/convert-with-timestamps
- YouTube caption file formats: https://support.google.com/youtube/answer/2734698
- LinkedIn video captions specs: https://www.linkedin.com/help/linkedin/answer/a424737

## 04_Areas/Marketing/Social Video Platform Specs 2026.md

---
type: reference
area: marketing
tags:
  - platform-specs
  - video
  - linkedin
  - youtube
  - tiktok
  - instagram
---
# Social Video Platform Specs 2026

Verificado em 2026-05-15 com fontes oficiais. Specs mudam; revalidar antes de campanha paga grande.

## Master recomendado

Use este master sempre que possivel:

- MP4
- H.264 video
- AAC audio
- 1080x1920
- 9:16
- 30fps
- legendas burned-in para short-form
- SRT sidecar para canais que aceitam caption upload

## YouTube Shorts

- Square ou vertical ate 3 minutos e classificado como Shorts.
- Upload via YouTube app ou YouTube Studio.
- Se tiver Content ID claim e durar mais de 1 minuto, pode ser bloqueado globalmente.
- Recomendo: 15-60s para performance; usar 60-180s somente quando a historia precisa.
- Caption: SRT simples ou VTT; manter master SRT.

## TikTok

- Recomendado: vertical 9:16.
- Non-Spark ads suportam 9:16, 16:9 e 1:1; vertical recomendado.
- Minimo vertical oficial: >= 540x960.
- Formatos: MP4, MOV e outros aceitos para ads.
- Tamanho: ate 500 MB para in-feed ads.
- Duração de ads Non-Spark: ate 10 minutos; Spark Ads puxa specs do video organico.
- Direct Post API exige consentimento explicito e clients nao auditados ficam restritos a private mode.
- Recomendo criativo organico/pago: 15-45s, key message dentro de safe zone.

## Instagram / Reels / Meta

- Reels aceitam proporcao entre 1.91:1 e 9:16.
- Minimo oficial: 30 FPS e resolucao minima de 720px.
- Para Reels ads, Meta recomenda criativos 9:16 com audio e key elements em safe zone.
- Recomendo: 1080x1920, 9:16, audio claro, legendas burned-in, CTA visual acima da UI inferior.
- Cover Reels: referencia oficial 420x654.

## LinkedIn

- Video ads: MP4.
- File size: 75 KB a 500 MB.
- Codec: H.264 ou VP8.
- Audio: AAC ou MPEG4.
- Frame rate: menor que 30 FPS segundo spec oficial de ads.
- Captions: SRT, somente texto; nao contar com cor, fonte ou markup.
- Videos menores que 30s podem loopar ate completar 30s de playback.
- Video precisa ser upload direto no LinkedIn, nao link do YouTube/Vimeo.
- Recomendo: 20-45s para founder/proof, 45-90s para tutorial executivo.

## Export matrix

| Canal | Export principal | Legenda | Melhor uso |
|---|---|---|---|
| YouTube Shorts | 1080x1920 MP4 | Burned-in + SRT | prova, tutorial, narrativa |
| TikTok | 1080x1920 MP4 | Burned-in | hook agressivo, trend, discovery |
| Instagram Reels | 1080x1920 MP4 | Burned-in | visual proof, social proof, product story |
| LinkedIn | 1080x1920 ou 1080x1350 MP4 | SRT + opcional burned-in leve | autoridade, case, tese B2B |
| LinkedIn feed image/carousel | 1080x1350 PNG/JPG | texto no card | resumo, framework, prova |

## Safe-zone padrao

- Manter textos e rosto/produto entre y=220 e y=1500 no master 1080x1920.
- Evitar CTA no rodape.
- Nao colocar texto essencial perto de bordas laterais.
- Testar primeiro frame como thumbnail.

## Referencias oficiais

- YouTube Shorts 3 minutos: https://support.google.com/youtube/answer/15424877
- YouTube caption formats: https://support.google.com/youtube/answer/2734698
- TikTok In-Feed Ads specs: https://ads.tiktok.com/help/article/tiktok-auction-in-feed-ads
- TikTok Direct Post API: https://developers.tiktok.com/doc/content-posting-api-reference-direct-post
- Instagram Reels size/aspect ratio: https://www.facebook.com/help/1038071743007909
- Meta Reels ads guidance: https://www.facebook.com/business/ads/facebook-instagram-reels-ads
- LinkedIn video ad specs: https://www.linkedin.com/help/linkedin/answer/a424737

## 04_Areas/Marketing/Creative QA Checklist.md

---
type: checklist
area: marketing
tags:
  - qa
  - creative
  - video
  - social
---
# Creative QA Checklist

## Antes de gerar

- [ ] Objetivo claro: awareness, leads, prova, produto, retargeting, authority.
- [ ] Canal primario definido: TikTok, Instagram, LinkedIn ou YouTube.
- [ ] Perguntas obrigatorias respondidas: canal, objetivo, pago/organico, tela real do app, hook e angulo.
- [ ] Produto/oferta e CTA definidos.
- [ ] Publico e dor especificos.
- [ ] Prova ou demo real escolhida; para app iOS, preferir Xcode/iOS Simulator sempre que possivel.
- [ ] Assets obrigatorios listados.
- [ ] Riscos de marca/compliance revisados.
- [ ] Nenhum segredo ou PII em screenshots/assets.
- [ ] Se for app do portfolio, manifest criado no `Creative Video Factory` nativo do Pierrondi IA Studio (`/studio/creatives/factory` ou API `/api/marketing-os/content-factory/creative-video`).
- [ ] Para ad group pago, existem 4 videos planejados/ativos: app real/problema, IA/interface, feature proof e trust/compliance.
- [ ] Se usar Veo/Gemini, ElevenLabs ou Pexels, eles complementam uma prova de produto real; nao substituem demo real quando ela e possivel.

## Script

- [ ] Hook nos primeiros 2 segundos.
- [ ] Uma tese principal, nao tres.
- [ ] Linguagem falada.
- [ ] CTA unico.
- [ ] Duracao estimada bate com o canal.
- [ ] Sem promessa que produto nao entrega.
- [ ] Sem claims de resultado sem prova.
- [ ] Para finanças/TikTok, sem linguagem de oportunidade, lucro, renda extra, retorno, enriquecimento ou compra/venda de ativos.

## Voz

- [ ] Voice slug escolhido.
- [ ] Pacing escolhido: slow, normal ou fast.
- [ ] Pronuncia de nomes e siglas revisada.
- [ ] Audio sem clipping.
- [ ] Voz combina com canal.
- [ ] Voz clonada tem consentimento e uso permitido.

## Legendas

- [ ] Burned-in legivel no celular.
- [ ] SRT gerado quando canal aceita caption upload.
- [ ] Sincronia palavra/fala validada.
- [ ] Texto dentro de safe zone.
- [ ] Sem legenda cobrindo CTA, rosto, produto ou UI importante.

## Visual

- [ ] Usa produto real, screenshot, demo Xcode/iOS Simulator ou b-roll relevante.
- [ ] O primeiro frame prova o produto, o hook ou o problema sem parecer stock generico.
- [ ] Criativos curados foram verificados antes de gerar via IA.
- [ ] Background videos locais foram verificados antes de Pexels.
- [ ] Primeiro frame funciona como thumbnail.
- [ ] Nenhum frame todo preto/branco ou quebrado.
- [ ] Sem stock generico quando a peca precisa provar algo.

## Export

- [ ] MP4 H.264/AAC.
- [ ] 1080x1920 para short-form.
- [ ] 1080x1350 ou 1080x1080 gerado se feed precisar.
- [ ] Duracao dentro do alvo.
- [ ] File size dentro do canal.
- [ ] SRT/VTT salvo quando aplicavel.
- [ ] Caminhos de output registrados.

## Publicacao

- [ ] Approval gate criado quando externo.
- [ ] Copy por canal revisada.
- [ ] Copy digitada na plataforma revisada contra typos antes de submit.
- [ ] UTM correto.
- [ ] Thumbnail/capa validada.
- [ ] Canal/conector pronto.
- [ ] Se TikTok Direct Post ainda nao auditado, tratar como draft/private/native completion.
- [ ] Para TikTok financeiro, [[04_Areas/Marketing/TikTok Financial Ads Compliance Runbook]] concluido.
- [ ] Se conteudo tiver IA, checkbox/rotulo AI-generated marcado e assets correspondentes selecionados.

## Aprendizado

- [ ] Hipotese do criativo registrada.
- [ ] Canal e variacao registrados.
- [ ] Metricas de 24h, 72h e 7d planejadas.
- [ ] O que remixar definido.
- [ ] Aprendizado registrado em [[04_Areas/Marketing/Creative Learning Loop]].

## 04_Areas/Marketing/Creative Prompt Starters.md

---
type: prompt-library
area: marketing
tags:
  - prompts
  - creative
  - video
  - social
---
# Creative Prompt Starters

Use estes prompts com Codex, Claude Code, Kimi, Gemini ou dentro do Studio. Sempre peça pacote completo, nao peca "um post".

## Criativo completo

```text
Use o vault e o repo pierrondi-ia. Leia:
- 04_Areas/Marketing/Pierrondi.dev Creative Video OS.md
- 04_Areas/Marketing/ElevenLabs Voice And Subtitle Workflow.md
- 04_Areas/Marketing/Social Video Platform Specs 2026.md
- 04_Areas/Marketing/Creative QA Checklist.md
- 02_Projects/pierrondi-ia.md
- /Users/paulopierrondi/Downloads/pierrondi-ia/docs/marketing-os/video-render-pipeline.md

Crie um pacote de criativo para:
Produto/oferta: <produto>
Canal primario: <linkedin | youtube_shorts | tiktok | instagram_reels>
Canais secundarios: <...>
Publico: <quem>
Dor: <dor>
Prova/demo: <prova>
CTA: <cta>
Idioma: <pt-BR | en>
Duracao alvo: <15s | 30s | 45s | 60s>
Tom: <founder-led, tecnico, provocativo, executivo, tutorial>

Entregue:
1. brief
2. 5 hooks
3. roteiro final falado
4. direcao de voz ElevenLabs
5. legenda/caption plan
6. b-roll/screenshot plan
7. export targets
8. copy por canal
9. checklist de QA
10. aprendizado esperado e metricas para acompanhar

Nao publique. Nao use segredos. Se precisar de API key, cite apenas o nome da env var.
```

## YouTube Shorts

```text
Crie um YouTube Shorts para <tema>. Target 35-60s, 1080x1920, hook em 2s, roteiro falado, CTA unico e SRT sidecar. Use voz founder se fizer sentido. Gere tambem titulo, descricao com UTM, 3 thumbnails textuais e plano de remix caso retenção caia antes de 5s.
```

## TikTok/Reels

```text
Crie uma versao TikTok/Reels para <tema>. Target 15-35s, visual proof antes de explicacao, captions burned-in, safe zone vertical, ritmo mais rapido e linguagem menos corporativa. Entregue 3 aberturas alternativas e uma versao "menos polida, mais nativa".
```

## LinkedIn

Regra obrigatoria: LinkedIn e exclusivo para ServiceNow ate Paulo dizer explicitamente o contrario. Prompts LinkedIn devem tratar de ServiceNow, Now Assist, AI Agents na ServiceNow, CSDM, CMDB, ITSM/ITOM/SPM, Workflow Data Fabric, AI Control Tower, K26, demos/arquitetura ServiceNow ou Bradesco/FSI. Nao gerar LinkedIn para IA generica, n8n, WhatsApp, freelancing, automacao PME, produto digital, apps consumer ou build-in-public.

```text
Crie uma versao LinkedIn para <tema>. Target 30-60s, tom founder/executivo, prova concreta, sem hype. Entregue video script, SRT simples, copy do post, headline, CTA e 3 comentarios de follow-up que Paulo pode postar depois.
```

## Creative remix

```text
Pegue o criativo abaixo e gere 5 remixes mudando apenas um eixo por vez:
1. hook
2. prova
3. visual
4. CTA
5. pacing/voz

Preserve a tese principal. Para cada remix, diga por que pode performar melhor e qual metrica validaria.

Criativo atual:
<colar resumo ou path>
```

## Pedir execucao no repo

```text
No repo /Users/paulopierrondi/Downloads/pierrondi-ia, use o pipeline existente de video factory. Antes de mexer, rode/consulte o preflight do video. Gere apenas draft/review, sem publicar automaticamente. Use RENDER_BACKEND=ffmpeg como default e registre output paths, renderId, scriptId, custos, blockers e proximos passos no vault.
```

## Kimi Claw - radar diario de video ads

2026-05-18: prompt operacional criado para tarefa diaria no Kimi Claw as 22:40, com pesquisa avancada de video ads por plataforma, ranking de tendencias, matriz de IA por custo-beneficio, prompts por ferramenta e backlog de criativos. Arquivo: `/Users/paulopierrondi/Documents/Codex/2026-05-18/quero-um-prompt-para-o-kimi-2/kimi-claw-daily-video-ads-intelligence-prompt.md`.

2026-05-19: prompt ampliado para Kimi Claw / Kimi CLI como `Kimi Growth War Room`, cobrindo pesquisa ampla de marketing digital, comunidades, ferramentas/agentes, ASO/ASA, App Store, melhoria de apps por receita, pacotes de campanha, criativos, posts e escrita segura no vault. Arquivo: `/Users/paulopierrondi/Documents/Codex/2026-05-19/me-da-um-super-maximo-prompt/kimi-claw-marketing-growth-superprompt.md`.

## 04_Areas/Marketing/Creative Pipeline Secrets Inventory.md

---
type: secrets-inventory
area: marketing
tags:
  - secrets
  - marketing
  - no-secret-values
---
# Creative Pipeline Secrets Inventory

Esta nota registra apenas nomes e finalidade. Nao registrar valores reais.

## Regra

- Valor real fica em Railway env, GitHub Actions Secrets, provider OAuth ou secret manager.
- Vault registra nome, escopo, ambiente e rotacao.
- Nunca colar API key em prompt, Markdown, screenshot, log ou commit.

## Pierrondi.dev video/creative env vars

| Env var | Uso | Onde o valor real deve ficar | Observacao |
|---|---|---|---|
| `ELEVENLABS_API_KEY` | TTS/voice generation | Railway env + local `.env.local` | Necessaria para voz |
| `ELEVENLABS_PAULO_VOICE_ID` | Voz founder | Railway env + local `.env.local` | Nao e segredo forte, mas tratar como config sensivel |
| `JARVIS_ELEVENLABS_VOICE_ID` | Voz Jarvis | Railway env | Opcional |
| `ELEVENLABS_DEFAULT_VOICE_ID` | Fallback voice | Railway env | Opcional |
| `PEXELS_API_KEY` | B-roll fallback | Railway env | Pode ser dispensada com background local |
| `CREATOMATE_API_KEY` | Render premium opcional | Railway env | Opcional quando `RENDER_BACKEND=ffmpeg` |
| `CREATOMATE_TEMPLATE_DEFAULT_ID` | Template premium | Railway env | Config |
| `VIDEO_STORAGE_ROOT` | Storage de videos | Railway env/volume | Nao e segredo |
| `VIDEO_SIGNING_SECRET` | URLs assinadas de video | Railway env | Segredo |
| `YOUTUBE_CLIENT_ID` | YouTube OAuth | Railway env | Config/OAuth |
| `YOUTUBE_CLIENT_SECRET` | YouTube OAuth | Railway env | Segredo |
| `YOUTUBE_REFRESH_TOKEN` | YouTube upload | Railway env | Segredo critico |
| `TIKTOK_CLIENT_KEY` | TikTok API | Railway env | Config/OAuth |
| `TIKTOK_CLIENT_SECRET` | TikTok API | Railway env | Segredo |
| `TIKTOK_REFRESH_TOKEN` | TikTok API | Railway env | Segredo critico |
| `TIKTOK_ACCESS_TOKEN` | TikTok API | Railway env | Segredo curto |
| `LINKEDIN_CLIENT_ID` | LinkedIn OAuth | Railway env | Config/OAuth |
| `LINKEDIN_CLIENT_SECRET` | LinkedIn OAuth | Railway env | Segredo |
| `LINKEDIN_AUTHOR_URN` | Autor LinkedIn | Railway env | Config |
| `META_APP_ID` | Instagram/Meta OAuth | Railway env | Config/OAuth |
| `META_APP_SECRET` | Instagram/Meta OAuth | Railway env | Segredo |
| `INSTAGRAM_REDIRECT_URI` | Instagram OAuth | Railway env | Config |
| `MARKETING_OS_TOKEN_ENCRYPTION_KEY` | Criptografia de tokens conectados | Railway env | Segredo critico |
| `CRON_SECRET` | Cron/API gated calls | Railway env | Segredo |

## Rotacao

- Rotacionar tokens de OAuth quando houver erro de refresh, troca de app ou suspeita de vazamento.
- Rotacionar `VIDEO_SIGNING_SECRET`, `CRON_SECRET` e encryption key com plano de migracao.
- Sempre atualizar inventario sem escrever o valor real.

## Links

- [[99_System/Security And Secrets Policy]]
- [[04_Areas/Coding/Checklists/Secrets And API Keys Register]]
- [[04_Areas/Coding/Checklists/Railway Secrets Inventory]]

## 99_System/Security And Secrets Policy.md

---
type: policy
tags:
  - security
  - secrets
  - second-brain
---
# Security And Secrets Policy

## Regra principal

O vault e o lugar para memoria, inventario, decisoes e referencias de credenciais. O vault nao guarda segredo real em Markdown.

Modelo canonico: [[99_System/Credential Vault Operating Model]].

## Permitido no vault

- Nome de env var.
- Nome do fornecedor.
- Projeto que usa a chave.
- Ambiente: local, staging, prod.
- Local onde o valor real esta guardado.
- Data de criacao/rotacao.
- Dono/responsavel.
- Escopo/permissao da chave.
- Procedimento de revogacao.

## Proibido no vault

- Valores reais de API keys.
- Tokens de acesso ou refresh tokens.
- Senhas.
- Cookies.
- Private keys.
- Service account JSON.
- Certificados privados.
- Arquivos `.env` completos.
- Screenshots que mostrem credenciais.

## Padrao para projetos

- `.env.local` para desenvolvimento local e fora do Git.
- `.env.example` com nomes e valores falsos.
- Secret manager/provider env vars para producao.
- GitHub Actions Secrets para CI.
- Nunca passar segredo para LLM quando nao for estritamente necessario.

## Regra para coders

- Nao pedir Paulo para colar API key/token em chat quando houver alternativa.
- Consultar [[04_Areas/Coding/Checklists/Secrets And API Keys Register]] e usar a referencia/local de armazenamento.
- Preferir `op://...` + `op run` quando 1Password CLI estiver disponivel.
- Se o secret manager nao estiver configurado, registrar acao humana e bloquear a parte que depende do segredo.

## Quando uma key vaza

1. Revogar imediatamente no fornecedor.
2. Criar nova key com permissao minima.
3. Atualizar secret manager/provider.
4. Rodar testes/deploy necessario.
5. Registrar incidente na nota do projeto sem repetir a key.
6. Procurar e remover vazamento em logs/commits se aplicavel.

Incidente aberto: [[99_System/Secret Exposure Incident - 2026-05-19]].

## Intake local seguro

Quando 1Password CLI ainda nao estiver disponivel, usar `/Users/paulopierrondi/.local/bin/brain-secret-intake` para gravar valores novos/rotacionados no Apple Keychain. O script nao recebe segredo por argumento; ele deixa o proprio Keychain pedir o valor.

Runbook manual no vault: [[99_System/Manual Credential Intake]].

Para importacao em lote, usar arquivo temporario fora do vault:

```bash
/Users/paulopierrondi/.local/bin/brain-secret-intake import /Users/paulopierrondi/.second-brain-secrets.env --delete
```

O arquivo temporario nao deve entrar em Obsidian, Git, Linear, email ou screenshot.

## Links

- [[99_System/Credential Vault Operating Model]]
- [[99_System/Manual Credential Intake]]
- [[99_System/Secret Exposure Incident - 2026-05-19]]
- [[04_Areas/Coding/Checklists/Secrets And API Keys Register]]
- [[04_Areas/Coding/Checklists/Railway Secrets Inventory]]
- [[04_Areas/Coding/Checklists/Security Checklist]]
- [[04_Areas/Coding/Checklists/Project Checklist Hub]]

## Project Note Snapshot

---
type: project
repo_name: "provadoria"
repo_path: "/Users/paulopierrondi/Downloads/provadoria"
repo_kind: "repo"
branch: "main"
dirty_files: 29
remote: "https://github.com/paulopierrondi/provadoria.git"
generated_at: "2026-05-22 09:38:19"
tags:
  - project
  - git
---
# provadoria

## Estado rapido

- Path: `/Users/paulopierrondi/Downloads/provadoria`
- Tipo: `repo`
- Repo kind: `repo`
- Branch: `main`
- Arquivos alterados agora: `29`
- Ultimo commit: `467fb2c 2026-05-21 feat: screenshots iPad Pro 12.9" gerados e upload via API ASC`
- Remote: `https://github.com/paulopierrondi/provadoria.git`
- Marcadores encontrados: `README.md, CLAUDE.md, AGENTS.md, GEMINI.md`

## Links do vault

- Indice de projetos: [[02_Projects/Projects Index]]
- Mapa de projetos: [[07_MOCs/Projects MOC]]
- Historico AI deste projeto: [[03_AI-Chats/Projects/provadoria - AI History]]
- Mapa de agentes: [[07_MOCs/AI Agents MOC]]
- Politica dos agentes: [[99_System/AI Agent Vault Policy]]
- Linear/Git tracking: [[04_Areas/Coding/Linear/Linear Git Development Tracking OS]]
- Linear project map: [[04_Areas/Coding/Linear/Linear Project Map]]

## Contexto importado do README

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
│   │   ├── cor
...[truncated]

## Decisoes e estado vivo

- Use esta nota para manter o estado atual do projeto, decisoes abertas, comandos canonicos e riscos.
- As sessoes locais de Codex, Claude Code, Kimi e Gemini foram indexadas no vault quando estavam disponiveis em disco.

## AI History Snapshot

---
type: project-ai-history
project: "provadoria"
status: generated
generated_at: "2026-05-22 09:38:19"
tags:
  - ai-history
  - project-history
  - generated
---
# provadoria - AI History

Projeto: [[02_Projects/provadoria|provadoria]]

- Path: `/Users/paulopierrondi/Downloads/provadoria`
- Codex relacionado: `0`
- Claude Code relacionado: `0`
- Kimi relacionado: `0`
- Claude-Mem observations relacionadas: `0`
- Claude-Mem summaries relacionados: `0`

## Codex

_Nenhuma sessao Codex relacionada encontrada._

## Claude Code

_Nenhuma sessao Claude Code relacionada encontrada._

## Kimi

_Nenhuma sessao Kimi relacionada encontrada._

## Claude-Mem

_Nenhuma observation relacionada encontrada._
