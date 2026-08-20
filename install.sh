#!/bin/bash
# Assemble installer — downloads the latest Assemble.app into /Applications.
# curl downloads carry no quarantine flag, so the app opens with no warnings.
set -e
echo "Installing Assemble…"
TMP=$(mktemp -d)
URL=$(curl -fsSL https://raw.githubusercontent.com/tyler-bam-ai/assemble-app/main/latest.json | python3 -c "import json,sys;print(json.load(sys.stdin)['url'])")
curl -fsSL "$URL" -o "$TMP/assemble.zip"
ditto -x -k "$TMP/assemble.zip" "$TMP"
rm -rf /Applications/Assemble.app
mv "$TMP/Assemble.app" /Applications/
xattr -dr com.apple.quarantine /Applications/Assemble.app 2>/dev/null || true
rm -rf "$TMP"
echo "Done. Opening Assemble — allow camera & microphone when asked."
open /Applications/Assemble.app
