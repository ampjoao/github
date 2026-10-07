#!/usr/bin/env bash
# Instala os 20 repositórios no Claude Code a nível de UTILIZADOR (~/.claude),
# para ficarem disponíveis em todos os projetos, não só neste.
# Requisitos: claude, git, bun (gstack), python3 (book-to-skill).
set -euo pipefail

marketplaces=(
  obra/superpowers
  nextlevelbuilder/ui-ux-pro-max-skill
  Leonxlnx/taste-skill
  pbakaus/impeccable
  heygen-com/hyperframes
  thedotmack/claude-mem
  blader/humanizer
  DietrichGebert/ponytail
  kepano/obsidian-skills
  AgriciDaniel/banana-claude
  ruvnet/ruflo
  affaan-m/ECC
  rshankras/claude-code-apple-skills
)

plugins=(
  superpowers@superpowers-dev
  ui-ux-pro-max@ui-ux-pro-max-skill
  taste-skill@taste-skill
  impeccable@impeccable
  hyperframes@hyperframes
  claude-mem@thedotmack
  humanizer@humanizer
  ponytail@ponytail
  obsidian@obsidian-skills
  banana-claude@banana-claude-marketplace
  ruflo-core@ruflo
  ecc@ecc
  apple-skills@indie-apple-stack
)

for m in "${marketplaces[@]}"; do
  claude plugin marketplace add "$m" --scope user || true
done
for p in "${plugins[@]}"; do
  claude plugin install "$p" --scope user -y || true
done

mkdir -p ~/.claude/skills

# gstack (não é plugin: clone + setup)
if [ ! -d ~/.claude/skills/gstack ]; then
  git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack
fi
(cd ~/.claude/skills/gstack && ./setup --team)

# book-to-skill (skill simples)
if [ ! -d ~/.claude/skills/book-to-skill ]; then
  git clone --depth 1 https://github.com/virgiliojr94/book-to-skill.git ~/.claude/skills/book-to-skill
fi

echo
echo "Feito. Reinicia o Claude Code."
echo "banana-claude fica desativado até configurares a chave Gemini:"
echo "  /plugin configure banana-claude@banana-claude-marketplace"
echo "  claude plugin enable banana-claude@banana-claude-marketplace"
