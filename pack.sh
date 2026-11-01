#!/bin/sh
# builds system24.vsix (vsce produced empty archives here). keep Version in vsix/extension.vsixmanifest in sync with package.json
set -e
cd "$(dirname "$0")"
node build.mjs
rm -rf .pack system24.vsix && mkdir -p .pack/extension
cp vsix/extension.vsixmanifest "vsix/[Content_Types].xml" .pack/
cp -R package.json LICENSE.md themes .pack/extension/
(cd .pack && zip -q -r ../system24.vsix "[Content_Types].xml" extension.vsixmanifest extension)
rm -rf .pack
echo "packed system24.vsix"
