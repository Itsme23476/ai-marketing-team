---
name: market-copy
description: Analyze and rewrite website copy. Use when the user runs "/market copy <url>" or asks to rewrite, improve, or critique website copy, headlines, value propositions, or CTAs. Scores the existing copy, generates on-brand before/after rewrites grounded in proven frameworks, and produces a client-ready COPY-SUGGESTIONS.md.
---

# Copy Analysis & Rewrite

The copywriting engine for `/market copy <url>`. You analyze the live copy, score it, and
generate optimized, on-brand alternatives with concrete before/after examples.

## Before you start

Load `~/.claude/skills/marketing-team/references/playbook.md` and the brand brief, then
dispatch the **`copywriter`** subagent to do the work — scoped to the brand brief, business
type, and fetched page. If `BRAND-VOICE.md` exists, hand it over so generated copy matches the
documented voice. Apply the playbook rules (brand grounding, tiered data, honest ROI); don't
restate them.

## Phase 1 — Discovery

1. **Fetch the page.** Use a Tier-1 MCP tool if one is connected (playbook Rule 2); otherwise
   `WebFetch`. Pull the H1, subhead, hero copy, all section headlines, key body paragraphs,
   every CTA, nav/footer labels, meta title/description, and social proof.
2. **Structured facts** (CTAs, forms, meta, schema):
   ```bash
   python3 ~/.claude/skills/marketing-team/scripts/analyze_page.py <url>
   ```
   Fall back to WebFetch parsing if unavailable; note reduced precision. Label the tier used.
3. **Detect page type** — it sets copy priorities:

| Page type | Primary goal | Copy priority |
|-----------|-------------|---------------|
| Homepage | Communicate value prop, route visitors | Headline clarity, nav clarity, CTA hierarchy |
| Landing | Single conversion action | Headline↔CTA alignment, objection handling, urgency |
| Pricing | Drive plan selection | Plan naming, feature framing, anchoring, FAQ |
| About | Build trust | Story, mission, credibility, values |
| Product (ecom) | Demonstrate product value | Feature→benefit, social proof, specs |
| Feature (SaaS) | Explain a capability | Problem→solution, use cases, comparison |
| Contact/Demo | Capture lead | Form headline, friction reduction, trust |

4. **Read the existing voice** so rewrites match it (unless the brand brief sets a target voice
   the page is failing to hit — then write toward the brief).

## Phase 2 — Score the copy

Score five dimensions 0–10 (total ×2 → /100):

| Dimension | Measures |
|-----------|----------|
| Clarity | Could a non-expert grasp what you do, fast? No jargon/fluff. |
| Persuasion | Does it move the reader to act and handle objections? |
| Specificity | Concrete numbers, outcomes, timeframes vs vague claims? |
| Emotion | Connects to pain, desire, identity, aspiration? |
| Action | CTAs clear, compelling, well-placed, low-friction? |

Run the **5-Second Test** on the headline (does a new visitor get what you do and who it's for
in 5 seconds?) and document the **value prop**: target customer · problem · solution · unique
mechanism · key benefit · proof. Flag any missing element.

## Phase 3 — Generate (on-brand)

Use proven frameworks to produce alternatives that reflect the brand brief's voice, audience,
and offer:

- **Headlines** — generate 5–10 using PAS (Problem-Agitate-Solve), AIDA, Before-After-Bridge,
  and 4U (Useful · Ultra-specific · Unique · Urgent). Rank by estimated effectiveness.
- **CTAs** — first person, value-loaded, risk-reducing, specific
  ("Start My Free Trial" not "Submit"; "Get the 2026 Guide" not "Download"). Check coverage:
  CTA above the fold, after each major section, repeated at the bottom, sticky on long pages.
- **Before/after pairs** — at least 5, each with a one-line *why*, covering the H1, subhead,
  primary CTA, one body paragraph, and the meta description. Quote the real current copy.
- **Swipe file** — 10 headlines, 5 subheads, 5 CTAs, 3 meta descriptions, 3 social-proof framings.

For impact, follow honest-ROI: describe leverage ("tightening this headline typically lifts
hero CTR 5–15% — illustrative, industry benchmark"), never invented dollar figures.

## Output: COPY-SUGGESTIONS.md

Lead with business name, URL, date, and data tier (playbook Rule 4).

```markdown
# Copy Analysis & Suggestions: [Business Name]
**URL:** [url] · **Date:** [date] · **Page Type:** [type]
**Data:** [tier — e.g. WebFetch + analyze_page.py]
**Copy Score: [X]/100**

## Executive Summary
[2–3 paragraphs: copy quality, top strength, priority fixes — tied to the brand brief's goal.]

## Score Breakdown
[5-dimension rubric with justifications and quoted copy.]

## Value Proposition Analysis
[Canvas with gaps flagged.]

## Headline Recommendations
[Current headline + 10 ranked alternatives, each labeled with the framework used.]

## Section-by-Section Suggestions
[Per section: current copy → issue → recommended copy → rationale.]

## CTA Optimization
[Every CTA analyzed + recommended text and placement.]

## Before/After Examples
[≥5 pairs, each with a why.]

## Swipe File
[All headline / subhead / CTA / meta alternatives.]

## Implementation Priority
[🔴/🟡/🟢 ranked, each with labeled leverage range.]

*Generated by your AI Marketing Team — /market copy*
```

## Terminal summary

```
=== COPY ANALYSIS: [Business] ===
Page Type: [type]   Voice: [casual/formal · simple/technical]
Copy Score: [X]/100
  Clarity     [X]/10 ████████░░
  Persuasion  [X]/10 ██████░░░░
  Specificity [X]/10 ███████░░░
  Emotion     [X]/10 █████░░░░░
  Action      [X]/10 ████████░░
Top fix: [#1 before/after]
Saved to COPY-SUGGESTIONS.md · Next: /market brand (voice guide) or /market landing
```

## Chaining

Use `BRAND-VOICE.md` to calibrate voice and `COMPETITOR-REPORT.md` for differentiation if they
exist. Suggest `/market landing` for a CRO deep dive or `/market brand` for voice guidelines.
