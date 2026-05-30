# Keybindings — Learning Reference

Everything wired up in this VS Code setup, grouped by *when you'd reach for it*.
Study a few rows at a time, use them on purpose for a day, then move on.

**Shortcuts marked ⭐ are custom** (defined in `keybindings.json` or the Vim
block of `settings.json`). Everything else is a VS Code default worth knowing.

**macOS note:** swap `Ctrl` → `Cmd` for most of these. The chord shortcuts
(`Ctrl+; a`, `Ctrl+K V`) stay as `Ctrl` even on macOS in this config.

**How to read chords:** `Ctrl+; a` means press `Ctrl+;`, release, then press
`a`. `Ctrl+K V` means `Ctrl+K`, release, then `V`. The space is just a pause.

---

## Tier 1 — The daily drivers (learn these first)

These are the ones you'll use dozens of times an hour. Drill them until they're
automatic before touching anything else.

| Keys | Does | |
|---|---|---|
| `Ctrl+P` | Quick-open any file by name (fuzzy) | |
| `Ctrl+Shift+P` | Command Palette — run *any* command by name | |
| `Ctrl+S` | Save (also triggers Prettier + ESLint fix on save) | |
| `Ctrl+/` | Toggle line comment | |
| `Ctrl+D` | Select next occurrence of current word (multi-cursor, Insert mode only when Vim is on) | ⭐ |
| `Ctrl+F` | Find in current file | |
| `Ctrl+Shift+F` | Find across all files | ⭐ |
| `` Ctrl+` `` | Toggle the integrated terminal | ⭐ |
| `Ctrl+B` | Toggle the sidebar | |

> **Why `Ctrl+D` is starred:** VS Code uses it for multi-cursor selection, but
> Vim uses it for half-page down. This config gives `Ctrl+D` back to Vim in
> Normal mode, while keeping VS Code multi-cursor behavior in Insert mode.

---

## Tier 2 — Moving around (files, tabs, panels)

| Keys | Does | |
|---|---|---|
| `Ctrl+Shift+E` | Jump to the Explorer (file tree) | ⭐ |
| `Ctrl+Shift+G` | Jump to Source Control (git) | ⭐ |
| `Ctrl+Alt+←` / `Ctrl+Alt+→` | Previous / next editor tab | ⭐ |
| `Ctrl+Tab` | Cycle tabs by most-recently-used | |
| `Ctrl+W` | Close current tab | |
| `Ctrl+K W` | Close *all* tabs in this group | ⭐ |
| `` Ctrl+Shift+` `` | Open a *new* terminal (vs toggling) | ⭐ |
| `Ctrl+1` / `Ctrl+2` | Focus editor group 1 / 2 | |

---

## Tier 3 — Editing power moves

The ones that make you look fast. Each saves a copy-paste-delete dance.

| Keys | Does | |
|---|---|---|
| `Alt+↑` / `Alt+↓` | Move the current line (or selection) up/down (Insert mode only when Vim is on) | ⭐ |
| `Shift+Alt+↓` / `Shift+Alt+↑` | Copy the current line down/up (Insert mode only when Vim is on) | ⭐ |
| `Ctrl+Shift+L` | Select *all* occurrences of current word at once (Insert mode only when Vim is on) | ⭐ |
| `Ctrl+.` | Quick Fix / auto-import / refactor suggestions (Insert mode only when Vim is on) | ⭐ |
| `F2` | Rename symbol everywhere (Insert mode only when Vim is on) | ⭐ |
| `Shift+Alt+F` | Format the document now (Insert mode only when Vim is on) | ⭐ |
| `Ctrl+Shift+K` | Delete the current line | |
| `Ctrl+Enter` | Insert line below (from anywhere on the line) | |
| `Ctrl+]` / `Ctrl+[` | Indent / outdent | |

> **`Alt+↓` vs `Shift+Alt+↓`:** plain Alt *moves* the line; adding Shift
> *duplicates* it. Easy to mix up — the Shift = "extra copy" mnemonic helps.

---

## Tier 4 — Navigating code (TypeScript superpowers)

This is where the TS language server earns its keep. These work because of
Pylance-style type awareness — lean on them hard while learning the language.

| Keys | Does | |
|---|---|---|
| `F12` | Go to definition | |
| `Alt+F12` | Peek definition (inline, without leaving) | |
| `Shift+F12` | Find all references | |
| `Ctrl+Click` | Go to definition (mouse) | |
| `Alt+←` / `Alt+→` | Go back / forward (after jumping around) | |
| `Ctrl+Shift+O` | Go to symbol in current file | |
| `Ctrl+T` | Go to symbol across the whole project | |
| `Ctrl+Space` | Trigger suggestions manually | |
| `F8` / `Shift+F8` | Jump to next / previous error or warning | |

> **`Alt+←` is the one people forget.** After `F12` takes you down a rabbit
> hole of definitions, `Alt+←` walks you straight back out. Treat it like a
> browser back button for code.

---

## Tier 5 — Splits & Markdown

| Keys | Does | |
|---|---|---|
| `Ctrl+\` | Split editor (side by side) | ⭐ |
| `Ctrl+K Ctrl+\` | Split editor (top/bottom) | ⭐ |
| `Ctrl+K V` | Open Markdown preview to the side | ⭐ |
| `Ctrl+Shift+V` | Open Markdown preview (full) | |

---

## Tier 6 — Testing (Vitest / Jest)

All custom, all under the `Ctrl+;` "test" cluster. The mnemonic: **;** then the
first letter of the action.

| Keys | Does | |
|---|---|---|
| `Ctrl+; a` | Run **a**ll tests | ⭐ |
| `Ctrl+; r` | **R**un the test at your cursor (Insert mode only when Vim is on) | ⭐ |
| `Ctrl+; d` | **D**ebug the test at your cursor (Insert mode only when Vim is on) | ⭐ |
| `Ctrl+; t` | Focus the **t**est explorer panel | ⭐ |

---

## Tier 7 — Debugging

`F5` to start/continue is the VS Code default; the rest fill in the gaps. The
`Ctrl+;` cluster is shared with testing — different letters.

| Keys | Does | |
|---|---|---|
| `F5` | Start / continue debugging | |
| `F9` | Toggle breakpoint on current line | |
| `F10` | Step **over** | |
| `F11` | Step **into** | |
| `Shift+F11` | Step **out** | |
| `Ctrl+; c` | Run without debugging (**c**ontinue/run) | ⭐ |
| `Ctrl+; s` | **S**top the debug session | ⭐ |
| `Ctrl+; b` | Toggle **b**reakpoint (alt to F9) | ⭐ |
| `Ctrl+; l` | Focus the variab**l**es view | ⭐ |

> With `debug.inlineValues` on (set in this config), stepping with `F10`/`F11`
> shows each variable's current value right next to it. For *seeing* an
> algorithm run, this beats any print statement.

---

## The AI-completion guardrail (why Tab feels different)

| Keys | Does | |
|---|---|---|
| `Tab` | **Un-bound** from accepting inline suggestions | ⭐ |
| `Ctrl+Shift+Alt+V` | Toggle Vim mode on/off entirely | ⭐ |

This config disables AI tab-completion. Suggestion popups (the ones from `.`
or parameter hints) still appear — accept those with `Enter`. The point: you
type your own code, suggestions never auto-fire.

---
---

# Vim — Learning Section

Vim is on, tuned **for learning, not for veterans**. The dangerous edges are
sanded off: your normal `Ctrl+S/C/V/Z/F` still work like always (this config
tells Vim to *not* capture them), so you can't get trapped.

## The two things that feel weird at first

1. **Modes.** You start in *Normal* mode (keys are commands, not text). Press
   `i` to enter *Insert* mode (now you type normally). This is the whole
   mental model — keys mean different things depending on mode.
2. **Getting back out.** Instead of reaching for `Esc`, this config lets you
   type **`jj`** or **`jk`** quickly to exit insert mode. ⭐ Far less finger
   travel. (`Esc` still works too.)

## Custom Vim bindings in THIS config ⭐

The leader key is **Space**. "Leader then a letter" = a custom shortcut.

| In Normal mode | Does |
|---|---|
| `jj` or `jk` | Exit insert mode (→ Normal) |
| `Ctrl+D` | Half-page down |
| `Space` `w` | Save file |
| `Space` `q` | Close current editor |
| `Space` `e` | Open the Explorer |
| `Space` `f` | Quick-open a file (fuzzy) |
| `Space` `/` | Find in all files |
| `Space` `Space` | Open the Command Palette |
| `H` | Previous editor tab |
| `L` | Next editor tab |

> `H`/`L` are normally cursor moves in Vim; this config repurposes them for
> tab-switching, which is more useful inside an editor. The lowercase `h`/`l`
> still move the cursor left/right.

## Core Vim motions to learn (these are standard, not custom)

Learn them in this order — each tier is genuinely useful on its own.

**Week 1 — survive:**
| Key | Does |
|---|---|
| `h` `j` `k` `l` | Move left / down / up / right |
| `i` | Insert before cursor |
| `a` | Insert after cursor (**a**ppend) |
| `o` | Open a new line below and insert |
| `x` | Delete character under cursor |
| `dd` | Delete (cut) the whole line |
| `u` | Undo |
| `Ctrl+R` | Redo |
| `:w` `Enter` | Save (or just use `Space w`) |

**Week 2 — move like you mean it:**
| Key | Does |
|---|---|
| `w` / `b` | Jump forward / back by word |
| `0` / `$` | Jump to start / end of line |
| `gg` / `G` | Jump to top / bottom of file |
| `{number}G` | Jump to line number (e.g. `42G`) |
| `/text` `Enter` | Search forward; `n` / `N` for next / prev |
| `%` | Jump to matching bracket |

**Week 3 — the killer feature (operators + motions):**
Vim's power is combining a *verb* with a *motion*. Learn the verbs, multiply by
the motions you already know.

| Combo | Does |
|---|---|
| `dw` | **D**elete to next **w**ord |
| `d$` | Delete to end of line |
| `cw` | **C**hange word (delete + enter insert) |
| `ci"` | **C**hange everything **i**nside the `"..."` |
| `ci(` | Change inside the `(...)` |
| `yy` | **Y**ank (copy) a line |
| `p` / `P` | **P**aste after / before |
| `v` | Visual mode (select); then motion to extend |
| `V` | Visual *line* mode |
| `>>` / `<<` | Indent / outdent line |

> **The mental shift:** stop thinking "select then act." Think "act on a
> motion." `ci"` ("change inside quotes") is one fluid thought, not three
> steps. Once `verb + motion` clicks, Vim makes sense.

---

## Build your own practice tool

Here's a small self-quiz you can run to drill these. Save it as
`keybind-quiz.html` anywhere and open it in a browser — it shuffles the
bindings from this doc and checks your recall. No install, no dependencies.

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Keybinding Drill</title>
<style>
  :root { color-scheme: dark; }
  body { font-family: 'Fira Code', ui-monospace, monospace; background: #1e1e2e;
         color: #cdd6f4; max-width: 640px; margin: 40px auto; padding: 0 20px; }
  h1 { color: #cba6f7; font-size: 1.3rem; }
  .card { background: #313244; border-radius: 12px; padding: 28px; margin: 20px 0;
          box-shadow: 0 6px 20px rgba(0,0,0,.35); }
  .prompt { font-size: 1.15rem; margin-bottom: 18px; }
  .answer { font-size: 1.4rem; color: #a6e3a1; margin: 14px 0; min-height: 1.6em; }
  button { font: inherit; background: #585b70; color: #cdd6f4; border: 0;
           padding: 10px 18px; border-radius: 8px; cursor: pointer; margin-right: 8px; }
  button:hover { background: #6c7086; }
  .meta { color: #9399b2; font-size: .85rem; margin-top: 10px; }
  .score { color: #f9e2af; }
  select { font: inherit; background: #313244; color: #cdd6f4; border: 1px solid #585b70;
           border-radius: 6px; padding: 6px; }
</style>
</head>
<body>
  <h1>⌨️  Keybinding Drill</h1>
  <p class="meta">
    Mode:
    <select id="mode">
      <option value="keys">Show action → recall keys</option>
      <option value="action">Show keys → recall action</option>
    </select>
    &nbsp;|&nbsp; Set:
    <select id="set">
      <option value="vscode">VS Code</option>
      <option value="vim">Vim</option>
      <option value="all">Everything</option>
    </select>
  </p>

  <div class="card">
    <div class="prompt" id="prompt">Loading…</div>
    <button id="reveal">Reveal</button>
    <div class="answer" id="answer"></div>
    <button id="next">Next →</button>
    <button id="got">✓ I knew it</button>
    <button id="miss">✗ Missed it</button>
    <div class="meta score" id="score">Seen 0 · Known 0</div>
  </div>

<script>
// Edit / extend these freely — add any binding you want to drill.
const BINDINGS = {
  vscode: [
    ["Quick-open file by name", "Ctrl+P"],
    ["Command Palette", "Ctrl+Shift+P"],
    ["Select next occurrence (multi-cursor)", "Ctrl+D"],
    ["Select ALL occurrences", "Ctrl+Shift+L"],
    ["Toggle terminal", "Ctrl+`"],
    ["New terminal", "Ctrl+Shift+`"],
    ["Move line up / down", "Alt+Up / Alt+Down"],
    ["Copy line down / up", "Shift+Alt+Down / Shift+Alt+Up"],
    ["Quick Fix / auto-import", "Ctrl+."],
    ["Rename symbol everywhere", "F2"],
    ["Format document", "Shift+Alt+F"],
    ["Go to definition", "F12"],
    ["Peek definition", "Alt+F12"],
    ["Find all references", "Shift+F12"],
    ["Go back after jumping", "Alt+Left"],
    ["Next / previous error", "F8 / Shift+F8"],
    ["Go to symbol in file", "Ctrl+Shift+O"],
    ["Split editor", "Ctrl+\\"],
    ["Markdown preview to side", "Ctrl+K V"],
    ["Close all tabs in group", "Ctrl+K W"],
    ["Run all tests", "Ctrl+; a"],
    ["Run test at cursor", "Ctrl+; r"],
    ["Debug test at cursor", "Ctrl+; d"],
    ["Start / continue debugging", "F5"],
    ["Step over / into / out", "F10 / F11 / Shift+F11"],
    ["Stop debugging", "Ctrl+; s"],
    ["Toggle Vim mode", "Ctrl+Shift+Alt+V"],
  ],
  vim: [
    ["Exit insert mode (custom)", "jj  or  jk"],
    ["Save file (leader)", "Space w"],
    ["Close editor (leader)", "Space q"],
    ["Open Explorer (leader)", "Space e"],
    ["Quick-open file (leader)", "Space f"],
    ["Find in files (leader)", "Space /"],
    ["Command Palette (leader)", "Space Space"],
    ["Previous / next tab (custom)", "H / L"],
    ["Move cursor L/D/U/R", "h j k l"],
    ["Insert before / append after", "i / a"],
    ["Open line below + insert", "o"],
    ["Delete char / delete line", "x / dd"],
    ["Undo / redo", "u / Ctrl+R"],
    ["Word forward / back", "w / b"],
    ["Start / end of line", "0 / $"],
    ["Top / bottom of file", "gg / G"],
    ["Search forward", "/text  then n / N"],
    ["Delete word / change word", "dw / cw"],
    ["Change inside quotes", "ci\""],
    ["Yank line / paste", "yy / p"],
    ["Visual select / visual line", "v / V"],
  ],
};

const $ = (id) => document.getElementById(id);
let deck = [], current = null, seen = 0, known = 0;

function buildDeck() {
  const set = $("set").value;
  const src = set === "all"
    ? [...BINDINGS.vscode, ...BINDINGS.vim]
    : BINDINGS[set];
  deck = src.map(([action, keys]) => ({ action, keys }));
  // Fisher-Yates shuffle
  for (let i = deck.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [deck[i], deck[j]] = [deck[j], deck[i]];
  }
}

function nextCard() {
  if (deck.length === 0) buildDeck();
  current = deck.pop();
  const mode = $("mode").value;
  $("prompt").textContent = mode === "keys" ? current.action : current.keys;
  $("answer").textContent = "";
}

function reveal() {
  if (!current) return;
  const mode = $("mode").value;
  $("answer").textContent = mode === "keys" ? current.keys : current.action;
}

function mark(hit) {
  seen++;
  if (hit) known++;
  $("score").textContent = `Seen ${seen} · Known ${known}`;
  nextCard();
}

$("reveal").onclick = reveal;
$("next").onclick = nextCard;
$("got").onclick = () => mark(true);
$("miss").onclick = () => mark(false);
$("mode").onchange = nextCard;
$("set").onchange = () => { buildDeck(); nextCard(); };

buildDeck();
nextCard();
</script>
</body>
</html>
```

**How to use it:** open the HTML, pick a mode (recall the *keys* from the
action, or vice-versa), pick a set (VS Code / Vim / Everything), and click
through. Hit "Reveal", then mark yourself. The deck reshuffles when exhausted.
To add your own bindings, just edit the `BINDINGS` object at the top of the
`<script>` — it's plain pairs of `["description", "keys"]`.

---

## A realistic learning order

1. **Days 1–3:** Tier 1 only. Don't even look at the rest.
2. **Week 1:** add Tier 2 + Tier 4 (navigation is where the time savings are).
3. **Week 2:** Tier 3 editing moves; start Vim Week-1 motions in low-stakes files.
4. **Week 3+:** Testing/Debugging clusters as you start writing tests; Vim
   operators (`ci"`, `dw`) once basic motions are automatic.
5. **Anytime it's not sticking:** toggle Vim off with `Ctrl+Shift+Alt+V` and
   come back to it. Learning the *editor* and learning *Vim* are two separate
   skills — don't let one block the other.
