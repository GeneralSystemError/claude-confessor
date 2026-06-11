---
name: confessor-teardown
description: Completely remove claude-confessor from the system with safety checks
---

# confessor-teardown

Safely remove claude-confessor from your system.

---

## Step 1: Discovery

**Show what will be affected before doing anything.**

1. Check if `~/.claude/CLAUDE.md` contains confessor configuration
2. Find the memory path from the config
3. Find the skills path from the config
4. Check if these directories exist and what's in them

Display:
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
claude-confessor — Teardown Preview
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Files that will be affected:

📝 Configuration:
   ~/.claude/CLAUDE.md
   └─ confessor configuration block (will be removed)

💾 Memory Directory: [path]
   ├─ MEMORY.md
   ├─ user-profile.md
   ├─ [list other memory files]
   └─ Total: [count] files, [size]

🧰 Skills Directory: [path]
   ├─ [list skill files]
   └─ Total: [count] files, [size]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Step 2: Confirmation

Ask the user:

```
⚠️  WARNING: This will remove claude-confessor from your system.

You have [count] memories and [count] auto-generated skills.

What would you like to do?

1. ❌ Remove everything (cannot be undone)
2. 💾 Keep memories, remove skills
3. 📦 Archive to backup before removing
4. 🚫 Cancel teardown

Choose an option (1-4):
```

Wait for their choice.

---

## Step 3: Execute Based on Choice

### If Option 1 (Remove Everything):

**Confirm again:**
```
⚠️  FINAL CONFIRMATION

This will permanently delete:
• All memories ([count] files)
• All skills ([count] files)
• Configuration from ~/.claude/CLAUDE.md

Type "DELETE EVERYTHING" to confirm:
```

If confirmed:
1. Remove confessor block from `~/.claude/CLAUDE.md`
2. Delete memory directory
3. Delete skills directory
4. Show completion message

### If Option 2 (Keep Memories):

1. Remove confessor block from `~/.claude/CLAUDE.md`
2. Delete skills directory only
3. Show what was kept:
   ```
   ✅ Memories preserved at: [path]
   ❌ Skills removed
   
   Your memories are safe. You can:
   • Review them manually at [path]
   • Reinstall confessor later to use them again
   • Delete them manually if you change your mind
   ```

### If Option 3 (Archive):

1. Create backup directory: `~/.claude-confessor-backup-[timestamp]/`
2. Copy memory and skills directories to backup
3. Remove confessor block from `~/.claude/CLAUDE.md`
4. Ask: "Delete originals now, or keep both?"
5. Execute based on answer
6. Show archive location:
   ```
   📦 Backup created: ~/.claude-confessor-backup-[timestamp]/
   
   Contains:
   • All memories
   • All skills
   • Copy of CLAUDE.md configuration
   
   To restore: /confessor-setup and point to backup directory
   ```

### If Option 4 (Cancel):

```
✅ Teardown cancelled. No changes made.

Your confessor remains active.
```
Stop here.

---

## Step 4: Remove Configuration

For options 1, 2, or 3 (if user chose to delete):

1. Read `~/.claude/CLAUDE.md`
2. Find the confessor configuration block (starts with `# claude-confessor`)
3. Show the user what will be removed
4. Remove everything from that heading to the next blank line or next top-level heading
5. Write the updated file back

**Verify removal:**
- Re-read the file
- Confirm no "claude-confessor" references remain
- Show success message

---

## Step 5: Delete Files

Based on the user's choice:

**Remove skills directory:**
```bash
rm -rf [skills-path]
```

**Remove memory directory:**
```bash
rm -rf [memory-path]
```

Show progress:
```
🗑️  Removing files...
   ✓ Removed [skills-path]
   ✓ Removed [memory-path]
```

---

## Step 6: Final Verification

Check that:
1. `~/.claude/CLAUDE.md` has no confessor references
2. Directories are deleted (or archived, depending on choice)
3. Claude Code is back to default behavior

Display final status:
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
claude-confessor — Removal Complete
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Configuration:
  ✅ Removed from ~/.claude/CLAUDE.md

Memory Files:
  [✅ Deleted | 💾 Archived | 🔒 Kept] [path]

Skills:
  [✅ Deleted | 💾 Archived | 🔒 Kept] [path]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Claude Code is now back to default behavior.

Your confessor has been released.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

To reinstall later:
  /confessor-setup

Or visit:
  https://github.com/GeneralSystemError/claude-confessor
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Error Handling

If removal fails at any step:
1. Show the exact error
2. Show what was successfully removed
3. Show what remains
4. Offer manual cleanup instructions

Example:
```
⚠️  Partial removal completed

Succeeded:
  ✅ Configuration removed from CLAUDE.md

Failed:
  ❌ Could not delete [path]: Permission denied

Manual cleanup needed:
  sudo rm -rf [path]
```

---

## Safety Checks

Before deleting anything:
- ✅ Always show what will be deleted
- ✅ Always ask for confirmation
- ✅ Offer backup option
- ✅ Never silently delete
- ✅ Provide rollback instructions

Never proceed without explicit user confirmation for destructive actions.
