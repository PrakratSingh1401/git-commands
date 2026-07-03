# git init — Initialize a Repository

The `git init` command creates a new Git repository in the current directory.

## Syntax

```bash
git init
```

## What It Does

- Creates a hidden `.git` folder in your project directory
- Initializes all necessary Git metadata and configuration
- Sets up an empty repository ready for tracking files

## Examples

### Example 1: Basic Repository Initialization

```bash
# Navigate to your project directory
cd my-project

# Initialize Git
git init

# Output:
# Initialized empty Git repository in /path/to/my-project/.git/
```

### Example 2: Create and Initialize a New Project

```bash
# Create a new directory
mkdir new-app
cd new-app

# Initialize Git
git init

# Create your first file
echo "# My App" > README.md

# Check status
git status
```

### Example 3: Initialize with a Specific Branch Name

```bash
# Initialize with main as default branch
git init --initial-branch=main

# Or use -b shorthand
git init -b main
```

## Common Use Cases

1. **Starting a new local project:**
   - You have existing files but no Git history
   - You want to start tracking changes

2. **Converting a folder to a Git repository:**
   - You have existing code files
   - You want to add version control

3. **Setting up a bare repository (for server):**
   ```bash
   git init --bare my-repo.git
   ```

## What's Created

After running `git init`, the `.git` folder contains:

```
.git/
├── HEAD              (Current branch reference)
├── config            (Repository configuration)
├── description       (Repository description)
├── hooks/            (Git hooks)
├── info/             (Additional info)
├── objects/          (Git objects)
└── refs/             (Branch and tag references)
```

## Next Steps

After initializing a repository:

1. **Add files:**
   ```bash
   git add README.md
   ```

2. **Create your first commit:**
   ```bash
   git commit -m "Initial commit"
   ```

3. **Connect to remote (if needed):**
   ```bash
   git remote add origin https://github.com/user/repo.git
   ```

## Important Notes

- ⚠️ **Never run `git init` twice** in the same directory—it will overwrite configuration
- 🔒 The `.git` folder contains all history—don't delete it unless you want to lose history
- 📁 You only need to run `git init` once per project
- ✅ Use `git clone` instead for copying existing repositories

## Troubleshooting

**Q: How do I check if a directory is already a Git repository?**

A: Look for a `.git` folder:
```bash
ls -la | grep .git
```

**Q: Can I rename the default branch?**

A: After initialization:
```bash
git branch -m main
```

---

**Next Command:** [git clone](02-git-clone.md)