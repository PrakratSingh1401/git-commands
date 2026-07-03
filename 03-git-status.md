# git status — Check Repository Status

The `git status` command shows the current state of your working directory and staging area.

## Syntax

```bash
git status
git status --short    # Short format
git status -s         # Even shorter
```

## What It Shows

- Current branch
- Files with unstaged changes
- Files staged for commit
- Untracked files
- Whether your branch is ahead or behind the remote

## Examples

### Example 1: Basic Status Check

```bash
git status

# Output:
# On branch main
# Your branch is up to date with 'origin/main'.
#
# nothing to commit, working tree clean
```

### Example 2: With Unstaged Changes

```bash
# Edit a file
echo "new content" >> index.js

git status

# Output:
# On branch main
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   modified:   index.js
#
# no changes added to commit but untracked changes present
```

### Example 3: With Staged Changes

```bash
# Stage the changes
git add index.js

git status

# Output:
# On branch main
# Changes to be committed:
#   (use "git restore --staged <file>..." to unstage)
#   modified:   index.js
```

### Example 4: With Untracked Files

```bash
# Create a new file
echo "config" > config.json

git status

# Output:
# On branch main
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   modified:   index.js
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#   config.json
```

### Example 5: Short Format

```bash
git status --short
# or
git status -s

# Output:
# M  index.js          (modified)
# A  app.py            (added)
# D  old.js            (deleted)
# ?? config.json       (untracked)
# M  package.json      (staged and modified)
```

### Example 6: Branch Ahead/Behind

```bash
# After committing but not pushing
git commit -m "New feature"

git status

# Output:
# On branch main
# Your branch is ahead of 'origin/main' by 1 commit.
#   (use "git push" to publish your local commits)
```

## Understanding the Output

### File Status Indicators (short format)

| Indicator | Meaning |
|-----------|---------|
| `M` | Modified |
| `A` | Added |
| `D` | Deleted |
| `R` | Renamed |
| `C` | Copied |
| `??` | Untracked |
| `MM` | Modified in both stages |
| `AM` | Added but modified |

### Position Meanings

- **First column:** Staging area (index)
- **Second column:** Working directory

```
M index.js  → Modified in staging area
 M index.js → Modified in working directory
MM index.js → Modified in both
```

## Common Use Cases

### Before Starting Work

```bash
# Check current state
git status

# Make sure your branch is up to date
git pull
```

### During Development

```bash
# Check what you've changed
git status

# Review changes before staging
git diff

# Stage important changes
git add important.js

# Check again
git status
```

### Before Committing

```bash
# Verify all intended changes are staged
git status

# If something is missing, add it
git add forgotten.js

# Now commit
git commit -m "Complete feature"
```

## Workflow Example

```bash
# 1. Check initial status
git status
# ✓ working tree clean

# 2. Make changes
echo "console.log('hello')" > app.js
echo "{ version: 1 }" > package.json

# 3. Check what changed
git status
# M  package.json
# ?? app.js

# 4. Stage one file
git add package.json

# 5. Check again
git status
# M  package.json (staged)
# ?? app.js (untracked)

# 6. Stage the other file
git add app.js

# 7. Final check
git status
# A  app.js
# M  package.json
# (ready to commit)

# 8. Commit
git commit -m "Initial setup"

# 9. Check final status
git status
# On branch main
# nothing to commit, working tree clean
```

## Pro Tips

### Use Short Format for Scripting

```bash
# Parse status for automation
git status -s | grep "^M"

# Get count of modified files
git status -s | grep "^M" | wc -l
```

### Check Before Push

```bash
# Always check before pushing
git status

# If ahead, review commits
git log origin/main..HEAD

# Then push
git push
```

### Track Specific Files

```bash
# Check status of specific file
git status -- src/app.js
```

## Common Messages

| Message | Meaning | Action |
|---------|---------|--------|
| `nothing to commit` | All changes committed | You're good! |
| `Changes not staged` | Files changed but not added | Run `git add` |
| `Untracked files` | New files not in Git | Run `git add` or create `.gitignore` |
| `ahead of origin/main` | Local commits not pushed | Run `git push` |
| `behind origin/main` | Remote has new commits | Run `git pull` |

---

**Previous Command:** [git clone](02-git-clone.md)
**Next Command:** [git add](04-git-add.md)