---
name: market-seo
description: SEO audit and search strategy for a website. Use when the user runs "/market seo <url>" or asks for an SEO audit, keyword strategy, on-page or technical SEO review, content-gap analysis, or help improving organic search rankings. Dispatches the seo-lead specialist and produces a client-ready SEO-AUDIT.md.
---

# SEO Audit (seo-lead)

The search-and-discoverability review for `/market seo <url>`. You dispatch the `seo-lead`
specialist, combine structured page extraction with expert judgment, and produce a
client-ready `SEO-AUDIT.md`.

## Before you start

Load `~/.claude/skills/marketing-team/references/playbook.md` and the brand brief (Rule 1).
Dispatch the **`seo-lead`** subagent with the brand brief, business type (Rule 5), and the
fetched page data. Apply the playbook rules — don't restate them. In particular: label your
data tier (Rule 2) and never print invented traffic/revenue numbers (Rule 3).

## Phase 0 — Gather data (tiered)

1. **Structured extraction** for hard facts (title, meta, headings, images/alt, links,
   schema, canonical, robots, viewport):
   ```bash
   python3 ~/.claude/skills/marketing-team/scripts/analyze_page.py <url>
   ```
   If unavailable, fall back to `WebFetch` and note reduced precision.
2. **Keyword & volume data (Tier 1 if connected).** Real search volumes change the quality of
   this audit. Use `ToolSearch` (e.g. "keyword research", "search volume", "trends") to find a
   connected keyword/trends MCP and prefer it for volume, difficulty, and related-query data.
   If none is connected, use `WebSearch` to read SERPs, People Also Ask, and related searches —
   and label volumes as estimated.
3. **Label the tier** at the top of the output, e.g.
   `Data: analyze_page.py + live volumes (keyword MCP)` or
   `Data: analyze_page.py + WebSearch SERP reads — connect a keyword tool for exact volumes`.

## Phase 1 — On-page audit

Score each element **Pass / Needs Work / Fail** and capture the current value + a rewritten
recommendation (Rule 4: example-driven, quote real copy).

- **Title tag** — exists, unique, 50–60 chars, primary keyword near the front, brand name,
  click-worthy.
- **Meta description** — exists, unique, 150–160 chars, keyword + reason to click.
- **Headings** — exactly one H1 with the keyword, logical H2/H3 nesting, descriptive.
- **Images** — descriptive alt text, decorative images `alt=""`, sensible filenames.
- **Internal links** — descriptive anchors (not "click here"), deep links, contextual.
- **URL** — readable, keyword-bearing, lowercase, hyphenated, no junk parameters.

## Phase 2 — Content quality (E-E-A-T)

Rate **Strong / Present / Weak / Missing** with evidence for each:
- **Experience** — first-hand proof: anecdotes, case studies, screenshots, specifics.
- **Expertise** — author credentials, depth, accuracy, authoritative sources.
- **Authoritativeness** — bylines, About page, mentions, recognized in the category.
- **Trustworthiness** — HTTPS, policies, contact/address, reviews, sourced claims.

## Phase 3 — Keyword & intent

- Identify the **primary keyword** and check placement (title, H1, first 100 words, a
  subheading, meta, URL). Flag stuffing (>3% density).
- List **5–10 secondary keywords** (synonyms, long-tail, PAA questions).
- **Search-intent match** — informational / commercial / transactional / navigational. Flag
  mismatch (e.g. an informational query landing on a sales page) — it's a ranking killer.

## Phase 4 — Technical SEO

- robots.txt accessible, not blocking key pages/CSS/JS, points to sitemap.
- sitemap.xml present, complete, no broken URLs.
- Canonical tag present and pointing to the right URL.
- Mobile: viewport tag, ≥16px body text, tap targets ≥48px, no horizontal scroll.
- **Core Web Vitals** benchmarks: LCP <2.5s / FID(INP) <100ms / CLS <0.1 / TTFB <200ms.
  For each failing metric give the typical fix (optimize hero image + CDN for LCP; defer JS
  for INP; set image dimensions for CLS). Describe CWV impact as a **labeled benchmark range**
  (e.g. "passing CWV typically reduces abandonment — illustrative, industry benchmark"),
  never a specific revenue figure for this site (Rule 3).

## Phase 5 — Opportunities

- **Content gaps** — topics competitors cover that this site doesn't. Table: topic | est.
  volume (tier-labeled) | competition | content type | priority.
- **Featured snippets** — question-based H2 + 40–60-word answer, lists, tables.
- **Schema** — Organization, Product, Article, FAQ, HowTo, Review, Breadcrumb,
  WebSite/SearchAction — present vs recommended (JSON-LD).
- **Internal-linking** — orphan pages, hub/pillar→cluster structure, blog→conversion links.
- **Content strategy** — cadence, content types, length benchmarks, refresh plan.

## Output: SEO-AUDIT.md

Lead with business name, URL, date, data tier (Rule 4).

```markdown
# SEO Audit: [Business Name]
**URL:** [url] · **Date:** [date] · **Type:** [business type]
**Data:** [tier — e.g. analyze_page.py + keyword MCP]
**SEO Health Score: [X]/100**

## Executive Summary
[Biggest organic opportunity tied to the brand brief's goal; top 3 moves.]

## On-Page SEO
[Title, meta, headings, images, internal links, URL — status + current + recommended.]

## Content Quality (E-E-A-T)
| Dimension | Score | Evidence |

## Keyword & Intent
- Primary keyword · Search intent · Placement checklist · Secondary keywords

## Technical SEO
[robots/sitemap/canonical/mobile/Core Web Vitals with fixes]

## Content Gap Analysis
| Missing topic | Est. volume (tier) | Competition | Type | Priority |

## Featured Snippets · Schema · Internal Linking · Content Strategy

## Prioritized Recommendations
### 🔴 Critical (now)
### 🟡 High (this month)
### 🟢 Medium (this quarter)
[Each with leverage label + basis; numbers only from real inputs, else benchmark range.]

*Generated by your AI Marketing Team — /market seo*
```

## Terminal summary

```
=== SEO AUDIT COMPLETE ===
Site: [name] ([type])   SEO Health: [X]/100
Data: [tier]
Top fix: [#1 critical item]
Content gaps found: [N]   Snippet opportunities: [N]
Saved to SEO-AUDIT.md · Next: /market competitors or /market copy
```

## Notes

- Be educational: explain *why* each item matters and prioritize by effort-to-impact.
- If `MARKETING-AUDIT.md` or `COMPETITOR-REPORT.md` exists, cross-reference its findings.
- If no keyword tool is connected, end with the upgrade hint: connect a keyword/trends MCP
  for exact volumes and difficulty.
