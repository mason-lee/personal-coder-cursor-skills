---
name: local-dev-overrides
description: Leave gitignored local dev override files alone during PR prep. Use when preparing a PR, reviewing working-tree changes, or deciding whether to revert uncommitted edits.
---

# Local Dev Overrides

Gitignored files hold each developer's local configuration. They are never
committed, and they must also **never be reverted or "cleaned up"** as part of
PR prep — they represent the developer's active local dev state.

## Known local-only files

- `growthbook.dev.local.json` — local GrowthBook feature flag overrides, e.g.
  `{"aiux": {"enabled": true}}` or `{"my-flag": true}`.
- `CLAUDE.local.md` — personal agent notes.
- `api_server/.local/` — local server state.

All are listed in `.gitignore` at the repo root.

## Pre-PR / pre-amend checklist

Before `git commit --amend` or `gt submit`:

1. Run `git status` to list working-tree changes.
2. For each path that looks like a local config, verify it is gitignored:
   ```bash
   git check-ignore -v <path>
   ```
   Exit 0 means the path is ignored and will never be part of the commit.
3. Stage only tracked files. Leave gitignored overrides untouched.
4. Do **not** suggest reverting a gitignored file, even if its presence feels
   unexpected. Confirm with the developer before touching it.

## When mentioning these files to the user

State explicitly that the file is gitignored and will not be part of the PR,
so the developer knows no action is required on their side.
