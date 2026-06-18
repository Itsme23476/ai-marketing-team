---
name: market-quick
description: 60-second marketing snapshot of a website. Use when the user runs "/market quick <url>" or asks for a fast marketing read, a quick gut-check, or a lightweight scorecard without the full audit. Does NOT launch the specialist team — produces a short terminal-only scorecard.
---

# Marketing Quick Snapshot

The fast, no-subagents read for `/market quick <url>`. Terminal output only — no files, no team.

## Before you start

Load `~/.claude/skills/marketing-team/references/playbook.md` and the brand brief. Keep it
light: this command is for speed, not depth.

## What to do

1. Fetch the homepage with `WebFetch` (optionally run
   `python3 ~/.claude/skills/marketing-team/scripts/analyze_page.py <url>` for hard facts).
2. Judge five things fast: headline clarity, CTA strength, value proposition, trust signals,
   mobile readiness.
3. Output a scorecard under 30 lines — no fabricated numbers (playbook Rule 3).

## Output (terminal only)

```
=== MARKETING QUICK SNAPSHOT ===
[Business] · [url] · [business type]

  Headline clarity    ▍▍▍▍▍▍▍░░░  7/10
  CTA strength        ▍▍▍▍▍░░░░░  5/10
  Value proposition   ▍▍▍▍▍▍▍▍░░  8/10
  Trust signals       ▍▍▍░░░░░░░  3/10
  Mobile readiness    ▍▍▍▍▍▍▍▍▍░  9/10

Top 3 wins:
  1. … 2. … 3. …
Top 3 fixes:
  1. … 2. … 3. …

Want the full picture? Run: /market audit <url>
```

End by recommending `/market audit <url>` for the full scored report.
