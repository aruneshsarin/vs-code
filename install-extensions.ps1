# Install all extensions on Windows.
# Run from PowerShell:  .\install-extensions.ps1
# If you get an execution-policy error:
#   powershell -ExecutionPolicy Bypass -File .\install-extensions.ps1

$ErrorActionPreference = "Stop"

$codeBin = if ($env:CODE_BIN) { $env:CODE_BIN } else { "code" }

$extensions = @(
  # Theme & UI
  "Catppuccin.catppuccin-vsc",
  "Catppuccin.catppuccin-vsc-icons",
  "miguelsolorio.fluent-icons",

  # TypeScript / JS core
  "dbaeumer.vscode-eslint",
  "esbenp.prettier-vscode",
  "usernamehw.errorlens",
  "christian-kohler.path-intellisense",
  "christian-kohler.npm-intellisense",
  "yoavbls.pretty-ts-errors",
  "streetsidesoftware.code-spell-checker",

  # React / Next.js
  "dsznajder.es7-react-js-snippets",
  "formulahendry.auto-rename-tag",
  "bradlc.vscode-tailwindcss",

  # Angular
  "Angular.ng-template",
  "cyrilletuzi.angular-schematics",
  "johnpapa.Angular2",

  # Node backend
  "humao.rest-client",
  "mikestead.dotenv",

  # Git
  "eamodio.gitlens",
  "mhutchie.git-graph",

  # Python (light)
  "ms-python.python",
  "ms-python.vscode-pylance",
  "ms-python.black-formatter",
  "charliermarsh.ruff",

  # C (light)
  "ms-vscode.cpptools",

  # Productivity
  "vscodevim.vim",
  "aaron-bond.better-comments",
  "EditorConfig.EditorConfig",
  "oderwat.indent-rainbow",
  "gruntfuggly.todo-tree",

  # Docs / data
  "yzhang.markdown-all-in-one",
  "bierner.markdown-preview-github-styles",
  "redhat.vscode-yaml",
  "tamasfe.even-better-toml"
)

Write-Host "Installing $($extensions.Count) extensions via '$codeBin'..."
foreach ($ext in $extensions) {
  Write-Host "→ $ext"
  & $codeBin --install-extension $ext --force | Out-Null
}

Write-Host "✓ Done. Restart VS Code to make sure everything loads cleanly."
