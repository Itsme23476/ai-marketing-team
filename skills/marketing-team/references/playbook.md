# Marketing Team Playbook (Shared Operating Rules)

Every skill in this suite follows these rules. Read this file once at the start of any
`/market` task, then return to the calling skill. Do not repeat these rules in output —
just apply them.

---

## Rule 1 — Read the Brand Brief first

Before producing anything, look for a brand brief in this order and load the first one found:

1. `./marketing/brand-brief.md` (current project)
2. `./brand-brief.md`
3. `~/.claude/marketing/brand-brief.md` (global default)

The brand brief tells you who the business is, who it sells to, its voice, offers, and
goals. **Everything you produce must reflect it.** Generic marketing output is the failure
mode this suite exists to prevent.

If no brand brief exists:
- For a URL-based command (`audit`, `seo`, `copy`, etc.), infer the brand context from the
  fetched site and state your assumptions in one line at the top of the output.
- For a generative command with no URL (`emails`, `social`, `launch`), STOP and offer to
  create a brand brief first: "I work best with a brand brief. Want me to create one now
  (2 min), or should I proceed with assumptions?" Then respect the answer.

Never invent a brand voice that contradicts the brief.

---

## Rule 2 — Tiered data sources (hybrid)

This suite works on a clean Claude Code install AND gets sharper when real data tools are
connected. Always check what's available, use the best tier present, and label which tier
you used.

**Tier 0 — Built-in (always available).** `WebFetch` and `WebSearch` for page content and
public research; the bundled Python scripts for structured extraction; your own marketing
expertise for judgment.

**Tier 1 — Connected MCP tools (use if present, never assume).** Before commands that need
real data (`seo`, `competitors`, `social`, `ads`), quickly check for connected tools and
prefer them over guessing:
- Keyword volume / search trends / YouTube + IG analytics → a vidIQ-style MCP if connected
- Live web search & source extraction → Tavily or `WebSearch`
- Social trends / post research → an X/Twitter MCP if connected
- Analytics, ad platforms, CRMs → any connected MCP that fits

To discover tools, use `ToolSearch` with a relevant keyword (e.g. "keyword research",
"twitter", "analytics"). If a fitting tool exists, use it and cite it. If not, fall back to
Tier 0 and say so.

**Always label the tier in output**, e.g. `Data: live keyword volumes (vidIQ MCP)` or
`Data: estimated from public sources (WebSearch) — connect a keyword tool for exact volumes`.
This keeps deliverables honest and shows the viewer the upgrade path.

---

## Rule 3 — Honest ROI (no fabricated numbers)

Never print a specific revenue or conversion figure unless it is derived from real inputs the
user provided or a tool returned. Fabricated dollar amounts in a client deliverable are a
liability, not a feature.

- If you have real inputs (traffic, conversion rate, AOV/ARPU): compute the estimate and show
  the formula and inputs.
- If you don't: present impact as a **labeled range with stated assumptions**, or ask for the
  three inputs you need. Mark every projected number `(illustrative — based on industry
  benchmarks, not this business's data)`.
- Always prefer "this change typically lifts X by 5–15%" over a invented dollar figure.

---

## Rule 4 — Output standards

1. **Actionable** — every recommendation is specific enough to implement today.
2. **Prioritized** — rank by impact: 🔴 High / 🟡 Medium / 🟢 Low.
3. **Example-driven** — show before/after copy, never just "improve the headline."
4. **Sourced** — quote real page copy; cite where data came from.
5. **Client-ready** — a report should be presentable without editing.

Save file deliverables to the current directory with the filename the skill specifies, and
print a short terminal summary. Lead every file with: business name, URL (if any), date, and
the data tier used.

---

## Rule 5 — Business-type lens

Detect the business type and let it shape the analysis:

| Type | Focus |
|------|-------|
| SaaS / Software | Trial→paid conversion, onboarding, feature clarity, pricing tiers, churn |
| E-commerce | Product pages, cart abandonment, reviews, upsells, AOV |
| Agency / Services | Case studies, positioning, lead qualification, trust signals |
| Local Business | Local SEO, Google Business Profile, reviews, NAP consistency |
| Creator / Course | Lead magnets, email capture, funnel, testimonials, community |
| Marketplace | Two-sided messaging, supply/demand balance, trust mechanisms |

---

## Running the Python helpers

Scripts install to `~/.claude/skills/marketing-team/scripts/`. Always call them with that
absolute path so they resolve regardless of the working directory:

```bash
python3 ~/.claude/skills/marketing-team/scripts/analyze_page.py <url>
```

These return structured JSON (SEO tags, CTAs, forms, tracking pixels, schema). Use them for
the factual extraction layer, then add expert judgment on top. If `python3` or a script is
missing, fall back to `WebFetch` and note the reduced precision.
