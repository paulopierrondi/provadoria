#!/bin/bash
set -e

echo "🚀 ProvadorIA Release Script"
echo "============================"

# Config
SCHEME="ProvadorIA"
PROJECT="ProvadorIA.xcodeproj"
API_KEY_ID="95ULBVD2BW"
API_ISSUER="20a81f12-b22c-4ff8-8b33-c1e5e411a24b"
API_KEY_PATH="/Users/paulopierrondi/Downloads/AuthKey_${API_KEY_ID}.p8"

cd "$(dirname "$0")"

# Clean
rm -rf build/*.ipa build/*.xcarchive

# Archive
echo "📦 Archiving..."
xcodebuild -project "$PROJECT" \
  -scheme "$SCHEME" \
  -sdk iphoneos \
  -configuration Release \
  -allowProvisioningUpdates \
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
