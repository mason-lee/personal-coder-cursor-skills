---
name: pr-scope-discipline
description: Mason's rule — never add unrelated changes (skills, rules, config, tooling, docs) to a feature PR without explicit permission. Use whenever staging, committing, or force-pushing onto a branch that already has an open PR.
---

# PR Scope Discipline (Mason's rule)

## The rule

**A PR contains only changes directly related to its stated purpose.** If a
task produces incidental artifacts (new skills, agent rules, local tooling,
unrelated doc tweaks, dev-only config), they do **not** go on the feature
branch. Ever — unless Mason explicitly says to.

## What counts as "unrelated"

Anything the PR's title and description would not lead a reviewer to expect,
including but not limited to:

- `.claude/skills/**`, `.cursor/rules/**`, `~/.cursor/skills/**` edits
- `AGENTS.md` / `CLAUDE.md` edits
- Changes to unrelated app features just because they were noticed in passing
- Dev tooling, editor config, scripts, CI tweaks that are not required by the
  feature itself
- Dependency bumps not required by the feature

## The mistake to avoid (real example)

While cleaning up PR #13019 (visit list v3), the agent created a new skill at
`.claude/skills/local-dev-overrides/` and committed it on the same branch as
`skills: add local-dev-overrides guidance`. Mason had to ask for it to be
reverted. The skill was a legitimate artifact but belonged on a separate
branch/PR.

## Correct workflow when incidental changes appear

1. **Do the primary work** and stage only its files.
2. **Leave incidental files untracked** in the working tree. Untracked files
   survive branch switches, so nothing is lost.
3. **Mention the stray files explicitly** in the final summary to Mason:
   > "Also in the working tree but not committed: `<path>`. Want me to put
   > these on a separate branch?"
4. **Wait for explicit confirmation** before adding them to the PR or creating
   a new one.

## When Mason says "amend" or "clean up this PR"

Amend or squash **only the commits that belong to the PR**. Do not fold in
anything new that wasn't already on the branch. If there are staged or
untracked files unrelated to the PR's purpose, leave them out and note them
in the summary.

## Pre-push checklist

Before `git push`, `git push --force-with-lease`, or `gt submit`:

1. `git log --oneline origin/main..HEAD` — confirm every commit on the branch
   matches the PR's stated scope.
2. `git status` — confirm no files unrelated to the PR are staged.
3. If a commit snuck in that shouldn't be on this PR, drop it with
   `git reset --soft HEAD~N` and restage/commit only what belongs.
