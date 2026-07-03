#!/bin/bash

# Complete Git Workflow Script
# This script demonstrates all basic Git commands in a practical workflow

set -e  # Exit on error

echo "========================================"
echo "  Complete Git Workflow Demonstration"
echo "========================================"
echo ""

# Step 1: Initialize repository
echo "Step 1: Initialize a new Git repository"
echo "$ git init"
# git init
echo ""

# Step 2: Check status
echo "Step 2: Check repository status"
echo "$ git status"
# git status
echo ""

# Step 3: Add files
echo "Step 3: Create and add files"
echo "$ echo 'Hello World' > README.md"
echo "$ git add README.md"
# echo 'Hello World' > README.md
# git add README.md
echo ""

# Step 4: Check status again
echo "Step 4: Check status (with staged changes)"
echo "$ git status"
# git status
echo ""

# Step 5: Commit
echo "Step 5: Commit changes"
echo "$ git commit -m 'Initial commit: Add README'"
# git commit -m 'Initial commit: Add README'
echo ""

# Step 6: View commits
echo "Step 6: View commit history"
echo "$ git log --oneline"
# git log --oneline
echo ""

# Step 7: Make more changes
echo "Step 7: Make additional changes"
echo "$ echo 'console.log(\"Hello\")' > app.js"
echo "$ git add app.js"
echo "$ git commit -m 'Add app.js with console.log'"
echo ""

# Step 8: View all commits
echo "Step 8: View all commits"
echo "$ git log --oneline -5"
echo ""

# Step 9: Create a branch
echo "Step 9: Create and switch to feature branch"
echo "$ git checkout -b feature/login"
# git checkout -b feature/login
echo ""

# Step 10: View branches
echo "Step 10: List branches"
echo "$ git branch -a"
echo ""

# Step 11: Make changes on branch
echo "Step 11: Make changes on feature branch"
echo "$ echo 'login code' > login.js"
echo "$ git add login.js"
echo "$ git commit -m 'Add login functionality'"
echo ""

# Step 12: Switch back to main
echo "Step 12: Switch back to main branch"
echo "$ git checkout main"
echo ""

# Step 13: View commits (should not have login changes)
echo "Step 13: View log on main branch"
echo "$ git log --oneline -3"
echo ""

# Step 14: Merge feature branch
echo "Step 14: Merge feature branch"
echo "$ git merge feature/login"
echo ""

# Step 15: Final status
echo "Step 15: Final status"
echo "$ git status"
echo ""

# Step 16: Setup remote (if applicable)
echo "Step 16: Add remote repository"
echo "$ git remote add origin https://github.com/user/repo.git"
echo ""

# Step 17: Push changes
echo "Step 17: Push to remote"
echo "$ git push -u origin main"
echo ""

# Step 18: Pull latest
echo "Step 18: Pull latest from remote"
echo "$ git pull origin main"
echo ""

echo "========================================"
echo "  Workflow Complete!"
echo "========================================"
echo ""
echo "Key commands used in this workflow:"
echo "  1. git init           - Initialize repository"
echo "  2. git status         - Check status"
echo "  3. git add            - Stage files"
echo "  4. git commit         - Create commits"
echo "  5. git log            - View history"
echo "  6. git checkout       - Switch branches"
echo "  7. git branch         - List branches"
echo "  8. git merge          - Merge branches"
echo "  9. git remote         - Manage remotes"
echo " 10. git push           - Upload changes"
echo " 11. git pull           - Download changes"
echo ""
echo "For more information, see the individual markdown files in this repo."
