#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Building site for GitHub Pages..."
npm run build

echo ""
echo "Build completed successfully."
echo "Commit and push to the main branch to publish via GitHub Actions."
