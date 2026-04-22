---
name: notion-product-proposal-style
description: Write concise Notion product proposal memos for stakeholder alignment. Use when creating or revising a proposal, strategy memo, rollout plan, or decision doc for PMs, VP Product, Head of Product, or cross-functional leads. Includes rationale, sequencing, alternatives, and metrics.
---

# Notion Product Proposal Style

Use for stakeholder-facing Notion docs that need approval, alignment, or
feedback on a product direction.

Do **not** use this for PR update pages that are demo-first and append-only.
Use `notion-prd-style` for those.

## Default audience

Assume the reader is a PM, VP Product, Head of Product, or product/engineering
lead who wants to answer:

1. What is the proposal?
2. Why now?
3. What is low risk vs high risk?
4. What decision am I being asked to make?

Optimize for fast decision-making, not exhaustive documentation.

## Default structure

Use this shape unless the user asks for something else:

```md
<callout icon="⚙️">
	**Status:** <Proposal draft | In review | Approved>
	**Author:** <Name>
	**Date:** <Month Day, Year>
	**Primary stakeholder:** <Name, title>
	**Stakeholders:** <PMs, leads, etc.>
	**Delivery shape:** <short rollout summary>
</callout>

## Executive summary
<2-4 short paragraphs>

## Decision requested
- <what needs approval now>
- <what is part of the proposal but staged later>

## Key analytics
- <1-3 bullets only>

## Proposal
### Core launch
- <scope>
### Later-stage test
- <higher-risk piece>

## Alternative considered
**Alternative:** <one viable alternative>
**Why not recommended:** <1-3 sentences>

## Success metrics
- <guardrails>
- <outcomes>

## Decisions needed
- <flat list>
```

## Writing rules

- **Lead with the ask.** The executive summary should make the proposal legible
  without reading the rest.
- **Be concise.** Prefer short paragraphs and flat bullets. Avoid long
  background sections.
- **Separate low-risk and high-risk changes.** If the proposal contains mixed
  risk, recommend a staged rollout instead of bundling them together.
- **Use analytics for meaning, not decoration.** State the takeaway in plain
  English after the number.
- **Include one viable alternative.** Do not use a strawman; name a real option
  and its tradeoffs.
- **Call out timing if it matters.** If launch timing, platform expansion, or
  shared infrastructure makes the moment important, say so in the executive
  summary.
- **Prefer rewrite-in-place.** For proposal docs, refine the same memo rather
  than append new versions, unless the user explicitly wants versioned history.

## What to include

- Why this proposal makes sense strategically
- What ships now vs later
- What is low risk vs higher risk
- What metrics will prove success or failure
- What stakeholder approvals are needed

## Avoid by default

- File lists
- Implementation details that do not affect risk or scope
- Multi-section PR changelogs
- Demo-first framing when the goal is decision-making
- More than one alternative unless the user asks

## Metrics guidance

- Prefer 1-3 high-signal metrics in the main memo.
- Use metrics to justify sequencing decisions.
- Distinguish between **population-level risk** and **high-intent cohort risk**
  when relevant.
- If a metric is ambiguous, say what it does and does not prove.

## Notion-flavored Markdown reminders

- Use tabs (not spaces) to indent children of `<callout>` and `<columns>`.
- Inline code uses backticks.
- Tables use `<table fit-page-width="true" header-row="true">` with plain
  `<tr>` / `<td>` children on their own lines.
- `<empty-block/>` must be on its own line to render as a blank line.
