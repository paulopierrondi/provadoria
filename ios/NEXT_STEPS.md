# ProvadorIA — Próximos Passos para App Store

## ✅ O que foi feito
- [x] Backend FastAPI com PostgreSQL/SQLAlchemy + JWT auth + account deletion
- [x] Backend deployado no Railway (`api-production-c696.up.railway.app`)
- [x] iOS app conectado ao backend real (APIService com JWT anônimo)
- [x] ProfileView com fluxo de exclusão de conta (Guideline 5.1.1v)
- [x] Info.plist com ITSAppUsesNonExemptEncryption=false
- [x] Build de debug no simulator: **SUCESSO**
- [x] Erros de build corrigidos (UserStats ambiguity, Review init, TryOnView stroke)

## ⏳ O que falta fazer (manual no Xcode/ASC)

### 1. Criar App Record no App Store Connect
- Acesse https://appstoreconnect.apple.com/apps
- Clique em **+** → **New App**
  - **Platform**: iOS
  - **Name**: ProvadorIA
  - **Primary Language**: Portuguese (Brazil)
  - **Bundle ID**: `com.paulopierrondi.provadoria`
  - **SKU**: provadoria-2024
  - **User Access**: Full Access

### 2. Configurar Signing no Xcode
- Abra `ios/ProvadorIA.xcodeproj` no Xcode
- Selecione o target **ProvadorIA** → tab **Signing & Capabilities**
- Em **Team**, selecione `PAULO HENRIQUE CARNEIRO PIERRONDI (8ULNGWJZ6B)`
- Em **Bundle Identifier**, verifique: `com.paulopierrondi.provadoria`
- Marque **Automatically manage signing**
- O Xcode vai criar o provisioning profile automaticamente

### 3. Build e Upload para TestFlight
- No Xcode, selecione **Any iOS Device (arm64)**
- Product → Archive
- Quando o Organizer abrir, clique em **Distribute App** → **App Store Connect** → **Upload**
- Siga os passos; quando chegar em "Export compliance", marque **No** (já está no Info.plist)

### 4. Preencher Metadados no ASC
- Acesse o app → **App Store** tab
- Preencha:
  - **Description** (pt-BR): veja `app-store-assets/metadata.md`
  - **Keywords**, **Support URL**, **Marketing URL**
  - **Screenshots**: iPhone 6.7" e 6.5"
  - **App Preview** (opcional)
- Em **Pricing and Availability**: Gratuito, Brasil
- Em **App Privacy**: Gere a política no https://app-privacy-policy-generator.firebaseapp.com/

### 5. Submeter para Review
- Após o upload processar (~10-30 min), vá em **TestFlight** → clique em **Manage** ao lado do build → **Add to Review**
- Confirme que não usa criptografia não isenta (já configurado)
- Clique em **Submit for Review**

## 🔧 Configuração do Backend (Railway)
Adicione as seguintes env vars no painel do Railway para o projeto ProvadorIA:
```
APP_ENV=production
JWT_SECRET=<gerar uma chave forte, ex: openssl rand -hex 32>
GEMINI_API_KEY=<sua chave do Gemini>
DATABASE_URL=<deixar vazio para usar SQLite fallback, ou configurar PostgreSQL addon>
```

## 📱 Bundle ID
`com.paulopierrondi.provadoria`
