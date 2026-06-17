---
name: market-emails
description: Generate ready-to-send email sequences. Use when the user runs "/market emails <topic/url>" or asks to write or build an email sequence, welcome flow, nurture, launch, onboarding, cart-abandonment, re-engagement, or cold-outreach campaign. Produces complete, on-brand sequences with subject lines, body copy, timing, and segmentation in EMAIL-SEQUENCES.md.
---

# Email Sequence Generation

The email engine for `/market emails <topic/url>`. You generate complete, ready-to-send
sequences — subject lines, body copy, cadence, and segmentation — built on proven frameworks.

## Before you start

Load `~/.claude/skills/marketing-team/references/playbook.md` and the brand brief, then dispatch
the **`email-marketer`** subagent — scoped to the brand brief's voice, audience, and offer. If
`BRAND-VOICE.md` exists, hand it over so every email matches the documented voice. This is a
generative command: if no brand brief and no URL exist, follow playbook Rule 1 — offer to create
a brief first rather than inventing one. Apply the playbook rules; don't restate them.

## Phase 1 — Context

If a URL is given, fetch it (Tier-1 MCP if connected per playbook Rule 2, else `WebFetch`;
structured facts via `python3 ~/.claude/skills/marketing-team/scripts/analyze_page.py <url>` —
label the tier). Otherwise work from the topic and the brief. Establish: business type, audience,
product, price point (higher price → longer nurture), primary CTA, entry point (lead magnet /
trial), and voice.

**Pick sequence types** (generate ≥2 unless the user names one):

| Sequence | When | Emails | Goal |
|----------|------|--------|------|
| Welcome | New subscriber / lead magnet | 5–7 | Build trust, deliver value, introduce product |
| Nurture | Warm but not ready | 6–8 | Educate, build authority, beat objections |
| Launch | New product/feature | 8–12 | Build anticipation, drive purchase |
| Re-engagement | Inactive 30–90 days | 3–4 | Win back or clean list |
| Onboarding | New trial/customer | 5–7 | Drive activation, reduce churn |
| Cart abandonment | Abandoned checkout | 3–4 | Recover sales |
| Cold outreach | B2B prospecting | 3–5 | Book meetings |

## Phase 2 — Frameworks

- **One email, one job** — one idea, one primary CTA, one desired action. Mixed asks are the #1
  cause of low click-through.
- **Structures:** *Value-Before-Ask* (~3:1 value-to-ask, for welcome/nurture); *Story-Driven*
  (hook → bridge → lesson → CTA); *Problem-Agitate-Solution* (for launch and cart abandonment).
- **Subject lines** — write a primary + an A/B variant + preheader for every email. Keep ≤50
  chars (40 ideal), front-load key words, use numbers, personalize ~20–30% of sends (not all),
  avoid spam triggers. Useful formulas: number+benefit, curiosity gap, direct benefit,
  question, how-to, social proof, urgency, pattern interrupt.
- **Cadence** (calibrate to the sequence): Welcome → days 1,2,4,6,8; Nurture → every 3–4 days;
  Launch → announce/teaser/open/reminder/close; Cart → 1hr, 24hr, 72hr; Cold → days 1,4,8.
  Send times: B2B Tue–Thu 9–11am; B2C Tue–Thu 10am or 7–9pm; avoid Mon AM / Fri PM / weekends
  (except e-commerce promo).

## Phase 3 — Write the sequences

Write full, paste-ready body copy for every email in the brand voice — not outlines. For each
email: timing, subject A, subject B, preheader, body, CTA text, CTA link target, goal, and a
segmentation note. Anchor welcome on the lead magnet; open cold outreach with research, not a
pitch; escalate cart abandonment reminder → objection → incentive.

## Phase 4 — Segmentation, testing, benchmarks, compliance

- **Segmentation:** by behavior, engagement, source, lifecycle stage, interest, or value.
- **A/B testing order:** subject lines → CTA/offer → send time → length/format. Two subject
  variants per email.
- **Benchmarks (label as industry benchmarks, not this list's data — playbook Rule 3):** opens
  SaaS 20–25% / e-com 15–20% / services 18–22% / courses 20–28%; clicks ~2–5%; conversion
  ~0.5–3% by industry. Present targets as ranges with stated assumptions; never a fabricated
  revenue figure. If the user supplies list size + conversion + AOV, compute and show the math.
- **Compliance checklist:** CAN-SPAM (physical address, working unsubscribe, accurate From,
  non-deceptive subject), GDPR (explicit opt-in, documented consent, right to erasure),
  CASL (express/implied consent, sender ID). Note: user should confirm with legal counsel.

## Output: EMAIL-SEQUENCES.md

Lead with business/topic, date, audience, and data tier (playbook Rule 4).

```markdown
# Email Sequences: [Business/Topic]
**Date:** [date] · **Business Type:** [type] · **Audience:** [desc] · **Data:** [tier]
**Sequences:** [list]

## Sequence 1: [Type]
### Overview
- Goal · Emails · Duration
- Target Open / Click / Conversion: [benchmark ranges, illustrative]

### Email 1: [Name]
**Send:** [timing]
**Subject A:** […]   **Subject B:** […]   **Preview:** […]
---
[Full paste-ready body copy]
---
**CTA:** [text] → [link]   **Goal:** […]   **Segment:** […]
[…repeat per email]

## Segmentation Strategy
## A/B Testing Plan
## Metrics & Benchmarks
## Compliance Checklist
## Implementation Notes

*Generated by your AI Marketing Team — /market emails*
```

## Terminal summary

```
=== EMAIL SEQUENCES: [Business] ===
Sequences: [list]   Total emails: [count]
  Welcome (7 emails, 14 days) — build trust & convert
  Cart Abandonment (3 emails, 7 days) — recover sales
Target ranges (illustrative): Opens 22–25% · Clicks 3–4% · Conv 1.5–2%
Saved to EMAIL-SEQUENCES.md · Next: /market funnel or /market copy
```

## Chaining

Match copy to `BRAND-VOICE.md`, align stages to `FUNNEL-ANALYSIS.md`, and reuse value props/CTAs
from `COPY-SUGGESTIONS.md` if present. Suggest `/market funnel` or `/market copy` as next steps.
