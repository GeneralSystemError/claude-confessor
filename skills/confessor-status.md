---
name: confessor-status
description: Check claude-confessor memory system status and show all active memories
---

# confessor-status

Shows the current state of your claude-confessor memory system.

---

## Step 1: Verify Installation

Check if claude-confessor is installed:

1. Look for `~/.claude/CLAUDE.md` and check if it contains "claude-confessor"
2. Find the memory path from the configuration
3. Check if memory directory exists

**If not installed:**
```
⚠️  claude-confessor is not installed.

To install, run: /confessor-setup

Or visit: https://github.com/GeneralSystemError/claude-confessor
```

**If installed, continue to Step 2.**

---

## Step 2: Read Memory Index

Read the `MEMORY.md` file from the configured memory path.

Show:
- Total number of memories
- List of all memory files with their descriptions
- Memory types breakdown (how many user/feedback/project/reference)

---

## Step 3: Display Status

Format the output like this:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
claude-confessor — Memory System Status
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📍 Memory Location: [path from config]
📦 Total Memories: [count]

Active Memories:
┌─────────────────────────────────────────────
│ USER MEMORIES ([count])
├─────────────────────────────────────────────
│ • user-profile.md — [description]
│ • [other user memories]
│
│ FEEDBACK MEMORIES ([count])
├─────────────────────────────────────────────
│ • [feedback memories]
│
│ PROJECT MEMORIES ([count])
├─────────────────────────────────────────────
│ • [project memories]
│
│ REFERENCE MEMORIES ([count])
├─────────────────────────────────────────────
│ • [reference memories]
└─────────────────────────────────────────────

🧠 Your Profile Summary:
• Learning style: [from user-profile.md]
• Technical level: [from user-profile.md]
• Preferred tone: [from user-profile.md]
• Primary languages: [from user-profile.md]

💾 Skills Directory: [path from config]
📊 Auto-generated skills: [count files in skills dir]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Quick commands:
• "Remember that [X]" → Save a new memory
• "Forget about [X]" → Remove a memory
• "Show me [memory-name]" → Read a specific memory
• "Update my profile" → Modify user-profile.md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Step 4: Health Check

Check for common issues:

**Check 1: Orphaned memory files**
- Files in memory directory not linked in MEMORY.md
- If found: offer to add them to the index

**Check 2: Broken links**
- Links in MEMORY.md pointing to non-existent files
- If found: offer to remove them from the index

**Check 3: Outdated memories**
- Project memories older than 90 days
- If found: suggest reviewing for relevance

If any issues found, show:
```
⚠️  Issues detected:

[List issues with suggested fixes]

Fix these? (yes/no)
```

---

## Optional: Detailed View

If the user asks for more detail, offer:

**"Show me [specific memory]"**
→ Read and display the full content of that memory file

**"Show all user memories"**
→ Read and display all memories of that type

**"When was [memory] last updated?"**
→ Check file modification time

**"What did I learn recently?"**
→ Sort memories by modification date, show newest 5

---

## Easter Egg: Saint Anthony's Prayer

**TRIGGER:** If the user's message contains "help me find" or "help find" or "can't find" AND they're asking about memories or searching their memory system.

**ACTION:** Before showing the normal status output, display:

```
     🕯️
  
Saint Anthony, Saint Anthony,
please come around.
Something is lost and needs to be found.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

```

Then proceed with the normal search/status display.

**Note:** This is an undocumented easter egg. Do not mention it exists unless triggered. The user must discover it naturally by asking for help finding something in their memories.
