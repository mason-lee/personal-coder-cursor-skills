---
name: notion-product-proposal-style
description: Write concise Notion product proposal memos for stakeholder alignment. Use when creating or revising a proposal, strategy memo, rollout plan, or decision doc for PMs, VP Product, Head of Product, or cross-functional leads. Includes rationale, sequencing, alternatives, and metrics.
---

# Notion Product Proposal Style

Use for stakeholder-facing Notion docs that need approval, alignment, or
feedback on a product direction.

Do **not** use this for PR update pages that are demo-first and append-only.
Use `notion-prd-style` for those.

## Safety

Do not include PHI, patient examples, secrets, tokens, customer-specific data,
or private URLs in proposal docs. Keep examples and references generic unless a
specific internal system is essential to the proposal.

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

## Prose formatting (Mason's preferences)

A stakeholder memo is prose-heavy. Loud inline formatting on every
identifier distracts from the decision ask.

- **Italic over backticks for identifiers in prose.** Data-model fields
  (*patient_id*), feature-flag names (*aiux*), component names, branch
  names, and UI button labels referenced in copy go in `*italics*` when
  embedded in sentences. Reserve backticks for actual code snippets or
  fenced code blocks.
- **Product name in prose, codename only for technical identifiers.**
  Refer to the shipped product by its user-facing name ("Freed 2.0") in
  executive summary, proposal, and success metrics sections. Internal
  codenames (e.g. *aiux*) appear only when pointing to a feature flag,
  `data-testid`, or file path, still rendered in *italics*.
- **Round in prose, precise in tables.** Striking precision (e.g.
  "0.005%") can feel alarmist or nitpicky in an executive summary.
  Round in the narrative ("\~50%") and keep the precise figure in the
  backing analytics or table.
- **Don't repeat the same stat.** If "47%" appears in the executive
  summary, analytics, and success metrics, each instance has to add
  something distinct (hook, data, target). Pure restatements get cut.
- **Consolidate related bullets.** If two bullets share the same
  underlying idea, merge them rather than list them separately.
- **Respect prior user edits on revision passes.** If the user manually
  trimmed content between turns, do not re-introduce the deleted
  material under a different structure when doing further polish. Ask
  before putting it back.
- **Grammar-polish the executive summary.** Stakeholders read it
  verbatim — catch subject/number agreement and preposition drift
  before shipping.

## Notion-flavored Markdown reminders

- Use tabs (not spaces) to indent children of `<callout>` and `<columns>`.
- Inline identifiers go in `*italics*` per the prose formatting rule
  above; backticks are for actual code blocks only.
- Tables use `<table fit-page-width="true" header-row="true">` with plain
`<tr>` / `<td>` children on their own lines.
- `<empty-block/>` must be on its own line to render as a blank line.

