#!/bin/bash

# Build site with correct commit hash
sed -i "s/^commit = \"\"/commit = \"$(git rev-parse --short HEAD)\"/" zola.toml
zola build
mv public/version/index.html public/version.json
rm -r public/version/
git restore zola.toml

# Upload to server
ssh connorcode@connorslade.com "rm -rf /mnt/block/static/mslicer.com/*"
scp -r public/* connorcode@connorslade.com:/mnt/block/static/mslicer.com/
