# personal-coder-skills

Personal [Cursor Agent Skills](https://cursor.com/) that follow me to every
workspace — Coder remote, local laptop, anywhere.

Each skill is a directory under `skills/` containing a `SKILL.md`. The
`install.sh` script symlinks every one of them under `~/.cursor/skills/` so
the Cursor agent discovers them automatically.

## What's in here

| Skill | Scope |
|---|---|
| `pr-scope-discipline` | Never sneak unrelated changes (skills, configs, docs) onto a feature PR. |
| `local-dev-overrides` | Gitignored local dev override files (e.g. `growthbook.dev.local.json`) must never be reverted as part of PR prep. |
| `notion-prd-style` | Terse, demo-first Notion PR update pages in the Freed "PR PRD" database — best for shipped/PR-linked updates, not stakeholder proposals. |
| `notion-product-proposal-style` | Concise stakeholder memos for product proposals in Notion — decision-first, metrics-backed, with rationale, sequencing, and one viable alternative. |

## Install on a new machine / workspace

```bash
git clone https://github.com/mason-lee/personal-coder-skills ~/personal-coder-skills
bash ~/personal-coder-skills/install.sh
```

Re-run `install.sh` any time new skills are pulled — it's idempotent.

## Automatic install on every Coder workspace

1. Go to your Coder user settings → **Dotfiles**.
2. Set the **Dotfiles URL** to `https://github.com/mason-lee/personal-coder-skills`.
3. Any new workspace will clone this repo and run `install.sh` on startup.

Reference: [Coder dotfiles docs](https://coder.com/docs/user-guides/workspace-dotfiles).

## Adding a new skill

```bash
mkdir skills/my-new-skill
$EDITOR skills/my-new-skill/SKILL.md
git add skills/my-new-skill
git commit -m "skills: add my-new-skill"
git push
# then on each machine: git pull && bash install.sh
```
