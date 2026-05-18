// app.jsx — Magazine-cover aesthetic (Vogue/i-D direction)
// Each screen feels like a page from a fashion magazine.
// Masthead, cover lines, full-bleed photos, drama in typography.

/* ─────────────────────  CHROME  ───────────────────── */

function Screen({ children, t, bg, dark }) {
  return (
    <div style={{
      width: '100%', height: '100%',
      background: bg || (dark ? t.ink : t.bone),
      color: dark ? t.bone : t.ink, fontFamily: t.sans, fontSize: 14,
      display: 'flex', flexDirection: 'column', overflow: 'hidden',
      position: 'relative',
    }}>
      {children}
    </div>
  );
}

/* Magazine masthead — the "ProvadorIA" wordmark + tagline strip */
function Masthead({ t, dark, sub, right, big }) {
  const ink = dark ? t.bone : t.ink;
  const muted = dark ? 'rgba(244,238,227,0.55)' : t.mid;
  const line = dark ? 'rgba(244,238,227,0.16)' : t.line;
  return (
    <div style={{
      borderBottom: `1px solid ${line}`,
      padding: big ? '18px 24px 14px' : '14px 24px 10px',
    }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
        <div style={{
          fontFamily: t.serif, fontSize: big ? 44 : 30,
          letterSpacing: '-0.04em', lineHeight: 1, fontWeight: 400, color: ink,
        }}>
          Provador<span style={{ fontStyle: 'italic', color: t.accent }}>ia</span>
        </div>
        {right}
      </div>
      <div style={{
        marginTop: 6, display: 'flex', justifyContent: 'space-between', alignItems: 'baseline',
        fontFamily: t.mono, fontSize: 9, letterSpacing: '0.22em',
        textTransform: 'uppercase', color: muted,
      }}>
        <span>{sub || 'O provador no seu bolso'}</span>
        <span>Nº 042 · Mai 2026 · BR</span>
      </div>
    </div>
  );
}

/* Tabs at bottom — magazine "section dividers" */
function TabBar({ t, active, dark }) {
  const ink = dark ? t.bone : t.ink;
  const muted = dark ? 'rgba(244,238,227,0.45)' : t.mid;
  const line = dark ? 'rgba(244,238,227,0.16)' : t.line;
  const bg = dark ? t.ink : t.bone;
  const tabs = [
    { id: 'home', label: 'Capa' },
    { id: 'try', label: 'Ensaio' },
    { id: 'saved', label: 'Arquivo' },
    { id: 'profile', label: 'Eu' },
  ];
  return (
    <div style={{
      borderTop: `1px solid ${line}`, background: bg,
      padding: '14px 8px 30px',
      display: 'flex', justifyContent: 'space-between',
    }}>
      {tabs.map(tab => {
        const isActive = active === tab.id;
        return (
          <div key={tab.id} style={{
            flex: 1, display: 'flex', flexDirection: 'column',
            alignItems: 'center', gap: 6, padding: '4px 0',
          }}>
            <div style={{
              fontFamily: t.serif, fontStyle: 'italic', fontSize: 18, lineHeight: 1,
              color: isActive ? t.accent : (isActive ? ink : muted),
              letterSpacing: '-0.01em',
            }}>{tab.label}</div>
            <div style={{
              width: 18, height: 2, background: isActive ? t.accent : 'transparent',
            }}/>
          </div>
        );
      })}
    </div>
  );
}

/* Photo placeholder with magazine vibes — editorial label + crop crosshair */
function MagPhoto({ t, h = 200, label, fullBleed, accent, dark, children, ratio }) {
  // Build bg style as a single object — mixing `background:` shorthand with
  // a separate `backgroundImage:` key lets React wipe the gradient when the
  // shorthand is serialized after the longhand. Use only longhand keys.
  const bgStyle = accent
    ? { backgroundImage: `linear-gradient(160deg, ${t.accent} 0%, ${t.accentDeep || t.accent} 100%)`, backgroundColor: t.accent }
    : dark
    ? { backgroundImage: `linear-gradient(180deg, #2c2520, #14110d)`, backgroundColor: t.ink }
    : {
        backgroundColor: t.paper,
        backgroundImage: `repeating-linear-gradient(122deg, transparent 0 16px, rgba(20,17,13,0.06) 16px 17px)`,
      };
  return (
    <div style={{
      width: '100%', height: h,
      aspectRatio: ratio,
      ...bgStyle,
      position: 'relative', overflow: 'hidden',
      borderRadius: 0,
    }}>
      {/* Crosshair guides — only inside framed shots, not full bleed */}
      {!fullBleed && (
        <>
          <div style={{ position: 'absolute', top: 12, left: 12, width: 12, height: 12, borderTop: `1px solid ${accent || dark ? 'rgba(244,238,227,0.5)' : 'rgba(20,17,13,0.35)'}`, borderLeft: `1px solid ${accent || dark ? 'rgba(244,238,227,0.5)' : 'rgba(20,17,13,0.35)'}` }}/>
          <div style={{ position: 'absolute', top: 12, right: 12, width: 12, height: 12, borderTop: `1px solid ${accent || dark ? 'rgba(244,238,227,0.5)' : 'rgba(20,17,13,0.35)'}`, borderRight: `1px solid ${accent || dark ? 'rgba(244,238,227,0.5)' : 'rgba(20,17,13,0.35)'}` }}/>
          <div style={{ position: 'absolute', bottom: 12, left: 12, width: 12, height: 12, borderBottom: `1px solid ${accent || dark ? 'rgba(244,238,227,0.5)' : 'rgba(20,17,13,0.35)'}`, borderLeft: `1px solid ${accent || dark ? 'rgba(244,238,227,0.5)' : 'rgba(20,17,13,0.35)'}` }}/>
          <div style={{ position: 'absolute', bottom: 12, right: 12, width: 12, height: 12, borderBottom: `1px solid ${accent || dark ? 'rgba(244,238,227,0.5)' : 'rgba(20,17,13,0.35)'}`, borderRight: `1px solid ${accent || dark ? 'rgba(244,238,227,0.5)' : 'rgba(20,17,13,0.35)'}` }}/>
        </>
      )}
      <div style={{
        position: 'absolute', inset: 0, padding: 14,
        display: 'flex', flexDirection: 'column', justifyContent: 'space-between',
        pointerEvents: 'none',
      }}>
        {label && (
          <div style={{
            fontFamily: t.mono, fontSize: 9, letterSpacing: '0.22em',
            textTransform: 'uppercase',
            color: accent || dark ? 'rgba(244,238,227,0.65)' : t.mid,
          }}>{label}</div>
        )}
        <div style={{ pointerEvents: 'auto' }}>{children}</div>
      </div>
    </div>
  );
}

/* ─────────────────────  1. HOME (Magazine cover) ───────────────────── */
function HomeScreen({ t }) {
  return (
    <Screen t={t}>
      <Masthead t={t} big sub="Edição diária · @marinasouza" right={
        <div style={{ display: 'flex', gap: 8, alignItems: 'center' }}>
          <div style={{
            fontFamily: t.mono, fontSize: 9, letterSpacing: '0.2em', textTransform: 'uppercase',
            color: t.mid, padding: '4px 8px', border: `1px solid ${t.line}`,
          }}>3 / 5 hoje</div>
          <div style={{
            width: 32, height: 32, borderRadius: 0, background: t.ink, color: t.bone,
            display: 'flex', alignItems: 'center', justifyContent: 'center',
            fontFamily: t.mono, fontSize: 11,
          }}>M</div>
        </div>
      }/>

      <div style={{ flex: 1, overflow: 'auto' }}>
        {/* Big cover hero — today's spotlight */}
        <div style={{ position: 'relative' }}>
          <MagPhoto t={t} h={420} accent fullBleed label="CAPA · 16 MAI 2026">
            {/* Cover lines on left */}
            <div style={{ position: 'absolute', top: 24, left: 16, right: 16 }}>
              <div style={{
                fontFamily: t.mono, fontSize: 9, letterSpacing: '0.24em',
                textTransform: 'uppercase', color: 'rgba(244,238,227,0.8)',
              }}>O LOOK DE HOJE</div>
              <div style={{
                marginTop: 12, fontFamily: t.serif, fontSize: 56, lineHeight: 0.95,
                color: t.bone, letterSpacing: '-0.035em', fontWeight: 400,
              }}>
                Como<br/>
                <span style={{ fontStyle: 'italic' }}>fica</span> em<br/>
                você<span style={{ fontStyle: 'italic' }}>?</span>
              </div>
            </div>
            <div style={{
              position: 'absolute', bottom: 24, left: 16, right: 16,
              display: 'flex', justifyContent: 'space-between', alignItems: 'flex-end',
            }}>
              <div style={{ maxWidth: 200 }}>
                <div style={{
                  fontFamily: t.mono, fontSize: 9, letterSpacing: '0.22em',
                  textTransform: 'uppercase', color: 'rgba(244,238,227,0.7)',
                }}>NESTA EDIÇÃO</div>
                <div style={{ marginTop: 6, color: t.bone, fontSize: 13, lineHeight: 1.5 }}>
                  Vestidos para o calor, jaquetas de meia estação e o tricô que cabe em todo mundo.
                </div>
              </div>
              <div style={{
                fontFamily: t.serif, fontSize: 42, fontStyle: 'italic',
                color: t.bone, lineHeight: 1,
              }}>+</div>
            </div>
          </MagPhoto>
        </div>

        {/* Primary CTA — "Novo Ensaio" as magazine pull quote */}
        <div style={{
          padding: '24px 24px 20px', display: 'flex', justifyContent: 'space-between', alignItems: 'flex-end',
          borderBottom: `1px solid ${t.line}`,
        }}>
          <div>
            <div style={{ fontFamily: t.mono, fontSize: 9, letterSpacing: '0.22em', textTransform: 'uppercase', color: t.accent }}>
              Começar · Próximo ensaio
            </div>
            <div style={{
              marginTop: 6, fontFamily: t.serif, fontSize: 36, lineHeight: 0.95,
              letterSpacing: '-0.025em',
            }}>
              Envie a peça.<br/>
              <span style={{ fontStyle: 'italic' }}>Em 5 segundos</span> está pronto.
            </div>
          </div>
          <div style={{
            width: 56, height: 56, background: t.ink, color: t.bone,
            display: 'flex', alignItems: 'center', justifyContent: 'center',
            fontSize: 24, fontFamily: t.serif, flexShrink: 0,
          }}>→</div>
        </div>

        {/* Today's "issue" — recent looks as numbered editorial list */}
        <div style={{ padding: '24px 24px 8px' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 16 }}>
            <div style={{ fontFamily: t.mono, fontSize: 10, letterSpacing: '0.22em', textTransform: 'uppercase', color: t.mid }}>
              Suas edições recentes
            </div>
            <div style={{ fontFamily: t.mono, fontSize: 10, color: t.mid }}>P. 02 / 05</div>
          </div>

          {[
            { n: '042', t: 'Vestido midi Farm', sub: 'Casamento · Tam. M', fit: '9,2', date: '16 mai' },
            { n: '041', t: 'Tricot oversize Reserva', sub: 'Trabalho · Tam. G', fit: '8,7', date: '15 mai' },
            { n: '040', t: 'Jaqueta couro Aramis', sub: 'Bar · Tam. P', fit: '7,4', date: '13 mai' },
            { n: '039', t: 'Saia plissada Renner', sub: 'Almoço · Tam. 38', fit: '9,0', date: '12 mai' },
          ].map((l, i) => (
            <div key={l.n} style={{
              padding: '14px 0', borderTop: `1px solid ${t.line}`,
              display: 'grid', gridTemplateColumns: '46px 1fr auto', gap: 14, alignItems: 'center',
            }}>
              <div style={{
                fontFamily: t.serif, fontSize: 26, fontStyle: 'italic',
                color: t.accent, lineHeight: 1,
              }}>{l.n}</div>
              <div>
                <div style={{ fontFamily: t.serif, fontSize: 18, letterSpacing: '-0.01em', lineHeight: 1.15 }}>{l.t}</div>
                <div style={{ marginTop: 3, fontSize: 11, color: t.mid }}>{l.sub} · {l.date}</div>
              </div>
              <div style={{ display: 'flex', alignItems: 'baseline', gap: 6 }}>
                <div style={{ fontFamily: t.serif, fontSize: 24, lineHeight: 1 }}>{l.fit}</div>
                <div style={{ fontFamily: t.mono, fontSize: 9, color: t.mid }}>/10</div>
              </div>
            </div>
          ))}
          <div style={{ borderTop: `1px solid ${t.line}` }}/>
        </div>

        {/* Page foot — magazine flourish */}
        <div style={{
          padding: '14px 24px 24px', display: 'flex', justifyContent: 'space-between',
          fontFamily: t.mono, fontSize: 9, letterSpacing: '0.22em', textTransform: 'uppercase', color: t.mid,
        }}>
          <span>— Veja o arquivo →</span>
          <span>P. 02</span>
        </div>
      </div>

      <TabBar t={t} active="home" />
    </Screen>
  );
}

/* ─────────────────────  2. CAPTURE (Ensaio)  ───────────────────── */
function CaptureScreen({ t }) {
  return (
    <Screen t={t}>
      <Masthead t={t} sub="Ensaio · Etapa 02 de 03" right={
        <div style={{ fontFamily: t.mono, fontSize: 10, letterSpacing: '0.22em', textTransform: 'uppercase', color: t.mid }}>
          Fechar
        </div>
      }/>

      <div style={{ flex: 1, padding: '20px 24px 0', overflow: 'auto' }}>
        {/* Editorial direction headline */}
        <div style={{
          fontFamily: t.mono, fontSize: 10, letterSpacing: '0.24em',
          textTransform: 'uppercase', color: t.accent,
        }}>Direção de arte</div>
        <h1 style={{
          margin: '8px 0 0', fontFamily: t.serif, fontSize: 44, lineHeight: 0.95,
          letterSpacing: '-0.03em', fontWeight: 400,
        }}>
          A peça,<br/>
          <span style={{ fontStyle: 'italic' }}>em foco.</span>
        </h1>
        <div style={{ marginTop: 12, fontSize: 13, color: t.mid, maxWidth: 280, lineHeight: 1.6 }}>
          Um print, uma foto da loja, do Instagram — a IA topa qualquer um.
          Manequim, cabide, em outra pessoa. Não importa.
        </div>

        {/* Progress as page-number style */}
        <div style={{ marginTop: 22, display: 'flex', gap: 14, alignItems: 'baseline' }}>
          {[
            { n: '01', label: 'Sua foto', done: true },
            { n: '02', label: 'A peça', active: true },
            { n: '03', label: 'Resultado' },
          ].map(s => (
            <div key={s.n} style={{ display: 'flex', flexDirection: 'column', gap: 4, flex: 1 }}>
              <div style={{
                fontFamily: t.serif, fontSize: 20, fontStyle: 'italic',
                color: s.active ? t.accent : s.done ? t.ink : t.mid,
                opacity: s.done && !s.active ? 0.4 : 1,
              }}>{s.n}</div>
              <div style={{
                height: 2, background: s.active || s.done ? t.ink : t.line,
                opacity: s.active ? 1 : s.done ? 0.4 : 1,
              }}/>
              <div style={{ fontFamily: t.mono, fontSize: 9, letterSpacing: '0.16em', textTransform: 'uppercase', color: s.active ? t.ink : t.mid }}>
                {s.label}
              </div>
            </div>
          ))}
        </div>

        {/* Drop zone — looks like a contact sheet frame */}
        <div style={{ marginTop: 22 }}>
          <MagPhoto t={t} h={350} label="UPLOAD · 3 : 4 · UNTITLED">
            <div style={{
              position: 'absolute', inset: 32,
              display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center',
              gap: 12, textAlign: 'center',
            }}>
              <div style={{ fontFamily: t.serif, fontSize: 32, fontStyle: 'italic', letterSpacing: '-0.02em', lineHeight: 1 }}>
                arraste a foto<br/>aqui
              </div>
              <div style={{ fontSize: 12, color: t.mid, maxWidth: 200, lineHeight: 1.5 }}>
                JPG · PNG · HEIC · até 12 MB
              </div>
              <div style={{ marginTop: 14, display: 'flex', gap: 8 }}>
                <div style={{ padding: '10px 16px', background: t.ink, color: t.bone, fontSize: 11, fontFamily: t.mono, letterSpacing: '0.16em', textTransform: 'uppercase' }}>Galeria</div>
                <div style={{ padding: '10px 16px', border: `1px solid ${t.ink}`, color: t.ink, fontSize: 11, fontFamily: t.mono, letterSpacing: '0.16em', textTransform: 'uppercase' }}>Câmera</div>
              </div>
            </div>
          </MagPhoto>
        </div>

        {/* Editorial-styled tips */}
        <div style={{ marginTop: 24, borderTop: `1px solid ${t.line}`, paddingTop: 16, marginBottom: 24 }}>
          <div style={{ fontFamily: t.mono, fontSize: 10, letterSpacing: '0.22em', textTransform: 'uppercase', color: t.mid, marginBottom: 12 }}>
            Notas da direção
          </div>
          {[
            ['Fundo neutro,', 'peça inteira no quadro.'],
            ['Luz natural,', 'sem flash direto.'],
            ['Evite manequim', 'em pose extrema.'],
          ].map(([a, b], i) => (
            <div key={i} style={{ display: 'grid', gridTemplateColumns: '24px 1fr', gap: 12, padding: '10px 0', borderBottom: i < 2 ? `1px solid ${t.line}` : 'none' }}>
              <div style={{ fontFamily: t.serif, fontSize: 16, color: t.accent, fontStyle: 'italic' }}>{String(i+1).padStart(2,'0')}</div>
              <div style={{ fontSize: 13 }}>
                <span style={{ fontFamily: t.serif, fontStyle: 'italic', fontSize: 15 }}>{a}</span> {b}
              </div>
            </div>
          ))}
        </div>
      </div>

      <div style={{ padding: '12px 24px 24px', borderTop: `1px solid ${t.line}` }}>
        <div style={{
          padding: '16px 20px', background: t.ink, color: t.bone,
          display: 'flex', justifyContent: 'space-between', alignItems: 'center',
        }}>
          <span style={{ fontFamily: t.mono, fontSize: 10, letterSpacing: '0.22em', color: t.accent }}>03</span>
          <span style={{ fontFamily: t.serif, fontSize: 18, fontStyle: 'italic' }}>Gerar try-on</span>
          <span style={{ fontSize: 18 }}>→</span>
        </div>
      </div>
    </Screen>
  );
}

/* ─────────────────────  3. RESULT — THE COVER ───────────────────── */
function ResultScreen({ t }) {
  return (
    <Screen t={t} dark>
      {/* Cover masthead — dark variant */}
      <div style={{ padding: '14px 24px 10px', borderBottom: `1px solid rgba(244,238,227,0.16)` }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
          <div style={{
            fontFamily: t.mono, fontSize: 10, letterSpacing: '0.22em',
            textTransform: 'uppercase', color: 'rgba(244,238,227,0.55)',
          }}>← Voltar</div>
          <div style={{
            fontFamily: t.mono, fontSize: 10, letterSpacing: '0.22em',
            textTransform: 'uppercase', color: 'rgba(244,238,227,0.55)',
          }}>Compartilhar</div>
        </div>
        <div style={{ marginTop: 6, display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
          <div style={{
            fontFamily: t.serif, fontSize: 36, letterSpacing: '-0.04em',
            lineHeight: 1, color: t.bone,
          }}>
            Provador<span style={{ fontStyle: 'italic', color: t.accent }}>ia</span>
          </div>
          <div style={{
            fontFamily: t.mono, fontSize: 9, letterSpacing: '0.22em',
            textTransform: 'uppercase', color: 'rgba(244,238,227,0.45)',
          }}>Nº 042 / Mai 2026</div>
        </div>
      </div>

      <div style={{ flex: 1, overflow: 'auto', position: 'relative' }}>
        {/* THE COVER — full-bleed accent image with cover lines */}
        <div style={{ position: 'relative' }}>
          <MagPhoto t={t} h={520} accent fullBleed>
            {/* Cover lines stacked on left */}
            <div style={{ position: 'absolute', top: 22, left: 22, right: 80 }}>
              <div style={{
                fontFamily: t.mono, fontSize: 9, letterSpacing: '0.26em',
                textTransform: 'uppercase', color: 'rgba(244,238,227,0.75)',
              }}>Try-on Nº 042 · 16 mai · 14:32</div>
              <div style={{
                marginTop: 14, fontFamily: t.serif, fontSize: 70, lineHeight: 0.88,
                color: t.bone, letterSpacing: '-0.04em', fontWeight: 400,
              }}>
                Cai<br/>
                <span style={{ fontStyle: 'italic' }}>perfeito</span>
                <span style={{ color: t.bone }}>.</span>
              </div>
              <div style={{
                marginTop: 14, fontSize: 13, color: 'rgba(244,238,227,0.85)',
                maxWidth: 220, lineHeight: 1.45,
              }}>
                Especialmente <span style={{ fontStyle: 'italic', fontFamily: t.serif, fontSize: 15 }}>na cintura</span>.
                O tamanho M ficou exato.
              </div>
            </div>

            {/* Big score in corner — magazine cover style */}
            <div style={{
              position: 'absolute', bottom: 22, right: 22,
              textAlign: 'right',
            }}>
              <div style={{
                fontFamily: t.mono, fontSize: 9, letterSpacing: '0.24em',
                textTransform: 'uppercase', color: 'rgba(244,238,227,0.7)',
              }}>Caimento</div>
              <div style={{
                fontFamily: t.serif, fontSize: 120, lineHeight: 0.9,
                color: t.bone, letterSpacing: '-0.04em',
                fontStyle: 'italic',
              }}>9,2</div>
            </div>

            {/* Tiny credit line bottom-left */}
            <div style={{
              position: 'absolute', bottom: 22, left: 22,
              fontFamily: t.mono, fontSize: 9, letterSpacing: '0.2em',
              textTransform: 'uppercase', color: 'rgba(244,238,227,0.55)',
            }}>
              Modelo: Marina · 1,67m · M<br/>
              <span style={{ color: 'rgba(244,238,227,0.7)', letterSpacing: '0.18em' }}>Gerado por Gemini 2.0</span>
            </div>
          </MagPhoto>
        </div>

        {/* Before / After split */}
        <div style={{ padding: '16px 24px 0', display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 8 }}>
          <div style={{ background: 'rgba(244,238,227,0.06)', padding: '10px 12px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <span style={{ fontFamily: t.mono, fontSize: 10, letterSpacing: '0.18em', textTransform: 'uppercase', color: 'rgba(244,238,227,0.6)' }}>Antes</span>
            <span style={{ color: 'rgba(244,238,227,0.4)', fontSize: 10 }}>↕</span>
          </div>
          <div style={{ background: t.bone, color: t.ink, padding: '10px 12px', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <span style={{ fontFamily: t.mono, fontSize: 10, letterSpacing: '0.18em', textTransform: 'uppercase' }}>Depois</span>
            <span style={{ color: t.accent, fontSize: 10 }}>●</span>
          </div>
        </div>

        {/* Article body — "review da peça" */}
        <div style={{ padding: '32px 24px 0' }}>
          <div style={{
            fontFamily: t.mono, fontSize: 9, letterSpacing: '0.24em',
            textTransform: 'uppercase', color: t.accent,
          }}>Análise · Caimento</div>
          <div style={{
            marginTop: 10, fontFamily: t.serif, fontSize: 26, lineHeight: 1.1,
            color: t.bone, letterSpacing: '-0.02em',
          }}>
            Vestido midi Farm · Tam. M.<br/>
            <span style={{ color: 'rgba(244,238,227,0.6)', fontStyle: 'italic' }}>R$ 289 · Loja oficial</span>
          </div>

          {/* Score breakdown — magazine pull stats */}
          <div style={{
            marginTop: 24, borderTop: `1px solid rgba(244,238,227,0.16)`,
            borderBottom: `1px solid rgba(244,238,227,0.16)`, padding: '18px 0',
            display: 'grid', gap: 12,
          }}>
            <ScoreRow t={t} dark k="Caimento" v="9,8" />
            <ScoreRow t={t} dark k="Cor" v="9,5" />
            <ScoreRow t={t} dark k="Estilo" v="8,9" />
            <ScoreRow t={t} dark k="Tamanho ideal" v="M" mono />
          </div>
        </div>

        {/* Style tips — magazine editor's note */}
        <div style={{ padding: '24px 24px 0' }}>
          <div style={{
            fontFamily: t.mono, fontSize: 9, letterSpacing: '0.24em',
            textTransform: 'uppercase', color: 'rgba(244,238,227,0.55)',
          }}>Edit · Como compor</div>
          <div style={{ marginTop: 14, display: 'flex', flexDirection: 'column', gap: 14 }}>
            {[
              ['Bota curta preta', 'mais que sandália. Equilibra o volume da saia.'],
              ['Cinto fino na cintura', 'sublinha o que a peça já entrega.'],
              ['Brincos pequenos.', 'O decote já tem caimento marcado.'],
            ].map(([head, tail], i) => (
              <div key={i} style={{ display: 'grid', gridTemplateColumns: '32px 1fr', gap: 12 }}>
                <div style={{ fontFamily: t.serif, fontSize: 24, color: t.accent, fontStyle: 'italic', lineHeight: 1 }}>
                  {String(i+1).padStart(2,'0')}
                </div>
                <div style={{ fontSize: 14, lineHeight: 1.5, color: t.bone }}>
                  <span style={{ fontFamily: t.serif, fontSize: 17, fontStyle: 'italic' }}>{head}</span>
                  {' '}{tail}
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Occasions — cover line list */}
        <div style={{ padding: '28px 24px 0' }}>
          <div style={{ fontFamily: t.mono, fontSize: 9, letterSpacing: '0.24em', textTransform: 'uppercase', color: 'rgba(244,238,227,0.55)', marginBottom: 14 }}>
            Veja também — ocasiões
          </div>
          {['Casamento ao ar livre', 'Almoço de domingo', 'Aniversário formal', 'Encontro à noite'].map((o, i) => (
            <div key={o} style={{
              padding: '12px 0', borderTop: `1px solid rgba(244,238,227,0.16)`,
              display: 'flex', justifyContent: 'space-between', alignItems: 'baseline',
            }}>
              <div style={{ display: 'flex', gap: 10, alignItems: 'baseline' }}>
                <span style={{ fontFamily: t.mono, fontSize: 9, color: 'rgba(244,238,227,0.4)' }}>P. {String(i+1).padStart(2,'0')}</span>
                <span style={{ fontFamily: t.serif, fontSize: 17, color: t.bone, fontStyle: 'italic' }}>{o}</span>
              </div>
              <span style={{ color: 'rgba(244,238,227,0.4)' }}>→</span>
            </div>
          ))}
          <div style={{ borderTop: `1px solid rgba(244,238,227,0.16)` }}/>
        </div>

        <div style={{ height: 32 }}/>
      </div>

      {/* CTA */}
      <div style={{
        padding: '12px 24px 28px', borderTop: `1px solid rgba(244,238,227,0.16)`,
        background: t.ink, display: 'flex', gap: 8,
      }}>
        <div style={{ flex: 1, padding: '16px', background: t.bone, color: t.ink, textAlign: 'center', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <span style={{ fontFamily: t.mono, fontSize: 10, letterSpacing: '0.18em', textTransform: 'uppercase' }}>Comprar</span>
          <span style={{ fontFamily: t.serif, fontSize: 18 }}>R$ 289</span>
        </div>
        <div style={{ padding: '16px 20px', border: `1px solid rgba(244,238,227,0.3)`, color: t.bone, fontFamily: t.mono, fontSize: 10, letterSpacing: '0.18em', textTransform: 'uppercase' }}>
          Salvar
        </div>
      </div>
    </Screen>
  );
}

function ScoreRow({ t, k, v, mono, dark }) {
  const ink = dark ? t.bone : t.ink;
  const muted = dark ? 'rgba(244,238,227,0.4)' : t.line;
  const num = parseFloat(v.replace(',', '.'));
  const pct = mono ? 0 : (num / 10) * 100;
  return (
    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
      <div style={{ fontSize: 14, color: ink, fontFamily: t.serif, fontStyle: 'italic', fontSize: 16 }}>{k}</div>
      <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
        {!mono && (
          <div style={{ width: 100, height: 1, background: muted, position: 'relative' }}>
            <div style={{ position: 'absolute', top: -1, left: 0, height: 3, width: `${pct}%`, background: t.accent }}/>
          </div>
        )}
        <div style={{ fontFamily: t.serif, fontSize: 22, color: ink, lineHeight: 1, minWidth: 40, textAlign: 'right' }}>
          {v}
        </div>
      </div>
    </div>
  );
}

/* ─────────────────────  4. SAVED — Archive (magazine issues grid) ───────────────────── */
function SavedScreen({ t }) {
  const issues = [
    { n: '042', t: 'Vestido midi', sub: 'Farm · M', fit: '9,2', date: '16 mai', accent: true },
    { n: '041', t: 'Tricot oversize', sub: 'Reserva · G', fit: '8,7', date: '15 mai' },
    { n: '040', t: 'Jaqueta couro', sub: 'Aramis · P', fit: '7,4', date: '13 mai' },
    { n: '039', t: 'Saia plissada', sub: 'Renner · 38', fit: '9,0', date: '12 mai' },
    { n: '038', t: 'Blazer linho', sub: 'Amaro · M', fit: '8,5', date: '10 mai' },
    { n: '037', t: 'Camisa seda', sub: 'C&A · P', fit: '6,8', date: '08 mai' },
  ];
  return (
    <Screen t={t}>
      <Masthead t={t} big sub="Arquivo · 42 edições" right={
        <div style={{ fontFamily: t.mono, fontSize: 10, letterSpacing: '0.22em', textTransform: 'uppercase', color: t.mid }}>Filtrar</div>
      }/>

      <div style={{ flex: 1, overflow: 'auto' }}>
        <div style={{ padding: '16px 24px 4px', display: 'flex', gap: 6, overflowX: 'auto' }}>
          {['Tudo', 'Vestidos', 'Tricot', 'Casacos', 'Calça', 'Inverno'].map((f, i) => (
            <div key={f} style={{
              padding: '8px 14px', fontSize: 11, fontFamily: t.mono, letterSpacing: '0.16em', textTransform: 'uppercase',
              background: i === 0 ? t.ink : 'transparent',
              color: i === 0 ? t.bone : t.ink,
              border: `1px solid ${i === 0 ? t.ink : t.line}`,
              whiteSpace: 'nowrap',
            }}>{f}</div>
          ))}
        </div>

        <div style={{ padding: '16px 24px 0' }}>
          <div style={{
            display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 14,
          }}>
            {issues.map(l => (
              <div key={l.n}>
                <MagPhoto t={t} h={210} accent={l.accent} fullBleed>
                  {/* Mini cover lines */}
                  <div style={{ position: 'absolute', top: 12, left: 12, right: 12 }}>
                    <div style={{
                      fontFamily: t.mono, fontSize: 8, letterSpacing: '0.24em',
                      textTransform: 'uppercase', color: l.accent ? 'rgba(244,238,227,0.7)' : t.mid,
                    }}>Nº {l.n}</div>
                    <div style={{
                      marginTop: 6, fontFamily: t.serif, fontSize: 22, lineHeight: 0.95,
                      letterSpacing: '-0.02em', fontStyle: 'italic',
                      color: l.accent ? t.bone : t.ink,
                    }}>{l.t}</div>
                  </div>
                  <div style={{
                    position: 'absolute', bottom: 12, right: 12,
                    fontFamily: t.serif, fontSize: 32, lineHeight: 1,
                    color: l.accent ? t.bone : t.ink, letterSpacing: '-0.02em',
                  }}>{l.fit}</div>
                  <div style={{
                    position: 'absolute', bottom: 12, left: 12,
                    fontFamily: t.mono, fontSize: 8, letterSpacing: '0.18em',
                    textTransform: 'uppercase', color: l.accent ? 'rgba(244,238,227,0.55)' : t.mid,
                  }}>{l.date}</div>
                </MagPhoto>
                <div style={{ marginTop: 8, fontSize: 11, color: t.mid, fontFamily: t.mono, letterSpacing: '0.1em', textTransform: 'uppercase' }}>
                  {l.sub}
                </div>
              </div>
            ))}
          </div>
        </div>

        <div style={{
          padding: '24px 24px 24px', display: 'flex', justifyContent: 'space-between',
          fontFamily: t.mono, fontSize: 9, letterSpacing: '0.22em', textTransform: 'uppercase', color: t.mid,
        }}>
          <span>— Fim das edições</span>
          <span>42 / 42</span>
        </div>
      </div>

      <TabBar t={t} active="saved" />
    </Screen>
  );
}

/* ─────────────────────  5. PROFILE — Bio editorial ───────────────────── */
function ProfileScreen({ t }) {
  return (
    <Screen t={t}>
      <Masthead t={t} sub="Quem assina esta edição" right={
        <div style={{ fontFamily: t.mono, fontSize: 10, letterSpacing: '0.22em', textTransform: 'uppercase', color: t.mid }}>Editar</div>
      }/>

      <div style={{ flex: 1, overflow: 'auto' }}>
        {/* Big editorial bio header */}
        <div style={{ padding: '24px 24px 0' }}>
          <div style={{
            fontFamily: t.mono, fontSize: 10, letterSpacing: '0.24em', textTransform: 'uppercase', color: t.accent,
          }}>Editora · São Paulo</div>
          <h1 style={{
            margin: '10px 0 0', fontFamily: t.serif, fontSize: 64, lineHeight: 0.92,
            letterSpacing: '-0.035em', fontWeight: 400,
          }}>
            Marina<br/>
            <span style={{ fontStyle: 'italic', color: t.mid }}>Souza</span>
          </h1>
          <div style={{ marginTop: 10, fontSize: 13, color: t.mid }}>@marinasouza · 1,67m · M</div>
        </div>

        {/* Stats — masthead style */}
        <div style={{
          margin: '28px 24px 0', borderTop: `1px solid ${t.line}`, borderBottom: `1px solid ${t.line}`,
          padding: '20px 0', display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 8,
        }}>
          {[
            { k: 'Edições', v: '42' },
            { k: 'Caimento médio', v: '8,6' },
            { k: 'Arquivo', v: '14' },
          ].map((s, i) => (
            <div key={s.k} style={{ borderLeft: i > 0 ? `1px solid ${t.line}` : 'none', paddingLeft: i > 0 ? 14 : 0 }}>
              <div style={{ fontFamily: t.serif, fontSize: 40, letterSpacing: '-0.025em', lineHeight: 1 }}>{s.v}</div>
              <div style={{ marginTop: 6, fontFamily: t.mono, fontSize: 9, letterSpacing: '0.18em', textTransform: 'uppercase', color: t.mid }}>{s.k}</div>
            </div>
          ))}
        </div>

        {/* Plan card — magazine subscription style */}
        <div style={{ padding: '28px 24px 0' }}>
          <div style={{
            background: t.ink, color: t.bone, padding: '28px 24px',
            position: 'relative', overflow: 'hidden',
          }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline' }}>
              <div style={{ fontFamily: t.mono, fontSize: 10, letterSpacing: '0.22em', textTransform: 'uppercase', color: t.accent }}>
                Plano gratuito · 3 / 5 hoje
              </div>
            </div>
            <div style={{
              marginTop: 14, fontFamily: t.serif, fontSize: 38, lineHeight: 0.95,
              letterSpacing: '-0.025em',
            }}>
              Assine.<br/>
              <span style={{ fontStyle: 'italic', opacity: 0.75 }}>Edições sem limite.</span>
            </div>
            <div style={{
              marginTop: 18, paddingTop: 16, borderTop: `1px solid rgba(244,238,227,0.16)`,
              display: 'flex', justifyContent: 'space-between', alignItems: 'center',
            }}>
              <div>
                <div style={{ fontFamily: t.serif, fontSize: 26, letterSpacing: '-0.01em' }}>R$ 14,90</div>
                <div style={{ fontSize: 11, opacity: 0.65, marginTop: 2 }}>por mês · ou R$ 89,90/ano</div>
              </div>
              <div style={{ padding: '12px 18px', background: t.bone, color: t.ink, fontFamily: t.mono, fontSize: 10, letterSpacing: '0.18em', textTransform: 'uppercase' }}>
                Assinar →
              </div>
            </div>
          </div>
        </div>

        {/* Settings — magazine index */}
        <div style={{ padding: '32px 24px 0' }}>
          <div style={{ fontFamily: t.mono, fontSize: 10, letterSpacing: '0.22em', textTransform: 'uppercase', color: t.mid, marginBottom: 8 }}>
            Índice — conta
          </div>
          {[
            ['Foto de referência', 'Atualizada 12 mai'],
            ['Privacidade', 'Retenção opt-in desligada'],
            ['Notificações', 'Apenas resultados'],
            ['Idioma', 'Português (BR)'],
            ['Histórico', '42 edições'],
            ['Sair', null],
          ].map(([k, v], i) => (
            <div key={k} style={{
              borderTop: `1px solid ${t.line}`, padding: '14px 0',
              display: 'grid', gridTemplateColumns: '32px 1fr auto', gap: 12, alignItems: 'center',
            }}>
              <div style={{ fontFamily: t.mono, fontSize: 10, color: t.mid }}>{String(i+1).padStart(2,'0')}</div>
              <div>
                <div style={{ fontFamily: t.serif, fontSize: 18, fontStyle: 'italic' }}>{k}</div>
                {v && <div style={{ fontSize: 11, color: t.mid, marginTop: 2 }}>{v}</div>}
              </div>
              <div style={{ color: t.mid }}>→</div>
            </div>
          ))}
          <div style={{ borderTop: `1px solid ${t.line}` }}/>
        </div>

        <div style={{ height: 28 }}/>
      </div>

      <TabBar t={t} active="profile" />
    </Screen>
  );
}

window.HomeScreen = HomeScreen;
window.CaptureScreen = CaptureScreen;
window.ResultScreen = ResultScreen;
window.SavedScreen = SavedScreen;
window.ProfileScreen = ProfileScreen;
