# git add — Stage Changes

The `git add` command prepares files to be committed (stages changes for the next commit).

## Syntax

```bash
git add <file>
git add .              # Stage all changes
git add -A             # Stage all (including deletions)
git add -p             # Interactive staging
```

## What It Does

- Moves changes from working directory to staging area (index)
- Prepares files for the next commit
- Allows you to choose which changes to include
- Tracks both new and modified files

## Examples

### Example 1: Stage a Specific File

```bash
# Edit a file
echo "new code" > index.js

# Stage it
git add index.js

# Verify
git status
# Output: Changes to be committed: modified: index.js
```

### Example 2: Stage All Changes

```bash
# Make multiple changes
echo "code1" > file1.js
echo "code2" > file2.js
echo "code3" > file3.js

# Stage all at once
git add .

# Or use -A
git add -A

# Verify
git status
# Output: 3 files staged
```

### Example 3: Stage Multiple Specific Files

```bash
# Edit multiple files
echo "update" > app.js
echo "config" > config.json
echo "style" > style.css

# Stage only some
git add app.js config.json

# Check status
git status
# M  app.js
# M  config.json
# ?? style.css (not staged)
```

### Example 4: Interactive Staging (-p flag)

```bash
# Stage changes interactively (hunks)
git add -p

# You'll see each change and can choose:
# (1/2) Stage this hunk [y,n,q,a,d,s,e,?]?
# y: stage
# n: skip
# q: quit
# a: stage all
# s: split into smaller hunks
```

### Example 5: Stage Files by Pattern

```bash
# Stage all .js files
git add *.js

# Stage all files in src directory
git add src/

# Stage all Python files
git add *.py
```

### Example 6: Stage and Unstage

```bash
# Stage a file
git add mistake.js

# Oops, unstage it
git restore --staged mistake.js
# or
git reset HEAD mistake.js

# Verify
git status
```

## Common Use Cases

### Case 1: Selective Staging

```bash
# You have 5 changes but want to commit only 3
git status
# M  feature1.js
# M  feature2.js
# M  bug-fix.js
# M  wip.js
# M  cleanup.js

# Stage the completed features
git add feature1.js feature2.js bug-fix.js

# Check
git status
# 3 staged, 2 not staged

# Commit completed work
git commit -m "Complete features and fix bug"

# Still have wip and cleanup for later
```

### Case 2: Staging by Directory

```bash
# Organize changes by feature
# Work on multiple features

# Stage one feature
git add src/auth/

# Commit it
git commit -m "Add authentication"

# Stage another feature
git add src/payment/

# Commit separately
git commit -m "Add payment processing"
```

### Case 3: Review Before Staging

```bash
# Check what changed
git diff

# Review specific file
git diff index.js

# Stage only what looks good
git add index.js

# Skip the rest for now
```

## Staging Workflow

```bash
# Step 1: Make changes
echo "function hello() {}" > app.js
echo "function world() {}" > util.js
echo "const config = {}" > config.js

# Step 2: Check status
git status
# ?? app.js
# ?? util.js  
# ?? config.js

# Step 3: Stage specific files
git add app.js util.js

# Step 4: Verify staging
git status
# A  app.js
# A  util.js
# ?? config.js (not staged)

# Step 5: Review staged changes
git diff --cached

# Step 6: Commit
git commit -m "Add core functions"

# Step 7: Handle remaining file
git add config.js
git commit -m "Add configuration"
```

## Advanced Staging

### Interactive Patch Staging

```bash
# Stage changes line by line
git add -p

# Hunks are shown one at a time
# Choose what to include in the commit
```

### Update Only Modified Files

```bash
# Stage only modified, not new files
git add -u
# or
git add --update
```

### Include All Changes (Including Deletions)

```bash
# Add all changes including deleted files
git add -A
# or
git add --all
```

### Add with Force

```bash
# Add files even if they match .gitignore
git add -f ignored-file.js
```

## Ignoring Files

Some files shouldn't be staged. Use `.gitignore`:

```bash
# Create .gitignore
cat > .gitignore << EOF
node_modules/
.env
*.log
.DS_Store
EOF

# Now these files won't show up in git status
```

## Common Mistakes

### Mistake 1: Staging Wrong File

```bash
# Oops, staged the wrong file
git add password.js

# Unstage it
git restore --staged password.js

# Add to .gitignore
echo "password.js" >> .gitignore
```

### Mistake 2: Staging Everything Accidentally

```bash
# Staged too much
git add .

# Unstage all
git reset HEAD

# Or unstage specific files
git restore --staged large-file.zip
```

### Mistake 3: Forgetting to Stage

```bash
# Made changes but forgot to stage
git status
# M  file.js (not staged)

# Quick fix: stage and commit together
git commit -am "Update file"
```

## Pro Tips

### Dry Run

```bash
# See what would be staged
git add --dry-run .
```

### Verbose Output

```bash
# See what's being staged
git add --verbose .
```

### List Staged Files

```bash
# Show all staged files
git diff --cached --name-only
```

---

**Previous Command:** [git status](03-git-status.md)
**Next Command:** [git commit](05-git-commit.md)