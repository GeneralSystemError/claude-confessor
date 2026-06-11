# claude-confessor

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code Compatible](https://img.shields.io/badge/Claude_Code-Compatible-blue.svg)](https://docs.anthropic.com/claude/docs)

> **Tell it once. It remembers forever.**

A centralized memory system for Claude Code that persists your identity, preferences, and learned skills across every project you work on.

## What It Does

Instead of re-introducing yourself to Claude Code in every new project, **claude-confessor** maintains a central memory store that automatically loads your personality, technical background, workflow rules, and reusable patterns. Claude learns from past sessions and saves "skills" — solutions and approaches that worked before — so you never have to explain the same thing twice.

Think of it as giving Claude a long-term memory that spans all your projects, not just the current conversation.

## Why "claude-confessor"?

Named after two patron saints:
- **St. Anthony of Padua** — patron saint of lost things (because Claude should never lose track of who you are)
- **St. Dymphna** — patron saint of memory (because remembering matters)

The "confessor" aspect: you tell Claude your preferences, habits, and quirks once, and it keeps them sacred across every project.

## Installation

### Option A: One-Line Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/GeneralSystemError/claude-confessor/main/install.sh | bash
```

Or clone and run locally:

```bash
git clone https://github.com/GeneralSystemError/claude-confessor.git
cd claude-confessor
chmod +x install.sh
./install.sh
```

### Option B: Manual Setup

1. Clone this repository
2. Copy the contents of `prompts/SETUP.md`
3. Paste into Claude Code in any project
4. Follow the interactive setup prompts

## Usage

Once installed, Claude Code will automatically load your memories and preferences in every project.

### Asking Claude to Remember

```
"Remember that I prefer TypeScript over JavaScript"
"Save this debugging approach as a skill"
"Remember my preferred testing framework is Jest"
```

### Asking Claude to Forget

```
"Forget my preference for TypeScript"
"Remove the memory about X"
```

### Checking What Claude Knows

```
"What do you remember about me?"
"Show me my saved skills"
"What are my preferences?"
```

### Saving a Skill

After solving a tricky problem:

```
"Save this API integration pattern as a skill"
"Turn this debugging workflow into a reusable skill"
```

## Teardown

To completely remove claude-confessor:

### Option A: Automated Uninstall

```bash
./uninstall.sh
```

### Option B: Manual Teardown

Copy the contents of `prompts/TEARDOWN.md` and paste into Claude Code to walk through the removal process interactively.

## File Structure

```
~/.claude-confessor/
├── memory/
│   ├── MEMORY.md          # Index of all your memories
│   └── user-profile.md    # Your personality and preferences
└── skills/
    └── ...                # Auto-generated reusable skills
```

Claude Code loads this via a configuration block in `~/.claude/CLAUDE.md`.

## Contributing

Contributions welcome! This is an experimental approach to persistent AI memory. Ideas for improvement:

- Better skill organization and tagging
- Memory search and filtering
- Skill sharing between users
- Migration tools from per-project to centralized memory

Open an issue or PR if you have suggestions.

## License

MIT License - Copyright (c) 2026 GeneralSystemError

See [LICENSE](LICENSE) for full text.

---

**Made with ❤️ for Claude Code users who are tired of repeating themselves.**
