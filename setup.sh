#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────
#  VS Code one-shot setup (Linux + macOS)
#
#  Run from inside this folder:   bash setup.sh
#
#  Does three things:
#    1. Installs the 15 extensions
#    2. Copies settings.json + keybindings.json into your VS Code User folder
#       (backing up anything already there)
#    3. Installs Fira Code + FiraCode Nerd Font
#
#  The ONE thing it can't do — Settings Sync — needs an interactive login.
#  Instructions for that are printed at the end.
#
#  Flags:
#    --skip-fonts        don't touch fonts
#    --skip-config       don't copy settings/keybindings
#    --skip-extensions   don't install extensions
#  Env:
#    CODE_BIN=codium     use VSCodium instead of `code`
# ─────────────────────────────────────────────────────────────────────────

set -euo pipefail

# ── Config ──────────────────────────────────────────────────────────────
CODE_BIN="${CODE_BIN:-code}"
DO_FONTS=1
DO_CONFIG=1
DO_EXTENSIONS=1

for arg in "$@"; do
  case "$arg" in
    --skip-fonts)      DO_FONTS=0 ;;
    --skip-config)     DO_CONFIG=0 ;;
    --skip-extensions) DO_EXTENSIONS=0 ;;
    *) echo "Unknown flag: $arg" >&2; exit 1 ;;
  esac
done

# Folder this script lives in (so it works no matter where you run it from).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors (fall back to nothing if not a terminal).
if [ -t 1 ]; then BOLD=$(tput bold); DIM=$(tput dim); RESET=$(tput sgr0)
else BOLD=""; DIM=""; RESET=""; fi
say()  { printf '%s\n' "${BOLD}$*${RESET}"; }
step() { printf '\n%s== %s ==%s\n' "${BOLD}" "$*" "${RESET}"; }

# ── Detect OS + VS Code User folder ─────────────────────────────────────
OS="$(uname -s)"
case "$OS" in
  Linux)  USER_DIR="$HOME/.config/Code/User";        FONT_DIR="$HOME/.local/share/fonts" ;;
  Darwin) USER_DIR="$HOME/Library/Application Support/Code/User"; FONT_DIR="$HOME/Library/Fonts" ;;
  *) echo "Unsupported OS: $OS (this script is for Linux/macOS; use setup.ps1 on Windows)" >&2; exit 1 ;;
esac

# ── Sanity: is `code` on PATH? ──────────────────────────────────────────
if [ "$DO_EXTENSIONS" -eq 1 ] && ! command -v "$CODE_BIN" >/dev/null 2>&1; then
  echo "✗ '$CODE_BIN' not found on PATH." >&2
  echo "  Open VS Code → Cmd/Ctrl+Shift+P → 'Shell Command: Install code command in PATH', then re-run." >&2
  exit 1
fi

# ── 1. Extensions ───────────────────────────────────────────────────────
EXTENSIONS=(
  Catppuccin.catppuccin-vsc
  Catppuccin.catppuccin-vsc-icons
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  usernamehw.errorlens
  yoavbls.pretty-ts-errors
  streetsidesoftware.code-spell-checker
  vitest.explorer
  eamodio.gitlens
  mhutchie.git-graph
  vscodevim.vim
  EditorConfig.EditorConfig
  aaron-bond.better-comments
  yzhang.markdown-all-in-one
  redhat.vscode-yaml
)

if [ "$DO_EXTENSIONS" -eq 1 ]; then
  step "Installing ${#EXTENSIONS[@]} extensions via '$CODE_BIN'"
  for ext in "${EXTENSIONS[@]}"; do
    printf '  → %s\n' "$ext"
    "$CODE_BIN" --install-extension "$ext" --force >/dev/null
  done
  say "✓ Extensions done."
else
  echo "(skipping extensions)"
fi

# ── 2. Config files (with backup) ───────────────────────────────────────
if [ "$DO_CONFIG" -eq 1 ]; then
  step "Copying settings.json + keybindings.json"
  mkdir -p "$USER_DIR"
  STAMP="$(date +%Y%m%d-%H%M%S)"
  for f in settings.json keybindings.json; do
    src="$SCRIPT_DIR/$f"
    dst="$USER_DIR/$f"
    if [ ! -f "$src" ]; then
      echo "  ! $f not found next to this script — skipping" >&2
      continue
    fi
    if [ -f "$dst" ]; then
      cp "$dst" "$dst.backup-$STAMP"
      printf '  %sbacked up existing %s → %s%s\n' "$DIM" "$f" "$(basename "$dst.backup-$STAMP")" "$RESET"
    fi
    cp "$src" "$dst"
    printf '  → %s\n' "$dst"
  done
  say "✓ Config copied to: $USER_DIR"
else
  echo "(skipping config copy)"
fi

# ── 3. Fonts ────────────────────────────────────────────────────────────
# Pulls the latest release asset URLs from the GitHub API (no version pinning,
# so it won't break when a new release lands). Needs curl + unzip.
install_font_zip() {  # $1 = repo (owner/name)  $2 = asset-name filter (grep)
  local repo="$1" filter="$2" api url tmp
  api="https://api.github.com/repos/${repo}/releases/latest"
  url="$(curl -fsSL "$api" \
        | grep -o '"browser_download_url": *"[^"]*"' \
        | sed 's/.*"\(https[^"]*\)"/\1/' \
        | grep -iE "$filter" \
        | head -n1)"
  if [ -z "$url" ]; then
    echo "  ! Couldn't find a matching asset in $repo — install this font manually." >&2
    return 1
  fi
  tmp="$(mktemp -d)"
  printf '  ↓ %s\n' "$(basename "$url")"
  curl -fsSL "$url" -o "$tmp/font.zip"
  unzip -o -q "$tmp/font.zip" -d "$tmp/extracted"
  # copy every .ttf/.otf we find, flattening subfolders
  find "$tmp/extracted" -type f \( -iname '*.ttf' -o -iname '*.otf' \) \
    -exec cp {} "$FONT_DIR"/ \;
  rm -rf "$tmp"
}

if [ "$DO_FONTS" -eq 1 ]; then
  step "Installing fonts (Fira Code + FiraCode Nerd Font)"
  if ! command -v curl >/dev/null 2>&1 || ! command -v unzip >/dev/null 2>&1; then
    echo "  ! Need 'curl' and 'unzip' for font install. Install them and re-run with"
    echo "    just the font step, or grab the fonts manually (links in README)." >&2
  else
    mkdir -p "$FONT_DIR"
    # Plain Fira Code (editor)
    install_font_zip "tonsky/FiraCode" 'Fira_Code_v.*\.zip' || true
    # FiraCode Nerd Font (terminal icons) — Nerd Fonts ships per-font zips
    install_font_zip "ryanoasis/nerd-fonts" 'FiraCode\.zip' || true
    if [ "$OS" = "Linux" ] && command -v fc-cache >/dev/null 2>&1; then
      fc-cache -f "$FONT_DIR" >/dev/null 2>&1 || true
      printf '  %srefreshed font cache%s\n' "$DIM" "$RESET"
    fi
    say "✓ Fonts installed to: $FONT_DIR"
    echo "  (macOS: if they don't show up, open Font Book once to register them.)"
  fi
else
  echo "(skipping fonts)"
fi

# ── 4. The manual bit: Settings Sync ────────────────────────────────────
step "One manual step left: Settings Sync"
cat <<'EOF'
  Settings Sync can't be scripted (it needs an interactive GitHub/Microsoft
  login inside VS Code). To turn it on:

    1. Restart VS Code.
    2. Ctrl/Cmd+Shift+P  →  "Settings Sync: Turn On"
    3. Sign in with GitHub.
    4. Check: Settings, Keybindings, Extensions, Snippets, UI State.
    5. First time on a machine, pick "Replace Local" on whichever machine
       already has the good state. After that it stays in sync automatically.

  Done. Restart VS Code and you're set.
EOF
