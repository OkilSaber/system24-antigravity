#!/bin/sh
# builds system24.vsix (vsce produced empty archives here). version and publisher come from package.json
set -e
cd "$(dirname "$0")"
node build.mjs
rm -rf .pack system24.vsix && mkdir -p .pack/extension
v=$(node -p "require('./package.json').version"); pub=$(node -p "require('./package.json').publisher")
sed -e "s/__VERSION__/$v/" -e "s/__PUBLISHER__/$pub/" vsix/extension.vsixmanifest > .pack/extension.vsixmanifest
cp "vsix/[Content_Types].xml" .pack/
cp -R package.json README.md LICENSE.md icon.png themes .pack/extension/
# -X -D: no extra fields (uid/gid, timestamps) or directory entries, open vsx rejects them
(cd .pack && zip -q -r -X -D ../system24.vsix "[Content_Types].xml" extension.vsixmanifest extension)
rm -rf .pack
echo "packed system24.vsix ($pub.system24 $v)"
