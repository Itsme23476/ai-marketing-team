---
name: market-competitors
description: Competitive intelligence and positioning analysis. Use when the user runs "/market competitors <url>" or asks who the competitors are, for a competitor comparison, positioning map, SWOT, differentiation strategy, or steal-worthy tactics. Dispatches the competitive-analyst specialist and produces a client-ready COMPETITOR-REPORT.md.
---

# Competitive Intelligence (competitive-analyst)

The rival-analysis review for `/market competitors <url>`. You dispatch the
`competitive-analyst` specialist to identify competitors, analyze their marketing, and
produce a client-ready `COMPETITOR-REPORT.md` with positioning gaps and differentiation moves.

## Before you start

Load `~/.claude/skills/marketing-team/references/playbook.md` and the brand brief (Rule 1).
Dispatch the **`competitive-analyst`** subagent with the brand brief, business type (Rule 5),
and the target site data. Apply the playbook rules — don't restate them. Label your data tier
(Rule 2) and never invent competitor metrics (follower counts, ratings, ad spend) you couldn't
verify (Rule 3); mark unverified figures `(estimated)`.

## Phase 0 — Gather data (tiered)

1. **Target + competitor pages.** Fetch the target and each competitor:
   ```bash
   python3 ~/.claude/skills/marketing-team/scripts/competitor_scanner.py --url <url> --output json
   ```
   This collects homepage content/metadata, pricing, blog topics, social links, and stack
   signals. If unavailable, use `WebFetch` per competitor and note reduced precision.
2. **Live web research (Tier 1 if connected).** Finding competitors needs real search. Use
   `ToolSearch` (e.g. "web search", "tavily", "search") to find a connected web-search MCP
   (Tavily-style) and prefer it for SERP discovery, "alternatives"/"vs" queries, and review
   mining. Otherwise fall back to `WebSearch`/`WebFetch`.
3. **Label the tier**, e.g. `Data: competitor_scanner.py + Tavily MCP` or
   `Data: WebFetch + WebSearch — connect a web-search tool for deeper SERP coverage`.

## Phase 1 — Identify competitors

Find across three tiers and confirm each with evidence:
- **Direct** (3–5) — same product, same audience. Search category keywords, "[brand]
  alternatives", "[brand] vs", check who ranks page 1.
- **Indirect** (2–3) — different product, same problem solved.
- **Aspirational** (1–2) — category leaders the brand wants to become.

Cross-check via review platforms (G2/Capterra/Trustpilot), the target's comparison/
integration pages, and community mentions (Reddit, X).

## Phase 2 — Analyze each competitor

- **Messaging** — exact H1, subhead, value prop, target audience, key differentiator, tone,
  social-proof type (quote real copy, Rule 4).
- **Pricing** — free plan, tier prices, trial, annual discount, model (per-seat/usage/flat),
  transparency. Mark any price you couldn't read directly `(estimated)`.
- **Features** — Full / Partial / No / Beta matrix vs the target. Highlight target moats,
  target gaps, and competitor-unique features.
- **SEO/content** — est. blog volume, cadence, depth, key topics; content gaps where rivals
  rank and the target doesn't.
- **Social presence** — platforms, follower scale, cadence, top content type (label
  estimates).
- **Review mining** — rating, review count, top 3 praises, top 3 complaints, switching
  reasons.

## Phase 3 — Positioning & SWOT

- **Positioning map** — plot rivals on two industry-relevant axes (e.g. simple↔powerful ×
  budget↔premium). Show where the target sits and the open territory.
- **Per-competitor SWOT** with evidence, then an **aggregate SWOT for the target**:
  where it wins, where it lags, unserved gaps, and the sharpest threats.

## Phase 4 — Strategic recommendations

- **Steal-worthy tactics** (5–10) — proven, adaptable, currently-unused tactics. Each: why it
  works, how to implement, effort (L/M/H), expected leverage (L/M/H — not a dollar figure).
- **Differentiation strategy** — pick angles among category / audience / feature / philosophy
  / experience. Give a positioning statement + headline + proof points per viable angle.
- **Alternative pages** — outline "[Target] vs [Competitor]" pages targeting high-intent
  "[competitor] alternative" searches (comparison table, where each wins, ICP, switcher
  stories, FAQ, CTA).
- **Switching narratives** — why customers switch (from review mining) + a switcher story
  template + a switching offer.
- **Monitoring plan** — alerts, pricing/review checks, ad-library tracking, and a short
  competitive-response playbook (price cut → emphasize value, not a price war; etc.).

## Output: COMPETITOR-REPORT.md

Lead with brand name, URL, date, data tier (Rule 4).

```markdown
# Competitive Intelligence Report: [Target Brand]
**URL:** [url] · **Date:** [date] · **Competitors:** [count]
**Data:** [tier] · **Competitive Position: [Strong/Moderate/Weak]**

## Executive Summary
[Landscape, target's position, biggest advantage, biggest threat, top 3 moves — tied to the
brand brief's goal.]

## Competitor Overview
[Direct / Indirect / Aspirational summary tables: name, URL, positioning, pricing, differentiator]

## Detailed Competitor Profiles
[Per competitor: messaging, pricing, features, SWOT, social, reviews — with quoted copy]

## Comparison Tables
[Feature matrix · Pricing matrix · Review ratings · Social presence — estimates labeled]

## Positioning Map
## Content & SEO Gap Analysis
## SWOT — [Target Brand]

## Strategic Recommendations
### Steal-Worthy Tactics  [effort + leverage labels]
### Differentiation Strategy
### Alternative Pages to Create
### Switching Narratives
## Competitive Monitoring Plan

## Next Steps
1. … 2. … 3. …

*Generated by your AI Marketing Team — /market competitors*
```

## Terminal summary

```
=== COMPETITIVE INTELLIGENCE COMPLETE ===
Target: [name]   Competitors: [count]   Position: [Strong/Moderate/Weak]
Data: [tier]
  Direct:       [Comp A], [Comp B]
  Aspirational: [Comp E]
Biggest advantage: [one line]   Biggest threat: [one line]
Feature gaps: [N]   Content gaps: [N]   Pricing: [Above/At/Below] market
Top fix: [#1 action]
Saved to COMPETITOR-REPORT.md · Next: /market copy or /market ads
```

## Notes

- If `MARKETING-AUDIT.md`, `COPY-SUGGESTIONS.md`, or `FUNNEL-ANALYSIS.md` exist, fold their
  findings into positioning and differentiation.
- If no web-search MCP is connected, end with the upgrade hint: connect a web-search tool
  (e.g. Tavily) for deeper competitor and review coverage.
