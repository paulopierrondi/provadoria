#!/bin/bash
set -e

echo "🚀 ProvadorIA Release Script"
echo "============================"

# Config
SCHEME="ProvadorIA"
PROJECT="ProvadorIA.xcodeproj"
BUNDLE_ID="com.paulopierrondi.provadoria"
PROFILE_NAME="ProvadorIA App Store"
TEAM_ID="8ULNGWJZ6B"
API_KEY_ID="95ULBVD2BW"
API_ISSUER="20a81f12-b22c-4ff8-8b33-c1e5e411a24b"
API_KEY_PATH="$HOME/.appstoreconnect/private_keys/AuthKey_${API_KEY_ID}.p8"

cd "$(dirname "$0")"

if [ ! -f "$API_KEY_PATH" ]; then
  echo "❌ App Store Connect API key not found at $API_KEY_PATH"
  exit 1
fi

# Clean
rm -rf build/*.ipa build/*.xcarchive

# Archive
echo "📦 Archiving..."
xcodebuild -project "$PROJECT" \
  -scheme "$SCHEME" \
  -sdk iphoneos \
  -destination "generic/platform=iOS" \
  -configuration Release \
  CODE_SIGN_STYLE=Manual \
  DEVELOPMENT_TEAM="$TEAM_ID" \
  PRODUCT_BUNDLE_IDENTIFIER="$BUNDLE_ID" \
  CODE_SIGN_IDENTITY="Apple Distribution" \
  PROVISIONING_PROFILE_SPECIFIER="$PROFILE_NAME" \
  archive -archivePath "build/${SCHEME}.xcarchive"

# Export
echo "📤 Exporting IPA..."
xcodebuild -exportArchive \
  -archivePath "build/${SCHEME}.xcarchive" \
  -exportPath build \
  -exportOptionsPlist exportOptions.plist

# Upload
echo "☁️ Uploading to TestFlight..."
xcrun altool --upload-app \
  -f "build/${SCHEME}.ipa" \
  -t ios \
  --apiKey "$API_KEY_ID" \
  --apiIssuer "$API_ISSUER"

echo "✅ Done! Check App Store Connect in 10-30 minutes."
