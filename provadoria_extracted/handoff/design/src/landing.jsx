// landing.jsx — Editorial landing page redesign (desktop, 1440 wide)

function Landing({ tokens }) {
  const t = tokens;
  return (
    <div style={{
      width: 1440, background: t.bone, color: t.ink, fontFamily: t.sans,
      fontSize: 15, lineHeight: 1.55,
    }}>
      <Nav tokens={t} />
      <Hero tokens={t} />
      <Marquee tokens={t} />
      <HowItWorks tokens={t} />
      <Showcase tokens={t} />
      <Stack tokens={t} />
      <Pricing tokens={t} />
      <Faq tokens={t} />
      <Footer tokens={t} />
    </div>
  );
}

/* ─────────────────────────  NAV  ───────────────────────── */
function Nav({ tokens: t }) {
  return (
    <nav style={{
      borderBottom: `1px solid ${t.line}`, padding: '20px 56px',
      display: 'flex', alignItems: 'center', justifyContent: 'space-between',
      background: t.bone, position: 'sticky', top: 0, zIndex: 10,
    }}>
      <div style={{ fontFamily: t.serif, fontSize: 26, letterSpacing: '-0.02em' }}>
        Provador<span style={{ fontStyle: 'italic', color: t.accent }}>ia</span>
      </div>
      <div style={{ display: 'flex', gap: 36, alignItems: 'center', fontSize: 13 }}>
        <a style={navLink(t)}>Como funciona</a>
        <a style={navLink(t)}>App</a>
        <a style={navLink(t)}>Preços</a>
        <a style={navLink(t)}>Sobre</a>
        <a style={navLink(t)}>FAQ</a>
        <div style={{ width: 1, height: 16, background: t.line, margin: '0 4px' }}/>
        <a style={{ ...navLink(t), color: t.ink, fontWeight: 500 }}>Entrar</a>
        <a style={{
          background: t.ink, color: t.bone, padding: '10px 18px',
          fontSize: 13, fontWeight: 500, textDecoration: 'none',
          display: 'inline-flex', alignItems: 'center', gap: 8,
        }}>
          Baixar na App Store
          <svg width="12" height="12" viewBox="0 0 12 12" fill="none"><path d="M2 6h8M6 2l4 4-4 4" stroke="currentColor" strokeWidth="1.2"/></svg>
        </a>
      </div>
    </nav>
  );
}
const navLink = t => ({ color: t.mid, textDecoration: 'none', cursor: 'pointer' });

/* ─────────────────────────  HERO  ───────────────────────── */
function Hero({ tokens: t }) {
  return (
    <section style={{ padding: '72px 56px 96px', borderBottom: `1px solid ${t.line}` }}>
      <div style={{ display: 'grid', gridTemplateColumns: '1.05fr 1fr', gap: 56, alignItems: 'end' }}>
        {/* Left: headline */}
        <div>
          <div style={{
            fontFamily: t.mono, fontSize: 11, letterSpacing: '0.2em',
            textTransform: 'uppercase', color: t.mid, marginBottom: 32,
            display: 'flex', alignItems: 'center', gap: 12,
          }}>
            <span style={{ width: 28, height: 1, background: t.ink }}/>
            Edição 01 · Virtual try-on
          </div>
          <h1 style={{
            fontFamily: t.serif, fontSize: 132, lineHeight: 0.92,
            letterSpacing: '-0.035em', fontWeight: 400, margin: 0,
            color: t.ink,
          }}>
            Veja como<br/>
            fica em <span style={{ fontStyle: 'italic', color: t.accent }}>você</span>
            <span style={{ color: t.accent }}>.</span>
          </h1>
          <div style={{ marginTop: 36, maxWidth: 520, fontSize: 17, lineHeight: 1.55, color: t.ink }}>
            Envie a foto de qualquer peça e o ProvadorIA gera o try-on no seu
            corpo em segundos. Análise de caimento incluída. Sem provador, sem
            fila, sem arrependimento.
          </div>
          <div style={{ marginTop: 40, display: 'flex', gap: 14, alignItems: 'center' }}>
            <a style={{
              background: t.ink, color: t.bone, padding: '16px 26px',
              fontSize: 14, fontWeight: 500, textDecoration: 'none',
              display: 'inline-flex', alignItems: 'center', gap: 12,
            }}>
              Baixar para iPhone
              <svg width="14" height="14" viewBox="0 0 14 14" fill="none"><path d="M2 7h10M7 2l5 5-5 5" stroke="currentColor" strokeWidth="1.3"/></svg>
            </a>
            <a style={{
              padding: '16px 0', fontSize: 14, fontWeight: 500,
              color: t.ink, borderBottom: `1px solid ${t.ink}`,
              cursor: 'pointer',
            }}>
              Ver demonstração
            </a>
          </div>
          <div style={{ marginTop: 56, display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 24, borderTop: `1px solid ${t.line}`, paddingTop: 24, maxWidth: 540 }}>
            <Stat tokens={t} k="Tempo médio" v="4,8s" />
            <Stat tokens={t} k="Custo por try-on" v="grátis*" />
            <Stat tokens={t} k="Avaliação de caimento" v="incluída" />
          </div>
          <div style={{ marginTop: 10, fontSize: 11, color: t.mid }}>
            * Plano gratuito com 5 try-ons por dia. Premium R$ 14,90/mês.
          </div>
        </div>

        {/* Right: editorial photo placeholder + caption */}
        <div>
          <EditorialPhoto tokens={t} ratio="3/4" caption="01 — Original" subcaption="Sua foto. Iluminação natural recomendada." sub="HERO · MODEL"/>
          <div style={{ marginTop: 16, display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 12 }}>
            <EditorialPhoto tokens={t} ratio="1/1" caption="02 — Peça" sub="GARMENT" small/>
            <EditorialPhoto tokens={t} ratio="1/1" caption="03 — Try-on" sub="AI RESULT" small accent/>
          </div>
        </div>
      </div>
    </section>
  );
}
function Stat({ tokens: t, k, v }) {
  return (
    <div>
      <div style={{ fontFamily: t.serif, fontSize: 36, lineHeight: 1, letterSpacing: '-0.02em' }}>{v}</div>
      <div style={{ marginTop: 6, fontFamily: t.mono, fontSize: 10, letterSpacing: '0.12em', textTransform: 'uppercase', color: t.mid }}>{k}</div>
    </div>
  );
}

/* Editorial photo placeholder — striped, labeled */
function EditorialPhoto({ tokens: t, ratio = '3/4', caption, subcaption, sub, small, accent, height }) {
  const padding = small ? 16 : 24;
  return (
    <figure style={{ margin: 0 }}>
      <div style={{
        aspectRatio: ratio, width: '100%', height,
        ...(accent
          ? { backgroundImage: `linear-gradient(135deg, ${t.accent} 0%, ${t.accent} 40%, ${t.accentDeep || t.ink} 100%)`, backgroundColor: t.accent }
          : { backgroundColor: t.paper, backgroundImage: `repeating-linear-gradient(135deg, transparent 0 22px, rgba(20,17,13,0.04) 22px 23px)` }),
        border: `1px solid ${t.line}`,
        position: 'relative', overflow: 'hidden',
      }}>
        <div style={{
          position: 'absolute', inset: padding, border: `1px dashed ${accent ? 'rgba(244,238,227,0.45)' : t.line}`,
          display: 'flex', flexDirection: 'column', justifyContent: 'space-between',
        }}>
          <div style={{
            fontFamily: t.mono, fontSize: 10, letterSpacing: '0.18em',
            textTransform: 'uppercase', color: accent ? t.bone : t.mid,
          }}>{sub}</div>
          <div style={{
            fontFamily: t.mono, fontSize: 10, letterSpacing: '0.18em',
            textTransform: 'uppercase', color: accent ? t.bone : t.mid,
            alignSelf: 'flex-end',
          }}>{ratio.replace('/', ' : ')}</div>
        </div>
      </div>
      {caption && (
        <figcaption style={{ marginTop: 10, display: 'flex', justifyContent: 'space-between', fontSize: 12, color: t.mid }}>
          <span style={{ fontFamily: t.mono, letterSpacing: '0.06em', textTransform: 'uppercase' }}>{caption}</span>
          {subcaption && <span style={{ fontStyle: 'italic', fontFamily: t.serif, fontSize: 13 }}>{subcaption}</span>}
        </figcaption>
      )}
    </figure>
  );
}

/* ─────────────────────────  MARQUEE  ───────────────────────── */
function Marquee({ tokens: t }) {
  const items = ['Shein', 'C&A', 'Renner', 'Zara', 'Riachuelo', 'Farm', 'Amaro', 'Hering', 'Reserva', 'Aramis'];
  return (
    <div style={{
      borderBottom: `1px solid ${t.line}`, padding: '24px 0',
      overflow: 'hidden', whiteSpace: 'nowrap',
    }}>
      <div style={{
        display: 'flex', gap: 56, alignItems: 'center',
        fontFamily: t.mono, fontSize: 12, letterSpacing: '0.2em',
        textTransform: 'uppercase', color: t.mid,
      }}>
        <span style={{ color: t.ink, paddingLeft: 56 }}>Funciona com prints de</span>
        {items.map(x => (
          <span key={x}>{x}<span style={{ marginLeft: 56, color: t.line }}>·</span></span>
        ))}
      </div>
    </div>
  );
}

/* ─────────────────────────  HOW IT WORKS  ───────────────────────── */
function HowItWorks({ tokens: t }) {
  const steps = [
    { n: '01', t: 'Print da peça', d: 'Tire um print de qualquer site, Instagram ou catálogo. A peça pode estar no manequim, no cabide ou em outra pessoa.' },
    { n: '02', t: 'Sua foto', d: 'Uma foto sua de corpo inteiro, em luz natural. Fica salva e reusada — você só envia uma vez.' },
    { n: '03', t: 'Try-on em 5s', d: 'A IA gera o resultado e devolve a análise de caimento, tamanho recomendado e como a peça valoriza seu biotipo.' },
  ];
  return (
    <section style={{ padding: '120px 56px', borderBottom: `1px solid ${t.line}` }}>
      <SectionHeader tokens={t} eyebrow="Método" title={<>O provador, <span style={{ fontStyle: 'italic' }}>desmontado</span> em três tempos.</>} />
      <div style={{ marginTop: 80, display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 1, background: t.line, border: `1px solid ${t.line}` }}>
        {steps.map(s => (
          <div key={s.n} style={{ background: t.bone, padding: '40px 32px', minHeight: 280 }}>
            <div style={{ fontFamily: t.serif, fontSize: 72, lineHeight: 1, color: t.accent, fontStyle: 'italic', letterSpacing: '-0.02em' }}>{s.n}</div>
            <div style={{ marginTop: 24, fontFamily: t.serif, fontSize: 28, letterSpacing: '-0.02em', lineHeight: 1.15 }}>{s.t}</div>
            <div style={{ marginTop: 14, fontSize: 14, color: t.mid, lineHeight: 1.6, maxWidth: 320 }}>{s.d}</div>
          </div>
        ))}
      </div>
    </section>
  );
}

function SectionHeader({ tokens: t, eyebrow, title, action }) {
  return (
    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'end', gap: 40 }}>
      <div>
        <div style={{ fontFamily: t.mono, fontSize: 11, letterSpacing: '0.2em', textTransform: 'uppercase', color: t.mid, marginBottom: 24 }}>
          {eyebrow}
        </div>
        <h2 style={{
          fontFamily: t.serif, fontSize: 64, lineHeight: 1, letterSpacing: '-0.03em',
          fontWeight: 400, margin: 0, maxWidth: 820,
        }}>
          {title}
        </h2>
      </div>
      {action}
    </div>
  );
}

/* ─────────────────────────  SHOWCASE (BEFORE/AFTER GRID)  ───────────────────────── */
function Showcase({ tokens: t }) {
  const looks = [
    { tag: 'Vestido midi', size: 'M', fit: '9.2', occasion: 'Casamento' },
    { tag: 'Jaqueta couro', size: 'P', fit: '8.7', occasion: 'Bar' },
    { tag: 'Tricot oversized', size: 'G', fit: '9.5', occasion: 'Trabalho' },
    { tag: 'Vestido floral', size: 'M', fit: '8.9', occasion: 'Almoço' },
  ];
  return (
    <section style={{ padding: '120px 56px', borderBottom: `1px solid ${t.line}` }}>
      <SectionHeader tokens={t} eyebrow="Resultados reais" title={<>Cada peça, <span style={{ fontStyle: 'italic' }}>provada</span> antes da compra.</>}
        action={<a style={{ fontSize: 13, color: t.ink, borderBottom: `1px solid ${t.ink}` }}>Ver galeria completa →</a>}
      />
      <div style={{ marginTop: 64, display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 20 }}>
        {looks.map((l, i) => (
          <div key={i}>
            <EditorialPhoto tokens={t} ratio="3/4" sub={`TRY-ON ${String(i+1).padStart(2,'0')}`} accent={i===1}/>
            <div style={{ marginTop: 12, display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
              <div>
                <div style={{ fontFamily: t.serif, fontSize: 18, letterSpacing: '-0.01em' }}>{l.tag}</div>
                <div style={{ fontSize: 12, color: t.mid, marginTop: 2 }}>{l.occasion} · Tam. {l.size}</div>
              </div>
              <div style={{ fontFamily: t.serif, fontSize: 24, color: t.accent }}>{l.fit}</div>
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}

/* ─────────────────────────  STACK  ───────────────────────── */
function Stack({ tokens: t }) {
  return (
    <section style={{ padding: '120px 56px', borderBottom: `1px solid ${t.line}`, background: t.paper }}>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1.2fr', gap: 80 }}>
        <div>
          <div style={{ fontFamily: t.mono, fontSize: 11, letterSpacing: '0.2em', textTransform: 'uppercase', color: t.mid, marginBottom: 24 }}>
            Por dentro
          </div>
          <h2 style={{
            fontFamily: t.serif, fontSize: 56, lineHeight: 1, letterSpacing: '-0.03em',
            fontWeight: 400, margin: 0,
          }}>
            Visão multi-imagem treinada para roupas.
          </h2>
        </div>
        <div style={{ fontSize: 16, lineHeight: 1.7, color: t.ink, maxWidth: 560, paddingTop: 12 }}>
          <p style={{ margin: '0 0 18px' }}>
            ProvadorIA combina sua foto com a peça usando um modelo de visão
            multi-imagem do Google Gemini 2.0 Flash. O resultado preserva
            iluminação, sombra e proporção corporal — não é colagem.
          </p>
          <p style={{ margin: '0 0 18px' }}>
            Sua foto é processada com criptografia em trânsito, nunca
            compartilhada e pode ser apagada a qualquer momento. Autenticação
            anônima por padrão.
          </p>
          <div style={{ marginTop: 32, display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 24, borderTop: `1px solid ${t.line}`, paddingTop: 24 }}>
            <SmallStat tokens={t} k="Modelo" v="Gemini 2.0 Flash"/>
            <SmallStat tokens={t} k="Tempo médio" v="4,8s"/>
            <SmallStat tokens={t} k="Latência p95" v="7,1s"/>
            <SmallStat tokens={t} k="Retenção de foto" v="opt-in"/>
          </div>
        </div>
      </div>
    </section>
  );
}
function SmallStat({ tokens: t, k, v }) {
  return (
    <div>
      <div style={{ fontFamily: t.mono, fontSize: 10, letterSpacing: '0.14em', textTransform: 'uppercase', color: t.mid }}>{k}</div>
      <div style={{ marginTop: 6, fontFamily: t.serif, fontSize: 22, letterSpacing: '-0.01em' }}>{v}</div>
    </div>
  );
}

/* ─────────────────────────  PRICING  ───────────────────────── */
function Pricing({ tokens: t }) {
  return (
    <section style={{ padding: '120px 56px', borderBottom: `1px solid ${t.line}` }}>
      <SectionHeader tokens={t} eyebrow="Planos" title={<>Comece <span style={{ fontStyle: 'italic' }}>grátis</span>. Suba quando precisar.</>} />
      <div style={{ marginTop: 80, display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 24 }}>
        <PriceCard tokens={t} name="Free" price="R$ 0" sub="para sempre"
          features={['5 try-ons por dia', 'Análise de caimento', 'Histórico de 7 dias', 'Resolução padrão']}
          cta="Baixar"
        />
        <PriceCard tokens={t} name="Premium" price="R$ 14,90" sub="por mês · ou R$ 89,90/ano"
          features={['Try-ons ilimitados', 'Histórico permanente', 'Resolução alta + 4 ângulos', 'Try-on em vídeo (em breve)', 'Sem marca d\u2019água']}
          cta="Assinar premium"
          highlight
        />
      </div>
    </section>
  );
}

function PriceCard({ tokens: t, name, price, sub, features, cta, highlight }) {
  return (
    <div style={{
      padding: '48px 40px',
      background: highlight ? t.ink : t.bone,
      color: highlight ? t.bone : t.ink,
      border: `1px solid ${highlight ? t.ink : t.line}`,
      display: 'flex', flexDirection: 'column',
    }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <div style={{ fontFamily: t.mono, fontSize: 11, letterSpacing: '0.18em', textTransform: 'uppercase' }}>
          {name}
        </div>
        {highlight && (
          <div style={{ fontFamily: t.mono, fontSize: 10, letterSpacing: '0.18em', textTransform: 'uppercase', color: t.accent }}>
            ★ Recomendado
          </div>
        )}
      </div>
      <div style={{ marginTop: 28, fontFamily: t.serif, fontSize: 80, lineHeight: 1, letterSpacing: '-0.03em' }}>
        {price}
      </div>
      <div style={{ marginTop: 6, fontSize: 13, opacity: 0.7 }}>{sub}</div>
      <div style={{ marginTop: 36, borderTop: `1px solid ${highlight ? 'rgba(244,238,227,0.18)' : t.line}`, paddingTop: 22, display: 'flex', flexDirection: 'column', gap: 14 }}>
        {features.map((f, i) => (
          <div key={i} style={{ display: 'flex', gap: 14, fontSize: 14 }}>
            <span style={{ fontFamily: t.mono, color: highlight ? t.accent : t.accent, fontSize: 11, paddingTop: 4 }}>
              {String(i+1).padStart(2,'0')}
            </span>
            <span>{f}</span>
          </div>
        ))}
      </div>
      <a style={{
        marginTop: 'auto', alignSelf: 'stretch', textAlign: 'center',
        padding: '16px 24px', fontSize: 14, fontWeight: 500,
        background: highlight ? t.bone : t.ink,
        color: highlight ? t.ink : t.bone,
        textDecoration: 'none', marginTop: 40,
      }}>
        {cta}
      </a>
    </div>
  );
}

/* ─────────────────────────  FAQ  ───────────────────────── */
function Faq({ tokens: t }) {
  const items = [
    { q: 'A IA é boa de verdade ou parece colagem?', a: 'O modelo preserva iluminação, sombra e proporção corporal — não é sobreposição. Você consegue distinguir resultados ruins (3,0–5,0) dos bons (8,0+) na hora.' },
    { q: 'Preciso enviar minha foto toda vez?', a: 'Não. Sua foto fica salva no app (não no servidor, se você optar) e é reusada em cada try-on. Você pode trocar quando quiser.' },
    { q: 'E privacidade? Vão usar minha foto pra treinar modelo?', a: 'Não. Sua foto é processada com criptografia em trânsito e descartada após o try-on por padrão. Retenção de foto é opt-in explícito.' },
    { q: 'Funciona com roupa do Shein, Amazon, Instagram?', a: 'Sim. Funciona com print de qualquer site, marketplace, rede social ou foto da loja física. A peça pode estar no manequim, cabide ou outra pessoa.' },
    { q: 'Quanto custa?', a: 'Grátis com 5 try-ons por dia. Premium ilimitado a R$ 14,90/mês ou R$ 89,90/ano. Sem fidelidade.' },
  ];
  return (
    <section style={{ padding: '120px 56px', borderBottom: `1px solid ${t.line}` }}>
      <SectionHeader tokens={t} eyebrow="Dúvidas" title={<>O que <span style={{ fontStyle: 'italic' }}>todo mundo</span> pergunta.</>} />
      <div style={{ marginTop: 64, maxWidth: 920 }}>
        {items.map((it, i) => (
          <div key={i} style={{ borderTop: `1px solid ${t.line}`, padding: '28px 0', display: 'grid', gridTemplateColumns: '60px 1fr 1fr', gap: 32 }}>
            <div style={{ fontFamily: t.mono, fontSize: 12, color: t.accent }}>{String(i+1).padStart(2,'0')}</div>
            <div style={{ fontFamily: t.serif, fontSize: 26, letterSpacing: '-0.02em', lineHeight: 1.2 }}>{it.q}</div>
            <div style={{ fontSize: 15, color: t.mid, lineHeight: 1.65 }}>{it.a}</div>
          </div>
        ))}
        <div style={{ borderTop: `1px solid ${t.line}` }}/>
      </div>
    </section>
  );
}

/* ─────────────────────────  FOOTER  ───────────────────────── */
function Footer({ tokens: t }) {
  return (
    <footer style={{ padding: '80px 56px 40px', background: t.ink, color: t.bone }}>
      <div style={{ display: 'grid', gridTemplateColumns: '1.6fr 1fr 1fr 1fr', gap: 56 }}>
        <div>
          <div style={{ fontFamily: t.serif, fontSize: 56, letterSpacing: '-0.02em' }}>
            Provador<span style={{ fontStyle: 'italic', color: t.accent }}>ia</span>
          </div>
          <div style={{ marginTop: 18, fontSize: 14, opacity: 0.65, maxWidth: 360, lineHeight: 1.6 }}>
            Try-on virtual com IA. Feito em São Paulo. Funciona em qualquer
            iPhone com iOS 17 ou superior.
          </div>
          <div style={{ marginTop: 36, display: 'flex', gap: 12 }}>
            <a style={{ padding: '14px 22px', background: t.bone, color: t.ink, fontSize: 13, fontWeight: 500, textDecoration: 'none' }}>App Store</a>
            <a style={{ padding: '14px 22px', border: `1px solid rgba(244,238,227,0.25)`, color: t.bone, fontSize: 13, fontWeight: 500, textDecoration: 'none' }}>Android (lista de espera)</a>
          </div>
        </div>
        <FooterCol tokens={t} title="Produto" items={['Como funciona', 'App iOS', 'Preços', 'Galeria', 'Mudanças']}/>
        <FooterCol tokens={t} title="Empresa" items={['Sobre', 'Imprensa', 'Carreiras', 'Contato']}/>
        <FooterCol tokens={t} title="Legal" items={['Privacidade', 'Termos', 'Cookies', 'Dados (LGPD)']}/>
      </div>
      <div style={{ marginTop: 64, paddingTop: 24, borderTop: `1px solid rgba(244,238,227,0.12)`, display: 'flex', justifyContent: 'space-between', fontSize: 12, opacity: 0.6 }}>
        <div>© 2026 ProvadorIA · CNPJ 00.000.000/0001-00</div>
        <div style={{ fontFamily: t.mono, letterSpacing: '0.18em', textTransform: 'uppercase' }}>v1.0 · São Paulo, BR</div>
      </div>
    </footer>
  );
}
function FooterCol({ tokens: t, title, items }) {
  return (
    <div>
      <div style={{ fontFamily: t.mono, fontSize: 11, letterSpacing: '0.18em', textTransform: 'uppercase', opacity: 0.55 }}>{title}</div>
      <div style={{ marginTop: 18, display: 'flex', flexDirection: 'column', gap: 10 }}>
        {items.map(x => <a key={x} style={{ fontSize: 14, color: t.bone, opacity: 0.85, textDecoration: 'none' }}>{x}</a>)}
      </div>
    </div>
  );
}

window.Landing = Landing;
