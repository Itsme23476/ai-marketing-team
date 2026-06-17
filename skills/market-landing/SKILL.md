---
name: market-landing
description: Conversion-rate-optimization teardown of a landing page. Use when the user runs "/market landing <url>" (or "/market cro <url>") or asks to review, audit, or improve a landing page's conversion — signup, lead capture, or purchase rates. Produces a scored, section-by-section, client-ready LANDING-CRO.md.
---

# Landing Page CRO Teardown

The CRO engine for `/market landing <url>`. You produce a section-by-section teardown with a
score and prioritized, on-brand fixes that move conversion.

## Before you start

Load `~/.claude/skills/marketing-team/references/playbook.md` and the brand brief, then dispatch
**`performance-marketer`** (conversion, forms, friction, speed) and **`copywriter`** (headline,
value prop, CTA copy) in parallel, both scoped to the brand brief and fetched page. Synthesize
their findings into one ranked list. Apply the playbook rules; don't restate them.

## Phase 1 — Fetch and classify

Use a Tier-1 MCP tool if connected (playbook Rule 2), else `WebFetch`; for structured facts
(CTAs, forms, tracking, schema, meta) run
`python3 ~/.claude/skills/marketing-team/scripts/analyze_page.py <url>` and label the tier.

Identify the page type — it sets the benchmark conversion range used for context (all ranges are
industry benchmarks, label them `(illustrative)`, never claim them as this page's numbers):

| Page type | Goal | Good CR | Great CR |
|-----------|------|---------|----------|
| Lead capture | Form submit | 5–10% | 15%+ |
| SaaS signup | Trial/freemium | 3–7% | 10%+ |
| E-commerce product | Add to cart | 2–4% | 5%+ |
| Webinar | Register | 20–30% | 40%+ |
| Waitlist | Join | 15–25% | 35%+ |
| Consultation | Book a call | 5–10% | 15%+ |

## Phase 2 — 7-point framework (score each 1–10, weighted)

1. **Hero (25%)** — headline visible <2s, benefit-driven, <10 words; subhead adds specificity;
   primary CTA above the fold, contrasting, action-oriented; supporting (non-stock) visual;
   trust signal above the fold; no competing nav on a dedicated LP.
2. **Value proposition (20%)** — what it does, specific outcomes, differentiation, clear target,
   quantified, scannable. Test against 4U: Useful · Urgent · Unique · Ultra-specific.
3. **Social proof (15%)** — ≥2 types, named testimonials with photos and specific results,
   recognizable logos, specific numbers ("11,847" > "10,000+"), placed near CTAs.
4. **Features & benefits (15%)** — features translated to benefits, scannable, most-important
   first, visuals, 3–7 key items. (Bad: "AI analytics dashboard." Good: "See which campaigns
   drive revenue — the AI reads your data so you don't have to.")
5. **Objection handling (10%)** — FAQ covers top 3–5 objections, risk reversal (guarantee,
   free trial, cancel anytime), pricing transparency, security/privacy signals.
6. **CTA (10%)** — value not action, visually dominant, repeated on long pages, secondary CTA
   for the not-ready, supporting microcopy ("No credit card required"), first person.
7. **Footer & secondary (5%)** — final CTA, contact/support, legal links, repeated trust badges,
   no leak-away links.

## Phase 3 — Copy, form, mobile, speed

- **Copy score (1–10 each, avg ×10 → /100):** Clarity · Urgency · Specificity · Proof · Action.
- **Form:** field count (each extra field ~−7% conversion; lead capture 3–5 max), label style,
  button text, inline validation, multi-step for long forms, mark optional not required,
  appropriate mobile input types.
- **Mobile (60%+ of traffic):** thumb-reachable CTA, 16px+ body text, large tap targets, no
  horizontal scroll, sticky CTA on scroll.
- **Speed:** flag unoptimized images, render-blocking JS, no CDN, excess third-party scripts.
  Frame impact as a benchmark range — e.g. "3–5s load typically costs ~20% of conversions
  (illustrative, industry benchmark)" — never a fabricated dollar figure (playbook Rule 3).

## Phase 4 — A/B test backlog

Frame each as a hypothesis: *"If we [change], then [metric] will [improve] because [reason]."*
Cover headline, CTA text/color, social-proof placement, field count, hero image vs video, urgency
elements, testimonial format.

## Output: LANDING-CRO.md

Lead with business name, URL, date, page type, and data tier (playbook Rule 4).

```markdown
# Landing Page CRO Analysis: [Business Name]
**URL:** [url] · **Date:** [date] · **Page Type:** [type] · **Data:** [tier]
**Overall CRO Score: [X]/100**
**Benchmark CR for this page type:** [range] (illustrative — industry benchmark)

## Executive Summary
[2–3 paragraphs: biggest leverage point, tied to the brand brief's goal.]

## Section-by-Section Analysis
### 1. Hero [X/10]
**Findings:** [observations, quote real copy]
**Fixes (🔴/🟡/🟢):** [specific, with before/after]
[…repeat for all 7 sections]

## Copy Score: [X]/100
[Clarity · Urgency · Specificity · Proof · Action — table with notes.]

## Form Audit
## Mobile Audit
## A/B Test Backlog
[Hypothesis-format tests, prioritized.]

## Prioritized Fix List
### Quick Wins (this week)   [each with labeled leverage range]
### Medium-Term (this month)
### Strategic (this quarter)

*Generated by your AI Marketing Team — /market landing*
```

## Terminal summary

```
=== LANDING CRO: [Business] ===
Page Type: [type]   CRO Score: [X]/100
  Hero        [X]/10 ████████░░
  Value Prop  [X]/10 ███████░░░
  Social Proof[X]/10 █████░░░░░
  Features    [X]/10 ███████░░░
  Objections  [X]/10 ██████░░░░
  CTA         [X]/10 ████████░░
Top fix: [#1 quick win]
Saved to LANDING-CRO.md · Next: /market copy or /market funnel
```

## Chaining

Fold in `MARKETING-AUDIT.md` (conversion score) or `COPY-SUGGESTIONS.md` if present. Suggest
`/market copy` for a full copy rewrite or `/market funnel` for the path before/after the page.
