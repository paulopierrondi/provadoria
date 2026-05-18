# ProvadorIA — App Store Submission Checklist

> Última atualização: 2026-05-17
> Status: **PREPARE_FOR_SUBMISSION** (pronto para preencher dados restantes)

---

## ✅ COMPLETADO AUTOMATICAMENTE

| Item | Status | Detalhes |
|------|--------|----------|
| App Record | ✅ | Criado manualmente na ASC |
| Build Upload | ✅ | Build 1.0 (1) — VALID, uploaded 10:38 PT |
| Build Association | ✅ | Build vinculado à versão 1.0 via API |
| Metadata (pt-BR) | ✅ | Preenchido via API |
| Description | ✅ | "ProvadorIA é seu provador virtual com Inteligência Artificial..." |
| Keywords | ✅ | `tryon,provador,roupa,moda,ia,ai,fitting,virtual,comprar,look,shopping` |
| Marketing URL | ✅ | https://provadoria-landing.vercel.app |
| Promotional Text | ✅ | "Visualize como qualquer roupa ficaria em você com IA. Pare de se arrepender das compras!" |
| Support URL | ✅ | https://provadoria-landing.vercel.app |
| Category Primary | ✅ | Lifestyle |
| Category Secondary | ✅ | Shopping |

---

## 📝 PENDENTE — MANUAL NO APP STORE CONNECT

### 1. Screenshots (OBRIGATÓRIO)
- [ ] **6 screenshots** para iPhone 6.7" Display (1290×2796 px)
- [ ] Idioma: **Português (Brasil)**
- [ ] Telas sugeridas:
  1. Onboarding / Tela inicial
  2. Upload de foto da roupa
  3. Resultado do try-on virtual
  4. Feed da comunidade com reviews
  5. Tela de review detalhada
  6. Perfil / Compartilhamento

> 💡 **Dica:** Use o simulador iPhone 16 Pro Max (Simulator > Device > iPhone 16 Pro Max) e capture com Cmd+S. Depois converta para 1290×2796 se necessário.

### 2. App Privacy (OBRIGATÓRIO)
Acesse: App Store Connect → App → App Privacy

| Dado | Uso | Rastreamento |
|------|-----|-------------|
| User ID | App Functionality | Não |
| Photos | App Functionality | Não |
| Usage Data | Analytics | Não |

- [ ] Preencher formulário de privacidade
- [ ] Confirmar que NÃO rastreia usuários
- [ ] Publicar política de privacidade

### 3. Review Information (OBRIGATÓRIO)
Acesse: App Store Connect → App → App Review Information

- [ ] **Contact Information**
  - First Name: Paulo
  - Last Name: Pierrondi
  - Phone: +55 11 99999-9999 *(atualizar)*
  - Email: pierrondi@gmail.com
- [ ] **App Review Information**
  - Sign-in required? **Não** (autenticação anônima)
  - Demo account: **Não necessário**
  - Notes: "O app usa autenticação anônima. Não é necessário login. O usuário recebe um token JWT ao abrir o app pela primeira vez. Para exclusão de conta, vá em Perfil > Configurações > Excluir Conta. O try-on virtual usa IA generativa para simular o caimento de roupas."
- [ ] **Attachment**: Não necessário

### 4. App Review Details
- [ ] **Content Rights**: Não contém conteúdo de terceiros protegido
- [ ] **Advertising Identifier**: Não usa IDFA
- [ ] **Age Rating**: 4+ (conteúdo leve, moda)

---

## 🚀 SUBMISSÃO

Quando tudo estiver preenchido:

1. [ ] Verificar se todos os campos obrigatórios estão verdes
2. [ ] Clicar em **"Add for Review"**
3. [ ] Aguardar email de confirmação da Apple

### Timeline Estimada
- **Review da Apple**: 24–48h (geralmente)
- **Possível rejeição**: Placeholder text, crashes, account deletion não funcional
- **Após aprovação**: Pode ser lançado manualmente ou automaticamente

---

## 📎 REFERÊNCIAS

- **App Store Connect**: https://appstoreconnect.apple.com/apps/6770621817/appstore
- **Landing Page**: https://provadoria-landing.vercel.app
- **Backend**: https://api-production-c696.up.railway.app
- **Bundle ID**: `com.paulopierrondi.provadoria`
- **Team ID**: `8ULNGWJZ6B`
