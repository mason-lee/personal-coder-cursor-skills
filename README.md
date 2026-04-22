# personal-coder-skills

Personal [Cursor Agent Skills](https://cursor.com/) that follow me to every
workspace — Coder remote, local laptop, anywhere.

Each skill is a directory under `skills/` containing a `SKILL.md`. The
`install.sh` script symlinks every one of them under `~/.cursor/skills/` so
the Cursor agent discovers them automatically.

## Intended use

Originally created as a personal skills repo, but structured to be shareable
with coworkers for internal product and engineering workflows.

## Safety / sharing notes

This repo should not contain:
- PHI or patient examples
- API keys, tokens, or secrets
- customer-specific data
- private URLs or credentials

Company-specific workflow references are okay when needed, but prefer generic
wording unless a skill truly depends on an internal system.

## What's in here

| Skill | Scope |
|---|---|
| `pr-scope-discipline` | Never sneak unrelated changes (skills, configs, docs) onto a feature PR. |
| `local-dev-overrides` | Gitignored local dev override files (e.g. `growthbook.dev.local.json`) must never be reverted as part of PR prep. |
| `notion-prd-style` | Terse, demo-first Notion PR update pages in the Freed "PR PRD" database — best for shipped/PR-linked updates, not stakeholder proposals. |
| `notion-product-proposal-style` | Concise stakeholder memos for product proposals in Notion — decision-first, metrics-backed, with rationale, sequencing, and one viable alternative. |

## Which skill should I use?

- `notion-prd-style`
  Use for terse PR-linked Notion updates: demo-first, shipped changes,
  append-only.
- `notion-product-proposal-style`
  Use for stakeholder proposal memos: decision-first, metrics-backed, includes
  rationale, sequencing, and alternatives.
- `pr-scope-discipline`
  Use when working on feature branches or preparing PRs.
- `local-dev-overrides`
  Use when local override files exist and should not be reverted.

## Install on a new machine / workspace

```bash
git clone https://github.com/mason-lee/personal-coder-cursor-skills ~/personal-coder-cursor-skills
bash ~/personal-coder-cursor-skills/install.sh
```

Re-run `install.sh` any time new skills are pulled — it's idempotent.

## Automatic install on every Coder workspace

1. Go to your Coder user settings → **Dotfiles**.
2. Set the **Dotfiles URL** to `https://github.com/mason-lee/personal-coder-cursor-skills`.
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

## Contribution guidelines

Before adding a new skill:
- keep `SKILL.md` concise
- avoid PHI, secrets, and customer-specific examples
- prefer generic wording over team-specific jargon where possible
- document when a skill is internal-company-specific
- include clear "use when..." guidance
