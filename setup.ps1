# ─────────────────────────────────────────────────────────────────────────
#  VS Code one-shot setup (Windows)
#
#  Run from inside this folder:
#      .\setup.ps1
#  If PowerShell blocks it:
#      powershell -ExecutionPolicy Bypass -File .\setup.ps1
#
#  Does three things:
#    1. Installs the 15 extensions
#    2. Copies settings.json + keybindings.json into %APPDATA%\Code\User
#       (backing up anything already there)
#    3. Installs Fira Code + FiraCode Nerd Font (current user)
#
#  The ONE thing it can't do — Settings Sync — needs an interactive login.
#  Instructions for that are printed at the end.
#
#  Switches:
#    -SkipFonts        don't touch fonts
#    -SkipConfig       don't copy settings/keybindings
#    -SkipExtensions   don't install extensions
#  Env:
#    $env:CODE_BIN="codium"   use VSCodium instead of `code`
# ─────────────────────────────────────────────────────────────────────────

param(
  [switch]$SkipFonts,
  [switch]$SkipConfig,
  [switch]$SkipExtensions
)

$ErrorActionPreference = "Stop"

$codeBin   = if ($env:CODE_BIN) { $env:CODE_BIN } else { "code" }
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$userDir   = Join-Path $env:APPDATA "Code\User"
$fontDir   = Join-Path $env:LOCALAPPDATA "Microsoft\Windows\Fonts"

function Step($msg) { Write-Host "`n== $msg ==" -ForegroundColor Cyan }
function Ok($msg)   { Write-Host $msg -ForegroundColor Green }

# ── 1. Extensions ───────────────────────────────────────────────────────
$extensions = @(
  "Catppuccin.catppuccin-vsc",
  "Catppuccin.catppuccin-vsc-icons",
  "dbaeumer.vscode-eslint",
  "esbenp.prettier-vscode",
  "usernamehw.errorlens",
  "yoavbls.pretty-ts-errors",
  "streetsidesoftware.code-spell-checker",
  "vitest.explorer",
  "eamodio.gitlens",
  "mhutchie.git-graph",
  "vscodevim.vim",
  "EditorConfig.EditorConfig",
  "aaron-bond.better-comments",
  "yzhang.markdown-all-in-one",
  "redhat.vscode-yaml"
)

if (-not $SkipExtensions) {
  if (-not (Get-Command $codeBin -ErrorAction SilentlyContinue)) {
    Write-Error "'$codeBin' not found on PATH. Reinstall VS Code with the 'Add to PATH' box checked, then re-run."
    exit 1
  }
  Step "Installing $($extensions.Count) extensions via '$codeBin'"
  foreach ($ext in $extensions) {
    Write-Host "  -> $ext"
    & $codeBin --install-extension $ext --force | Out-Null
  }
  Ok "OK Extensions done."
} else {
  Write-Host "(skipping extensions)"
}

# ── 2. Config files (with backup) ───────────────────────────────────────
if (-not $SkipConfig) {
  Step "Copying settings.json + keybindings.json"
  New-Item -ItemType Directory -Force -Path $userDir | Out-Null
  $stamp = Get-Date -Format "yyyyMMdd-HHmmss"
  foreach ($f in @("settings.json", "keybindings.json")) {
    $src = Join-Path $scriptDir $f
    $dst = Join-Path $userDir $f
    if (-not (Test-Path $src)) {
      Write-Warning "  $f not found next to this script - skipping"
      continue
    }
    if (Test-Path $dst) {
      $backup = "$dst.backup-$stamp"
      Copy-Item $dst $backup
      Write-Host "  backed up existing $f -> $(Split-Path -Leaf $backup)" -ForegroundColor DarkGray
    }
    Copy-Item $src $dst -Force
    Write-Host "  -> $dst"
  }
  Ok "OK Config copied to: $userDir"
} else {
  Write-Host "(skipping config copy)"
}

# ── 3. Fonts ────────────────────────────────────────────────────────────
# Pulls the latest release asset from each GitHub repo (no version pinning).
# Installs for the current user (no admin needed) and registers in the
# per-user Fonts registry key.
function Install-FontZip {
  param([string]$Repo, [string]$Filter)
  $api = "https://api.github.com/repos/$Repo/releases/latest"
  try {
    $rel = Invoke-RestMethod -Uri $api -Headers @{ "User-Agent" = "vscode-setup" }
  } catch {
    Write-Warning "  Couldn't reach GitHub for $Repo - install this font manually."
    return
  }
  $asset = $rel.assets | Where-Object { $_.name -match $Filter } | Select-Object -First 1
  if (-not $asset) {
    Write-Warning "  No matching asset in $Repo - install this font manually."
    return
  }
  $tmp = Join-Path $env:TEMP ("font-" + [guid]::NewGuid())
  New-Item -ItemType Directory -Force -Path $tmp | Out-Null
  $zip = Join-Path $tmp "font.zip"
  Write-Host "  v $($asset.name)"
  Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $zip -Headers @{ "User-Agent" = "vscode-setup" }
  Expand-Archive -Path $zip -DestinationPath "$tmp\extracted" -Force

  $shell = New-Object -ComObject Shell.Application
  $fontsFolder = $shell.Namespace(0x14)  # virtual Fonts folder
  Get-ChildItem -Path "$tmp\extracted" -Recurse -Include *.ttf, *.otf | ForEach-Object {
    $target = Join-Path $fontDir $_.Name
    if (-not (Test-Path $target)) {
      Copy-Item $_.FullName $target -Force
      $name = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
      $regPath = "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
      New-ItemProperty -Path $regPath -Name "$name (TrueType)" -Value $_.Name -PropertyType String -Force | Out-Null
    }
  }
  Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue
}

if (-not $SkipFonts) {
  Step "Installing fonts (Fira Code + FiraCode Nerd Font)"
  New-Item -ItemType Directory -Force -Path $fontDir | Out-Null
  Install-FontZip -Repo "tonsky/FiraCode"      -Filter 'Fira_Code_v.*\.zip'
  Install-FontZip -Repo "ryanoasis/nerd-fonts" -Filter '^FiraCode\.zip$'
  Ok "OK Fonts installed for current user."
  Write-Host "  (You may need to restart apps for new fonts to appear.)"
} else {
  Write-Host "(skipping fonts)"
}

# ── 4. The manual bit: Settings Sync ────────────────────────────────────
Step "One manual step left: Settings Sync"
@"
  Settings Sync can't be scripted (it needs an interactive GitHub/Microsoft
  login inside VS Code). To turn it on:

    1. Restart VS Code.
    2. Ctrl+Shift+P  ->  "Settings Sync: Turn On"
    3. Sign in with GitHub.
    4. Check: Settings, Keybindings, Extensions, Snippets, UI State.
    5. First time on a machine, pick "Replace Local" on whichever machine
       already has the good state. After that it stays in sync automatically.

  Done. Restart VS Code and you're set.
"@ | Write-Host
