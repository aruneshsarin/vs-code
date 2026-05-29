# Extensions (25 total)

Grouped by purpose with a one-line "why." Install scripts: `install-extensions.sh`
(Linux) and `install-extensions.ps1` (Windows).

## Theme & UI (3)
- `Catppuccin.catppuccin-vsc` — Catppuccin theme (Mocha is set as default).
- `Catppuccin.catppuccin-vsc-icons` — Matching file icons.
- `miguelsolorio.fluent-icons` — Modern product icons.

## TypeScript / JS core (7)
- `dbaeumer.vscode-eslint` — ESLint integration (flat config aware).
- `esbenp.prettier-vscode` — Prettier formatter.
- `usernamehw.errorlens` — Inline errors/warnings right in the code.
- `yoavbls.pretty-ts-errors` — Human-readable TypeScript errors.
- `christian-kohler.path-intellisense` — Path autocomplete in strings.
- `christian-kohler.npm-intellisense` — npm package name autocomplete.
- `streetsidesoftware.code-spell-checker` — Catches typos in identifiers/comments.

## Testing (1)
- `vitest.explorer` — Official Vitest extension; also runs Jest in Vitest-compat
  mode. Gutter run/debug buttons, Test Explorer sidebar, watch mode.

## Node.js backend (2)
- `humao.rest-client` — Fire HTTP requests from `.http` files (better than Postman).
- `mikestead.dotenv` — `.env` syntax highlighting.

## Git (2)
- `eamodio.gitlens` — Inline blame, history, comparisons.
- `mhutchie.git-graph` — Visual commit graph.

## Python (4)
- `ms-python.python` — Core Python support.
- `ms-python.vscode-pylance` — Fast type-aware language server.
- `ms-python.black-formatter` — Black formatter.
- `charliermarsh.ruff` — Modern, fast linter.

## C (1)
- `ms-vscode.cpptools` — C/C++ IntelliSense + debugger.

## Quality of life (4)
- `vscodevim.vim` — Vim emulation (tuned for learners).
- `EditorConfig.EditorConfig` — Respect `.editorconfig` in repos.
- `gruntfuggly.todo-tree` — Tree view of all TODOs in workspace.
- `aaron-bond.better-comments` — Highlights TODO/FIXME/NOTE comments.

## Docs / data (2)
- `yzhang.markdown-all-in-one` — Markdown editing supercharger.
- `redhat.vscode-yaml` — YAML language server (schema-aware).

---

## Removed (and why)
- **Angular extensions** (`Angular.ng-template`, `cyrilletuzi.angular-schematics`,
  `johnpapa.Angular2`) — add per-project if you start an Angular workspace.
- **React-specific** (`dsznajder.es7-react-js-snippets`,
  `formulahendry.auto-rename-tag`, `bradlc.vscode-tailwindcss`) — the TS server
  + Emmet cover most React needs. Add Tailwind back if you actually use Tailwind.
- **`GitHub.copilot` / TabNine** — you don't want AI tab completion. Use a
  sidebar AI app instead.

## To install per-project later
If you start an Angular project: `code --install-extension Angular.ng-template`.
If you start a Tailwind project: `code --install-extension bradlc.vscode-tailwindcss`.
