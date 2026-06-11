#!/usr/bin/env bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Define paths
CONFESSOR_HOME="${HOME}/.claude-confessor"
CLAUDE_CONFIG="${HOME}/.claude/CLAUDE.md"

echo -e "${YELLOW}"
cat << "EOF"
   __  __      _           _        _ _
  |  \/  |    (_)         | |      | | |
  | \  / |_ __ _ _ __  ___| |_ __ _| | |
  | |\/| | '__| | '_ \/ __| __/ _` | | |
  | |  | | |  | | | | \__ \ || (_| | | |
  |_|  |_|_|  |_|_| |_|___/\__\__,_|_|_|

   claude-confessor
EOF
echo -e "${NC}\n"

echo -e "${RED}This will remove claude-confessor from your system.${NC}\n"

# Show what will be affected
echo -e "${YELLOW}Files and directories that will be affected:${NC}"
echo -e "  - ${CLAUDE_CONFIG} (confessor config block will be removed)"
if [ -d "${CONFESSOR_HOME}" ]; then
    echo -e "  - ${CONFESSOR_HOME}/ (your memories and skills)"
else
    echo -e "  - ${CONFESSOR_HOME}/ (does not exist)"
fi
echo ""

# Confirm before proceeding
read -p "Continue with uninstall? (y/N) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Uninstall cancelled.${NC}"
    exit 0
fi

echo -e "\n${BLUE}[1/3]${NC} Removing configuration from ${CLAUDE_CONFIG}..."

if [ -f "${CLAUDE_CONFIG}" ]; then
    # Create backup
    cp "${CLAUDE_CONFIG}" "${CLAUDE_CONFIG}.backup"
    echo -e "${GREEN}✓${NC} Backup created: ${CLAUDE_CONFIG}.backup"

    # Remove confessor config block
    # This removes from "# claude-confessor" to the end of that section
    sed -i.tmp '/# claude-confessor - Centralized Memory System/,/^$/d' "${CLAUDE_CONFIG}" 2>/dev/null || \
    sed -i '' '/# claude-confessor - Centralized Memory System/,/^$/d' "${CLAUDE_CONFIG}" 2>/dev/null || \
    echo -e "${YELLOW}Warning: Could not automatically remove config block. Please edit manually.${NC}"

    rm -f "${CLAUDE_CONFIG}.tmp"
    echo -e "${GREEN}✓${NC} Removed confessor configuration"
else
    echo -e "${YELLOW}Warning: ${CLAUDE_CONFIG} not found${NC}"
fi

echo -e "\n${BLUE}[2/3]${NC} Handling memory and skills..."
echo ""
if [ -d "${CONFESSOR_HOME}" ]; then
    echo -e "${YELLOW}Your memories and skills are stored at:${NC}"
    echo -e "  ${CONFESSOR_HOME}"
    echo ""
    echo -e "${YELLOW}This includes:${NC}"
    [ -d "${CONFESSOR_HOME}/memory" ] && echo -e "  - Personal memories and preferences"
    [ -d "${CONFESSOR_HOME}/skills" ] && echo -e "  - Auto-generated skills"
    echo ""
    read -p "Delete these files permanently? (y/N) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "${CONFESSOR_HOME}"
        echo -e "${GREEN}✓${NC} Deleted ${CONFESSOR_HOME}"
    else
        echo -e "${BLUE}✓${NC} Kept ${CONFESSOR_HOME} (you can delete manually later)"
    fi
else
    echo -e "${BLUE}No memory directory found at ${CONFESSOR_HOME}${NC}"
fi

echo -e "\n${BLUE}[3/3]${NC} Verifying removal..."

# Check if CLAUDE.md still has confessor config
if [ -f "${CLAUDE_CONFIG}" ] && grep -q "claude-confessor" "${CLAUDE_CONFIG}"; then
    echo -e "${YELLOW}Warning: Some confessor configuration may still exist in ${CLAUDE_CONFIG}${NC}"
    echo -e "${YELLOW}Please review manually.${NC}"
else
    echo -e "${GREEN}✓${NC} Configuration removed from ${CLAUDE_CONFIG}"
fi

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}Uninstall complete!${NC}\n"

echo -e "${YELLOW}Summary of changes:${NC}"
echo -e "  ${GREEN}✓${NC} Removed claude-confessor configuration from Claude Code"
if [ ! -d "${CONFESSOR_HOME}" ]; then
    echo -e "  ${GREEN}✓${NC} Deleted memory and skills directory"
else
    echo -e "  ${BLUE}✓${NC} Kept memory and skills directory (manual cleanup needed)"
fi
echo ""
echo -e "${BLUE}Claude Code is now back to default behavior.${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
