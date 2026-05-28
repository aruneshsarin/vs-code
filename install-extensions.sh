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
  "christian-kohler.path-intellisense"
  "christian-kohler.npm-intellisense"
  "yoavbls.pretty-ts-errors"
  "streetsidesoftware.code-spell-checker"

  # React / Next.js
  "dsznajder.es7-react-js-snippets"
  "formulahendry.auto-rename-tag"
  "bradlc.vscode-tailwindcss"

  # Angular
  "Angular.ng-template"
  "cyrilletuzi.angular-schematics"
  "johnpapa.Angular2"

  # Node backend
  "humao.rest-client"
  "mikestead.dotenv"

  # Git
  "eamodio.gitlens"
  "mhutchie.git-graph"

  # Python (light)
  "ms-python.python"
  "ms-python.vscode-pylance"
  "ms-python.black-formatter"
  "charliermarsh.ruff"

  # C (light)
  "ms-vscode.cpptools"

  # Productivity
  "vscodevim.vim"
  "aaron-bond.better-comments"
  "EditorConfig.EditorConfig"
  "oderwat.indent-rainbow"
  "gruntfuggly.todo-tree"

  # Docs / data
  "yzhang.markdown-all-in-one"
  "bierner.markdown-preview-github-styles"
  "redhat.vscode-yaml"
  "tamasfe.even-better-toml"
)

echo "Installing ${#EXTENSIONS[@]} extensions via '$CODE_BIN'..."
for ext in "${EXTENSIONS[@]}"; do
  echo "→ $ext"
  "$CODE_BIN" --install-extension "$ext" --force >/dev/null
done

echo "✓ Done. Restart VS Code to make sure everything loads cleanly."
