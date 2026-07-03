# git push — Upload Changes to Remote

The `git push` command sends your local commits to a remote repository (like GitHub).

## Syntax

```bash
git push                           # Push to default
git push <remote> <branch>         # Push to specific branch
git push -u origin main            # Set upstream
git push --all                     # Push all branches
```

## What It Does

- Uploads local commits to remote repository
- Shares your changes with team members
- Updates remote branch references
- Syncs history between local and remote

## Examples

### Example 1: Basic Push

```bash
# After committing locally
git commit -m "Add new feature"

# Push to remote
git push

# Output:
# Enumerating objects: 5, done.
# Counting objects: 100% (5/5), done.
# Writing objects: 100% (3/3), 245 bytes | 245.00 KiB/s, done.
# Total 3 (delta 2), reused 0 (delta 0)
# To github.com:user/repo.git
#    abc1234..def5678  main -> main
```

### Example 2: Push to Specific Branch

```bash
# Push to specific branch
git push origin feature-branch

# Output:
# To github.com:user/repo.git
#  * [new branch]      feature-branch -> feature-branch
```

### Example 3: Set Upstream on First Push

```bash
# Create new local branch
git checkout -b feature

# Make commits
git commit -m "Add feature"

# Push and set upstream
git push -u origin feature
# or
git push --set-upstream origin feature

# Now future pushes just need: git push
```

### Example 4: Push All Branches

```bash
# Push every branch
git push --all

# Output shows multiple branches pushed:
# To github.com:user/repo.git
#    main
#    feature-1
#    feature-2
#    bugfix-3
```

### Example 5: Push Tags

```bash
# Create a tag
git tag v1.0.0

# Push tag
git push origin v1.0.0

# Push all tags
git push --tags
```

### Example 6: Force Push (Use with Caution!)

```bash
# Rewrite history locally
git rebase -i HEAD~3

# Force push changes
git push --force
# or safer option
git push --force-with-lease

# ⚠️ Only do this on your own branches!
```

## Common Use Cases

### Case 1: Regular Development

```bash
# Make changes
echo "new code" > app.js

# Stage and commit
git add app.js
git commit -m "Update app"

# Push to share
git push origin main
```

### Case 2: Feature Branch Workflow

```bash
# Create feature branch
git checkout -b feature/auth

# Make commits
git commit -m "Add login"
git commit -m "Add logout"

# Push with upstream tracking
git push -u origin feature/auth

# Later, just push normally
git push
```

### Case 3: Multiple Commits Before Push

```bash
# Make several commits locally
git commit -m "Commit 1"
git commit -m "Commit 2"
git commit -m "Commit 3"

# Push all at once
git push origin main

# All 3 commits go to remote
```

## Push Workflow

```bash
# Step 1: Check status
git status
# On branch main
# nothing to commit, working tree clean

# Step 2: Make changes
echo "code" > feature.js

# Step 3: Commit
git add feature.js
git commit -m "Add feature"

# Step 4: Check log
git log --oneline -3
# abc1234 Add feature
# def5678 Previous commit
# ghi9012 Earlier commit

# Step 5: Verify branch is tracked
git branch -vv
# * main    abc1234 [origin/main: behind 1] Add feature

# Step 6: Push
git push

# Step 7: Verify
git branch -vv
# * main    abc1234 [origin/main] Add feature
```

## Remote Management

### View Remote Info

```bash
# See configured remotes
git remote -v
# Output:
# origin  https://github.com/user/repo.git (fetch)
# origin  https://github.com/user/repo.git (push)

# Get details
git remote show origin
```

### Add Multiple Remotes

```bash
# Add second remote
git remote add upstream https://github.com/original/repo.git

# Push to different remotes
git push origin main
git push upstream main
```

## Push Options

### Delete Remote Branch

```bash
# Delete remote branch
git push origin --delete feature-branch
# or
git push origin :feature-branch
```

### Push Empty Commits

```bash
# Trigger CI without changes
git commit --allow-empty -m "CI: trigger build"
git push
```

### Dry Run (Test Push)

```bash
# Simulate push without actually pushing
git push --dry-run
```

### Verbose Push

```bash
# See detailed information
git push --verbose
# or
git push -v
```

## Common Issues

### Issue 1: Remote Rejected

```bash
# Push rejected - remote has changes
# Error: failed to push some refs

# Solution: Pull first
git pull origin main

# Resolve conflicts if any, then push
git push origin main
```

### Issue 2: No Upstream Branch

```bash
# Error: fatal: The current branch has no upstream branch

# Solution: Set upstream on first push
git push -u origin feature

# Or configure it
git branch --set-upstream-to=origin/feature feature
```

### Issue 3: Authentication Failed

```bash
# Error: fatal: Authentication failed

# Solutions:
# 1. Use personal access token (PAT)
# 2. Configure SSH keys
# 3. Use HTTPS instead of SSH
```

## Push Patterns

### Pattern 1: Atomic Commits

```bash
# Commit feature
git commit -m "Feature: add search"
git push

# Commit tests
git commit -m "Test: add search tests"
git push

# Commit docs
git commit -m "Docs: update search docs"
git push

# Each push is separate and deployable
```

### Pattern 2: Staged Rollout

```bash
# Push to development
git push origin feature-branch

# Test it
# ... QA testing ...

# Push to staging
git push origin staging

# Test more
# ... integration testing ...

# Push to production
git push origin main
```

## Pro Tips

### Verify Before Push

```bash
# Always check before pushing
git log origin/main..HEAD
# Shows commits to be pushed

# Then push
git push
```

### Automated Pushing

```bash
# Configure to auto-push tags
git config --global push.followTags true

# Now tags push automatically
git push
```

### Review Remote State

```bash
# See what's on remote
git ls-remote origin

# Show all branches on remote
git branch -r
```

---

**Previous Command:** [git commit](05-git-commit.md)
**Next Command:** [git pull](07-git-pull.md)