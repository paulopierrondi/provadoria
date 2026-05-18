// canvas.jsx — Composes everything into a DesignCanvas with Tweaks

const TWEAK_DEFAULTS = /*EDITMODE-BEGIN*/{
  "palette": "cherry",
  "typeface": "serif-instrument"
}/*EDITMODE-END*/;

// Palettes tuned to 2025–26 IG/TikTok fashion trends.
// Each one has a TINTED neutral base (not generic cream) + ONE saturated
// accent — so cherry feels cherry-coded, butter feels butter-coded, etc.
const PALETTES = {
  cherry: {
    label: 'Cherry · tomato red',
    bone: '#F8DCD0', paper: '#FCE7DC', ink: '#1A0E0A',
    mid: '#8C6A5C', line: 'rgba(26,14,10,0.14)',
    accent: '#E63923', accentDeep: '#9F1F12',
  },
  mocha: {
    label: 'Mocha · butter accent',
    bone: '#E2CDAA', paper: '#EFDEC0', ink: '#2E1F14',
    mid: '#8B7560', line: 'rgba(46,31,20,0.14)',
    accent: '#D89A2F', accentDeep: '#7E5311',
  },
  butter: {
    label: 'Butter · tomato accent',
    bone: '#F1DE8E', paper: '#F8E9A8', ink: '#1A140A',
    mid: '#7D6F4E', line: 'rgba(26,20,10,0.16)',
    accent: '#FF4A3D', accentDeep: '#A1241A',
  },
  pink: {
    label: 'Electric pink',
    bone: '#FBDADF', paper: '#FEE9EC', ink: '#1A0A10',
    mid: '#8A5A68', line: 'rgba(26,10,16,0.12)',
    accent: '#FF3D7F', accentDeep: '#B0184E',
  },
  lime: {
    label: 'Bottega lime',
    bone: '#E8E8B8', paper: '#F0EFC8', ink: '#141408',
    mid: '#6F7050', line: 'rgba(20,20,8,0.14)',
    accent: '#B7E635', accentDeep: '#5C7A12',
  },
  noir: {
    label: 'Noir · gold accent',
    bone: '#15120E', paper: '#1E1A15', ink: '#F2EBDE',
    mid: '#8A8278', line: 'rgba(242,235,222,0.14)',
    accent: '#C9925A', accentDeep: '#7E5311',
  },
};

const TYPEFACES = {
  'serif-instrument': { serif: '"Instrument Serif", "Times New Roman", serif', sans: '"Inter", -apple-system, system-ui, sans-serif', mono: '"JetBrains Mono", ui-monospace, monospace' },
  'serif-newsreader': { serif: '"Newsreader", Georgia, serif', sans: '"Inter Tight", -apple-system, system-ui, sans-serif', mono: '"JetBrains Mono", ui-monospace, monospace' },
};

function App() {
  const [tweaks, setTweak] = window.useTweaks(TWEAK_DEFAULTS);
  const palette = PALETTES[tweaks.palette] || PALETTES.bone;
  const type = TYPEFACES[tweaks.typeface] || TYPEFACES['serif-instrument'];
  const tokens = { ...palette, ...type };

  return (
    <>
      <Tweaks tokens={tokens} tweaks={tweaks} setTweak={setTweak} />
      <DesignCanvas>
        <DCSection id="foundations" title="01 — Foundations" subtitle="Paleta, tipografia, voz. A regra antes do desenho.">
          <DCArtboard id="fnd" label="Brand foundations" width={1200} height={760}>
            <Foundations tokens={tokens} />
          </DCArtboard>
        </DCSection>

        <DCSection id="landing" title="02 — Landing page" subtitle="provadoria.com.br — desktop, 1440px">
          <DCArtboard id="land-full" label="Full page" width={1440} height={4600}>
            <Landing tokens={tokens} />
          </DCArtboard>
        </DCSection>

        <DCSection id="app" title="03 — iOS app" subtitle="iPhone 16 Pro · 402×874 · 5 telas do fluxo principal">
          <DCArtboard id="app-home" label="Início" width={402} height={874}>
            <PhoneShell tokens={tokens}><HomeScreen t={tokens} /></PhoneShell>
          </DCArtboard>
          <DCArtboard id="app-capture" label="Capturar peça" width={402} height={874}>
            <PhoneShell tokens={tokens}><CaptureScreen t={tokens} /></PhoneShell>
          </DCArtboard>
          <DCArtboard id="app-result" label="Resultado" width={402} height={874}>
            <PhoneShell tokens={tokens}><ResultScreen t={tokens} /></PhoneShell>
          </DCArtboard>
          <DCArtboard id="app-saved" label="Salvos" width={402} height={874}>
            <PhoneShell tokens={tokens}><SavedScreen t={tokens} /></PhoneShell>
          </DCArtboard>
          <DCArtboard id="app-profile" label="Perfil" width={402} height={874}>
            <PhoneShell tokens={tokens}><ProfileScreen t={tokens} /></PhoneShell>
          </DCArtboard>
        </DCSection>
      </DesignCanvas>
    </>
  );
}

// Lightweight iPhone shell — keeps the screen inside an editorial-clean
// device frame without the iOS 26 starter's heavy bezel.
function PhoneShell({ children, tokens }) {
  return (
    <div style={{
      width: 402, height: 874, background: tokens.bone, position: 'relative',
      overflow: 'hidden', color: tokens.ink,
    }}>
      {/* Status bar */}
      <div style={{
        height: 54, padding: '18px 28px 0', display: 'flex',
        justifyContent: 'space-between', alignItems: 'center',
        fontFamily: '-apple-system, system-ui', fontSize: 17, fontWeight: 600,
        color: tokens.ink, position: 'relative', zIndex: 5,
      }}>
        <span>9:41</span>
        <div style={{
          position: 'absolute', left: '50%', top: 10, transform: 'translateX(-50%)',
          width: 124, height: 36, borderRadius: 18, background: '#000',
        }}/>
        <div style={{ display: 'flex', gap: 6, alignItems: 'center' }}>
          <svg width="18" height="11" viewBox="0 0 18 11">
            <rect x="0" y="7" width="3" height="4" rx=".5" fill={tokens.ink}/>
            <rect x="5" y="5" width="3" height="6" rx=".5" fill={tokens.ink}/>
            <rect x="10" y="3" width="3" height="8" rx=".5" fill={tokens.ink}/>
            <rect x="15" y="0" width="3" height="11" rx=".5" fill={tokens.ink}/>
          </svg>
          <svg width="24" height="12" viewBox="0 0 24 12">
            <rect x="0.5" y="0.5" width="21" height="11" rx="3" stroke={tokens.ink} strokeOpacity=".4" fill="none"/>
            <rect x="2" y="2" width="14" height="8" rx="1.5" fill={tokens.ink}/>
          </svg>
        </div>
      </div>
      <div style={{ position: 'absolute', inset: '54px 0 0', overflow: 'hidden' }}>
        {children}
      </div>
      {/* Home indicator */}
      <div style={{
        position: 'absolute', bottom: 8, left: '50%', transform: 'translateX(-50%)',
        width: 134, height: 5, borderRadius: 3, background: tokens.ink, opacity: 0.85,
      }}/>
    </div>
  );
}

/* ─────────────────────  TWEAKS PANEL  ───────────────────── */
function Tweaks({ tokens, tweaks, setTweak }) {
  return (
    <window.TweaksPanel title="Tweaks">
      <window.TweakSection label="Paleta">
        <window.TweakRadio
          label="Paleta"
          value={tweaks.palette}
          onChange={v => setTweak('palette', v)}
          options={Object.entries(PALETTES).map(([k, p]) => ({ value: k, label: p.label }))}
        />
      </window.TweakSection>
      <window.TweakSection label="Tipografia">
        <window.TweakRadio
          label="Display"
          value={tweaks.typeface}
          onChange={v => setTweak('typeface', v)}
          options={[
            { value: 'serif-instrument', label: 'Instrument' },
            { value: 'serif-newsreader', label: 'Newsreader' },
          ]}
        />
      </window.TweakSection>
    </window.TweaksPanel>
  );
}

ReactDOM.createRoot(document.getElementById('root')).render(<App />);
