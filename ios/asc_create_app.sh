#!/bin/bash
# Tenta criar o app no App Store Connect via API
# NOTA: A API key precisa ter permissão ADMIN para CREATE apps

set -e

TEAM_ID="8ULNGWJZ6B"
API_KEY_ID="95ULBVD2BW"
API_KEY_PATH="$HOME/Downloads/AuthKey_95ULBVD2BW.p8"
ISSUER_ID="$(cat $HOME/.asc_issuer_id 2>/dev/null || echo 'COLOQUE_ISSUER_ID_AQUI')"

if [ ! -f "$API_KEY_PATH" ]; then
    echo "❌ API Key não encontrada em $API_KEY_PATH"
    echo "Baixe em: https://appstoreconnect.apple.com/access/api"
    exit 1
fi

if [ "$ISSUER_ID" = "COLOQUE_ISSUER_ID_AQUI" ]; then
    echo "❌ ISSUER_ID não configurado"
    echo "Encontre em: App Store Connect > Users and Access > Keys > App Store Connect API"
    exit 1
fi

# Gera JWT token
JWT=$(python3 -c "
import jwt, time
headers = {'alg': 'ES256', 'kid': '$API_KEY_ID', 'typ': 'JWT'}
payload = {'iss': '$ISSUER_ID', 'iat': int(time.time()), 'exp': int(time.time()) + 1200, 'aud': 'appstoreconnect-v1'}
with open('$API_KEY_PATH', 'r') as f:
    key = f.read()
print(jwt.encode(payload, key, algorithm='ES256', headers=headers))
")

echo "🔑 JWT gerado. Tentando criar app..."

# Tenta criar o app
curl -s -X POST \
  https://api.appstoreconnect.apple.com/v1/apps \
  -H "Authorization: Bearer $JWT" \
  -H "Content-Type: application/json" \
  -d '{
    "data": {
      "type": "apps",
      "attributes": {
        "name": "ProvadorIA",
        "bundleId": "com.paulopierrondi.provadoria",
        "sku": "provadoria-2026",
        "primaryLocale": "pt-BR"
      }
    }
  }' | python3 -m json.tool

echo ""
echo "ℹ️ Se retornou FORBIDDEN_ERROR: a API key não tem permissão CREATE."
echo "   Crie manualmente em: https://appstoreconnect.apple.com/apps"
