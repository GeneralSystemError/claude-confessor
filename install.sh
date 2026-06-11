#!/usr/bin/env bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Banner
echo -e "${BLUE}"
cat << "EOF"
   ____ _                 _
  / ___| | __ _ _   _  __| | ___
 | |   | |/ _` | | | |/ _` |/ _ \
 | |___| | (_| | |_| | (_| |  __/
  \____|_|\__,_|\__,_|\__,_|\___|

   ____             __
  / ___|___  _ __  / _| ___  ___ ___  ___  _ __
 | |   / _ \| '_ \| |_ / _ \/ __/ __|/ _ \| '__|
 | |__| (_) | | | |  _|  __/\__ \__ \ (_) | |
  \____\___/|_| |_|_|  \___||___/___/\___/|_|

EOF
echo -e "${NC}"
echo -e "${GREEN}Tell it once. It remembers forever.${NC}\n"

# Check for required commands
command -v git >/dev/null 2>&1 || { echo -e "${RED}Error: git is required but not installed.${NC}" >&2; exit 1; }

# Define paths
CONFESSOR_HOME="${HOME}/.claude-confessor"
MEMORY_DIR="${CONFESSOR_HOME}/memory"
SKILLS_DIR="${CONFESSOR_HOME}/skills"
CLAUDE_CONFIG="${HOME}/.claude/CLAUDE.md"
CLAUDE_SKILLS_DIR="${HOME}/.claude/skills"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}[1/6]${NC} Creating directory structure..."
mkdir -p "${MEMORY_DIR}"
mkdir -p "${SKILLS_DIR}"
mkdir -p "${CLAUDE_SKILLS_DIR}"
mkdir -p "$(dirname "${CLAUDE_CONFIG}")"

echo -e "${BLUE}[2/6]${NC} Installing templates..."
cp "${SCRIPT_DIR}/templates/MEMORY.md.template" "${MEMORY_DIR}/MEMORY.md"
cp "${SCRIPT_DIR}/templates/user-profile.md.template" "${MEMORY_DIR}/user-profile.md"

echo -e "${BLUE}[3/6]${NC} Installing skills..."
if [ -d "${SCRIPT_DIR}/skills" ]; then
    cp "${SCRIPT_DIR}/skills"/*.md "${CLAUDE_SKILLS_DIR}/" 2>/dev/null || true
    echo -e "${GREEN}✓${NC} Installed confessor skills to ${CLAUDE_SKILLS_DIR}"
else
    echo -e "${YELLOW}Warning: Skills directory not found. Skipping skill installation.${NC}"
fi

echo -e "${BLUE}[4/6]${NC} Configuring Claude Code..."

# Check if CLAUDE.md exists
if [ -f "${CLAUDE_CONFIG}" ]; then
    # Check if confessor config already exists
    if grep -q "claude-confessor" "${CLAUDE_CONFIG}"; then
        echo -e "${YELLOW}Warning: claude-confessor configuration already exists in ${CLAUDE_CONFIG}${NC}"
        echo -e "${YELLOW}Skipping configuration update.${NC}"
    else
        echo -e "\n" >> "${CLAUDE_CONFIG}"
        cat "${SCRIPT_DIR}/templates/CLAUDE.md.template" >> "${CLAUDE_CONFIG}"
        echo -e "${GREEN}✓${NC} Updated existing CLAUDE.md"
    fi
else
    cat "${SCRIPT_DIR}/templates/CLAUDE.md.template" > "${CLAUDE_CONFIG}"
    echo -e "${GREEN}✓${NC} Created new CLAUDE.md"
fi

echo -e "${BLUE}[5/6]${NC} Setting up memory system..."
# Memory files already copied in step 2
echo -e "${GREEN}✓${NC} Memory index created at ${MEMORY_DIR}/MEMORY.md"
echo -e "${GREEN}✓${NC} User profile created at ${MEMORY_DIR}/user-profile.md"

echo -e "${BLUE}[6/6]${NC} Verifying installation..."
echo ""
echo -e "${GREEN}Installation complete!${NC}\n"

# Print success message
cat << EOF
${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}

Your confessor is ready and waiting.

${YELLOW}Next Steps:${NC}

1. Open Claude Code in any project

2. Run the interactive setup:
   ${BLUE}/confessor-setup${NC}

   This will walk you through personalizing your profile.

3. Or start using it immediately:
   ${BLUE}"Remember that I prefer TypeScript over JavaScript"${NC}
   ${BLUE}"I'm a senior backend engineer"${NC}
   ${BLUE}"I like detailed explanations"${NC}

${YELLOW}Installation Details:${NC}
- Memory: ${MEMORY_DIR}
- Skills: ${SKILLS_DIR}
- Config: ${CLAUDE_CONFIG}
- Claude Skills: ${CLAUDE_SKILLS_DIR}

${YELLOW}Quick Commands:${NC}
- ${BLUE}/confessor-setup${NC} — Interactive configuration
- ${BLUE}/confessor-status${NC} — View memory system status
- ${BLUE}/confessor-teardown${NC} — Uninstall confessor

${YELLOW}Natural Language:${NC}
- "Remember that [preference]"
- "Forget about [thing]"
- "What do you remember about me?"
- "Save this as a reusable skill"

${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}
EOF
