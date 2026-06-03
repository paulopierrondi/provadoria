# App Store Connect — Setup Manual (ProvadorIA)

> ⚠️ A API key não tem permissão `CREATE` para apps. Esse passo precisa ser feito manualmente no browser.

---

## Passo 1: Criar o App Record

1. Acesse: https://appstoreconnect.apple.com/apps
2. Clique no botão **"+"** (Add App)
3. Preencha:

| Campo | Valor |
|---|---|
| **Platform** | iOS |
| **Name** | ProvadorIA |
| **Primary Language** | Portuguese (Brazil) |
| **Bundle ID** | `com.paulopierrondi.provadoria` |
| **SKU** | `provadoria-2026` |
| **User Access** | Full Access |

4. Clique **Create**

---

## Passo 2: Preencher App Information

Na sidebar, clique em **App Information**:

| Campo | Valor |
|---|---|
| **Subtitle** | Experimente roupas com IA |
| **Category (Primary)** | Lifestyle |
| **Category (Secondary)** | Shopping |
| **Content Rights** | Não contém conteúdo de terceiros |
| **Age Rating** | 4+ |

---

## Passo 3: Pricing and Availability

| Campo | Valor |
|---|---|
| **Price** | Free |
| **Availability** | Brazil (inicialmente) |

---

## Passo 4: Preparar para Upload (feito via Fastlane)

Após criar o app record, volte ao terminal e rode:

```bash
cd /Users/paulopierrondi/Projects/provadoria/ios
./release.sh
```

O script vai:
1. Arquivar o app com Xcode
2. Fazer upload para o App Store Connect via `altool`
3. Enviar metadados via Deliverfile

---

## Bundle ID Checklist

- [ ] `com.paulopierrondi.provadoria` registrado no App Store Connect
- [ ] Provisioning profile gerado automaticamente pelo Xcode
- [ ] App record criado com SKU `provadoria-2026`
