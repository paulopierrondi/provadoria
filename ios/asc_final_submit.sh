#!/bin/bash
set -e

echo "============================================"
echo "  ProvadorIA — Final App Store Submit"
echo "============================================"
echo ""
echo "Este script vai:"
echo "  1. Logar no App Store Connect"
echo "  2. Publicar App Privacy"
echo "  3. Abrir browser para Pricing (1 clique)"
echo "  4. Submeter para review"
echo ""

# Step 1: App Privacy via fastlane
echo "📍 [1/3] Publicando App Privacy..."
echo "   (vai pedir senha do Apple ID + 2FA)"
cd "$(dirname "$0")"
fastlane set_app_privacy

# Step 2: Open browser for Pricing
echo ""
echo "📍 [2/3] Abrindo Pricing no browser..."
echo "   Clique em 'Free' e salve."
open "https://appstoreconnect.apple.com/apps/6770621817/appstore/pricing"

read -p "   Pressione ENTER depois de salvar o Pricing..."

# Step 3: Submit for review
echo ""
echo "📍 [3/3] Submetendo para review..."
fastlane submit_review

echo ""
echo "============================================"
echo "  ✅ Done!"
echo "============================================"
