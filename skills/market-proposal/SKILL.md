---
name: market-proposal
description: Generate a client-ready marketing services proposal. Use when the user runs "/market proposal <client>" or asks for a marketing proposal, scope of work, pricing/tiers document, or engagement proposal to send a prospective client. Produces CLIENT-PROPOSAL.md.
---

# Client Proposal Generator

The sales-document engine for `/market proposal <client>`. You produce a persuasive,
client-ready proposal that positions the seller, frames pricing with tiered options, and
justifies the investment honestly. This is the `cmo-strategist` deliverable.

## Before you start

Load `~/.claude/skills/marketing-team/references/playbook.md` and the brand brief, then work
as `cmo-strategist`.

**Two parties, two sources of truth:**
- The **brand brief describes the AGENCY/seller** — its services, voice, case studies, and
  positioning. Use it for the "About us / Team / Case Studies / Approach" sections.
- The **`<client>` argument is who the proposal is FOR** — the prospect. Gather their context
  separately (ask, or pull from any audit data on file). Never conflate the two.

If the brand brief is missing, ask whether the seller is the user's own agency and capture the
essentials before writing (Rule 1).

## Step 1 — Gather inputs

**About the client (the prospect):** company + industry, current marketing situation, pain
points, goals, budget range if known, decision timeline, stakeholders.
**About the engagement (from the brand brief):** services proposed, engagement model
(retainer/project/performance), timeline, relevant case studies.

**If `MARKETING-AUDIT.md`, `COMPETITOR-REPORT.md`, or `FUNNEL-ANALYSIS.md` exist for the
client**, fold their findings into the Situation Analysis — data-backed proposals close far
better than generic ones. Cite the source and its data tier (Rule 2).

If no discovery call has happened, offer the 10-question discovery framework (business model,
ideal customer, sales process, current marketing + spend + ROI, 6/12-month vision, target
numbers, customer LTV, decision process/timeline).

## Step 2 — Build the proposal (frame everything as opportunity, not criticism)

1. **Cover** — title, prepared for [client], prepared by [seller], date, valid 30 days.
2. **Executive Summary (≤1 pg)** — acknowledge their situation/goal, name the core problem,
   preview the approach and outcome, create urgency. Use the client's own words.
3. **Situation Analysis** — current state, opportunities, competitive landscape, key
   challenges, market context. Pull from audit data where available.
4. **Strategy & Approach** — framework + phased plan (Foundation → Growth → Scale → Optimize),
   each with activities, outcomes, and how success is measured.
5. **Scope of Work** — specific deliverables with quantities, meeting cadence, response SLAs,
   tools, reporting. Explicitly list exclusions and client responsibilities.
6. **Timeline** — phases, milestones, deliverables across the engagement.
7. **Investment** — Good-Better-Best tiers with aspirational names; anchor the top tier first,
   badge the middle as recommended. Reference the pricing-model table (retainer / project /
   performance / hybrid / hourly) to set the structure.
8. **ROI Projection** — see honest-ROI rule below.
9. **Team** — name, role, 2–3 sentence bio (from the brand brief).
10. **Case Studies** — 2–3 relevant results from the seller's brand brief; anonymize if needed.
11. **Next Steps** — a single, specific, time-bound action; reduce friction; restate validity.

## Honest ROI — CRITICAL (playbook Rule 3)

This is the single most important rule for a client-facing document. **Do not fabricate
revenue, lead-lift, or ROI multiples.**

- If the client gave real inputs (traffic, conversion rate, close rate, deal value/LTV):
  compute the projection and **show the formula and inputs** so it's defensible:
  ```
  Monthly lift = traffic × conversion-rate delta × value per conversion
  ```
- If you don't have those inputs: present impact as a **benchmark range with stated
  assumptions**, and mark every projected figure
  `(illustrative — based on industry benchmarks, not this client's data)`.
- Prefer "CRO typically lifts conversion 5–15%" over an invented dollar amount. Under-promise.
- Pricing-tier dollar figures are the seller's real prices — those are fine to state. The
  prohibition is on invented *return/outcome* numbers.

## Output: CLIENT-PROPOSAL.md

```markdown
# Marketing Services Proposal
**Prepared for:** [Client] · **Prepared by:** [Seller/Agency] · **Date:** [date]
**Valid until:** [date + 30 days]
**Data basis:** [tier — e.g. client audit on file (WebFetch + analyze_page.py); else discovery inputs]

## Table of Contents
1. Executive Summary  2. Situation Analysis  3. Strategy & Approach  4. Scope of Work
5. Timeline  6. Investment  7. ROI Projection  8. Our Team  9. Case Studies  10. Next Steps

[All sections populated. Investment shows three tiers. ROI section follows the honest-ROI
rule — real-input formula OR labeled (illustrative) ranges, never invented dollars.]

## Appendix
- Terms & Conditions (payment, duration, cancellation, IP, confidentiality, results disclaimer)
- Detailed deliverables · Tool stack

*Prepared by your AI Marketing Team — /market proposal*
```

## Terminal summary

```
=== CLIENT PROPOSAL READY ===
Client: [client]   Seller: [agency from brief]
Engagement: [model] · [N] tiers ($[low]–$[high]/mo, real seller pricing)
ROI basis: [real client inputs | illustrative benchmark ranges]
Audit data used: [yes/no]
Saved to CLIENT-PROPOSAL.md · Next: /market report-pdf (polished leave-behind)
```

## Chaining

A proposal sells the fixes an audit found. If a client `MARKETING-AUDIT.md` exists, reference
it heavily. Suggest `/market report-pdf` to attach a polished visual report, and keep the
objection-handling and follow-up cadence (Day 0/2/5/7/14/21) on hand for after sending.
