---
name: market-ads
description: Paid ad campaigns, creative, and copy. Use when the user runs "/market ads <url>" or asks for ad campaigns, ad copy variations, Google/Meta/LinkedIn/TikTok/X ad creative, audience targeting, budget allocation, retargeting funnels, or a media-buyer-ready brief. Dispatches the performance-marketer specialist and produces a client-ready AD-CAMPAIGNS.md.
---

# Ad Campaigns (performance-marketer)

The paid-media engine for `/market ads <url>`. You dispatch the `performance-marketer`
specialist to generate complete, production-ready campaigns across the right platforms.
Output goes to `AD-CAMPAIGNS.md`.

## Before you start

Load `~/.claude/skills/marketing-team/references/playbook.md` and the brand brief (Rule 1).
Dispatch the **`performance-marketer`** subagent with the brand brief, business type (Rule 5),
and the fetched site data. Apply the playbook rules — don't restate them.

- **Fetch the site** (`analyze_page.py` or `WebFetch`) to read the product, price point,
  value props, conversion action, social proof, and likely objections.
- **Honesty (Rule 3) is critical here.** Do NOT invent spend, CPA, ROAS, or revenue for this
  business. Use the **benchmark tables below as labeled industry ranges** `(illustrative —
  industry benchmark, not this account's data)`. If the user gives real inputs (budget, AOV,
  conversion rate), compute and show the formula; otherwise ask for them or present ranges.

## Phase 0 — Performance data (tiered)

If the account's own numbers are available they beat benchmarks:
- **Tier 1 if connected:** use `ToolSearch` (e.g. "analytics", "ads", "google ads", "meta")
  to find a connected analytics/ad-platform MCP and prefer its real CPA/ROAS/audience data.
- **Fallback:** the benchmark ranges in Phase 4, clearly labeled.
- **Label the tier**, e.g. `Data: live account metrics (analytics MCP)` or
  `Data: industry benchmarks (no account connected) — connect an analytics/ads tool for real CPA/ROAS`.

## Phase 1 — Foundation

- **Offer analysis** — product, price, audience, USP, conversion action, social proof,
  objections, competitor angles (pull from `COMPETITOR-REPORT.md` if present).
- **Objective mapping** — map the business goal to objective + platform + format (awareness →
  Reach/video; leads → Lead Gen; trials/sales → Conversions; ecom → Sales/ROAS).

## Phase 2 — Platform campaigns

Generate for the 2–3 platforms that fit the business type. Per platform, respect the specs and
write real copy (Rule 4), grounded in the brand voice:

- **Google** — Responsive Search Ads: 10+ headlines (30 chars) across angles (value prop,
  pain→solution, benefit+number, social proof, offer, question, how-to, comparison, feature,
  action) + 4 descriptions (90 chars); 10–15 high-intent keywords/ad group with match types
  and a negative list; 3–5 themed ad groups. Note Performance Max asset/image specs if used.
- **Meta** — per concept: primary text (short/medium/long), 5 headlines (40 chars), 3
  descriptions, CTA button. Cover 5–10 angles: pain point, social proof, before/after,
  objection handling, urgency, curiosity, direct benefit, comparison, testimonial, how-to.
  Specs: feed 1080×1080, stories/reels 1080×1920.
- **LinkedIn** — Sponsored Content / Message / Document ads; B2B angles (professional
  development, industry insight, ROI, peer comparison, thought leadership); targeting by title,
  company size, industry, seniority, matched/lookalike audiences. (intro 600 / headline 200.)
- **TikTok** — 9:16 video, 9–15s optimal, native aesthetic, trending sounds, text overlays.
  Use the hook→problem→solution→proof→CTA script. Spark Ads from organic.
- **X/Twitter** — Promoted Tweets; conversational, hot-take + solution; 100–150 chars perform
  best.

## Phase 3 — Retargeting funnel

Three stages with audiences, goals, ad types, and 3–5 ad variations each:
- **Awareness (cold)** — lookalikes/interest; educational/thought leadership; ~40% of spend.
- **Consideration (warm)** — visitors 7–30d, video viewers, list; case studies/demos/
  comparison; ~35%.
- **Conversion (hot)** — cart/pricing-page/trial; offer/urgency/guarantee/testimonial; ~25%.

## Phase 4 — Budget & benchmarks (all labeled illustrative)

Budget splits and benchmark CPA/ROAS are **industry references, not promises** — mark them
`(illustrative — industry benchmark)`:
- **Platform split by business type** (e.g. SaaS-B2B ≈ Google 30 / Meta 25 / LinkedIn 30;
  ecom ≈ Google 30 / Meta 40 / TikTok 20). Funnel split 40/35/25.
- **ROAS reference** — ecom 2:1 ok / 4:1 good / 8:1+ excellent; SaaS 3 / 5 / 10:1.
- **CPA reference** — give ranges by platform and goal, labeled as benchmarks.
- **Landing-page alignment** — message-match checklist (headline match, promise delivery, CTA
  consistency, mobile, <3s load, single CTA). Score each ad↔page 1–10; flag below 7.

## Phase 5 — Testing

Per concept: 5 headlines, 3 primary-text lengths, 3 CTAs, 3 visual concepts for designer
handoff. Test order: audience → offer → creative → headline → body → CTA. One variable at a
time; 3–5 days or ~1,000 impressions/variant; kill at 2× target CPA; scale winners +20%.

## Output: AD-CAMPAIGNS.md

Lead with business name, URL, date, objective, platforms, data tier (Rule 4).

```markdown
# Ad Campaigns: [Business Name]
**URL:** [url] · **Date:** [date] · **Type:** [business type]
**Primary Objective:** [objective] · **Platforms:** [list]
**Data:** [tier]

## Campaign Strategy Overview
## Audience Targeting

## Campaign 1: [Platform]
### Ad Group 1: [Theme]  (targeting · budget · objective)
#### Ad Variation 1 — Headline / Primary text / Description / CTA / Visual / Landing page
[Repeat per variation, ad group, platform]

## Retargeting Strategy        (3-stage funnel)
## Budget Allocation           (labeled illustrative ranges)
## Performance Benchmarks      (ROAS/CPA — labeled illustrative)
## Landing Page Alignment      (message-match scores)
## Testing Plan
## Creative Brief for Designers

*Generated by your AI Marketing Team — /market ads*
```

## Terminal summary

```
=== AD CAMPAIGNS COMPLETE ===
Business: [name] ([type])   Platforms: [list]   Variations: [count]
Data: [tier]
Budget guidance: [range or "provide budget for tailored split"]
ROAS/CPA targets: [ranges — illustrative benchmarks]
Saved to AD-CAMPAIGNS.md · Next: /market funnel or /market landing
```

## Notes

- If `COPY-SUGGESTIONS.md`, `COMPETITOR-REPORT.md`, `FUNNEL-ANALYSIS.md`, or
  `SOCIAL-CALENDAR.md` exist, reuse their messaging, positioning, funnel stages, and top
  organic posts (as Spark/boosted ads).
- If no analytics/ads MCP is connected, end with the upgrade hint: connect one for real
  CPA/ROAS instead of benchmark ranges.
