#!/bin/bash
# AI Marketing Team — Uninstaller
set -e
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'

echo "Removing AI Marketing Team from Claude Code..."

# Skills (orchestrator + market-* sub-skills)
rm -rf "$HOME/.claude/skills/marketing-team"
rm -rf "$HOME"/.claude/skills/market-*

# Specialist subagents
for a in cmo-strategist copywriter seo-lead performance-marketer social-manager email-marketer competitive-analyst; do
    rm -f "$HOME/.claude/agents/$a.md"
done

# Command
rm -f "$HOME/.claude/commands/market.md"

echo -e "${GREEN}✓ Removed skills, specialists, and the /market command.${NC}"
echo -e "${YELLOW}Note:${NC} your brand brief at ~/.claude/marketing/brand-brief.md was kept."
echo "      Delete it manually if you want it gone:  rm -rf ~/.claude/marketing"
