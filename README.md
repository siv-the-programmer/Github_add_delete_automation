# GitHub Automation Menu Script

This Bash script provides a simple interactive menu for common GitHub actions directly from the terminal.

It is designed to reduce repetitive Git commands and add safety controls around destructive operations such as deleting files or folders from a repository.

The script is intended for Linux shells.

---

## Features

- Interactive terminal menu
- Add and push files to GitHub
- Delete files or folders from Git and GitHub
- Built-in safety confirmation to prevent accidental deletion
- Works on any Git repository
- Uses standard Git CLI commands

---

## Menu Options

When the script runs, the following menu appears:

GITHUB MENU

1) Add files to GitHub  
2) Delete a file or directory from GitHub  
q) Quit  

---

## Option 1 — Add Files to GitHub

This option is reserved for automating:

- git add
- git commit
- git push

The function is intentionally empty so it can be customized based on your workflow.

Example logic you may add later:

- automatic staging
- commit message prompt
- branch detection
- push automation

---

## Option 2 — Delete File or Folder from GitHub

This option performs a destructive Git operation and includes a mandatory confirmation prompt.

What happens:

- The selected file or directory is removed using `git rm`
- The deletion is committed
- The commit is pushed to GitHub

The file or folder is deleted locally and from the remote repository.

---

## Deletion Safety System

Before deletion occurs, the script requires the user to type the exact phrase:

i want to delete this


If the phrase does not match exactly:

- The script aborts
- No files are deleted
- No Git commands are executed

This prevents accidental deletion caused by:

- running the script too fast
- mistyping a path
- deleting the wrong directory
- muscle-memory mistakes

---

## Usage

Make the script executable:

```
chmod +x git_menu.sh
Run the script:

./git_menu.sh
Follow the on-screen menu prompts.
```
# Requirements:

Linux or WSL environment

Bash shell

Git installed

Git repository initialized

Remote origin configured

# Important Notes
This script must be run inside a Git repository

The delete option permanently removes files

Deleted files cannot be recovered unless restored from Git history

# Use with caution

# Example Delete Command Flow
Select option 2

Enter file or folder name

Enter commit message

Type the confirmation phrase

Changes are committed and pushed

# Security
Do not run this script as root.

Do not use wildcards such as * or /.

Always double-check the target path before confirming deletion.

# Future Improvements
Implement git_add automation

Branch auto-detection

Commit message prompts

GitHub-only deletion using git rm --cached

Colored menu output

Logging support

# Disclaimer
This script performs real Git operations.

Once pushed, changes affect the remote repository immediately.

Use responsibly.

