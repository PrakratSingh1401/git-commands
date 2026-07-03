# git commit — Save Changes

The `git commit` command creates a permanent snapshot of your staged changes with a descriptive message.

## Syntax

```bash
git commit -m "message"
git commit --message="message"
git commit -am "message"       # Stage and commit
git commit --amend             # Modify last commit
```

## What It Does

- Saves all staged changes to the repository
- Creates a snapshot with a unique hash (SHA)
- Records author, timestamp, and message
- Makes changes permanent in history
- Creates a new commit object

## Examples

### Example 1: Basic Commit

```bash
# Stage changes
git add index.js

# Commit with message
git commit -m "Add user authentication"

# Output:
# [main abc1234] Add user authentication
#  1 file changed, 25 insertions(+)
```

### Example 2: Commit with Detailed Description

```bash
# Detailed commit message
git commit -m "Add login functionality" -m "- Implements JWT token
- Adds password hashing with bcrypt
- Creates user session management
- Adds email verification"

# Output:
# [main xyz5678] Add login functionality
#  3 files changed, 45 insertions(+)
```

### Example 3: Stage and Commit in One Step

```bash
# For modified files only (not new files)
git commit -am "Fix bug in payment processing"

# Output:
# [main def9012] Fix bug in payment processing
#  2 files changed, 15 insertions(+), 5 deletions(-)
```

### Example 4: Commit with Multiple Flags

```bash
# Commit with author info
git commit -m "Update API endpoints" --author="John Doe <john@example.com>"

# Commit with date
git commit -m "Update API" --date="2024-07-01"
```

### Example 5: Amend Last Commit

```bash
# Fix the last commit message
git commit --amend -m "Corrected message"

# Add forgotten files to last commit
git add forgotten-file.js
git commit --amend --no-edit
```

### Example 6: Empty Commit

```bash
# Create commit with no changes (for documentation)
git commit --allow-empty -m "CI: trigger build"
```

## Commit Message Best Practices

### Good Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Example Good Commit Message

```bash
git commit -m "feat(auth): add JWT token validation" -m "- Validates JWT tokens on protected routes
- Implements token refresh mechanism
- Adds authentication middleware

Closes #123"
```

### Common Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Code style (no logic change)
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Build/dependency updates

## Workflow Examples

### Example 1: Multiple Commits

```bash
# Commit 1: Core functionality
git add auth/login.js
git commit -m "Add login form component"

# Commit 2: Styling
git add auth/login.css
git commit -m "Add login form styles"

# Commit 3: Tests
git add tests/login.test.js
git commit -m "Add login form tests"

# View commits
git log --oneline
# abc1234 Add login form tests
# def5678 Add login form styles
# ghi9012 Add login form component
```

### Example 2: Fix Commit After Realizing Mistake

```bash
# Made a commit
git commit -m "Add payment feature"

# Realized there's a bug
git add payment-fix.js

# Amend the previous commit
git commit --amend --no-edit

# Result: commit is updated (not a new commit)
```

### Example 3: Partial Staging and Multiple Commits

```bash
# Have 3 changes
# Stage and commit first
git add feature1.js
git commit -m "Implement feature 1"

# Stage and commit second
git add feature2.js
git commit -m "Implement feature 2"

# Stage and commit third
git add feature3.js
git commit -m "Implement feature 3"

# View all commits
git log --oneline
```

## Commit Information

### View Commits

```bash
# Show all commits
git log

# One-line format
git log --oneline

# Last 5 commits
git log -5

# Show diff in commits
git log -p
```

### Commit Details

```bash
# View a specific commit
git show abc1234

# View just the message
git log -1 --pretty=%B

# View author
git log -1 --pretty=%an
```

## Advanced Commit Options

### Sign Commits

```bash
# Sign with GPG
git commit -S -m "Secure commit"
```

### Bypass Hooks

```bash
# Skip pre-commit hooks
git commit --no-verify -m "Skip hooks"
```

### Interactive Commit

```bash
# Open editor for detailed message
git commit
# (Opens default editor: vim, nano, etc.)
```

## Useful Commit Patterns

### Fixup Commits

```bash
# Create a fixup commit for previous commit
git commit --fixup abc1234

# Automatically fix previous commit
git rebase -i --autosquash
```

### Squash Commits

```bash
# Create a squash commit
git commit --squash abc1234

# Later, rebase to combine
git rebase -i --autosquash
```

## Common Scenarios

### Scenario 1: Forgot to Add File

```bash
# Committed without a file
git commit -m "Complete feature"

# Oops, forgot config.js
git add config.js

# Add to previous commit
git commit --amend --no-edit
```

### Scenario 2: Wrong Commit Message

```bash
# Made a typo
git commit -m "Asd user autentication"

# Fix it
git commit --amend -m "Add user authentication"
```

### Scenario 3: Commit Too Early

```bash
# Committed but still working
git commit -m "Work in progress"

# Continue working
echo "more code" >> app.js

# Amend to include new work
git add app.js
git commit --amend --no-edit
```

## Pro Tips

### View Uncommitted Changes

```bash
# Before committing, review changes
git diff --cached
```

### Commit Template

```bash
# Set a commit template
git config commit.template .gitmessage

# Create template file
cat > .gitmessage << EOF
<type>: <subject>

<body>

Closes: #<issue_number>
EOF
```

### Statistics

```bash
# See commit statistics
git log --stat

# See who changed what
git blame file.js
```

---

**Previous Command:** [git add](04-git-add.md)
**Next Command:** [git push](06-git-push.md)