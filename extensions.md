# Extensions

Curated extension list. Each extension is grouped by purpose, with a one-line "why" so
you can prune later. Install scripts are in `install-extensions.sh` (Linux/macOS) and
`install-extensions.ps1` (Windows PowerShell).

## Theme & UI
- `Catppuccin.catppuccin-vsc` — Catppuccin theme (Mocha is set as default).
- `Catppuccin.catppuccin-vsc-icons` — Matching file icons.
- `miguelsolorio.fluent-icons` — Modern product icons.
- `pkief.material-icon-theme` — Alternative icon theme if you prefer it (optional).

## TypeScript / JS core
- `dbaeumer.vscode-eslint` — ESLint integration (flat config aware).
- `esbenp.prettier-vscode` — Prettier formatter.
- `usernamehw.errorlens` — Inline errors/warnings right in the code.
- `christian-kohler.path-intellisense` — Path autocomplete in strings.
- `christian-kohler.npm-intellisense` — npm package name autocomplete.
- `yoavbls.pretty-ts-errors` — Human-readable TypeScript errors.
- `streetsidesoftware.code-spell-checker` — Catches typos in identifiers/comments.

## React / Next.js
- `dsznajder.es7-react-js-snippets` — React/Redux/GraphQL snippets.
- `formulahendry.auto-rename-tag` — Renames the matching JSX/HTML tag.
- `bradlc.vscode-tailwindcss` — Tailwind IntelliSense (no-op if you don't use Tailwind).

## Angular
- `Angular.ng-template` — Official Angular Language Service.
- `cyrilletuzi.angular-schematics` — Angular schematics UI.
- `johnpapa.Angular2` — Snippets (battle-tested).

## Node.js backend
- `humao.rest-client` — Fire HTTP requests from `.http` files. Better than Postman.
- `mikestead.dotenv` — `.env` syntax highlighting.
- `Prisma.prisma` — Prisma schema language (enable only if you use it).

## Git
- `eamodio.gitlens` — Inline blame, history, comparisons.
- `mhutchie.git-graph` — Visual commit graph.
- `donjayamanne.githistory` — File history viewer (lightweight complement).

## Python (light use)
- `ms-python.python` — Core Python support.
- `ms-python.vscode-pylance` — Fast type-aware language server.
- `ms-python.black-formatter` — Black formatter.
- `charliermarsh.ruff` — Modern, fast linter (use instead of flake8/isort).

## C (light use)
- `ms-vscode.cpptools` — C/C++ IntelliSense + debugger.
- `ms-vscode.cmake-tools` — CMake integration (only if you use CMake).

## Productivity / quality of life
- `vscodevim.vim` — Vim emulation (settings tuned for learning).
- `aaron-bond.better-comments` — Highlights TODO/FIXME/NOTE comments.
- `wayou.vscode-todo-highlight` — Configurable TODO highlighting.
- `EditorConfig.EditorConfig` — Respect `.editorconfig` in repos.
- `oderwat.indent-rainbow` — Subtle indent coloring.
- `gruntfuggly.todo-tree` — Tree view of all TODOs in workspace.

## Docs / data
- `yzhang.markdown-all-in-one` — Markdown editing supercharger.
- `bierner.markdown-preview-github-styles` — GitHub-like markdown preview.
- `redhat.vscode-yaml` — YAML language server (schema-aware).
- `tamasfe.even-better-toml` — TOML support.

## Optional (only install if you actually need them)
- `ms-azuretools.vscode-docker` — Docker.
- `ms-vscode-remote.remote-ssh` — Remote SSH dev.
- `github.vscode-pull-request-github` — PR review in editor.
- `wallabyjs.console-ninja` — Inline runtime values (paid for advanced features).

## What we DIDN'T install (and why)
- `GitHub.copilot` — You don't want AI tab completion. Use a sidebar AI app instead.
- `TabNine.tabnine-vscode` — Same reason.
- `formulahendry.code-runner` — Encourages running random snippets; built-in
  debugger + tasks are better.
- `liveServer` — `next dev` / `ng serve` / `vite` cover this for your stack.
