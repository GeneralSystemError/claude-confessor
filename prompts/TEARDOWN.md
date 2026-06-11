# claude-confessor Teardown

Please help me completely remove **claude-confessor** from my system.

Walk me through the following steps:

---

## Step 1: Discovery

**Show me which files and folders will be affected before deleting anything.**

Specifically, check for:
- `~/.claude-confessor/` directory
  - `memory/` subdirectory and its contents
  - `skills/` subdirectory and its contents
- `~/.claude/CLAUDE.md` (the claude-confessor configuration block)
- Any other files that might have been created during setup

List everything with full paths and file sizes, so I can see what I'm about to remove.

---

## Step 2: Remove Configuration

**Remove the claude-confessor memory block from `~/.claude/CLAUDE.md`.**

Before removing:
1. Show me the current claude-confessor section in the file
2. Confirm this is what you'll remove
3. Ask for my approval

After removing:
1. Show me the updated file (or the relevant section)
2. Confirm the configuration has been removed

---

## Step 3: Handle Memory and Skills

**Ask me whether I want to keep or delete my memory and skills files at `~/.claude-confessor/`.**

Present these options:

- **Option A: Keep everything** — Preserve all memories and skills (I can manually review/archive later)
- **Option B: Keep memories, delete skills** — Preserve my personal memories, remove auto-generated skills
- **Option C: Delete everything** — Permanently remove all files (cannot be undone)

For whichever option I choose:
1. Show me exactly what will be kept/deleted
2. Ask for confirmation before proceeding
3. Execute the action
4. Confirm completion

---

## Step 4: Verify Removal

**Confirm Claude Code is back to default behavior by showing the current state of `~/.claude/CLAUDE.md`.**

Check:
- Does it still contain any claude-confessor references?
- Is it back to default Claude Code behavior?
- Are there any lingering configuration fragments?

---

## Step 5: Summary

**Print a summary of everything that was removed:**

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
claude-confessor — Removal Complete
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Configuration:
  ✓ Removed from ~/.claude/CLAUDE.md

Memory Files:
  [✓ Deleted | ✓ Kept | — Not found] ~/.claude-confessor/memory/

Skills:
  [✓ Deleted | ✓ Kept | — Not found] ~/.claude-confessor/skills/

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Claude Code is now back to default behavior.

Your confessor has been released.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Include:
- What was removed
- What was kept (if anything)
- Whether any manual cleanup is needed
- How to reinstall if I change my mind

---

Ready to begin teardown. Please start with **Step 1: Discovery**.
