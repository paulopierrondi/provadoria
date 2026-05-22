#!/bin/bash
echo "Abrindo App Store Connect nas 4 páginas necessárias..."
echo ""
echo "=== INSTRUÇÕES RÁPIDAS ==="
echo "1. Aba 'Pricing': Clique em 'Free' e salve"
echo "2. Aba 'App Privacy': Clique em 'Get Started' depois 'Publish'"
echo "3. Aba 'App Info': Scroll até 'Content Rights', selecione 'does not contain third-party content' e salve"
echo "4. Aba 'App Store': Clique em 'Add for Review'"
echo ""
open -na "Google Chrome" --args --new-window \
  "https://appstoreconnect.apple.com/apps/6770621817/appstore/pricing" \
  "https://appstoreconnect.apple.com/apps/6770621817/appstore/appprivacy" \
  "https://appstoreconnect.apple.com/apps/6770621817/appstore/appinfo" \
  "https://appstoreconnect.apple.com/apps/6770621817/appstore"
echo "Chrome aberto com 4 abas."
