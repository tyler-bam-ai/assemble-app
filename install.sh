#!/bin/bash
# Beam installer — downloads the latest Beam.app into /Applications.
# curl downloads carry no quarantine flag, so the app opens with no warnings.
set -e
echo "Installing Beam…"
TMP=$(mktemp -d)
URL=$(curl -fsSL https://raw.githubusercontent.com/tyler-bam-ai/beam-app/main/latest.json | python3 -c "import json,sys;print(json.load(sys.stdin)['url'])")
curl -fsSL "$URL" -o "$TMP/beam.zip"
ditto -x -k "$TMP/beam.zip" "$TMP"
rm -rf /Applications/Beam.app
mv "$TMP/Beam.app" /Applications/
xattr -dr com.apple.quarantine /Applications/Beam.app 2>/dev/null || true
rm -rf "$TMP"
echo "Done. Opening Beam — allow camera & microphone when asked."
open /Applications/Beam.app
