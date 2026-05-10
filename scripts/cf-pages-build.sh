#!/usr/bin/env bash
set -euo pipefail

QUARTO_VERSION="${QUARTO_VERSION:-1.6.40}"
QUARTO_DIR="quarto-${QUARTO_VERSION}"
QUARTO_TGZ="quarto-${QUARTO_VERSION}-linux-amd64.tar.gz"
QUARTO_URL="https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/${QUARTO_TGZ}"

echo "Installing Quarto ${QUARTO_VERSION}"
curl -fsSL -o "${QUARTO_TGZ}" "${QUARTO_URL}"
tar -xzf "${QUARTO_TGZ}"
export PATH="${PWD}/${QUARTO_DIR}/bin:${PATH}"

quarto --version
quarto render blog
