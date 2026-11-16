#!/usr/bin/env bash
# Copyright (c) 2026 Prontera Labs (https://query.aegis-sentinel.id). MIT License.
# Install AegisQuery (Apple Silicon) from the latest GitHub release.
# Usage: curl -fsSL https://raw.githubusercontent.com/jimmyleonardo/aegis-query-releases/main/install.sh | bash
set -euo pipefail

REPO="jimmyleonardo/aegis-query-releases"
APP="AegisQuery.app"
DEST="/Applications"

if [ "$(uname -s)" != "Darwin" ]; then
  echo "AegisQuery is only available for macOS." >&2; exit 1
fi
if [ "$(uname -m)" != "arm64" ]; then
  echo "This build is for Apple Silicon (M1 and newer). Intel Macs are not supported yet." >&2; exit 1
fi

URL="https://github.com/${REPO}/releases/latest/download/AegisQuery.dmg"

TMP=$(mktemp -d)
MNT="${TMP}/mnt"
cleanup() { hdiutil detach "${MNT}" -quiet 2>/dev/null || true; rm -rf "${TMP}"; }
trap cleanup EXIT

echo "==> Downloading the latest AegisQuery..."
if ! curl -fL --progress-bar "${URL}" -o "${TMP}/AegisQuery.dmg"; then
  echo "Download failed: no AegisQuery.dmg in the latest release of ${REPO}." >&2; exit 1
fi

echo "==> Installing to ${DEST}..."
mkdir -p "${MNT}"
hdiutil attach "${TMP}/AegisQuery.dmg" -nobrowse -readonly -mountpoint "${MNT}" -quiet
if pgrep -xq aegisquery; then
  echo "  Quitting the running AegisQuery..."
  osascript -e 'quit app "AegisQuery"' 2>/dev/null || pkill -x aegisquery || true
  sleep 2
fi
SUDO=""
[ -w "${DEST}" ] || SUDO="sudo"
${SUDO} rm -rf "${DEST}/${APP}"
${SUDO} cp -R "${MNT}/${APP}" "${DEST}/"

echo "OK: AegisQuery installed at ${DEST}/${APP}"
open "${DEST}/${APP}"
