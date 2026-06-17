---
name: market-funnel
description: Map and optimize a website's conversion funnel. Use when the user runs "/market funnel <url>" or asks to analyze a sales/conversion funnel, find drop-off points, diagnose where visitors leak, or improve trial/checkout/lead conversion. Produces a prioritized FUNNEL-ANALYSIS.md.
---

# Sales Funnel Analysis & Optimization

The conversion engine for `/market funnel <url>`. You trace every step from first visit to
conversion, score each page for friction, locate the biggest leak, and recommend prioritized
fixes. This is the `performance-marketer` specialist's deliverable.

## Before you start

Load `~/.claude/skills/marketing-team/references/playbook.md` and the brand brief, then work
as `performance-marketer`. Apply honest ROI (Rule 3) — only show dollar figures derived from
real inputs; otherwise use labeled benchmark lift ranges. Label the data tier used (Rule 2).

## Phase 1 — Map the funnel

1. **Fetch the funnel pages.** Use Tier-1 analytics/CRO MCP tools if connected (check via
   `ToolSearch`); else `WebFetch` the landing/homepage and each downstream step.
2. **Run structured extraction** for CTAs, forms, fields, and tracking:
   ```bash
   python3 ~/.claude/skills/marketing-team/scripts/analyze_page.py <url>
   ```
   If unavailable, fall back to WebFetch parsing and note reduced precision.
3. **Identify funnel type** — it sets the steps and the key metric:

| Funnel Type | Typical Steps | Key Metric |
|-------------|---------------|------------|
| Lead Gen | Landing → Form → Thank-you → Nurture → Call | Lead-to-close |
| SaaS Trial | Home → Pricing → Signup → Onboarding → Upgrade | Trial-to-paid |
| SaaS Demo | Home → Features → Demo request → Call → Close | Demo-to-close |
| E-commerce | Product → Cart → Checkout → Upsell → Confirm | Cart-to-purchase |
| Webinar | Opt-in → Confirm → Live → Offer → Checkout | Reg-to-sale |
| Application | Info → Apply → Review → Interview → Accept | Apply-to-accept |
| Content/Sub | Blog → Capture → Nurture → Premium → Subscribe | Reader-to-sub |

4. **Document each step:** URL, page type, primary action, intended next step, exit points,
   friction elements, trust elements.

## Phase 2 — Score each step

Score every funnel page 0–10 on: **Clarity**, **Continuity** (follows from prior step),
**Motivation** (reason to advance), **Friction** (10 = frictionless), **Trust**. Page score
= average. Convert the funnel to an overall health score (0–100).

Diagnose common leaks per stage and prescribe the fix:
- **Homepage:** vague value prop → specific-outcome headline; weak/multiple CTAs → single
  primary CTA above the fold; slow load; poor mobile.
- **Pricing:** price shock → value framing first; 4+ plans → 3 + highlight recommended;
  hidden costs; no proof near pricing; missing objection FAQ.
- **Signup:** 5+ fields → ≤3; account required too early; no progress indicator; no SSO; no
  trust note.
- **Checkout:** surprise shipping; forced account; one payment option; no urgency; no
  guarantee near CTA.

If the funnel uses a lead magnet, score it on relevance, specificity, perceived value, quick
win, product alignment, and opt-in friction.

## Phase 3 — Metrics, benchmarks, impact

Show conversion at each step vs. benchmark, and flag the single biggest drop-off.

| Funnel Type | Good | Great | Elite |
|-------------|------|-------|-------|
| Lead Gen (form) | 3–5% | 5–10% | 10–20% |
| SaaS Free Trial | 2–5% | 5–10% | 10–15% |
| Trial → Paid | 10–15% | 15–25% | 25–40% |
| E-com browse→buy | 1–3% | 3–5% | 5–8% |
| Cart → Purchase | 50–60% | 60–70% | 70–80% |
| Webinar → Sale | 2–5% | 5–10% | 10–20% |
| Demo → Close | 15–25% | 25–40% | 40–60% |

**Revenue impact (honest ROI — playbook Rule 3):** only compute dollars when the user gave
real inputs. With traffic + conversion + value-per-conversion, show the formula:
```
Monthly lift = Monthly traffic × conversion-rate delta × value per conversion
```
Without those inputs, express each fix as a benchmark lift range marked `(illustrative)` and
ask for the three numbers you need. Never invent revenue.

## Phase 4 — Prioritize

Rank fixes 🔴 High / 🟡 Medium / 🟢 Low by leverage, split into Do Now (this week), Plan (this
month), Strategic (this quarter). Map each funnel stage to the email sequence that supports it
and note traffic-source → entry-point alignment where relevant.

## Output: FUNNEL-ANALYSIS.md

```markdown
# Funnel Analysis: [Business Name]
**URL:** [url] · **Date:** [date] · **Type:** [business type] · **Funnel:** [funnel type]
**Data:** [tier — e.g. WebFetch + analyze_page.py]
**Funnel Health: [X]/100**

## Executive Summary
[3–4 paragraphs: funnel type, current state, biggest bottleneck, top 3 fixes with labeled
impact. Tie to the brand brief's goal.]

## Funnel Map
[ASCII flow with conversion % at each step vs benchmark]

## Page-by-Page Analysis
### Step 1: [Page] — [score]/10
[Scores, friction, trust, before/after fix examples]
### Step 2: …

## Funnel Metrics
[Current vs benchmark, gaps highlighted]

## Revenue Impact
[Real-input calculation OR labeled benchmark ranges (illustrative)]

## Optimization Recommendations
### 🔴 Do Now (This Week)
### 🟡 Plan (This Month)
### 🟢 Strategic (This Quarter)

## Pricing Page Assessment
## Lead Magnet Assessment (if applicable)
## Email Nurture Integration

## Next Steps
1. … 2. … 3. …

*Generated by your AI Marketing Team — /market funnel*
```

## Terminal summary

```
=== FUNNEL ANALYSIS COMPLETE ===
Business: [name]   Funnel: [type]   Health: [X]/100
Conversion flow:
  Visitors → Leads:  [X]% (bench [X]%)
  Leads    → Trial:  [X]% (bench [X]%)
  Trial    → Paid:   [X]% (bench [X]%)
Biggest bottleneck: [stage] — [X]% drop-off
Top fix: [#1] — est. [X]% lift (illustrative)
Saved to FUNNEL-ANALYSIS.md · Next: /market copy or /market emails
```

## Chaining

If `MARKETING-AUDIT.md`, `COPY-SUGGESTIONS.md`, `EMAIL-SEQUENCES.md`, or `COMPETITOR-REPORT.md`
exist, fold in their findings. Suggest `/market copy` (page rewrites), `/market emails`
(nurture), or `/market landing` (CRO deep dive) as next steps.
