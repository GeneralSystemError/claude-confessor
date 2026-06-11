---
name: confessor-setup
description: Interactive setup for claude-confessor centralized memory system
---

# claude-confessor Setup

Welcome! This will set up **claude-confessor**, a centralized memory system that lets Claude remember who you are across all projects.

## What This Does

- Creates a central memory directory (`~/.claude-confessor/memory/`)
- Creates a skills directory for auto-generated patterns
- Configures Claude Code to auto-load your memories at every session start
- Sets up your user profile with learning style and preferences

---

## Step 1: Configuration Paths

Ask the user one at a time:

**Q1: Where should I store your central memory?**
- Default: `~/.claude-confessor/memory/`
- Or specify a custom path

Wait for answer, then ask:

**Q2: Where should I store auto-generated skills?**
- Default: `~/.claude-confessor/skills/`
- Or specify a custom path

---

## Step 2: User Profile

Ask these questions one at a time (wait for each answer):

**Q3: What's your learning style?**
- **Visual** — diagrams, examples, analogies
- **Analytical** — technical details, deep dives
- **Hands-on** — step-by-step instructions
- **Exploratory** — understand the "why", multiple approaches

**Q4: What's your technical background?**
- Beginner
- Intermediate
- Advanced
- Expert

**Q5: How do you prefer explanations?**
- Short and concise
- Detailed and thorough
- Balanced (context-dependent)

**Q6: What tone works best?**
- Professional
- Casual
- Enthusiastic
- Straightforward

**Q7: Tell me about your workflow preferences:**

Ask about:
- Primary programming languages
- Preferred testing frameworks
- Development environment (OS, editor, shell)
- Git workflow preferences (commit style, branch naming, PR size)
- Any other preferences I should remember

---

## Step 3: Installation

Now create the directory structure:

```bash
mkdir -p [memory-path]
mkdir -p [skills-path]
mkdir -p ~/.claude
```

Create `[memory-path]/MEMORY.md`:
```markdown
# Memory Index

This is your central memory system for Claude Code, managed by **claude-confessor**.

---

## Active Memories

- [User Profile](user-profile.md) — Your personality, learning style, and preferences

---

## How This Works

When you ask Claude to "remember" something, it gets saved as a separate file in this directory and linked here.

### Memory Types

| Type | What It Stores | Example |
|------|----------------|---------|
| **user** | Your role, background, preferences, knowledge | "I'm a backend engineer who prefers Python" |
| **feedback** | Corrections or validated approaches | "Don't use mocks in integration tests" |
| **project** | Ongoing work, goals, or context | "We're in a feature freeze until June 20" |
| **reference** | Pointers to external resources | "Bugs are tracked in Linear project INGEST" |

---

## Quick Reference

| What You Say | What Claude Does |
|--------------|-----------------|
| "Remember that [preference]" | Saves a new memory file and links it here |
| "Forget about [thing]" | Removes the memory file and its link |
| "What do you remember about me?" | Reads all memories and summarizes them |
| Use `/confessor-status` | Shows all active memories |

---

**Last Updated:** [current date]
```

Create `[memory-path]/user-profile.md` using their answers:
```markdown
---
name: user-profile
description: Core personality, learning style, and communication preferences
metadata:
  type: user
---

# User Profile

## Learning Style

**[Their answer from Q3]**

## Technical Background

**[Their answer from Q4]**

## Explanation Preferences

**[Their answer from Q5]**

## Communication Tone

**[Their answer from Q6]**

## Tools & Workflows

[Their answers from Q7, formatted as sections:]

### Programming Languages
- Primary: [their answer]
- Secondary: [their answer]

### Development Environment
- OS: [their answer]
- Editor/IDE: [their answer]
- Shell: [their answer]

### Testing & Quality
- Preferred testing framework: [their answer]
- Code style preferences: [their answer]

### Git Workflow
- Commit message style: [their answer]
- Branch naming convention: [their answer]
- PR size preference: [their answer]

### Other Preferences
[Any other preferences they mentioned]

---

**Last Updated:** [current date]
```

---

## Step 4: Configure Claude Code

Check if `~/.claude/CLAUDE.md` exists:

**If it exists:**
- Check if it already has a claude-confessor section
- If yes: warn and skip
- If no: append the configuration block

**If it doesn't exist:**
- Create it with the configuration block

**Configuration block to add:**

```markdown
# claude-confessor - Centralized Memory System

**Your confessor is listening.**

## Memory System Configuration

Memory is stored centrally and loaded at every session start.

**Primary memory location:** `[their memory path]`

At the start of every conversation:
1. Read `[memory-path]/MEMORY.md` to load the memory index
2. Read `[memory-path]/user-profile.md` to understand who I am and how I work
3. Use these memories to inform your behavior, communication style, and recommendations

## Saving Memories

When I ask you to "remember" something, or when you learn important information about me:

1. Determine the memory type:
   - **user** — Information about my role, background, preferences, knowledge
   - **feedback** — Guidance on what to do or avoid (corrections or validated approaches)
   - **project** — Ongoing work, goals, or context about this specific project
   - **reference** — Pointers to where information lives (docs, dashboards, repos)

2. Save to: `[memory-path]/{type}_{name}.md`

3. Use this frontmatter format:
   ```markdown
   ---
   name: short-kebab-case-slug
   description: One-line summary (used to decide relevance in future conversations)
   metadata:
     type: user | feedback | project | reference
   ---

   [Memory content here]

   For feedback and project memories, structure as:
   - Lead with the rule/fact
   - **Why:** (the reason or motivation)
   - **How to apply:** (when/where this guidance applies)
   ```

4. Update the index at `[memory-path]/MEMORY.md` with a one-line pointer

## Forgetting Memories

When I ask you to "forget" something:

1. Find the relevant memory file in `[memory-path]/`
2. Show me what you're about to delete
3. Ask for confirmation
4. Remove the file and its entry from `MEMORY.md`

## Auto-Generated Skills

When I solve a tricky problem or you identify a reusable pattern, you can save it as a skill:

**Skills location:** `[skills-path]/`

Skills should be:
- Reusable across projects
- Well-documented with examples
- Named clearly (e.g., `api-integration-pattern.md`, `debugging-react-hooks.md`)

When saving a skill:
1. Ask if I want to save it
2. Suggest a clear name
3. Write the skill file with structure:
   ```markdown
   # [Skill Name]

   ## When to Use
   [Description of the problem this solves]

   ## Approach
   [Step-by-step solution]

   ## Example
   [Code example or walkthrough]

   ## Variations
   [Alternative approaches or edge cases]
   ```

## Git Workflow Rules

**CRITICAL: Never take destructive git actions without explicit permission.**

- **Never auto-push** to remote repositories
- **Always ask before committing**
- Before staging, show me a summary of changes
- Before creating a PR, walk through what will be included
- Never use `--force` flags without explicit approval
- Always prefer creating new commits over amending (safer)

## Communication Guidelines

Adapt your responses based on my user profile (`[memory-path]/user-profile.md`):

- Match my preferred **learning style** ([their style])
- Adjust explanation **depth** to my technical background ([their level])
- Use my preferred **tone** ([their tone])
- Honor my **workflow preferences** ([key preferences])

---

**Installed:** claude-confessor v1.0
**Repository:** https://github.com/GeneralSystemError/claude-confessor
```

---

## Step 5: Verify Installation

Show the user:

1. **Files created:**
   ```
   [memory-path]/
   ├── MEMORY.md
   └── user-profile.md
   
   [skills-path]/
   (empty, will be populated over time)
   
   ~/.claude/CLAUDE.md
   (updated with confessor configuration)
   ```

2. **Test the memory system:**
   - Read the user profile
   - Confirm you can see their preferences
   - Show an example of how you'll adapt communication to their style

3. **Quick reference card:**
   ```
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   claude-confessor is ready!
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   
   Your preferences:
   • Learning style: [their style]
   • Technical level: [their level]
   • Tone: [their tone]
   
   Quick commands:
   • "Remember that [X]" → Save a memory
   • "Forget about [X]" → Remove a memory
   • "What do you remember about me?" → Show all memories
   • /confessor-status → View memory system status
   
   Skills installed:
   • /confessor-setup (this skill)
   • /confessor-status (check memories)
   
   What's next:
   Start any project and I'll automatically remember who you
   are and how you like to work. No more re-explaining yourself!
   
   Try it: "Remember that I prefer TypeScript over JavaScript"
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   ```

---

## Step 6: Next Steps

Tell the user:

"Setup is complete! Your confessor is now active in all projects.

**Test it out:**
1. Open Claude Code in any project
2. Ask me 'What do you remember about me?'
3. You should see your profile loaded automatically

**Customize further:**
- Tell me to remember any preferences as you work
- Ask me to save useful patterns as skills
- Use `/confessor-status` anytime to see what I know

**Need help?**
- Repository: https://github.com/GeneralSystemError/claude-confessor
- Uninstall: Use the `/confessor-teardown` skill or run `~/.claude-confessor/uninstall.sh`"

---

## Error Handling

If any step fails:
1. Show the exact error
2. Suggest fixes
3. Ask if they want to continue or abort
4. Don't leave partial installations

If `~/.claude/CLAUDE.md` already has confessor config:
- Show the existing config
- Ask: "Update it?" or "Keep existing?"
- Only proceed with permission
