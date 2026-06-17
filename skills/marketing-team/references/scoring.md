# Marketing Score Methodology

Used by `/market audit`, `/market report`, and `/market report-pdf`.

## Six weighted dimensions

| Category | Weight | Measures |
|----------|--------|----------|
| Content & Messaging | 25% | Copy quality, value props, headline clarity, CTA strength |
| Conversion Optimization | 20% | CTAs, forms, friction, social proof, urgency |
| SEO & Discoverability | 20% | On-page + technical SEO, content structure |
| Competitive Positioning | 15% | Differentiation, market awareness, comparison pages |
| Brand & Trust | 10% | Consistency, trust signals, authority |
| Growth & Strategy | 10% | Pricing, acquisition channels, retention loops |

```
Marketing Score =
    Content      * 0.25 +
    Conversion   * 0.20 +
    SEO          * 0.20 +
    Competitive  * 0.15 +
    Brand        * 0.10 +
    Growth       * 0.10
```

## Grade bands

| Score | Grade | Meaning |
|-------|-------|---------|
| 85–100 | A | Excellent — minor optimizations only |
| 70–84 | B | Good — clear opportunities |
| 55–69 | C | Average — significant gaps |
| 40–54 | D | Below average — major overhaul needed |
| 0–39 | F | Critical — fundamental issues |

## Recommendation tiers

- **Quick Wins** (<1 week, low effort, high impact): headline/CTA copy, missing meta
  descriptions, trust signals near CTAs, broken links/images.
- **Strategic** (1–4 weeks): pricing page redesign, comparison pages, lead magnets, email
  sequences, landing-page tests.
- **Long-Term** (1–3 months): content/SEO campaigns, funnel redesign, repositioning, new
  channels.

## Impact labeling (honest ROI — see playbook Rule 3)

Score each recommendation 🔴 High / 🟡 Medium / 🟢 Low by *expected leverage*, not invented
dollars. Only attach a dollar/percentage figure when you have real inputs (traffic,
conversion rate, AOV/ARPU) — then show the formula:

```
Monthly lift = Monthly traffic × conversion-rate delta × value per conversion
```

Otherwise express impact as a benchmark range and mark it `(illustrative)`.
