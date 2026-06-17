---
description: Dispatch your AI marketing team — audit, copy, emails, social, ads, funnel, SEO, competitors, launch, proposal, report. Run "/market standup" for a full plan.
argument-hint: <command> [url|topic]   e.g. standup · audit https://site.com · emails "free trial onboarding"
---

The user invoked the AI marketing team with: **`$ARGUMENTS`**

Activate the `marketing-team` skill and route this request:

1. Parse the first word of the arguments as the command, the rest as the target (URL or topic).
2. Follow the routing table in the `marketing-team` skill's `SKILL.md`.
3. Before doing anything, load `references/playbook.md` and the brand brief (playbook Rule 1).
4. Read the matching `skills/market-<command>/SKILL.md` for detailed instructions and follow it.

If no command is given (empty arguments), show the available commands and recommend
`/market standup` (the full-team plan) or `/market audit <url>` to start.

Valid commands: standup, audit, quick, copy, brand, landing, emails, social, ads, funnel,
competitors, seo, launch, proposal, report, report-pdf.
