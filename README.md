# 🧑‍💼 AI Marketing Team for Claude Code

Turn Claude Code into a **full marketing team** — a CMO, copywriter, SEO lead, performance
marketer, social manager, email marketer, and competitive analyst — that knows *your*
business and works from one command.

```
> /market standup

📋 Loading brand brief: Acme Analytics (SaaS, growth stage)
👥 Marketing standup — 7 specialists working in parallel...

  CMO              → Fix trial→paid: only path to the 90-day MRR goal
  Copywriter       → Homepage headline fails the 5-second test (rewrite ready)
  SEO Lead         → 3 bottom-funnel keywords competitors rank for, you don't
  Performance      → Pricing page has 4 leaks; one A/B test to run first
  Social           → 2-week "build in public" angle, 12 posts drafted
  Email            → Onboarding sequence missing — highest-leverage build
  Competitive      → You win on speed, lose on social proof vs Rival A/B

🎯 #1 move this week: ship the onboarding email sequence (/market emails)
📄 Full 90-day plan → MARKETING-PLAN.md
```

This is a rebuilt, corrected, and upgraded version of the popular
[`ai-marketing-claude`](https://github.com/zubair-trabzada/ai-marketing-claude) suite.

---

## Why this version exists

The original suite had great marketing knowledge but shipped broken as a Claude Code package.
This version fixes the mechanics and adds the two things a real team needs — **roles** and
**context about your business**:

| | Original | This version |
|---|---|---|
| **Triggers reliably?** | ❌ No YAML frontmatter — skills/agents don't register | ✅ Proper `name` + `description` on every file |
| **`/market` command** | ❌ Promised but never installed | ✅ Real `/market` command + `/market standup` |
| **Python scripts** | ❌ Broken relative paths; rarely run | ✅ Absolute paths; wired into the skills |
| **Knows your business** | ❌ Generic output | ✅ Reads a **Brand Brief** before every task |
| **Real data** | ❌ One homepage guess | ✅ **Hybrid tiers**: built-in by default, auto-uses connected MCP tools (keyword/trends/analytics) when present |
| **ROI claims** | ⚠️ Fabricated dollar figures | ✅ Honest — real inputs or clearly-labeled ranges |
| **The "team"** | 5 generic audit bots | 7 named specialists with distinct roles |
| **Token cost** | Heavy, repetitive skills | Shared playbook + progressive disclosure |

---

## Install

```bash
git clone <your-repo-url> ai-marketing-team
cd ai-marketing-team
./install.sh
```

Then: fill in `~/.claude/marketing/brand-brief.md`, start a new session, run `/market standup`.

---

## The team

| Specialist | Subagent | Handles |
|-----------|----------|---------|
| CMO / Strategist | `cmo-strategist` | Audit synthesis, strategy, launches, proposals, reports |
| Copywriter | `copywriter` | Website/landing copy, brand voice, headlines, CTAs |
| SEO Lead | `seo-lead` | SEO audits, keyword strategy, technical SEO |
| Performance Marketer | `performance-marketer` | Ads, funnels, CRO |
| Social Manager | `social-manager` | Content calendars, post copy, trends |
| Email Marketer | `email-marketer` | Welcome / nurture / launch sequences |
| Competitive Analyst | `competitive-analyst` | Competitor intel, positioning |

---

## Commands

| Command | What it does |
|---------|-------------|
| `/market standup` | **Flagship.** Whole team → unified 90-day plan (`MARKETING-PLAN.md`) |
| `/market audit <url>` | Full scored marketing audit, 6 dimensions |
| `/market quick <url>` | 60-second snapshot |
| `/market copy <url>` | Rewrite copy with before/after examples |
| `/market brand <url>` | Brand voice analysis & guidelines |
| `/market landing <url>` | Landing page CRO |
| `/market emails <topic>` | Email sequences |
| `/market social <topic>` | Social content calendar |
| `/market ads <url>` | Ad creative & copy |
| `/market funnel <url>` | Funnel analysis |
| `/market competitors <url>` | Competitive intelligence |
| `/market seo <url>` | SEO audit |
| `/market launch <product>` | Launch playbook |
| `/market proposal <client>` | Client proposal |
| `/market report[-pdf] <url>` | Marketing report (Markdown or PDF) |

---

## The Brand Brief (the secret sauce)

A real team knows your business. Fill in `~/.claude/marketing/brand-brief.md` once — audience,
voice, offers, goals — and every command produces output tailored to *you* instead of generic
filler. Per-project? Drop a `marketing/brand-brief.md` in the project root; it takes priority.

Don't want to fill it in by hand? Run `/market brand <your-url>` and the copywriter drafts it
from your live site for you to refine.

---

## Hybrid data tiers

- **Tier 0 (always on):** `WebFetch`, `WebSearch`, and bundled Python analyzers. Works on a
  clean install.
- **Tier 1 (auto-detected):** if you've connected MCP tools (keyword research, search trends,
  analytics, social), the relevant specialists use them automatically and cite the source.

Every deliverable labels which tier produced it, so you always know what's measured vs.
estimated.

---

## How it works

1. You run a `/market` command (or just ask in natural language — skills auto-trigger).
2. The orchestrator loads the **playbook** (shared rules) and your **brand brief**.
3. It dispatches the right specialist(s) — in parallel for big jobs like `standup`/`audit`.
4. Specialists pull facts (scripts + best available data tier) and apply their frameworks.
5. The CMO synthesizes a prioritized, honest, on-brand deliverable.

---

## License

MIT — adapted from `ai-marketing-claude`. Marketing frameworks reorganized; mechanics,
brand-brief grounding, tiered data, honest-ROI, and the team architecture added.
