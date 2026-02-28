#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR"

echo "[1/4] Estado actual"
git status --short --branch

echo "[2/4] Añadiendo cambios de Build"
git add -A Build

if git diff --cached --quiet; then
  echo "No hay cambios nuevos en Build para publicar."
  exit 0
fi

echo "[3/4] Commit de Build"
git commit -m "Update Build assets $(date +%Y-%m-%d_%H-%M-%S)"

echo "[4/4] Push a origin/main"
git push origin main

echo "Listo: Build publicado en GitHub."