# ProvadorIA — App Store Submission Checklist

## ✅ Pré-Submission (Antes de abrir o Xcode)

- [x] Backend deployado no Railway (online)
- [x] API endpoints testados e funcionando
- [x] E2E tests passando (12/12)
- [x] iOS UI Tests criados
- [x] Landing page no ar (Vercel)
- [x] App Icon (1024x1024) criado
- [x] App Store Connect app record criado manualmente
- [x] Bundle ID registrado: `com.paulopierrondi.provadoria`
- [x] Provisioning Profile gerado pelo Xcode

---

## 📸 Screenshots (Obrigatório — 6.7" Display)

### Required Screenshots (3 mínimo, 10 máximo)
| # | Tela | Descrição |
|---|------|-----------|
| 1 | Tela Inicial / Feed | Shows app in use with real data |
| 2 | Novo Try-On | Upload de foto da peça |
| 3 | Resultado | Try-on gerado com avaliação |
| 4 | Reviews | Reviews da comunidade com fotos |
| 5 | Comunidade | Feed de try-ons |
| 6 | Perfil | User profile com estatísticas |

### Specs
- **iPhone 15 Pro Max (6.7"):** 1290 x 2796 pixels
- **iPhone 14 Pro (6.1"):** 1179 x 2556 pixels
- **Formato:** PNG ou JPEG (sem alpha para JPEG)
- **Sem transparência**

### Dicas de Screenshot Profissional
- Use o app com dados reais do backend
- Horário do device: 9:41 AM (padrão Apple)
- Wi-Fi cheio, bateria 100%
- Sem notificações no topo
- Texto em português

---

## 🎬 App Preview Video (Opcional mas recomendado)

- [ ] Gravado em iPhone real (não simulador)
- [ ] 15-30 segundos
- [ ] Sem áudio (ou mudo se tiver)
- [ ] Resolução: 886 x 1920 (portrait)
- [ ] Formato: MOV, MP4, M4V
- [ ] Tamanho: < 500 MB
- [ ] Legendas em português

---

## 📝 Metadados no App Store Connect

### App Information
| Campo | Valor |
|-------|-------|
| Name | ProvadorIA: Try-On Virtual |
| Subtitle | Experimente com IA antes |
| Category (Primary) | Lifestyle |
| Category (Secondary) | Shopping |
| Content Rights | Não contém |
| Age Rating | 4+ |

### Pricing
| Campo | Valor |
|-------|-------|
| Price | Free |
| In-App Purchases | Sim (Pro R$19,90/mês) |

### Version Information
| Campo | Valor |
|-------|-------|
| Version Number | 1.0.0 |
| Build | 1 |
| Copyright | 2026 Paulo Pierrondi |
| Support URL | https://provadoria-landing.vercel.app |
| Marketing URL | https://provadoria-landing.vercel.app |
| Privacy Policy URL | https://provadoria-landing.vercel.app/privacy |

---

## 🔐 App Privacy (Required)

### Data Collection
| Data Type | Collected? | Linked to User? | Tracking? |
|-----------|-----------|-----------------|-----------|
| User ID (anonymous) | ✅ | ❌ | ❌ |
| Photos (optional, Pro) | ✅ | ❌ | ❌ |
| Usage Data | ✅ | ❌ | ❌ |
| Diagnostics | ✅ | ❌ | ❌ |

### Privacy Policy Text
```
ProvadorIA respeita sua privacidade.

• Usamos autenticação anônima (não coletamos nome, email ou telefone)
• Fotos são processadas em tempo real e não armazenadas permanentemente
• Você pode excluir sua conta e todos os dados a qualquer momento
• Não vendemos dados a terceiros
• Não usamos tracking para publicidade

Para mais informações: suporte@provadoria.app
```

---

## 🚀 Build & Upload

```bash
cd /Users/paulopierrondi/Downloads/provadoria/ios
./release.sh
```

### release.sh faz:
1. Limpa build anterior
2. Arquiva com Xcode (Release)
3. Valida com altool
4. Faz upload para App Store Connect
5. Envia metadados com Deliverfile

---

## ⏱️ Timeline de Review

| Etapa | Tempo |
|-------|-------|
| Upload do build | 10-30 min |
| Processamento do build | 15-60 min |
| Review da Apple | 24-48h (geralmente) |
| **Total estimado** | **1-3 dias** |

---

## 🚨 Rejeições Comuns & Prevenção

| Rejeição | Causa | Prevenção |
|----------|-------|-----------|
| Guideline 2.1 — Performance | App crasha | Testar em device real |
| Guideline 4.0 — Design | UI confusa | Seguir HIG da Apple |
| Guideline 5.1.1 — Privacy | Política incompleta | Preencher App Privacy corretamente |
| Guideline 2.3 — Accurate Metadata | Descrição enganosa | Ser honesto sobre o que o app faz |
| Guideline 3.1.1 — In-App Purchase | Pagamento fora da App Store | Usar StoreKit para subscriptions |

---

## 📞 Contatos de Suporte

- **Email:** suporte@provadoria.app
- **Landing Page:** https://provadoria-landing.vercel.app
- **Backend Status:** https://api-production-c696.up.railway.app/health
