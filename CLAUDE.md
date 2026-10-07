## gstack (recommended)

This project uses [gstack](https://github.com/garrytan/gstack) for AI-assisted workflows.
Install it for the best experience:

```bash
git clone --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack
cd ~/.claude/skills/gstack && ./setup --team
```

Skills like /qa, /ship, /review, /investigate, and /browse become available after install.
Use /browse for all web browsing (Aside first, the bundled gstack browser as fallback). Use ~/.claude/skills/gstack/... for gstack file paths.

## Plugins e skills instalados

Declarados em `.claude/settings.json` (o Claude Code pede para os instalar ao abrir o projeto):
superpowers, ui-ux-pro-max, taste-skill, impeccable, hyperframes, claude-mem, humanizer,
ponytail, obsidian, banana-claude (desativado até configurar a chave Gemini), ruflo-core,
ecc (everything-claude-code) e apple-skills (claude-code-apple-skills).

Skills locais: `.claude/skills/book-to-skill` (`/book-to-skill <livro.pdf>`). gstack: ver acima.

Referência em `vendor/` (submódulos git; `git submodule update --init --depth 1`):
- `vendor/awesome-design-md` — ficheiros DESIGN.md de marcas conhecidas; usar como base de design system.
- `vendor/public-apis` — catálogo de APIs públicas gratuitas; consultar ao escolher uma API.
- `vendor/screenshot-to-code` — app (FastAPI + React) que converte capturas de ecrã em código.
- `vendor/Scrapegraph-ai` — biblioteca Python de scraping com LLMs (`pip install scrapegraphai`).
- `vendor/OmniRoute` — gateway de IA multi-fornecedor (`npx omniroute`).

Para instalar tudo a nível global (todos os projetos): `scripts/install-claude-global.sh`.
