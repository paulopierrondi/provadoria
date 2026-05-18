// foundations.jsx — Brand foundations card (palette + type + logo + tone)
// Renders inside a DCArtboard.

function Foundations({ tokens }) {
  const t = tokens;
  return (
    <div style={{
      width: 1200, height: 760, background: t.bone, color: t.ink,
      fontFamily: t.sans, padding: '56px 64px', boxSizing: 'border-box',
      display: 'grid', gridTemplateColumns: '1.1fr 1fr', gap: 56,
    }}>
      {/* LEFT: wordmark + tone */}
      <div style={{ display: 'flex', flexDirection: 'column', justifyContent: 'space-between' }}>
        <div>
          <Eyebrow tokens={t}>Brand foundations · v1</Eyebrow>
          <div style={{ marginTop: 28, fontFamily: t.serif, fontSize: 132, lineHeight: 0.92, letterSpacing: '-0.04em', fontWeight: 400 }}>
            Provador<span style={{ fontStyle: 'italic', color: t.accent }}>ia</span>
          </div>
          <div style={{ marginTop: 18, fontSize: 14, color: t.mid, maxWidth: 520, lineHeight: 1.6 }}>
            Try-on de roupas com inteligência artificial. Marca posicionada
            como editorial — confiante, seca, brasileira. Sem cyberpunk,
            sem emoji, sem promessa exagerada.
          </div>
        </div>

        <div>
          <Eyebrow tokens={t}>Voz</Eyebrow>
          <div style={{ marginTop: 14, display: 'grid', gap: 10, fontSize: 14, color: t.ink }}>
            <ToneRow tokens={t} good="Veja como fica em você." bad="Revolução do fitting virtual chegou ao seu bolso 🚀" />
            <ToneRow tokens={t} good="5 segundos." bad="Powered by Gemini AI ⚡" />
            <ToneRow tokens={t} good="Sem provador. Sem fila." bad="A IA generativa mais avançada do mercado" />
          </div>
        </div>
      </div>

      {/* RIGHT: palette + type */}
      <div style={{ display: 'flex', flexDirection: 'column', gap: 36 }}>
        <div>
          <Eyebrow tokens={t}>Paleta</Eyebrow>
          <div style={{ marginTop: 14, display: 'grid', gridTemplateColumns: 'repeat(5, 1fr)', gap: 10 }}>
            <Swatch hex={t.bone}    name="Bone"      role="bg"      tokens={t}/>
            <Swatch hex={t.paper}   name="Paper"     role="surface" tokens={t}/>
            <Swatch hex={t.ink}     name="Ink"       role="text"    tokens={t} dark/>
            <Swatch hex={t.mid}     name="Stone"     role="muted"   tokens={t} dark/>
            <Swatch hex={t.accent}  name="Cinabre"   role="accent"  tokens={t} dark/>
          </div>
          <div style={{ marginTop: 10, fontSize: 11, color: t.mid, letterSpacing: '0.04em' }}>
            Cinabre = único acento. Nunca aplicado em superfície grande. Usado
            em links, números, marcadores editoriais.
          </div>
        </div>

        <div>
          <Eyebrow tokens={t}>Tipografia</Eyebrow>
          <div style={{ marginTop: 14, borderTop: `1px solid ${t.line}`, paddingTop: 16 }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
              <div style={{ fontFamily: t.serif, fontSize: 56, lineHeight: 1, letterSpacing: '-0.025em' }}>
                Sob medida, <span style={{ fontStyle: 'italic' }}>sem provador</span>.
              </div>
            </div>
            <div style={{ marginTop: 8, fontSize: 11, color: t.mid, letterSpacing: '0.04em', textTransform: 'uppercase' }}>
              Instrument Serif · Display · 40–132px
            </div>
          </div>
          <div style={{ marginTop: 22, borderTop: `1px solid ${t.line}`, paddingTop: 16 }}>
            <div style={{ fontSize: 17, lineHeight: 1.55, color: t.ink, maxWidth: 480 }}>
              Envie a foto da peça. A IA gera o try-on em segundos e devolve a
              análise de caimento — sem você precisar provar fisicamente.
            </div>
            <div style={{ marginTop: 8, fontSize: 11, color: t.mid, letterSpacing: '0.04em', textTransform: 'uppercase' }}>
              Inter · Body · 14–17px · weight 400
            </div>
          </div>
          <div style={{ marginTop: 22, borderTop: `1px solid ${t.line}`, paddingTop: 16 }}>
            <div style={{ fontFamily: t.mono, fontSize: 11, letterSpacing: '0.18em', textTransform: 'uppercase', color: t.ink }}>
              01 — Foto · 02 — Caimento · 03 — Resultado
            </div>
            <div style={{ marginTop: 8, fontSize: 11, color: t.mid, letterSpacing: '0.04em', textTransform: 'uppercase' }}>
              JetBrains Mono · Eyebrow · 11px · tracked
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

function Eyebrow({ children, tokens }) {
  return (
    <div style={{
      fontFamily: tokens.mono, fontSize: 11, letterSpacing: '0.18em',
      textTransform: 'uppercase', color: tokens.mid,
    }}>{children}</div>
  );
}

function ToneRow({ good, bad, tokens }) {
  return (
    <div style={{ display: 'grid', gridTemplateColumns: '20px 1fr', gap: 12, alignItems: 'start' }}>
      <div>
        <div style={{ marginBottom: 6, color: tokens.accent, fontFamily: tokens.mono, fontSize: 11 }}>✓</div>
        <div style={{ color: tokens.mid, fontFamily: tokens.mono, fontSize: 11 }}>✕</div>
      </div>
      <div>
        <div style={{ fontFamily: tokens.serif, fontSize: 19, fontStyle: 'italic', letterSpacing: '-0.01em' }}>
          “{good}”
        </div>
        <div style={{ marginTop: 4, fontSize: 13, color: tokens.mid, textDecoration: 'line-through' }}>
          {bad}
        </div>
      </div>
    </div>
  );
}

function Swatch({ hex, name, role, tokens, dark }) {
  return (
    <div>
      <div style={{
        height: 88, background: hex, borderRadius: 4,
        border: `1px solid ${tokens.line}`,
      }}/>
      <div style={{ marginTop: 8, fontFamily: tokens.mono, fontSize: 10, letterSpacing: '0.08em', color: tokens.ink, textTransform: 'uppercase' }}>
        {name}
      </div>
      <div style={{ fontFamily: tokens.mono, fontSize: 10, color: tokens.mid }}>{hex}</div>
      <div style={{ fontSize: 10, color: tokens.mid, marginTop: 2 }}>{role}</div>
    </div>
  );
}

window.Foundations = Foundations;
