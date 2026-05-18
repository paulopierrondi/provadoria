#!/bin/bash
# Script para associar build e preencher metadados no App Store Connect
# NOTA: Screenshots e Review Information precisam ser feitos manualmente no web UI

set -e

ISSUER_ID="20a81f12-b22c-4ff8-8b33-c1e5e411a24b"
KEY_ID="95ULBVD2BW"
KEY_PATH="$HOME/Downloads/AuthKey_95ULBVD2BW.p8"
APP_ID="6770621817"
VERSION_ID="e6a257f7-08d8-4dfe-aa83-1813a1c5f65c"
LOCALIZATION_ID="ba8075a3-2b3a-4ec6-9e1f-2c40bbe4dfaf"
BUILD_ID="201543d7-ddb2-4a88-bdc7-8c5aaeffaae6"

echo "🚀 ProvadorIA — App Store Submission Script"
echo "============================================"

# Gerar JWT
JWT=$(python3 -c "
import jwt, time
with open('$KEY_PATH', 'r') as f:
    key = f.read()
headers = {'alg': 'ES256', 'kid': '$KEY_ID', 'typ': 'JWT'}
payload = {'iss': '$ISSUER_ID', 'iat': int(time.time()), 'exp': int(time.time()) + 1200, 'aud': 'appstoreconnect-v1'}
print(jwt.encode(payload, key, algorithm='ES256', headers=headers))
")

echo ""
echo "📋 CHECKLIST DE SUBMISSÃO:"
echo "--------------------------"

# 1. Associar build à versão
echo ""
echo "1️⃣  Associando build à versão..."
curl -s -X PATCH \
  -H "Authorization: Bearer $JWT" \
  -H "Content-Type: application/json" \
  "https://api.appstoreconnect.apple.com/v1/appStoreVersions/$VERSION_ID/relationships/build" \
  -d "{
    \"data\": {
      \"type\": \"builds\",
      \"id\": \"$BUILD_ID\"
    }
  }" | python3 -m json.tool 2>/dev/null || echo "   ⚠️  Pode precisar fazer manualmente no web UI"

# 2. Atualizar localização (metadados)
echo ""
echo "2️⃣  Preenchendo metadados em pt-BR..."
curl -s -X PATCH \
  -H "Authorization: Bearer $JWT" \
  -H "Content-Type: application/json" \
  "https://api.appstoreconnect.apple.com/v1/appStoreVersionLocalizations/$LOCALIZATION_ID" \
  -d '{
    "data": {
      "type": "appStoreVersionLocalizations",
      "id": "'"$LOCALIZATION_ID"'",
      "attributes": {
        "description": "ProvadorIA é seu provador virtual com Inteligência Artificial. Visualize como qualquer roupa ficaria em você antes de comprar. Envie a foto da peça e receba um try-on realista em segundos, com análise de caimento e dicas de estilo. Leia reviews com fotos reais da comunidade e compre com confiança!",
        "keywords": "tryon,provador,roupa,moda,ia,ai,fitting,virtual,comprar,look,shopping",
        "marketingUrl": "https://provadoria-landing.vercel.app",
        "promotionalText": "Visualize como qualquer roupa ficaria em você com IA. Pare de se arrepender das compras! 🛍️",
        "supportUrl": "https://provadoria-landing.vercel.app",
        "whatsNew": "• Try-On virtual com IA generativa\n• Análise de caimento e dicas\n• Reviews detalhadas da comunidade\n• Feed social para descobrir peças\n• Suporte a exclusão de conta"
      }
    }
  }' | python3 -m json.tool 2>/dev/null || echo "   ⚠️  Pode precisar fazer manualmente no web UI"

# 3. Verificar status
echo ""
echo "3️⃣  Verificando status do app..."
curl -s -H "Authorization: Bearer $JWT" \
  "https://api.appstoreconnect.apple.com/v1/appStoreVersions/$VERSION_ID" | python3 -c "
import json, sys
data = json.load(sys.stdin)
state = data['data']['attributes']['appStoreState']
print(f'   Status: {state}')
if state == 'PREPARE_FOR_SUBMISSION':
    print('   ✅ Pronto para preencher dados restantes e submeter')
"

echo ""
echo "============================================"
echo "✅ Metadados preenchidos via API!"
echo ""
echo "📸 PRÓXIMOS PASSOS MANUAIS:"
echo "   1. Acesse: https://appstoreconnect.apple.com/apps/$APP_ID/appstore"
echo "   2. Faça upload dos screenshots (6 telas, 1290x2796px)"
echo "   3. Preencha App Privacy (dados coletados)"
echo "   4. Preencha Review Information (contato, demo account)"
echo "   5. Clique em 'Add for Review'"
echo ""
echo "⏱️  Review da Apple: 24-48h"
