---
name: market-launch
description: Build a week-by-week go-to-market launch playbook. Use when the user runs "/market launch <product>" or asks for a launch plan, go-to-market strategy, launch checklist, or multi-channel launch campaign for a product, feature, course, or service. Produces LAUNCH-PLAYBOOK.md.
---

# Product/Service Launch Playbook

The go-to-market engine for `/market launch <product>`. You produce a tactical, week-by-week
launch plan with ready-to-customize templates (emails, social, press, partner outreach),
a launch-day runbook, and a metrics dashboard. This is the `cmo-strategist` deliverable.

## Before you start

Load `~/.claude/skills/marketing-team/references/playbook.md` and the brand brief, then work
as `cmo-strategist`. If no brand brief exists and no product detail is given, offer to create
one or proceed with stated assumptions (Rule 1). Keep every template grounded in the brand's
voice, audience, and offer — generic launch advice is the failure mode. Apply honest ROI
(Rule 3): no fabricated revenue/signup projections; targets come from the user or are labeled
ranges. Budget figures appear only when the user states a budget.

## Step 1 — Gather launch context

Pull from the brand brief; ask only for what's missing:
1. What's launching (product/feature/course/event) and its core promise
2. Target audience + existing list/following size
3. Primary goal and any real target (revenue, signups, downloads)
4. Launch date or desired timeline
5. Channels available (email, social, ads budget, partners)
6. Price point and existing customers (for beta/testimonials)

## Step 2 — Pick the launch type

| Launch Type | Best For | Key Channel | Prep |
|---|---|---|---|
| Product Hunt | SaaS, dev tools, apps | PH + X | 4–6 wk |
| Email List | Course, info product, list-led SaaS | Email | 6–8 wk |
| Social | Consumer, personal brand | X / LinkedIn / IG | 4–6 wk |
| Paid Ads | E-commerce, established product | Meta / Google | 2–4 wk |
| Community | Niche, dev tools | Reddit / Discord / Slack | 6–8 wk |
| Partner | B2B, marketplace | Partner channels | 8–12 wk |
| Hybrid | High-stakes | Multi-channel | 8–12 wk |

Always offer a **minimum viable launch** for limited resources.

## Step 3 — The 8-week timeline (work backward from the launch date)

- **Weeks 1–2 Foundation:** positioning statement ("For [TARGET] who [PROBLEM], [PRODUCT]
  is a [CATEGORY] that [BENEFIT]. Unlike [ALT], we [DIFFERENTIATOR]."), landing/waitlist page,
  tracking + UTMs, draft all email sequences, recruit 10–20 beta testers, list 20+ communities.
- **Weeks 3–4 Audience building:** content seeding, build-in-public, community engagement,
  beta feedback + testimonials, partner outreach begins, demo video, referral waitlist.
- **Weeks 5–6 Pre-launch:** pre-launch email sequence, daily social, beta case study, finalize
  pricing/offer, prep launch-day content package, brief partners with swipe copy, test every
  signup/checkout flow end-to-end, set up the metrics dashboard.
- **Week 7 LAUNCH WEEK:** Mon soft/VIP access · Tue public announcement (email, blog, social,
  PH at 12:01 AM PT, partners, ads) · Wed social-proof push · Thu objection handling + live
  Q&A · Fri urgency/scarcity close · Sat–Sun last-chance + wrap.
- **Week 8 Post-launch:** survey, metrics retrospective, transition to regular pricing,
  onboarding sequence, plan v2, stand up the ongoing engine.

Provide each week as a checklist with deliverables.

## Step 4 — Templates (customize to the brand brief)

- **Email sequence (7):** Teaser → Reveal → Social proof → Launch → Proof follow-up →
  Objection handler → Urgency close. Give subject + purpose + body outline + CTA for each.
- **Social:** X thread, LinkedIn post, IG/visual caption — each templated and on-voice.
- **Press:** release structure + a short media-pitch email.
- **Partners:** week-by-week outreach timeline + the asset pack to send (access, swipe copy,
  graphics, tracked link, commission terms).

## Step 5 — Metrics & budget

Track awareness (traffic, impressions, opens), engagement (time on site, CTR, demo
completion), conversion (signup/purchase rate, AOV, CAC), and post-launch retention (D1/D7,
adoption, NPS). State target benchmarks as ranges, not invented absolutes.

**Budget allocation only if the user provides a budget** — then split across ads / partners /
PR / tools proportionally. Do not print dollar figures the user didn't supply.

## Step 6 — Avoid the classic mistakes

Launching to nobody, no urgency mechanism, perfectionism, single-channel, no follow-up
sequence (most conversions land days 3–7), no support plan, unclear offer, untested mobile,
no post-launch plan.

## Output: LAUNCH-PLAYBOOK.md

```markdown
# Launch Playbook: [Product Name]
**Launch Date:** [date] · **Type:** [launch type] · **Goal:** [goal + target]
**Brand:** [name] · **Data:** [tier if research used]

## Week-by-Week Plan
[Checklists Weeks 1–8 with deliverables]

## Email Sequences
[7 templates customized to the product + voice]

## Social Media Content
[Platform-specific posts]

## Partner / Influencer Plan
[Outreach timeline + asset pack]

## Launch Day Runbook
[Hour-by-hour Tuesday/Day-1 plan]

## Metrics Dashboard
[Metrics + benchmark ranges]

## Budget Allocation
[Only if budget provided]

## Post-Launch Plan
[Week 8+ and retrospective framework]

*Generated by your AI Marketing Team — /market launch*
```

## Terminal summary

```
=== LAUNCH PLAYBOOK READY ===
Product: [name]   Type: [launch type]   Launch: [date]
Goal: [goal/target]
Timeline: 8 weeks · [N] emails · [N] social posts · partner plan
Next move: [#1 foundation task]
Saved to LAUNCH-PLAYBOOK.md · Next: /market emails or /market social
```

## Chaining

If `MARKETING-AUDIT.md`, `BRAND-VOICE.md`, or `LANDING-CRO.md` exist, pull positioning and
voice from them. Suggest `/market emails` (build the sequences) or `/market social` (the
content calendar) to execute.
