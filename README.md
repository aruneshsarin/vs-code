# VS Code Setup — TypeScript-Focused (Linux + Windows)

A shareable, no-fuss VS Code config for working across Linux and Windows,
focused on TypeScript (React/Next.js, Node). Tuned for Catppuccin Mocha +
Fira Code, with AI tab-completion fully disabled (use a sidebar AI app instead).

**15 extensions, focused on what you actually use day-to-day.** Trimmed from a
larger polyglot setup — Python, C, and backend/API extensions removed. The
cleanest way to bring them back is a separate VS Code Profile (see below);
Angular/React-specific extensions are per-project adds.

---

## What's in this folder

| File | Purpose |
|---|---|
| `setup.sh` | **One-shot setup for Linux/macOS** (extensions + config + fonts) |
| `setup.ps1` | **One-shot setup for Windows** (extensions + config + fonts) |
| `settings.json` | Your user-level VS Code settings |
| `keybindings.json` | Custom shortcuts |
| `extensions.md` | Curated extension list with rationale |
| `launch.json.template` | Per-project TS debugging presets (copy into a project's `.vscode/`) |
| `README.md` | This file |

---

## 1. Quick start (one command)

Make sure VS Code's `code` command is on your PATH first:
- **Windows**: tick the "Add to PATH" box in the installer.
- **Linux/macOS**: the official `.deb`/`.rpm`/Snap do it; on macOS run
  `Cmd+Shift+P` → "Shell Command: Install 'code' command in PATH".

Then, from inside this folder:

```bash
# Linux / macOS
bash setup.sh
```

```powershell
# Windows  (if it's blocked: powershell -ExecutionPolicy Bypass -File .\setup.ps1)
.\setup.ps1
```

That single script:
1. Installs all 15 extensions.
2. Copies `settings.json` + `keybindings.json` into your VS Code User folder,
   **backing up** anything already there (as `*.backup-<timestamp>`).
3. Downloads and installs **Fira Code** (editor) and **FiraCode Nerd Font**
   (terminal icons) — latest release, pulled live from GitHub.

Then restart VS Code. The only thing left is Settings Sync (section 3) — it
needs an interactive login, so the script just prints the steps at the end.

**Useful flags** if you want to run only part of it:
`--skip-fonts`, `--skip-config`, `--skip-extensions` (bash) or
`-SkipFonts`, `-SkipConfig`, `-SkipExtensions` (PowerShell).
To use VSCodium instead of VS Code: set `CODE_BIN=codium` (bash) /
`$env:CODE_BIN="codium"` (PowerShell) before running.

### Config folder, for reference
The script handles this automatically, but if you ever need it by hand:

| OS | Path |
|---|---|
| Linux | `~/.config/Code/User/` |
| macOS | `~/Library/Application Support/Code/User/` |
| Windows | `%APPDATA%\Code\User\` (i.e. `C:\Users\<you>\AppData\Roaming\Code\User\`) |

---

## 2. Set up sync between machines

Both Settings Sync and a Git backup, for belt-and-braces. Here's the layout:

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

## 3. What's been tuned

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

### TypeScript debugging (F5)
The user settings turn on inline variable values (`debug.inlineValues`), so
when you step through code the current value of each variable shows greyed-out
right next to it — the fastest way to *see* an algorithm execute, which is
exactly what you want for fundamentals.

To get one-key debugging in a project, copy `launch.json.template` to
`<project>/.vscode/launch.json` and install `tsx` once (`npm i -D tsx`). Then:
- Open any `.ts` file, set a breakpoint (click the gutter), press **F5** →
  it runs that file directly with no build step.
- Step with **F10** (over) / **F11** (into) / **Shift+F11** (out).
- `smartStep` + skipping `node_internals` keeps you in *your* code, not
  library guts.

The template also includes a "Debug current test file" config for stepping
through Vitest tests with breakpoints (more than the quick `Ctrl+; d` run).

### Format on save
Prettier handles JS/TS/JSON/Markdown/CSS, ESLint auto-fixes on save.
`prettier.requireConfig: true` means projects without a Prettier config won't
get accidentally reformatted.

### Theme
**Catppuccin Mocha** for the muted-but-warm look, with Catppuccin file icons.
(Product icons use VS Code's default set — the Fluent icons extension was
dropped in the trim.) To try Gruvbox instead: install `jdinhlife.gruvbox`
and change `workbench.colorTheme` to `"Gruvbox Dark Medium"`.

### Cross-platform terminal
Profiles defined for both OSes. The `settingsSync.ignoredSettings` block keeps
them from overwriting each other.

---

## 4. Per-project overrides

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

### If you go back to polyglot (Python / C)
Rather than reinstalling globally and re-bloating your TS environment, create a
separate **Profile**:
1. `Ctrl+Shift+P` → **Profiles: Create Profile** → name it e.g. "Polyglot",
   based on your current profile (so it inherits these settings).
2. In that profile, install what you need:
   ```bash
   code --profile "Polyglot" --install-extension ms-python.python
   code --profile "Polyglot" --install-extension ms-python.vscode-pylance
   code --profile "Polyglot" --install-extension charliermarsh.ruff
   code --profile "Polyglot" --install-extension ms-vscode.cpptools
   ```
3. Re-add the `[python]` / `[c]` formatter blocks and the `python.analysis.*` /
   `C_Cpp.*` settings to that profile's `settings.json` (they were removed from
   the lean TS config). Switch profiles from the gear menu, bottom-left.

This keeps your default TS profile fast — Pylance and cpptools are both heavy,
slow-activating extensions you don't want loading when you're only touching `.ts`.

---

## 5. Revisit checklist (3–6 months from now)

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
