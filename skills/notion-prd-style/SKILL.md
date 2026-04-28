---
name: notion-prd-style
description: Style rules for PR update pages in the "PR PRD" Notion database. Use when creating or appending terse, demo-first Notion updates tied to a PR or shipped iteration. Not for stakeholder proposal memos; use notion-product-proposal-style for those.
---

# Notion PR Update Style

Applies to pages in the "PR PRD" data source (parent
`collection://34473e86-8e19-8005-94d2-000bbe7acf88`), e.g.
`AIUX Visit List — Bulk Selection & Deletion Redesign`.

Use this skill for **PR-linked update sections**. If the user wants a
stakeholder memo with rationale, sequencing, alternatives, or decision asks,
use `notion-product-proposal-style` instead.

## Safety

Do not include PHI, patient examples, secrets, tokens, customer-specific data,
or private URLs in PR update pages. Keep examples and references generic unless
an internal workflow reference is required for the review context.

## Section template for a new PR or follow-up iteration

Use this exact skeleton. Drop sections that do not apply; do not add new ones
without being asked.

```
---
## <Title — short noun phrase, not a sentence>
<callout icon="<emoji>">
	**Status:** <In draft | In review | Merged>
	**Author:** <Name>
	**Date:** <Month Day, Year>
	**PR:** [#<num>](<github url>)
	**Branch:** `<branch name>`
</callout>
### Demo
<video src="<loom url>"></video>
### Before / After
<columns>
	<column>
		**Before**
		![Before screenshot](<url>)
	</column>
	<column>
		**After**
		![After screenshot](<url>)
	</column>
</columns>
### What changed
- **<Feature name in bold>** — one-sentence description.
- **<Feature name in bold>** — one-sentence description.
```

## Audience

The readers are **stakeholders** (PMs, designers, leads, other engineers) who
have **never seen intermediate implementation states**. They only ever see
what shipped to production. Write every bullet from that outside-in
perspective.

## Rules

- **Demo first.** The Loom video goes immediately under the metadata callout,
  under a `### Demo` heading. Don't bury it below prose.
- **"What changed" bullets only.** Each bullet starts with the feature in
  **bold**, em-dash, then a single-sentence explanation. No sub-bullets, no
  intro paragraph before the list.
- **Heading is `### What changed`**, not `### What changed in this iteration`
  or `### Summary`.
- **Frame each bullet as shipped → shipped, not dev-branch → shipped.** Use
  "previously X; now Y" when it helps, but X must be what was live in
  production before this PR, not an intermediate draft or a bug that only
  existed while the PR was being built.
- **Update the status as the PR progresses.** In draft → In review → Merged.
  When appending a follow-up iteration, also go back and update the prior
  section's status if it has moved on.
- **Metadata callout is tight.** Status / Author / Date / PR / Branch. Nothing
  else.
- **Never delete existing content.** Append new iterations below the previous
  section, separated by a `---` divider.
- **Before/After screenshots are mandatory for UI changes.** Every PR that
  touches the UI must include a side-by-side comparison showing the
  production state (before) and the PR state (after). Place them under a
  `### Before / After` heading, between Demo and What changed.

## Before / After screenshot capture

For any PR with UI changes, capture screenshots of the relevant screens
from both the current production state and the PR branch. This gives
reviewers an instant visual diff without needing to check out the code.

### Capture workflow

1. **Before (main branch):**
   - Check out the latest remote `main` branch (or use the production app).
   - Navigate to the affected screen(s) in the browser.
   - Take a screenshot of each screen that the PR changes. Use the
     browser MCP tools (`browser_take_screenshot`) or manual capture.
   - Save each screenshot with a descriptive name
     (e.g. `before-visit-list.png`).

2. **After (PR branch):**
   - Check out the PR branch and run the app locally.
   - Navigate to the same screen(s), matching the same state and viewport
     as the "before" screenshots as closely as possible.
   - Take a matching screenshot for each.

3. **Upload and embed:**
   - Upload both images to the Notion page (or a shared image host).
   - Embed them in a `<columns>` block under `### Before / After`:
     ```
     ### Before / After
     <columns>
     	<column>
     		**Before**
     		![Before screenshot](<url>)
     	</column>
     	<column>
     		**After**
     		![After screenshot](<url>)
     	</column>
     </columns>
     ```

### Rules for screenshots

- **Match the viewport and state.** Both screenshots should show the same
  screen, same data (or equivalent), same window width. The only
  difference should be the UI change itself.
- **Crop to the relevant area.** Full-page screenshots are fine for layout
  changes; crop to the component for focused changes (e.g. a button
  redesign or a single panel tweak).
- **Multiple pairs are OK.** If the PR affects several screens or states
  (e.g. empty state, loaded state, error state), include a pair for each.
  Stack them vertically, each in its own `<columns>` block.
- **Skip for non-visual changes.** If the PR is purely backend, data, or
  logic with no visible UI impact, omit the Before / After section.

## Metric placeholders (`[ADD_METRIC]`)

When generating a PRD, look for places where a concrete usage stat would
strengthen the case — adoption rates, event volumes, conversion funnels,
error rates, latency percentiles, or any quantitative signal that makes the
"why" more persuasive. If the data is not available from context, insert a
placeholder:

```
[ADD_METRIC: <plain-English description of the stat needed>]
```

### Where to place markers

- **"Why this matters" / context sections** — adoption or frequency stats
  that justify the change (e.g. how often users hit the pain point today).
- **Before/after comparison tables** — baseline metrics the reviewer can
  compare against after the change ships.
- **Callout blocks** — headline stats that anchor a section
  (e.g. "**X% of DAU** use this feature").
- **Inline in prose** — when a sentence makes a claim that would land
  harder with a number behind it.

### Rules for markers

- Keep the description specific enough that someone can query it without
  re-reading the whole PRD. Bad: `[ADD_METRIC: usage data]`.
  Good: `[ADD_METRIC: daily unique users who trigger bulk delete, last 30d]`.
- Include the time window or comparison period when relevant
  (e.g. "last 30d", "week-over-week", "since launch").
- If a table has multiple rows that need data, put one marker per row
  rather than a single marker for the whole table.
- Don't over-mark. One or two well-placed metrics per section is plenty.
  If a section doesn't need data to make its point, skip it.

## Analytics prompts

At the end of the generated PRD — below all content sections and the
`<empty-block/>` — append a **📊 Analytics prompts** block. This gives
the author ready-to-paste prompts for their internal analytics tool to
fill in each `[ADD_METRIC]` placeholder.

### Format

```
---
### 📊 Analytics prompts
Use these with your analytics tool to fill in the `[ADD_METRIC]` placeholders above.

1. **<Short label matching the marker>**
   > "<Natural-language question phrased for a data analyst or analytics AI.
   >  Include: metric name, entity (users / events / sessions), time window,
   >  any breakdowns (by platform, user segment, etc.), and desired output
   >  format (single number, trend, table).>"

2. **<Next marker>**
   > "..."
```

### Rules for prompts

- **One prompt per `[ADD_METRIC]` marker**, numbered to match.
- **Write the prompt as a complete, self-contained question.** The person
  pasting it into the analytics tool should not need to look up context.
  Include the feature name, relevant event names or table names if known,
  the time window, and what shape the answer should take.
- **Suggest breakdowns when useful** — by platform (web / mobile / desktop),
  by user role, by cohort, by time period — but only when the breakdown
  would actually inform the PRD narrative.
- **If event or table names are unknown, describe the behavior instead.**
  The analytics tool can map behavior descriptions to the right data
  source. E.g. "How many users delete 2+ visits in a single session?"
  rather than "Query the `visit_bulk_delete` event."
- **Keep prompts concise.** One to three sentences max. The analytics tool
  doesn't need preamble or politeness.
- **Remove the analytics prompts section when all markers are filled.**
  Once the author has replaced every `[ADD_METRIC]` with real data, delete
  the prompts block — it's scaffolding, not part of the final doc.

## Drop these by default

Do not add these sections or phrases unless the user explicitly asks for them:

- "Why it looks the way it does" / design rationale / rejected alternatives
- "States to keep in mind when reviewing" matrices
- "Files touched" lists — the reviewer can see them in the PR diff
- Multi-paragraph intros before the "What changed" bullets
- **Implementation-only artifacts** — bugs that only existed on a dev branch
  and were fixed before shipping (e.g. "no longer duplicates per group",
  "no longer disappears on empty lists"), "we tried X first", or any
  mid-implementation state no stakeholder ever saw.

## Prose formatting (Mason's preferences)

The PRD is read top-to-bottom by stakeholders. Loud inline formatting on
every identifier makes the page feel like a code review instead of a
product update. Default to the quieter option.

- **Italic over backticks for identifiers in prose.** Data-model fields
  (*patient_id*, *patient_name*), feature-flag names (*aiux*), component
  and prop names (*PatientNameAutocomplete*, *predictedPatientName*),
  branch names (*mason/feature-foo*), UI button labels referenced in
  copy (*✓ Confirm*, *Review ▼*), and `data-testid` values should be
  wrapped in `*italics*` when they appear inside sentences. Backticks
  are visually loud; reserve them for actual code blocks or fenced
  snippets (e.g. inside `<code language="...">` and SQL / shell
  examples).
- **Product name in prose, codename only for technical identifiers.**
  Refer to the shipped product by its user-facing name ("Freed 2.0"),
  never by its internal codename, in prose. The codename (e.g. *aiux*)
  is reserved for the GrowthBook flag, `data-testid` attributes, and
  file paths, and is still rendered in *italics* per the rule above.
- **Don't repeat the same stat across sections.** If a headline number
  (e.g. "47% ignored") appears in the TL;DR, the table, and the success
  metrics, each instance has to add something distinct (hook vs. data
  vs. target). Pure restatements — especially a bullet that just
  re-quotes numbers already visible in a table above it — get deleted.
- **Drop "what this tells us" bullets that just restate the table.**
  A takeaway section should add a non-obvious strategic frame or not
  exist at all. When in doubt, collapse to a one-sentence takeaway
  directly under the table.
- **Round numbers in prose, precision in tables.** Striking precision
  (e.g. "0.005% explicit confirm") often reads as alarmist or nitpicky
  inside a TL;DR. Round in narrative ("\~50%") and keep the precise
  figure in the backing table / analytics section.
- **Consolidate related bullets.** If two bullets are expressing the
  same underlying idea (e.g. "unlocks predictive summary" +
  "unlocks carry-forward", both keyed off the same patient context
  page), merge them into one bullet instead of listing them
  separately.
- **Respect prior user edits on revision passes.** If the user manually
  removed bullets, stats, or phrasing between turns, do not silently
  re-introduce the deleted content under a different structure when
  you do further polish. Ask before putting it back.
- **Grammar-polish TL;DR and section leads.** These get read verbatim.
  Catch subject/number agreement ("leaving a visit" →
  "leaving those visits"), preposition drift, and dangling phrases
  before shipping the doc.

## Notion-flavored Markdown reminders

- Use tabs (not spaces) to indent children of `<callout>` and `<columns>`.
- Inline identifiers go in `*italics*` per the prose formatting rule
  above; backticks are for actual code blocks only.
- Escape a leading `~` in prose as `\~` (the doc uses this for "\~30k").
- Tables use `<table fit-page-width="true" header-row="true">` with plain
  `<tr>` / `<td>` children on their own lines, no extra indentation.
- `<empty-block/>` must be on its own line to render as a blank line.

## Safe-append workflow (never delete existing content)

1. `notion-fetch` the page to get current content.
2. Pick the last 2–3 lines of the existing content as `old_str` so the match
   is unique and local to the end of the doc.
3. Call `notion-update-page` with `command: "update_content"` and one
   `content_updates` entry whose `new_str` is `old_str` + `\n---\n<new section>`.
4. Re-fetch and verify nothing above the append point changed.
