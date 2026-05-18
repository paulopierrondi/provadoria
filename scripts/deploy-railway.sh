#!/bin/bash
set -e

# Deploy ProvadorIA backend to Railway
# Requer: railway CLI instalado e autenticado
# Instalar: npm install -g @railway/cli

PROJECT_ID="83a77148-cc64-41a8-9380-a25da70cb01e"

echo "=== ProvadorIA Railway Deploy ==="
echo "Project ID: $PROJECT_ID"

# Link project
railway link --project "$PROJECT_ID"

# Provision PostgreSQL (se ainda nao existir)
echo "Verifique se o PostgreSQL esta provisionado no Railway dashboard."
echo "Se nao estiver, adicione um database PostgreSQL ao projeto."

# Deploy backend
cd backend
railway up

echo "=== Deploy iniciado ==="
echo "Acompanhe em: https://railway.app/project/$PROJECT_ID"
