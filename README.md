# GitHub Automation ADD OR REMOVE

![Git](https://img.shields.io/badge/Git-Version%20Control-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-Code%20Hosting-181717?style=for-the-badge&logo=github&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-Scripting-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)

This Bash script provides an interactive terminal menu for managing common Git operations.  
It is designed to simplify daily GitHub workflows while adding safety checks around destructive actions.

The script works on Linux and WSL environments using the standard Git CLI.

---

## Features

- Interactive menu-based interface
- Add and push files to GitHub
- Select a single file or add all files
- Automatic branch detection
- Automatic pull before push
- Safe file and directory deletion
- Mandatory confirmation phrase before deletion
- Works inside any Git repository

---

## Menu Options

When the script runs, the following menu is displayed:

GITHUB MENU

1) Add files to github  
2) Delete a file/dir off github  
q) Quit  

---

## Option 1 — Add Files to GitHub

This option automates the full Git workflow:

- Lists all files in the current directory (excluding `.git`)
- Allows selecting:
  - one specific file, or
  - all files at once
- Detects the current Git branch automatically
- Pulls the latest changes from the remote branch
- Stages selected files
- Prompts for a commit message
- Commits and pushes to GitHub

This removes the need to manually run:

- git status  
- git add  
- git pull  
- git commit  
- git push  

---

## Option 2 — Delete File or Directory

This option permanently removes files or folders from both:

- the local repository
- the GitHub remote repository

Before deletion, the script:

- prompts for the target file or directory
- requires a commit message
- displays a large warning message
- requires the exact confirmation phrase:

i want to delete this


If the phrase does not match exactly, the operation is aborted.

---

## Safety System

The delete operation includes multiple safeguards:

- file existence validation
- mandatory commit message
- explicit confirmation phrase
- abort on incorrect input

This prevents accidental deletion caused by:

- mistyped paths
- running commands too quickly
- deleting the wrong directory
- muscle-memory mistakes

---

## Requirements

- Linux or WSL environment
- Bash shell
- Git installed
- Git repository initialized
- Remote origin configured

---

## Usage

Make the script executable:

```
chmod +x git_menu.sh
Run the script:

./git_menu.sh
Follow the on-screen menu instructions.
```
# Example Workflow
Add files:

Choose option 1

Select file number or . for all files

Enter commit message

Files are pulled, committed, and pushed

Delete files:

Choose option 2

Enter file or directory name

Enter commit message

Type the confirmation phrase

Deletion is committed and pushed

# Important Notes
This script must be run from inside a Git repository

Deleted files are removed locally and remotely

Deleted content can only be restored from Git history

Do not run this script as root

Avoid using wildcards such as * or /

# Security
Do not commit the following files to GitHub:

~/.aws/credentials

.env files

private keys (*.pem, *.key)

Always use a .gitignore file.

# Future Improvements
GitHub-only deletion mode (git rm --cached)

File picker with directory preview

Colored menu output

Commit history viewer

Logging support

Multi-branch selection

# Disclaimer
This script executes real Git commands.

Once changes are pushed, they immediately affect the remote repository.

Use responsibly.
