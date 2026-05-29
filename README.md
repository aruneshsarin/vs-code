# VS Code Setup — TypeScript Full-Stack (Linux + Windows)

A shareable, no-fuss VS Code config for working across Linux and Windows on the
same stack: TypeScript (React/Next.js, Node backends), plus occasional Python
and C. Tuned for Catppuccin Mocha + Fira Code, with AI tab-completion fully
disabled (use a sidebar AI app instead).

**25 extensions, focused on what you actually use day-to-day.** Angular and
React-specific extensions removed — add per-project if/when you need them.

---

## What's in this folder

| File | Purpose |
|---|---|
| `settings.json` | Your user-level VS Code settings |
| `keybindings.json` | Custom shortcuts |
| `extensions.md` | Curated extension list with rationale |
| `install-extensions.sh` | One-shot installer for Linux |
| `install-extensions.ps1` | One-shot installer for Windows |
| `README.md` | This file |

---

## 1. Install prerequisites

### Both OSes
- **VS Code** — make sure `code` is on your PATH. On Windows, the installer
  has a checkbox for this; on Linux, the official `.deb`/`.rpm`/Snap all
  configure it.
- **Fira Code** — download from <https://github.com/tonsky/FiraCode/releases>.
  - Linux: drop `.ttf` files into `~/.local/share/fonts/` and run `fc-cache -fv`.
  - Windows: select all `.ttf` files → right-click → Install for all users.
- **FiraCode Nerd Font** (for the terminal — gives you icons in prompts like
  Starship/Oh-My-Posh): <https://github.com/ryanoasis/nerd-fonts/releases>.
  Same install steps. If you don't use a fancy prompt, regular Fira Code is fine
  and the config falls back to it automatically.

### Windows-only
- If PowerShell blocks the install script:
  ```powershell
  powershell -ExecutionPolicy Bypass -File .\install-extensions.ps1
  ```

---

## 2. Apply the config

### Find your config folder

| OS | Path |
|---|---|
| Linux | `~/.config/Code/User/` |
| Windows | `%APPDATA%\Code\User\` (i.e. `C:\Users\<you>\AppData\Roaming\Code\User\`) |

Drop `settings.json` and `keybindings.json` into that folder, overwriting the
existing ones. (Back yours up first if you have anything precious.)

### Install extensions

```bash
# Linux
chmod +x install-extensions.sh
./install-extensions.sh
```

```powershell
# Windows
.\install-extensions.ps1
```

Restart VS Code once it's done.

---

## 3. Set up sync between machines

You asked for **both** Settings Sync and a Git backup. Here's the layout:

### A. Turn on Settings Sync (primary)
1. `Ctrl+Shift+P` → **Settings Sync: Turn On**.
2. Sign in with GitHub (recommended) or Microsoft.
3. Check all the boxes: Settings, Keybindings, Extensions, Snippets, UI State, Profiles.
4. Pick "Replace Local" the first time, on whichever machine has the
   newer/better state. From then on, both machines stay in sync automatically.

The `settingsSync.ignoredSettings` array in `settings.json` already excludes
OS-specific terminal profiles, so your Windows PowerShell config and Linux
bash config won't fight each other.

### B. Keep a Git backup repo (insurance)

```bash
# One-time setup on either machine
mkdir ~/dotfiles && cd ~/dotfiles
git init
mkdir -p vscode
# Linux
cp ~/.config/Code/User/settings.json     vscode/
cp ~/.config/Code/User/keybindings.json  vscode/
# Windows (Git Bash or WSL)
# cp "$APPDATA/Code/User/settings.json"    vscode/
# cp "$APPDATA/Code/User/keybindings.json" vscode/

# Snapshot extension list
code --list-extensions > vscode/extensions.txt

git add . && git commit -m "Initial VS Code config"
git remote add origin git@github.com:<you>/dotfiles.git
git push -u origin main
```

To restore on a fresh machine:
```bash
git clone git@github.com:<you>/dotfiles.git ~/dotfiles
# Copy settings.json + keybindings.json to the User folder for your OS
cat ~/dotfiles/vscode/extensions.txt | xargs -L 1 code --install-extension
```

**Recommended workflow:** let Settings Sync do the day-to-day, and re-snapshot
to the Git repo every few weeks (or before any risky experiment).

---

## 4. What's been tuned

### AI autocomplete
Disabled in three places (`editor.inlineSuggest.enabled`, the Copilot block,
and a keybinding that unbinds Tab from inline-suggest commit). Suggestion
popups (parameter hints, autocomplete on `.`) still work — you just have to
explicitly accept them. Use Claude/ChatGPT in a sidebar panel or separate window.

### Vim
Set up for **learning**, not for veterans. `jj` or `jk` exits insert mode,
`Space` is leader, `Ctrl+S/C/V/Z/F` still work like normal (no muscle-memory
surprises). To toggle Vim off entirely: `Ctrl+Shift+Alt+V`.

### Testing
The `vitest.explorer` extension runs both Vitest and Jest. You'll see
gutter run/debug icons next to `test()` and `describe()` blocks, plus a Test
Explorer sidebar. Custom shortcuts:
- `Ctrl+; a` — run all tests
- `Ctrl+; r` — run test at cursor
- `Ctrl+; d` — debug test at cursor
- `Ctrl+; t` — focus the test view

### Format on save
Prettier handles JS/TS/JSON/Markdown/CSS, Black handles Python, ESLint
auto-fixes on save. `prettier.requireConfig: true` means projects without a
Prettier config won't get accidentally reformatted.

### Theme
**Catppuccin Mocha** for the muted-but-warm look, with Catppuccin file icons
and Fluent product icons. To try Gruvbox instead: install `jdinhlife.gruvbox`
and change `workbench.colorTheme` to `"Gruvbox Dark Medium"`.

### Cross-platform terminal
Profiles defined for both OSes. The `settingsSync.ignoredSettings` block keeps
them from overwriting each other.

---

## 5. Per-project overrides

For repo-specific tweaks, drop a `.vscode/settings.json` in the project root.
Common one — pinning the workspace TS version:

```jsonc
{
  "typescript.tsdk": "node_modules/typescript/lib",
  "eslint.workingDirectories": [{ "mode": "auto" }]
}
```

Drop an `.editorconfig` at the repo root so non-VS-Code collaborators stay
aligned:

```ini
root = true
[*]
charset = utf-8
end_of_line = lf
indent_style = space
indent_size = 2
insert_final_newline = true
trim_trailing_whitespace = true

[*.{py,c,h}]
indent_size = 4
```

### If you start an Angular project
```bash
code --install-extension Angular.ng-template
```
The Angular Language Service is the only one you really need.

### If you start a Tailwind project
```bash
code --install-extension bradlc.vscode-tailwindcss
```

---

## 6. Revisit checklist (3–6 months from now)

When you come back to refresh this, here's what to look at:
- **VS Code updates**: deprecated settings show as warnings in the JSON editor.
- **Extension churn**: anything you installed per-project that you now want
  globally? Anything in the main list you haven't used in months?
- **ESLint flat config**: `eslint.useFlatConfig` is already on; if v10+ is out
  by then, this may be the default and you can remove the setting.
- **TypeScript inlay hints**: I've kept them mostly off because they add
  visual noise. If you've grown comfortable, try turning
  `typescript.inlayHints.parameterNames.enabled` up to `"all"`.
- **Vim**: if you're sticking with it, look at `vim-easymotion` (set to `false`
  here so it doesn't ambush you while learning) and consider `vim.normalModeKeyBindingsNonRecursive`
  additions for whatever motions you find yourself reaching for.

---

## Quick sanity check after install
1. Open a `.ts` file → save → confirm it formats automatically.
2. Type `cl` in a `.tsx` file → no auto-accept on Tab. Suggestion shows up,
   you can pick it with Enter or ignore it.
3. `Ctrl+Shift+P` → "Catppuccin Mocha" should be the active theme.
4. Open any test file → run/debug icons should show in the gutter next to
   `test()` blocks (after `npm install` in the project).
5. Terminal shows Fira Code (or FiraCode Nerd Font if installed).
6. `:` in normal mode in any editor → Vim command mode activates.
