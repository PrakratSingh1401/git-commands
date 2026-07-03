# git pull — Download Changes from Remote

The `git pull` command fetches changes from the remote repository and merges them into your local branch.

## Syntax

```bash
git pull                          # Pull from default
git pull <remote> <branch>        # Pull specific branch
git pull --rebase                 # Use rebase instead of merge
git pull --no-commit              # Fetch without committing
```

## What It Does

- Fetches updates from remote repository
- Merges remote changes into local branch
- Updates your working directory
- Combines `git fetch` + `git merge`

## Examples

### Example 1: Basic Pull

```bash
# Pull latest changes from remote
git pull

# Output:
# remote: Counting objects: 100% (5/5), done.
# From github.com:user/repo
#    abc1234..def5678  main -> origin/main
# Updating abc1234..def5678
# Fast-forward
#  file.js | 5 +++++
#  1 file changed, 5 insertions(+)
```

### Example 2: Pull Specific Branch

```bash
# Pull from specific branch
git pull origin develop

# Output shows changes from develop branch
```

### Example 3: Pull with Rebase

```bash
# Pull but rebase instead of merge
git pull --rebase

# Cleaner history (no merge commits)
# Output:
# Rebase in progress
# First, rewinding head to replay your work on top of it...
# Applying: Your commit message
```

### Example 4: Pull Without Committing

```bash
# Fetch changes but don't merge yet
git pull --no-commit

# Review changes
git diff --cached

# Then decide to merge or abort
git merge --abort
```

### Example 5: Pull from Different Remote

```bash
# Pull from upstream repository
git pull upstream main

# Merges upstream main into your current branch
```

### Example 6: Force Pull (Overwrite Local)

```bash
# ⚠️ Discard local changes and pull
git fetch origin
git reset --hard origin/main

# Or directly
git pull --force
```

## Common Use Cases

### Case 1: Before Starting Work

```bash
# Every morning, pull latest changes
git pull origin main

# Ensures you have all team member's work
# Prevents merge conflicts later
```

### Case 2: Sync with Team

```bash
# Team member pushed changes
# You get notified

# Pull their changes
git pull origin main

# Now you have their code
```

### Case 3: Merge Feature Branch

```bash
# Pull a feature branch from teammate
git pull origin feature-branch

# Now you have their feature code
```

## Pull Workflow

```bash
# Step 1: Start work
echo "code" > app.js
git add app.js
git commit -m "Add feature"

# Step 2: Teammate pushed changes
# (you see notification)

# Step 3: Pull their changes
git pull

# Output:
# remote: Counting objects: 3, done.
# From github.com:user/repo
#    abc1234..def5678  main -> origin/main
# Auto-merging config.js
# Merge made by the 'recursive' strategy.
#  config.js | 2 ++
#  1 file changed, 1 insertion(+)

# Step 4: Continue working with merged code
git log --oneline -3
# 1234567 Merge branch 'main' of github.com:user/repo
# abc1234 Add feature
# def5678 Team member's change
```

## Handling Merge Conflicts

### Example: Conflict Scenario

```bash
# You have local change
echo "your code" > app.js
git add app.js
git commit -m "Your change"

# Someone changed the same file
git pull

# Output:
# CONFLICT (content): Merge conflict in app.js
# Automatic merge failed; fix conflicts and then commit

# View conflicts
git status
# both modified: app.js
```

### Resolving Conflicts

```bash
# Check the conflicted file
cat app.js
# <<<<<<< HEAD
# your code
# =======
# their code
# >>>>>>> origin/main

# Edit to resolve
echo "resolved code" > app.js

# Mark as resolved
git add app.js

# Complete merge
git commit -m "Merge and resolve conflict"
```

## Pull vs Fetch vs Merge

### Fetch Only (Don't Merge)

```bash
# Get updates but don't merge
git fetch

# Now you can compare before merging
git log origin/main..HEAD     # What you'll send
git log HEAD..origin/main     # What you'll get

# Manually merge when ready
git merge origin/main
```

### Understand the Difference

```bash
# git pull = git fetch + git merge
# git fetch = download only (no merge)
# git merge = combine branches

# So:
git pull
# is the same as:
git fetch
git merge
```

## Rebase vs Merge

### Traditional Merge (Default)

```bash
# Creates merge commit
git pull

# History:
# *   Merge commit (combines branches)
# |\  
# | * Team member's commit
# * | Your commit
# |/
```

### Rebase (Linear History)

```bash
# Reapply your commits on top
git pull --rebase

# History:
# * Your commit (replayed)
# * Team member's commit
# * Previous commit
```

## Common Issues

### Issue 1: Merge Conflicts

```bash
# Merge failed due to conflicts
git pull
# CONFLICT (content): Merge conflict

# Solution: Resolve conflicts
# ... edit files ...
git add .
git commit
```

### Issue 2: Diverged History

```bash
# Error: Your branch and 'origin/main' have diverged

# Solution: Rebase
git pull --rebase

# Or reset to remote
git reset --hard origin/main
```

### Issue 3: Stale Tracking Branch

```bash
# Remote branch deleted but local exists
# Solution: Prune stale branches
git pull --prune

# Or manually
git remote prune origin
```

## Pull Patterns

### Pattern 1: Daily Sync

```bash
# Start each day by pulling
git pull origin main

# Ensures you're up-to-date
# Reduces conflicts later
```

### Pattern 2: Before Pushing

```bash
# Always pull before pushing
git pull origin main

# Resolve any conflicts
# Then push your changes
git push origin main
```

### Pattern 3: Feature Branch Sync

```bash
# Keep feature branch updated
git checkout feature
git pull origin feature

# Or merge main into feature
git pull origin main
```

## Advanced Pulling

### Pull with Squash

```bash
# Pull and squash all commits
git pull --squash

# Creates single commit from pull
```

### Pull Specific Commit

```bash
# Pull individual commit
git cherry-pick abc1234
```

### Pull and Sign

```bash
# Pull with GPG signature on merge commit
git pull --gpg-sign
```

## Pro Tips

### Always Review Before Pull

```bash
# Check what's on remote
git fetch
git log HEAD..origin/main --oneline

# Then pull if comfortable
git pull
```

### Configure Pull Strategy

```bash
# Set default to rebase
git config --global pull.rebase true

# Now all pulls use rebase
git pull
```

### Check Pull Status

```bash
# See if you're behind
git status

# See what commits you're behind
git log origin/main..HEAD

# Pull to catch up
git pull
```

## Complete Workflow

```bash
# Morning: Start work
git pull origin main

# Development: Work on feature
git commit -m "Add feature 1"
git commit -m "Add feature 2"

# Before push: Get latest
git pull origin main
# (resolve conflicts if any)

# Push: Share changes
git push origin main

# Later: Pull teammate's updates
git pull origin main

# Continue: Keep working
echo "more code" > app.js
git commit -am "Update app"
```

---

**Previous Command:** [git push](06-git-push.md)
**Main Page:** [Back to README](README.md)