# git clone — Copy a Repository

The `git clone` command downloads an entire repository from a remote source (like GitHub) to your local machine.

## Syntax

```bash
git clone <repository-url>
git clone <repository-url> <directory>
```

## What It Does

- Downloads all files, branches, and commit history
- Creates a new directory with the repository name
- Sets up the remote tracking for the original repository
- Automatically checks out the default branch

## Examples

### Example 1: Basic Clone

```bash
# Clone a repository
git clone https://github.com/user/repo.git

# This creates a folder named 'repo' with all files
cd repo
```

### Example 2: Clone with Custom Directory Name

```bash
# Clone into a specific folder name
git clone https://github.com/user/repo.git my-custom-folder

cd my-custom-folder
```

### Example 3: Clone a Specific Branch

```bash
# Clone only a specific branch (faster)
git clone --branch develop https://github.com/user/repo.git

# Shorthand
git clone -b develop https://github.com/user/repo.git
```

### Example 4: Clone with SSH

```bash
# Using SSH instead of HTTPS
git clone git@github.com:user/repo.git

# Requires SSH key configured
```

### Example 5: Shallow Clone (Limited History)

```bash
# Clone with only recent commit history (faster for large repos)
git clone --depth 1 https://github.com/user/repo.git

# Clone last 10 commits
git clone --depth 10 https://github.com/user/repo.git
```

### Example 6: Clone Multiple Repositories

```bash
# Clone several repositories
git clone https://github.com/user/repo1.git
git clone https://github.com/user/repo2.git
git clone https://github.com/user/repo3.git

ls
# Output: repo1  repo2  repo3
```

## Common Use Cases

1. **Getting started on a team project:**
   ```bash
   git clone https://github.com/company/project.git
   cd project
   ```

2. **Contributing to open source:**
   ```bash
   git clone https://github.com/contributor/awesome-project.git
   cd awesome-project
   ```

3. **Downloading a specific branch:**
   ```bash
   git clone -b feature-branch https://github.com/user/repo.git
   ```

## Clone Options

| Option | Description |
|--------|-------------|
| `--branch <name>` | Clone specific branch |
| `-b <name>` | Shorthand for --branch |
| `--depth <number>` | Clone only recent history |
| `--single-branch` | Clone only one branch |
| `--recursive` | Clone with submodules |

## What Gets Downloaded

After cloning, you have:

```
repo/
├── .git/              (Complete history)
├── .github/           (GitHub configs)
├── src/               (Source code)
├── README.md          (Documentation)
├── package.json       (Dependencies)
└── ...
```

## What Happens After Clone

1. **All branches are available locally:**
   ```bash
   git branch -a
   ```

2. **Remote is already configured:**
   ```bash
   git remote -v
   # Output: origin  https://github.com/user/repo.git (fetch)
   #         origin  https://github.com/user/repo.git (push)
   ```

3. **You're on the default branch:**
   ```bash
   git branch
   # Output: * main
   ```

## Next Steps After Cloning

```bash
# 1. Navigate into the directory
cd repo

# 2. Check the status
git status

# 3. List all branches
git branch -a

# 4. Switch to a different branch if needed
git checkout feature-branch

# 5. Install dependencies (if applicable)
npm install    # for Node.js
pip install    # for Python

# 6. Make your changes
# ... edit files ...

# 7. Commit and push
git add .
git commit -m "Make changes"
git push origin main
```

## Common Issues

**Q: Permission denied when cloning via SSH?**

A: Use HTTPS instead or configure SSH keys:
```bash
git clone https://github.com/user/repo.git  # Use HTTPS
```

**Q: How to clone a private repository?**

A: You need authentication:
```bash
# HTTPS: Use personal access token
git clone https://token@github.com/user/private-repo.git

# SSH: Use SSH keys (more secure)
git clone git@github.com:user/private-repo.git
```

**Q: Repository is too large, how to speed it up?**

A: Use shallow clone:
```bash
git clone --depth 1 https://github.com/user/large-repo.git
```

---

**Previous Command:** [git init](01-git-init.md)
**Next Command:** [git status](03-git-status.md)