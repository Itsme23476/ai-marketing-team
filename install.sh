#!/bin/bash
# AI Marketing Team — Claude Code Installer
# Installs the marketing-team skill suite, specialist subagents, the /market command,
# Python helpers, and templates into Claude Code.

set -e

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; CYAN='\033[0;36m'; RED='\033[0;31m'; NC='\033[0m'

echo ""
echo -e "${CYAN}╔════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║        AI Marketing Team — for Claude Code       ║${NC}"
echo -e "${CYAN}║   16 commands · 7 specialists · /market          ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════╝${NC}"
echo ""

# Locate source (works for local clone and curl | bash)
if [ -n "$BASH_SOURCE" ] && [ "$BASH_SOURCE" != "bash" ] && [ -f "$BASH_SOURCE" ]; then
    SCRIPT_DIR="$(cd "$(dirname "$BASH_SOURCE")" && pwd)"
else
    echo -e "${YELLOW}Remote install — cloning repository...${NC}"
    TEMP_DIR=$(mktemp -d)
    git clone --depth 1 https://github.com/zubair-trabzada/ai-marketing-claude.git "$TEMP_DIR/repo" 2>/dev/null || { echo -e "${RED}Clone failed.${NC}"; exit 1; }
    SCRIPT_DIR="$TEMP_DIR/repo"
fi

SKILLS_DIR="$HOME/.claude/skills"
AGENTS_DIR="$HOME/.claude/agents"
COMMANDS_DIR="$HOME/.claude/commands"
TEAM_DIR="$SKILLS_DIR/marketing-team"

echo -e "${BLUE}Source:${NC} $SCRIPT_DIR"
echo -e "${BLUE}Target:${NC} $HOME/.claude"
echo ""

command -v claude &>/dev/null && echo -e "${GREEN}✓ Claude Code detected${NC}" || echo -e "${YELLOW}⚠ Claude Code not found in PATH (continuing)${NC}"

mkdir -p "$SKILLS_DIR" "$AGENTS_DIR" "$COMMANDS_DIR"

# 1. Skills (orchestrator + 14 sub-skills, each its own folder)
echo -e "\n${BLUE}Installing skills...${NC}"
SKILL_COUNT=0
for dir in "$SCRIPT_DIR"/skills/*/; do
    name=$(basename "$dir")
    mkdir -p "$SKILLS_DIR/$name"
    cp -R "$dir"* "$SKILLS_DIR/$name/"
    echo -e "  ${GREEN}✓${NC} $name"
    SKILL_COUNT=$((SKILL_COUNT + 1))
done

# 2. Specialist subagents
echo -e "\n${BLUE}Installing specialists (subagents)...${NC}"
AGENT_COUNT=0
for f in "$SCRIPT_DIR"/agents/*.md; do
    cp "$f" "$AGENTS_DIR/$(basename "$f")"
    echo -e "  ${GREEN}✓${NC} $(basename "$f" .md)"
    AGENT_COUNT=$((AGENT_COUNT + 1))
done

# 3. /market slash command
echo -e "\n${BLUE}Installing /market command...${NC}"
cp "$SCRIPT_DIR"/commands/*.md "$COMMANDS_DIR/"
echo -e "  ${GREEN}✓${NC} /market"

# 4. Python helpers + templates → absolute path the skills reference
echo -e "\n${BLUE}Installing helpers & templates...${NC}"
mkdir -p "$TEAM_DIR/scripts" "$TEAM_DIR/templates"
cp "$SCRIPT_DIR"/scripts/*.py "$TEAM_DIR/scripts/" 2>/dev/null && chmod +x "$TEAM_DIR"/scripts/*.py
cp "$SCRIPT_DIR"/templates/*.md "$TEAM_DIR/templates/" 2>/dev/null
echo -e "  ${GREEN}✓${NC} scripts → $TEAM_DIR/scripts"
echo -e "  ${GREEN}✓${NC} templates → $TEAM_DIR/templates"

# 5. Brand brief — the thing that makes output yours
echo -e "\n${BLUE}Brand brief...${NC}"
mkdir -p "$HOME/.claude/marketing"
if [ -f "$HOME/.claude/marketing/brand-brief.md" ]; then
    echo -e "  ${GREEN}✓${NC} existing brand brief kept ($HOME/.claude/marketing/brand-brief.md)"
else
    cp "$SCRIPT_DIR/templates/brand-brief.md" "$HOME/.claude/marketing/brand-brief.md"
    echo -e "  ${GREEN}✓${NC} starter brand brief created → $HOME/.claude/marketing/brand-brief.md"
    echo -e "    ${YELLOW}Fill it in (or run /market brand <your-url>) so the team works on YOUR business.${NC}"
fi

# 6. Optional PDF dependency
echo -e "\n${BLUE}Python check...${NC}"
if command -v python3 &>/dev/null; then
    python3 -c "import reportlab" 2>/dev/null \
        && echo -e "  ${GREEN}✓${NC} reportlab installed (PDF reports ready)" \
        || echo -e "  ${YELLOW}⚠${NC} reportlab missing — for /market report-pdf run: ${CYAN}pip install reportlab${NC}"
else
    echo -e "  ${YELLOW}⚠${NC} python3 not found — skills fall back to WebFetch"
fi

[ -n "$TEMP_DIR" ] && rm -rf "$TEMP_DIR"

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║              Installation complete!              ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════╝${NC}"
echo -e "  Skills: ${GREEN}$SKILL_COUNT${NC}   Specialists: ${GREEN}$AGENT_COUNT${NC}   Command: ${GREEN}/market${NC}"
echo ""
echo -e "${CYAN}Start here:${NC}"
echo "  1. Fill in your brand brief:  ~/.claude/marketing/brand-brief.md"
echo "  2. Start a NEW Claude Code session"
echo "  3. Run:  /market standup        ← your whole team builds a 90-day plan"
echo "     or:   /market audit <url>    ← full scored marketing audit"
echo ""
