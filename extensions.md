# Extensions (15 total)

Trimmed to a TypeScript-focused set. Grouped by purpose with a one-line "why."
Installed automatically by `setup.sh` (Linux/macOS) or `setup.ps1` (Windows).

## Theme & UI (2)
- `Catppuccin.catppuccin-vsc` — Catppuccin theme (Mocha is set as default).
- `Catppuccin.catppuccin-vsc-icons` — Matching file icons.

## TypeScript / JS core (5)
- `dbaeumer.vscode-eslint` — ESLint integration (flat config aware).
- `esbenp.prettier-vscode` — Prettier formatter.
- `usernamehw.errorlens` — Inline errors/warnings right in the code.
- `yoavbls.pretty-ts-errors` — Human-readable TypeScript errors.
- `streetsidesoftware.code-spell-checker` — Catches typos in identifiers/comments.

## Testing (1)
- `vitest.explorer` — Official Vitest extension; also runs Jest in Vitest-compat
  mode. Gutter run/debug buttons, Test Explorer sidebar, watch mode.

## Git (2)
- `eamodio.gitlens` — Inline blame, history, comparisons.
- `mhutchie.git-graph` — Visual commit graph.

## Quality of life (3)
- `vscodevim.vim` — Vim emulation (tuned for learners).
- `EditorConfig.EditorConfig` — Respect `.editorconfig` in repos.
- `aaron-bond.better-comments` — Highlights TODO/FIXME/NOTE comments inline.

## Docs / data (2)
- `yzhang.markdown-all-in-one` — Markdown editing supercharger.
- `redhat.vscode-yaml` — YAML language server (schema-aware).

---

## TypeScript debugging (no extension needed)
VS Code's built-in JavaScript debugger handles TS — no extension required.
For zero-config debugging of `.ts` files, add `tsx` as a dev dependency in the
project (`npm i -D tsx`) and use the included `launch.json.template`. Press F5
to step through any file with inline variable values.

---

## Removed in the TS-focused trim (and why)
Cut from the previous 25-extension polyglot setup:

- **Redundant with built-ins** — `christian-kohler.path-intellisense` and
  `christian-kohler.npm-intellisense`: VS Code's TS language service already
  does path completion in import strings and npm-package-name completion.
  `miguelsolorio.fluent-icons`: pure cosmetics on top of an already-complete
  icon theme.
- **Backend / API tools** — `humao.rest-client`, `mikestead.dotenv`: not used
  for algorithm/data-structure work in TS.
- **Python** — `ms-python.python`, `ms-python.vscode-pylance`,
  `ms-python.black-formatter`, `charliermarsh.ruff`. Pylance is heavy.
- **C** — `ms-vscode.cpptools` (one of the heaviest, slowest-activating
  extensions in the ecosystem).
- **Overlap** — `gruntfuggly.todo-tree`: kept `better-comments` (inline
  coloring) instead of the sidebar TODO list.

If you return to polyglot work, the cleanest path is a separate VS Code
**Profile** that re-adds Python + C, rather than reinstalling globally — keeps
your TS environment lean and fast to start.

## To install per-project later
If you start an Angular project: `code --install-extension Angular.ng-template`.
If you start a Tailwind project: `code --install-extension bradlc.vscode-tailwindcss`.
If you pick Python back up: `code --install-extension ms-python.python ms-python.vscode-pylance`.
