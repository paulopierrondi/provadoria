# ProvadorIA — Passos Finais App Store Connect

> **Data:** 2026-05-22  
> **Build:** 1.0 (5)  
> **App ID:** 6770621817  
> **Estado:** Quase pronto para submissão! 🚀

---

## ✅ O que já está pronto (automação concluiu)

- [x] Build 5 enviado ao TestFlight
- [x] Screenshots iPhone + iPad uploadados
- [x] Metadata preenchida (descrição, keywords, URL suporte, etc.)
- [x] Content Rights resolvido via API
- [x] Categorias: Lifestyle + Shopping
- [x] Age Rating: 4+
- [x] Build 5 associado à versão 1.0

---

## ⚠️ O que precisa ser feito manualmente (3 passos)

O App Store Connect bloqueia automação browser em botões críticos.  
O Safari já está logado na sua conta. Siga os passos abaixo:

---

### Passo 1: Cancelar os 5 rascunhos pendentes

1. No Safari (já aberto), você está na página:  
   `App Store Connect > ProvadorIA > App para iOS Versão 1.0`

2. Role até o final da página

3. Clique em **"Rascunhos de envios (5)"**

4. Você verá 5 rascunhos listados. Clique em cada um e clique **"Cancelar"** (ou ícone de lixeira)

   > 💡 **Por que cancelar:** A Apple limita a 1 submission ativa por vez. Os 5 rascunhos anteriores estão bloqueando nova submissão.

---

### Passo 2: Verificar Pricing e App Privacy

#### Pricing (Preços)
1. No menu lateral, clique em **"Preços e disponibilidade"**
2. Se aparecer **"Configure um preço inicial"**, clique em **"Adicionar preços"**
3. Selecione **"Free"** (Gratuito)
4. Clique em **"Salvar"**

> Se já mostrar uma tabela de preços configurada, pule este passo.

#### App Privacy (Privacidade do app)
1. No menu lateral, clique em **"Privacidade do app"**
2. Se aparecer **"Get Started"** ou **"Começar"**, clique nele
3. Responda às perguntas (para o ProvadorIA):
   - **Dados de contato:** Não coletamos
   - **Fotos/Vídeos:** Sim, para funcionalidade do app (try-on virtual)
   - **Dados de uso:** Não coletamos
   - **Dados de diagnóstico:** Não coletamos
4. Clique em **"Publicar"** ou **"Publish"**

> Se já mostrar "Publicado" ou "Published", pule este passo.

---

### Passo 3: Enviar para revisão 🎉

1. Volte para a página principal: **"App para iOS Versão 1.0"**
   - Ou clique em **"Geral"** no menu lateral

2. No topo da página, clique no botão **"Adicionar para revisão"**

3. Se aparecer um modal de confirmação:
   - Marque as checkboxes de compliance (export, content rights, IDFA)
   - Clique em **"Submeter"** / **"Submit"**

4. **Pronto!** O ProvadorIA foi enviado para revisão da Apple! 🎉

---

## 📋 Checklist pós-submissão

- [ ] App aparece como **"Waiting for Review"** no App Store Connect
- [ ] Email de confirmação recebido em pierrondi@gmail.com
- [ ] Status no dashboard: amarelo/orange "Waiting for Review"

---

## 🆘 Se aparecer erro ao submeter

Se o botão "Adicionar para revisão" estiver cinza ou aparecer mensagem de erro, verifique:

1. **Build associado:** A seção "Compilação" mostra Build 5 (1.0)?
2. **Screenshots:** iPhone tem pelo menos 1 screenshot? iPad tem screenshots?
3. **URL de suporte:** Está preenchida (provadoria-landing.vercel.app)?
4. **Texto promocional + Descrição:** Estão preenchidos?
5. **Informações para revisão:** Seção "Informações para a equipe de revisão" — adicione notas se necessário:
   > "O app usa IA para virtual try-on de roupas. Não requer login."

---

## 📞 Contato

Se travar em algum passo, me avise com:
- Screenshot da tela
- URL atual do Safari
- Mensagem de erro (se houver)
