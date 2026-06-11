# claude-confessor — Quick Start

> **Tell it once. It remembers forever.**

## 60-Second Installation

### Step 1: Install

Run this in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/GeneralSystemError/claude-confessor/main/install.sh | bash
```

**What this does:**
- Creates `~/.claude-confessor/memory/` for your memories
- Creates `~/.claude-confessor/skills/` for auto-generated patterns
- Installs management skills to `~/.claude/skills/`
- Updates `~/.claude/CLAUDE.md` with auto-load configuration

### Step 2: Configure

Open Claude Code in **any project** and run:

```
/confessor-setup
```

Answer 7 quick questions about your preferences:
1. Memory location (default: `~/.claude-confessor/memory/`)
2. Skills location (default: `~/.claude-confessor/skills/`)
3. Learning style (Visual / Analytical / Hands-on / Exploratory)
4. Technical background (Beginner / Intermediate / Advanced / Expert)
5. Explanation preference (Short / Detailed / Balanced)
6. Communication tone (Professional / Casual / Enthusiastic / Straightforward)
7. Workflow preferences (languages, tools, git style, etc.)

### Step 3: Done!

From now on, Claude remembers who you are in **every project**.

---

## Usage

### Check What Claude Knows

```
/confessor-status
```

Or ask naturally:
```
"What do you remember about me?"
```

### Save a Memory

Just ask Claude naturally:
```
"Remember that I prefer TypeScript over JavaScript"
"Remember I work on backend systems"
"Remember to always run tests before committing"
```

### Forget Something

```
"Forget my preference for TypeScript"
"Remove the memory about X"
```

### Save a Reusable Pattern

After solving a problem:
```
"Save this debugging approach as a skill"
"Save this API integration pattern"
```

---

## How It Works

### At Session Start
1. Claude reads `~/.claude-confessor/memory/MEMORY.md`
2. Claude reads `~/.claude-confessor/memory/user-profile.md`
3. Claude adapts to your style automatically

### When You Say "Remember"
1. Claude saves the memory to a file in `~/.claude-confessor/memory/`
2. Claude updates `MEMORY.md` index with a link
3. Future sessions auto-load it

### Memory Types

| Type | Example |
|------|---------|
| **user** | "I'm a backend engineer who prefers Python" |
| **feedback** | "Don't use mocks in integration tests" |
| **project** | "We're in a feature freeze until June 20" |
| **reference** | "Bugs are tracked in Linear project INGEST" |

---

## Uninstall

Run the teardown skill:

```
/confessor-teardown
```

Or run the uninstall script:

```bash
~/.claude-confessor/uninstall.sh
```

Both methods offer:
- Preview what will be deleted
- Option to archive memories before removal
- Option to keep memories but remove configuration
- Safe, confirmed deletion

---

## File Structure

```
~/.claude-confessor/
├── memory/
│   ├── MEMORY.md          # Index of all memories
│   ├── user-profile.md    # Your preferences
│   └── *.md               # Individual memory files
└── skills/
    └── *.md               # Auto-generated patterns

~/.claude/
├── CLAUDE.md              # Updated with confessor config
└── skills/
    ├── confessor-setup.md
    ├── confessor-status.md
    └── confessor-teardown.md
```

---

## Troubleshooting

### "Claude doesn't remember me"

Check if the configuration is loaded:
```
/confessor-status
```

If not installed, run:
```
/confessor-setup
```

### "Skills not found"

Skills might not be installed. Run:
```bash
mkdir -p ~/.claude/skills
curl -o ~/.claude/skills/confessor-setup.md https://raw.githubusercontent.com/GeneralSystemError/claude-confessor/main/skills/confessor-setup.md
curl -o ~/.claude/skills/confessor-status.md https://raw.githubusercontent.com/GeneralSystemError/claude-confessor/main/skills/confessor-status.md
curl -o ~/.claude/skills/confessor-teardown.md https://raw.githubusercontent.com/GeneralSystemError/claude-confessor/main/skills/confessor-teardown.md
```

Restart Claude Code.

### "Memory not loading automatically"

Check `~/.claude/CLAUDE.md` contains:
```markdown
# claude-confessor - Centralized Memory System
```

If not, run `/confessor-setup` to add it.

---

## Full Documentation

- **README:** https://github.com/GeneralSystemError/claude-confessor
- **Issues:** https://github.com/GeneralSystemError/claude-confessor/issues
- **License:** MIT

---

**Made with ❤️ for Claude Code users who are tired of repeating themselves.**
