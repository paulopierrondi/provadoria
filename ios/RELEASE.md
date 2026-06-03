# ProvadorIA — Release Script

## Pré-requisitos (execute uma vez)
1. Crie o app record manualmente em https://appstoreconnect.apple.com/apps
   - Bundle ID: `com.paulopierrondi.provadoria`
   - Nome: ProvadorIA
2. Abra o projeto no Xcode uma vez para que ele baixe os provisioning profiles:
   ```bash
   open ProvadorIA.xcodeproj
   ```
   - No Xcode, selecione o target → Signing & Capabilities → verifique se "Automatically manage signing" está marcado
   - Feche o Xcode

## Build & Upload Automático

### Opção A: Script Shell (recomendado)
```bash
cd /Users/paulopierrondi/Projects/provadoria/ios
./release.sh
```

### Opção B: Comandos Manuais
```bash
cd /Users/paulopierrondi/Projects/provadoria/ios

# 1. Archive
xcodebuild -project ProvadorIA.xcodeproj \
  -scheme ProvadorIA \
  -sdk iphoneos \
  -configuration Release \
  -allowProvisioningUpdates \
  archive -archivePath build/ProvadorIA.xcarchive

# 2. Export IPA
xcodebuild -exportArchive \
  -archivePath build/ProvadorIA.xcarchive \
  -exportPath build \
  -exportOptionsPlist exportOptions.plist

# 3. Upload para TestFlight
xcrun altool --upload-app \
  -f build/ProvadorIA.ipa \
  -t ios \
  --apiKey 95ULBVD2BW \
  --apiIssuer 20a81f12-b22c-4ff8-8b33-c1e5e411a24b
```

## Após Upload
1. Aguarde 10-30 minutos para processamento
2. Acesse https://appstoreconnect.apple.com/apps → ProvadorIA → TestFlight
3. Clique em "Manage" ao lado do build → "Add to Review"
4. Confirme export compliance (No)
5. Preencha os metadados (já estão em `fastlane/metadata/pt-BR/`)
6. Submeta para review
