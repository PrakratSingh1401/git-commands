# Git Commands Guide

A comprehensive repository demonstrating all basic Git commands with practical examples and use cases.

## 📋 Table of Contents

1. [git init](#git-init) — Initialize a Repository
2. [git clone](#git-clone) — Copy a Repository
3. [git status](#git-status) — Check Repository Status
4. [git add](#git-add) — Stage Changes
5. [git commit](#git-commit) — Save Changes
6. [git push](#git-push) — Upload Changes to Remote
7. [git pull](#git-pull) — Download Changes from Remote

---

## git init

Initialize a new Git repository in your current directory.

```bash
git init
```

### Example:
```bash
cd my-project
git init
# Output: Initialized empty Git repository in /path/to/my-project/.git/
```

This creates a `.git` folder that stores all version history and configuration.

**When to use:** Start a new local project.

---

## git clone

Download an entire repository from a remote source (like GitHub) to your local machine.

```bash
git clone <repository-url>
```

### Example:
```bash
git clone https://github.com/user/repo.git
# Creates a folder named 'repo' with all files and history
```

Clone with a custom folder name:
```bash
git clone https://github.com/user/repo.git my-custom-folder
```

**When to use:** Copy an existing project from GitHub or another remote source.

---

## git status

Show the current state of your working directory and staging area.

```bash
git status
```

### Example output:
```
On branch main
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  modified:   index.js

Untracked files:
  (use "git add <file>..." to include in what will be committed)
  config.json

nothing added to commit but untracked changes present
```

**When to use:** Before staging or committing changes to see what's changed.

---

## git add

Prepare files to be committed (stage changes).

### Stage a specific file:
```bash
git add index.js
```

### Stage all changes:
```bash
git add .
```

### Stage multiple files:
```bash
git add file1.js file2.js file3.js
```

### Example workflow:
```bash
# Check what changed
git status

# Stage specific changes
git add index.js

# Verify staging
git status
# Output shows "Changes to be committed: index.js"
```

**When to use:** Before committing, to select which changes to include.

---

## git commit

Create a permanent snapshot of your staged changes with a descriptive message.

### Basic commit:
```bash
git commit -m "Add user authentication feature"
```

### Include detailed description:
```bash
git commit -m "Add login functionality" -m "- Implements JWT authentication
- Adds password hashing
- Creates user session management"
```

### Stage and commit in one step (modified files only):
```bash
git commit -am "Fix bug in payment processing"
```

### Example workflow:
```bash
# Make changes to files
# ... edit code ...

# Stage changes
git add .

# Commit with a message
git commit -m "Implement dark mode toggle"
# Output: [main a1b2c3d] Implement dark mode toggle
#         1 file changed, 15 insertions(+), 5 deletions(-)
```

**When to use:** After staging changes to save them to history with a message.

---

## git push

Send your local commits to a remote repository (like GitHub).

### Push to default branch:
```bash
git push
```

### Push to specific branch:
```bash
git push origin main
```

### Push all branches:
```bash
git push --all
```

### Example workflow:
```bash
# After making commits locally
git commit -m "Update API endpoints"

# Push to remote repository
git push origin main
# Output: Enumerating objects: 5, done.
#         Counting objects: 100% (5/5), done.
#         Writing objects: 100% (3/3), 245 bytes | 245.00 KiB/s, done.
#         Total 3 (delta 2), reused 0 (delta 0)
#         To github.com:user/repo.git
#         a1b2c3d..e5f6g7h main -> main
```

**When to use:** After committing to share your changes with team members.

---

## git pull

Fetch changes from the remote repository and merge them into your local branch.

```bash
git pull
```

### Pull from specific branch:
```bash
git pull origin main
```

### Example workflow:
```bash
# Your team member pushed changes to the remote
# Update your local repository
git pull origin main
# Output: remote: Counting objects: 100% (3/3), done.
#         From github.com:user/repo
#            a1b2c3d..e5f6g7h main -> origin/main
#         Updating a1b2c3d..e5f6g7h
#         Fast-forward
#          README.md | 2 ++
#          1 file changed, 2 insertions(+)
```

**When to use:** Before starting work or to get the latest changes from teammates.

---

## Complete Workflow Example

Here's how these commands work together in a typical workflow:

```bash
# 1. Clone a repository
git clone https://github.com/user/repo.git
cd repo

# 2. Check status
git status

# 3. Make changes to files
# ... edit files ...

# 4. Check what changed
git status

# 5. Stage your changes
git add .

# 6. Commit with a message
git commit -m "Add new feature"

# 7. Pull latest changes from team
git pull origin main

# 8. Push your commits
git push origin main
```

---

## Quick Reference Table

| Command | Purpose |
|---------|----------|
| `git init` | Create a new repository |
| `git clone <url>` | Copy an existing repository |
| `git status` | View current changes |
| `git add <file>` | Stage changes for commit |
| `git commit -m "msg"` | Save changes with a message |
| `git push` | Upload commits to remote |
| `git pull` | Download and merge remote changes |

---

## File Structure

This repository contains practical examples for each Git command:

```
git-commands/
├── README.md                  (This file)
├── 01-git-init.md            (git init examples)
├── 02-git-clone.md           (git clone examples)
├── 03-git-status.md          (git status examples)
├── 04-git-add.md             (git add examples)
├── 05-git-commit.md          (git commit examples)
├── 06-git-push.md            (git push examples)
├── 07-git-pull.md            (git pull examples)
├── examples/                 (Sample code files)
│   ├── index.js
│   ├── config.json
│   └── app.py
└── workflows/                (Complete workflow examples)
    └── complete-workflow.sh
```

---

## How to Use This Repository

1. **Clone this repository:**
   ```bash
   git clone https://github.com/PrakratSingh1401/git-commands.git
   cd git-commands
   ```

2. **Read through each command guide** in the numbered markdown files

3. **Practice the commands** with the provided examples

4. **Refer to the Quick Reference Table** when you need a quick reminder

---

## Resources

- [Official Git Documentation](https://git-scm.com/doc)
- [GitHub Help](https://docs.github.com/en)
- [Git Cheat Sheet](https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf)

---

**Happy learning! 🚀**