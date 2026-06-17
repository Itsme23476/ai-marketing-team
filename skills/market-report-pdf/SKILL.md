---
name: market-report-pdf
description: Generate a polished, visual PDF marketing report. Use when the user runs "/market report-pdf <url>" or asks for a client-ready PDF report, a polished/branded report with charts and score gauges, or a sales-collateral version of the marketing assessment. Produces MARKETING-REPORT.pdf via the bundled Python script.
---

# Marketing Report (PDF)

The PDF deliverable for `/market report-pdf <url>`. You assemble the report data into the
JSON the generator expects, then render a branded PDF with a score gauge, category bar chart,
findings, action plan, and competitor table. This is the `cmo-strategist` deliverable and the
most client-facing artifact in the suite — quality and accuracy matter.

## Before you start

Load `~/.claude/skills/marketing-team/references/playbook.md`, the brand brief, and the
scoring methodology — **do not restate the scoring math**, load it:
`~/.claude/skills/marketing-team/references/scoring.md`. Work as `cmo-strategist`. Label data
tiers (Rule 2) and never fabricate revenue (Rule 3) — the executive summary and findings
must avoid invented dollar figures; use labeled benchmark ranges instead.

## Step 1 — Collect existing data (fold in the cwd)

Reuse what's already on disk instead of re-analyzing:
- `MARKETING-REPORT.md` (ideal — already scored and structured)
- `MARKETING-AUDIT.md`, `COMPETITOR-REPORT.md`, `BRAND-VOICE.md`
- `FUNNEL-ANALYSIS.md`, `SEO-AUDIT.md`, `LANDING-CRO.md`, any `*-AUDIT.md`

If nothing exists, recommend `/market audit <url>` first; if the user insists, fetch the URL
(Tier-1 tools if connected, else `WebFetch` +
`python3 ~/.claude/skills/marketing-team/scripts/analyze_page.py <url>`) and score per
`scoring.md`.

## Step 2 — Build the JSON

The generator reads a JSON file with this structure (six categories matching `scoring.md`):

```json
{
  "url": "https://example.com",
  "date": "June 18, 2026",
  "brand_name": "Example Co",
  "brand_colors": {"primary": "#1B2A4A", "accent": "#2D5BFF"},
  "overall_score": 62,
  "executive_summary": "2–4 sentences: marketing health, top finding, recommended first step. State impact as a labeled range, never an invented dollar figure.",
  "categories": {
    "Content & Messaging":      {"score": 68, "weight": "25%"},
    "Conversion Optimization":  {"score": 52, "weight": "20%"},
    "SEO & Discoverability":    {"score": 74, "weight": "20%"},
    "Competitive Positioning":  {"score": 48, "weight": "15%"},
    "Brand & Trust":            {"score": 70, "weight": "10%"},
    "Growth & Strategy":        {"score": 55, "weight": "10%"}
  },
  "findings": [
    {"severity": "Critical", "finding": "Specific, evidence-backed finding"},
    {"severity": "High",     "finding": "..."},
    {"severity": "Medium",   "finding": "..."},
    {"severity": "Low",      "finding": "..."}
  ],
  "quick_wins":  ["...", "...", "..."],
  "medium_term": ["...", "...", "..."],
  "strategic":   ["...", "...", "..."],
  "competitors": [
    {"name": "Competitor A", "positioning": "...", "pricing": "...", "social_proof": "...", "content": "..."}
  ]
}
```

Guidance:
- `brand_colors` — **make the report match the brand.** Use the brand brief's colors if set.
  Otherwise extract them from the live site: check the `<meta name="theme-color">` tag, the
  web-app manifest, or the most-used non-neutral hex values in the site's CSS, e.g.
  `curl -fsSL <url> | grep -oiE '#[0-9a-fA-F]{6}' | sort | uniq -c | sort -rn | head`.
  Pick `primary` (a dark/brand base, used for header bars) and `accent` (the signature color,
  used for headings, bars, and the cover stripe). `highlight` is optional. The generator keeps
  the green/amber/red score colors fixed for readability and brands everything else. Omit the
  key to use the neutral default palette.
- `overall_score` = weighted composite from `scoring.md`. Round to a whole number.
- `findings`: 5–10, ordered most→least severe; specific and quantified, quote real copy.
- `quick_wins` / `medium_term` / `strategic` map to the recommendation tiers in `scoring.md`.
- `competitors`: up to 3; omit the key entirely if you have no competitor data.
- If a `MARKETING-REPORT.md` exists, transcribe its scores/findings rather than re-scoring.

## Step 3 — Generate the PDF

```bash
# Ensure reportlab is available
python3 -c "import reportlab" 2>/dev/null || pip3 install reportlab

# Write the assembled data
cat > /tmp/report_data.json << 'JSONEOF'
{ ...assembled JSON... }
JSONEOF

# Render (always call the script by its absolute ~/.claude path)
python3 ~/.claude/skills/marketing-team/scripts/generate_pdf_report.py /tmp/report_data.json "MARKETING-REPORT.pdf"
```

Then verify and clean up:
```bash
ls -la "MARKETING-REPORT.pdf"
rm /tmp/report_data.json
```

Running the script with no arguments produces a sample PDF for reference.

## PDF contents

Cover (title, URL, date, score gauge, grade, exec summary) · Score breakdown (bar chart +
weighted table) · Key findings (color-coded severity) · Prioritized action plan (Quick Wins /
Medium-Term / Strategic) · Competitive landscape (if provided) · Methodology footer.

## Troubleshooting

| Issue | Fix |
|---|---|
| `No module named 'reportlab'` | `pip3 install reportlab` |
| Only 1 page / empty | Validate JSON: `python3 -c "import json; json.load(open('/tmp/report_data.json'))"` |
| Gauge missing | `overall_score` must be a number 0–100 |
| Competitor table missing | each competitor needs name, positioning, pricing, social_proof, content |

## Terminal summary

```
=== PDF REPORT GENERATED ===
Company: [name]   Score: [X]/100 (Grade [letter])
Folded in: [files used]   Data: [tier]
File: MARKETING-REPORT.pdf ([size])
Next: /market proposal (turn findings into an engagement)
```

## Chaining

Best run after `/market report` (or `/market audit`). The PDF is the leave-behind for client
conversations; pair it with `/market proposal` to convert findings into a sellable scope.
