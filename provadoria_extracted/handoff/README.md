# Handoff — ProvadorIA redesign (Landing + iOS app)

## Visão geral

Redesign completo da landing pública (`provadoria.com.br`) e do app iOS
ProvadorIA. Direção estética: **editorial premium / capa de revista**
(Vogue · i-D · Self Service), com paleta de tendência IG/TikTok 2025–26
(tomato red sobre blush salmonado).

Substitui a versão atual em produção, cuja estética cyberpunk neon
(`#00F0FF`, `#B829F7`) não combina com moda e leu como amadora.

## Sobre os arquivos deste bundle

Os arquivos HTML/JSX neste bundle são **referências de design** —
protótipos em HTML/React mostrando intenção visual e de interação, não
código de produção pra copiar e colar.

A tarefa é **recriar esses designs no codebase existente**:

- **App iOS**: SwiftUI (já está em `ios/ProvadorIA/Views/*.swift`).
- **Landing**: HTML/CSS/JS estático (`landing/index.html` + `landing/styles.css`).
  Considere migrar pra Next.js/Astro se quiser SSR + OG image dinâmica.

Use os tokens (cores, fontes, spacing) deste handoff. Use os componentes
e patterns que já existem no codebase. Não trate os arquivos React como
canônicos.

## Fidelidade

**High-fidelity (hi-fi).** Cores, tipografia, hierarquia, copy e
microcopy são finais. O dev deve reproduzir pixel-near nas plataformas
de destino, adaptando apenas onde o framework nativo exigir (ex: SF
Pro Display ≠ Instrument Serif no iOS — solução abaixo).

## Tela 00 — Landing page

**Arquivo de referência:** `Landing.jsx` (componente raiz: `Landing`).
**Screenshot:** `screenshots/00_landing_full.png` (924×4320 — escalado
a partir do design 1440px wide).

Estrutura (top → bottom):

1. **Nav fixa** — `Provadoria` wordmark serif + 6 links + botão preto
   "Baixar na App Store". Border-bottom 1px line color. Sticky.
2. **Hero** — split 1.05fr / 1fr. Esquerda: eyebrow "EDIÇÃO 01 · VIRTUAL
   TRY-ON", headline serifa 132px "Veja como fica em *você*." (palavra
   em itálico + accent), corpo 17px, 2 CTAs (sólido + link sublinhado),
   3 stats (4,8s / grátis* / incluída). Direita: 1 placeholder editorial
   3:4 (HERO · MODEL) + 2 placeholders 1:1 (GARMENT em paper, AI RESULT
   em accent gradient).
3. **Marquee** — barra com label "Funciona com prints de" + lista de
   marcas BR (Shein, C&A, Renner, Zara, Riachuelo, Farm, Amaro, Hering,
   Reserva, Aramis). Mono 12px, tracked 0.2em.
4. **Método (Como funciona)** — header "O provador, *desmontado* em três
   tempos." 3 colunas separadas por linhas 1px. Cada coluna: numeral
   serif italic 72px em accent, título 28px serif, corpo 14px mid.
5. **Showcase** — header "Cada peça, *provada* antes da compra." Grid
   4 colunas. Cada card: placeholder 3:4 (1 deles em accent gradient),
   info inline (peça · ocasião · tamanho + nota grande).
6. **Stack** — fundo `paper`. Grid 1fr / 1.2fr. Esquerda: headline 56px
   "Visão multi-imagem treinada para roupas." Direita: 2 parágrafos +
   4 stats (Modelo, Tempo médio, Latência p95, Retenção de foto).
7. **Pricing** — 2 cards: Free (bone, R$ 0) e Premium (ink/dark, R$ 14,90,
   featured com tag "★ Recomendado" em accent). Cada feature numerada.
8. **FAQ** — header "O que *todo mundo* pergunta." Grid 60px / 1fr / 1fr.
   Numeral em accent + pergunta serif 26px + resposta 15px mid. 5 itens.
9. **Footer** — fundo `ink`. Grid 1.6fr / 1fr / 1fr / 1fr. Wordmark
   grande, parágrafo, 2 botões (App Store + Android waitlist), 3 colunas
   de links. Linha © + versão.

## Tela 01 — Brand foundations

**Arquivo:** `Foundations.jsx`.
**Screenshot:** `screenshots/01_foundations.png` (1200×760).

Card de fundação da marca: wordmark grande, exemplos de voz (✓ vs ✕),
swatches da paleta, exemplos de hierarquia tipográfica.

Use como referência ao gerar guidelines internas, asset kit ou onboarding
de novos devs/designers.

## Telas 02–06 — App iOS

Todas em 402×874 (iPhone 16 Pro size). Magazine masthead em todo topo
("Provador*ia*" + "Nº 042 · Mai 2026 · BR"). Bottom tabbar com 4 tabs
em **serifa itálica**: Capa · Ensaio · Arquivo · Eu.

### 02 · Capa (Home)

**Arquivo:** `HomeScreen` em `app.jsx`.
**Screenshot:** `screenshots/02_app_home.png`.

- Masthead `big=true` com avatar M (32×32 ink square) + chip "3/5 hoje"
- Hero full-bleed 420px tall em accent gradient com cover lines
  ("O LOOK DE HOJE" eyebrow + "Como *fica* em você?" 56px serif)
- "Próximo ensaio" — CTA editorial com headline 36px + botão quadrado 56×56
- Lista de edições recentes: numeral italic 26px accent + título + nota
- Footer mono "— Veja o arquivo →" + "P. 02"

### 03 · Ensaio (Capture)

**Arquivo:** `CaptureScreen`.
**Screenshot:** `screenshots/03_app_capture.png`.

- Eyebrow "DIREÇÃO DE ARTE" em accent
- H1 "A peça, *em foco.*" 44px serif
- Progress steps com numerais italic + labels mono
- Drop zone 350px tall, paper bg, dashed border, "arraste a foto aqui"
  32px serif italic. Dois botões: Galeria (ink) + Câmera (outline).
- Notas da direção: 3 dicas numeradas serif italic + corpo
- CTA bar ink "03 · Gerar try-on →"

### 04 · Resultado (Cover) — TELA HERO

**Arquivo:** `ResultScreen`.
**Screenshot:** `screenshots/04_app_result.png`.

A tela de maior impacto. **Tela inteira em modo dark** (ink bg).

- Cover masthead (← Voltar / Provadoria + Nº 042 / Compartilhar)
- Hero full-bleed 520px tall em accent gradient
- Cover lines no canto superior esquerdo: eyebrow + headline serif 70px
  "Cai *perfeito*." + corpo 13px
- **Nota gigante** no canto inferior direito: "Caimento" mono + "9,2"
  serif italic 120px
- Créditos no canto inferior esquerdo: modelo + "Gerado por Gemini 2.0"
- Antes/Depois toggle abaixo
- Article body com:
  - Análise · Caimento — peça + preço
  - 4 score rows com barras finas (Caimento, Cor, Estilo, Tamanho ideal)
  - Edit · Como compor — 3 dicas numeradas em italic
  - Veja também — ocasiões — lista
- CTA bar: Comprar (R$ 289) [bone] + Salvar [outline]

### 05 · Arquivo (Saved)

**Arquivo:** `SavedScreen`.
**Screenshot:** `screenshots/05_app_saved.png`.

- Masthead "Coleção" / "42 edições"
- Filter chips horizontal scroll (Tudo / Vestidos / Tricot / Casacos / Calça / Inverno)
- Grid 2 colunas — cada card é uma mini-capa:
  - Eyebrow "Nº 042"
  - Título italic serif 22px
  - Nota grande no canto inferior direito
  - Data mono no canto inferior esquerdo
  - 1 card destacado em accent gradient

### 06 · Eu (Profile)

**Arquivo:** `ProfileScreen`.
**Screenshot:** `screenshots/06_app_profile.png`.

- Header "Editora · São Paulo" + nome 64px "Marina *Souza*"
- Stats row (Edições / Caimento médio / Arquivo) com numerais serif 40px
- Plan card ink — "Vire premium. *Try-ons ilimitados.*" + R$ 14,90
- Índice — conta — 6 linhas numeradas mono + label italic serif + sub

## Interações & comportamento

- **Hero da Home**: tappar leva a capture flow
- **Capture flow**: drag/drop foto → pick galeria/câmera → progress
  bar visual atualiza 01→02→03
- **Result screen**: scroll vertical, antes/depois é toggle, "Comprar"
  abre link afiliado, "Salvar" persiste localmente
- **Saved screen**: filter chips refazem grid, tap em card vai pro
  Result novamente
- **Profile**: "Assinar" abre StoreKit IAP, links de conta abrem sub-telas
- **Tab bar**: ativo = label em accent (cinabre/cherry red) + barra de
  18×2px embaixo. Inativo = mid color, sem barra
- **Não usar**: ícones SF Symbols decorativos, gradientes cyan→purple,
  glow pulses, emojis, stars rating amarelo

## Tokens de design

### Paleta (default: Cherry)

```
bone        #F8DCD0    fundo de tela (blush salmonado)
paper       #FCE7DC    superfície (cards, paper bg)
ink         #1A0E0A    texto + dark bg
mid         #8C6A5C    texto secundário, linhas hover
line        rgba(26,14,10,0.14)   linhas, divisórias
accent      #E63923    cinabre / tomato red (único acento)
accentDeep  #9F1F12    final do gradiente accent
```

### Paletas alternativas (todas no arquivo `canvas.jsx`)

- **Mocha** — `#E2CDAA` base + `#D89A2F` accent (Pantone Mocha Mousse 2025)
- **Butter** — `#F1DE8E` base + `#FF4A3D` accent
- **Electric Pink** — `#FBDADF` base + `#FF3D7F` accent
- **Bottega Lime** — `#E8E8B8` base + `#B7E635` accent
- **Noir** — `#15120E` base + `#C9925A` accent (dark mode)

### Tipografia

```
Display    Instrument Serif         iOS: New York (system serif)
                                    web: Google Fonts
                                    pesos: 400 normal + italic

UI         Inter                    iOS: SF Pro (mantém)
                                    pesos: 300 / 400 / 500 / 600

Mono       JetBrains Mono           iOS: SF Mono
                                    pesos: 400 / 500
                                    uso: eyebrows, labels, dates
                                    style: ALL CAPS, letter-spacing 0.18–0.24em, 9–11px
```

**Escala display (Instrument Serif italic mix):**

| Token | Size | Line height | Letter-spacing | Uso |
|---|---|---|---|---|
| display-xl | 132px | 0.92 | -0.035em | Hero landing |
| display-lg | 70px | 0.88 | -0.04em | Result cover headline |
| display-md | 56px | 0.95 | -0.03em | Section headers landing |
| display-sm | 44px | 0.95 | -0.03em | App headlines |
| display-xs | 32px | 0.95 | -0.02em | Sub-heroes |

**Escala body (Inter):**

| Token | Size | Line height | Uso |
|---|---|---|---|
| body-lg | 17px | 1.55 | Hero corpo |
| body | 14–15px | 1.55 | Default |
| body-sm | 13px | 1.55 | Cards, secondary |
| caption | 11–12px | 1.55 | Captions |

**Eyebrow (JetBrains Mono):**
- 10–11px, weight 400
- `text-transform: uppercase`
- `letter-spacing: 0.18em` a `0.24em`
- color: `mid`

### Espaçamento

App iOS:
- Padding horizontal padrão: 24px
- Gap entre seções: 24–32px
- Padding vertical entre blocos: 14–20px
- Status bar height: 54px (com Dynamic Island)
- Tab bar height: ~80px (com home indicator)

Landing desktop:
- Padding horizontal: 56px
- Section padding vertical: 120px
- Grid gap padrão: 24px
- Container max-width: 1200–1440px

### Bordas, raio, sombra

- **Border radius: 0** em quase tudo. Magazine = esquinas vivas.
  Únicas exceções: avatar redondo (32×32), home indicator, status bar.
- **Borders**: 1px sólido `line` color. NUNCA 2px ou dashed (exceto dashed
  em placeholders de imagem).
- **Sem sombras.** O design não usa box-shadow. Hierarquia vem de
  tipografia + cor + espaço, não de elevação.

## Equivalentes iOS / SwiftUI

| Esta proposta | SwiftUI |
|---|---|
| Instrument Serif | `Font.custom("NewYork-Regular", size: X)` ou bundle Instrument Serif via `.otf` |
| Italic emphasis | `.italic()` modifier |
| Inter | Bundle Inter via `.otf` ou use `.system(.body, design: .default)` |
| JetBrains Mono | `Font.system(.caption, design: .monospaced)` |
| accent | `Color(red: 0.902, green: 0.224, blue: 0.137)` ou Asset Catalog "Accent" |
| bone | `Color(red: 0.973, green: 0.863, blue: 0.816)` |
| ink | `Color(red: 0.102, green: 0.055, blue: 0.039)` |
| `.padding(.horizontal, 24)` | mesma coisa |
| Sem corner radius | não usar `.cornerRadius()` em nada |

## State management (iOS)

O app já usa SwiftUI + `@State`. Estados mínimos por tela:

- **HomeView**: `stats: UserStats`, `recentTryOns: [TryOn]`, `quotaUsed: Int`
- **CaptureView**: `garmentImage: UIImage?`, `userPhoto: UIImage?` (persistido),
  `currentStep: 1 | 2 | 3`
- **ResultView**: `tryOn: TryOn` (com `fitScore`, `colorScore`, `styleScore`,
  `recommendedSize`, `tips: [String]`, `occasions: [String]`, `garmentPrice: Double?`)
- **SavedView**: `tryOns: [TryOn]`, `filter: Category`
- **ProfileView**: `user: User`, `plan: PlanType`, `quotaUsed: Int`

Backend models não mudam — manter `TryOnModels.swift` como está. Só a
camada View é redesenhada.

## Copy (PT-BR final)

Lista exaustiva da copy nova está nos próprios arquivos JSX. Pontos
críticos:

- **Wordmark**: "Provador" regular + "ia" *italic + cor accent*
- **Hero landing**: "Veja como fica em *você*."
- **Result hero**: "Cai *perfeito*." (substituível por outro headline
  baseado no score — ver fallback `ratingDescription` na versão atual)
- **Tabs**: Capa / Ensaio / Arquivo / Eu (italic serif, não sans)
- **CTAs**: "Baixar para iPhone", "Gerar try-on", "Comprar (R$ XXX)",
  "Assinar premium"
- **Edition number format**: "Nº 042" (sempre 3 dígitos zero-padded)
- **Date format**: "16 mai" (mês em minúsculas, 3 letras)
- **Score format**: "9,2" (vírgula decimal — PT-BR)

## Assets necessários

Placeholders editoriais (`HERO · MODEL`, `GARMENT`, `AI RESULT`) **devem
ser substituídos por fotos reais antes do launch**.

Mínimo viável:
- 1 modelo brasileira (preferência: representativa do público-alvo
  — mulher 25–40, biotipo médio, expressão neutra editorial)
- 1 sessão de fotos: corpo inteiro + 4 ângulos
- 4 peças photographed: vestido midi, tricot oversize, jaqueta couro,
  saia plissada (matchar peças do showcase)
- 4 results gerados pela IA (versões "depois") das mesmas combinações

Sem photoshoot real, o app fica preso na promessa amador-vs-pro.

## Arquivos neste bundle

```
handoff/
├── README.md                       (este arquivo)
├── design/                         (referência HTML/React)
│   ├── ProvadorIA Redesign.html    (canvas com tudo)
│   ├── _print.html                 (harness para gerar screenshots)
│   ├── design-canvas.jsx           (starter do design canvas)
│   ├── tweaks-panel.jsx            (starter dos tweaks)
│   ├── ios-frame.jsx               (starter device frame, não usado no atual)
│   └── src/
│       ├── foundations.jsx
│       ├── landing.jsx
│       ├── app.jsx                 (5 telas iOS)
│       └── canvas.jsx              (composição + tweaks)
└── screenshots/
    ├── 00_landing_full.png         (924×4320 — landing inteira)
    ├── 01_foundations.png          (1200×760 — brand)
    ├── 02_app_home.png             (255×540 — Início/Capa)
    ├── 03_app_capture.png          (255×540 — Ensaio)
    ├── 04_app_result.png           (255×540 — Resultado/Cover)
    ├── 05_app_saved.png            (255×540 — Arquivo)
    └── 06_app_profile.png          (255×540 — Eu)
```

Para rodar a referência localmente: abrir `ProvadorIA Redesign.html`
no navegador. Não precisa servidor.

## Sequência sugerida de implementação

1. **Tokens + fonts** primeiro. Asset catalog (iOS) + tailwind config
   (web) com a paleta cherry e a tipografia. Bundle Instrument Serif
   `.otf` no app iOS (ou use New York como fallback nativo).
2. **App: ResultScreen** (`TryOnResultView.swift`). É a tela mais
   impactante e a que mais expõe a mudança de tom.
3. **App: HomeScreen + CaptureView**.
4. **App: SavedView + ProfileView**.
5. **Landing**: reescrita do `landing/index.html` + `styles.css`.
   Pode ficar HTML estático ou migrar pra Next/Astro.
6. **Photoshoot** + substituir placeholders.
7. **Screenshots da App Store** com a nova UI (`marketing/store-screenshots/`).

## Coisas que NÃO mudam

- Arquitetura backend (FastAPI, Gemini 2.0 Flash) — sem alteração
- `Models/TryOnModels.swift` — schemas mantidos
- `Services/APIService.swift` — endpoints idênticos
- Bundle ID `com.paulopierrondi.provadoria`
- Infra Railway, deploy, env vars

Só a **camada de View + landing + asset catalog de cores e fontes**
são redesenhados.
