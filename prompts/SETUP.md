# claude-confessor Interactive Setup

I want to set up **claude-confessor**, a centralized memory system for Claude Code. Please help me configure this step by step.

## Phase 1: Discovery

FIRST, ask me these questions **one at a time** (wait for my answer before moving to the next):

1. **Where should I store the central memory folder?**
   - Default: `~/.claude-confessor/memory/`
   - Or specify a custom path

2. **Where should I store auto-generated skills?**
   - Default: `~/.claude-confessor/skills/`
   - Or specify a custom path

3. **What's your learning style / personality type?**
   - **Visual** — diagrams, examples, analogies
   - **Analytical** — technical details, deep dives
   - **Hands-on** — step-by-step, just tell me what to do
   - **Exploratory** — understand the why, multiple approaches

4. **What's your technical background?**
   - Beginner
   - Intermediate
   - Advanced
   - Expert

5. **How do you prefer explanations?**
   - Short and concise
   - Detailed and thorough
   - Balanced (context-dependent)

6. **What tone works best for you?**
   - Professional
   - Casual
   - Enthusiastic
   - Straightforward

7. **Any specific preferences, tools, or workflows I should know about?**
   - Programming languages you prefer
   - Testing frameworks
   - Development environment (OS, editor, shell)
   - Git workflow preferences
   - Anything else I should remember

---

## Phase 2: Installation

AFTER I answer all questions, please:

1. **Create the directory structure** at the paths I specified:
   ```
   [memory-path]/
   ├── MEMORY.md
   └── user-profile.md
   
   [skills-path]/
   (empty, will be populated over time)
   ```

2. **Create or update `~/.claude/CLAUDE.md`** with:
   - Memory location configuration pointing to my chosen path
   - Auto-skill generation instructions
   - Git rules:
     - Never auto-push to remote
     - Always ask before committing
     - Summarize changes before staging
   - Any workflow preferences I mentioned

3. **Create `MEMORY.md`** index file at my chosen memory path with:
   ```markdown
   # Memory Index
   
   This is your central memory system for Claude Code.
   
   ## Active Memories
   
   - [User Profile](user-profile.md) — Your personality, learning style, and preferences
   
   ## How This Works
   
   - When you ask Claude to "remember" something, it gets saved here
   - Memories are organized by type: user, feedback, project, reference
   - Each memory is a separate file, indexed in this document
   
   ## Quick Reference
   
   - "Remember that [preference]" → saves a memory
   - "Forget about [thing]" → removes a memory
   - "What do you remember about me?" → loads and summarizes memories
   - "Save this as a skill" → exports a pattern to the skills directory
   ```

4. **Create `user-profile.md`** capturing:
   - My learning style
   - Technical background
   - Communication preferences
   - Any specific tools/workflows I mentioned

5. **Verify everything is set up correctly** by:
   - Listing all created files with their paths
   - Confirming Claude Code will load them at session start
   - Checking that the memory and skills directories are writable

6. **Print a quick reference card** showing how to:
   - Ask Claude to remember something
   - Ask Claude to forget something
   - Save a pattern as a skill
   - Check what Claude knows about me
   - Update my profile
   - Reset everything (uninstall)

---

## Phase 3: Confirmation

After setup is complete, please:

1. **Test the memory system** by:
   - Reading my user profile
   - Confirming you can see my preferences
   - Showing me an example of how you'll adapt communication to my style

2. **Show me what's next:**
   - How to start using the system naturally
   - When and how skills get auto-generated
   - How to manually manage memories if needed

---

Ready? Let's start with question 1: **Where should I store the central memory folder?**
