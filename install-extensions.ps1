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
  "yoavbls.pretty-ts-errors",
  "christian-kohler.path-intellisense",
  "christian-kohler.npm-intellisense",
  "streetsidesoftware.code-spell-checker",

  # Testing
  "vitest.explorer",

  # Node backend
  "humao.rest-client",
  "mikestead.dotenv",

  # Git
  "eamodio.gitlens",
  "mhutchie.git-graph",

  # Python
  "ms-python.python",
  "ms-python.vscode-pylance",
  "ms-python.black-formatter",
  "charliermarsh.ruff",

  # C
  "ms-vscode.cpptools",

  # Quality of life
  "vscodevim.vim",
  "EditorConfig.EditorConfig",
  "gruntfuggly.todo-tree",
  "aaron-bond.better-comments",

  # Docs / data
  "yzhang.markdown-all-in-one",
  "redhat.vscode-yaml"
)

Write-Host "Installing $($extensions.Count) extensions via '$codeBin'..."
foreach ($ext in $extensions) {
  Write-Host "→ $ext"
  & $codeBin --install-extension $ext --force | Out-Null
}

Write-Host "✓ Done. Restart VS Code to make sure everything loads cleanly."
