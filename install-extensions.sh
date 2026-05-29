#!/usr/bin/env bash
# Install all extensions. Run: bash install-extensions.sh
# Works wherever `code` is on PATH. For VSCodium, replace `code` with `codium`.

set -euo pipefail

CODE_BIN="${CODE_BIN:-code}"

EXTENSIONS=(
  # Theme & UI
  "Catppuccin.catppuccin-vsc"
  "Catppuccin.catppuccin-vsc-icons"
  "miguelsolorio.fluent-icons"

  # TypeScript / JS core
  "dbaeumer.vscode-eslint"
  "esbenp.prettier-vscode"
  "usernamehw.errorlens"
  "yoavbls.pretty-ts-errors"
  "christian-kohler.path-intellisense"
  "christian-kohler.npm-intellisense"
  "streetsidesoftware.code-spell-checker"

  # Testing
  "vitest.explorer"

  # Node backend
  "humao.rest-client"
  "mikestead.dotenv"

  # Git
  "eamodio.gitlens"
  "mhutchie.git-graph"

  # Python
  "ms-python.python"
  "ms-python.vscode-pylance"
  "ms-python.black-formatter"
  "charliermarsh.ruff"

  # C
  "ms-vscode.cpptools"

  # Quality of life
  "vscodevim.vim"
  "EditorConfig.EditorConfig"
  "gruntfuggly.todo-tree"
  "aaron-bond.better-comments"

  # Docs / data
  "yzhang.markdown-all-in-one"
  "redhat.vscode-yaml"
)

echo "Installing ${#EXTENSIONS[@]} extensions via '$CODE_BIN'..."
for ext in "${EXTENSIONS[@]}"; do
  echo "→ $ext"
  "$CODE_BIN" --install-extension "$ext" --force >/dev/null
done

echo "✓ Done. Restart VS Code to make sure everything loads cleanly."
