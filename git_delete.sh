#!/usr/bin/env bash
set -euo pipefail

git_add() {
    
}

git_delete() {
#-------------------------------------------------
# THIS SCRIPT WILL DELETE YOUR FILES AND REMOVE IT 
# i CREATED A PROMPT TO ASK BEFORE DELETEING 

set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage:"
  echo "  ./git_remove.sh <file_or_folder> \"commit message\""
  exit 1
fi

TARGET="$1"
shift
MSG="$*"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not inside a git repository."
  exit 1
fi

if [[ ! -e "$TARGET" ]]; then
  echo "Target does not exist: $TARGET"
  exit 1
fi

echo
echo "WARNING"
echo "You are about to PERMANENTLY remove this from Git and GitHub:"
echo
echo "  $TARGET"
echo
echo "This WILL delete the file/folder locally."
echo "This CANNOT be undone easily."
echo "type anything in the console to abort."
echo
echo "Type exactly:"
echo "i want to delete this"
echo

read -r CONFIRM

if [[ "$CONFIRM" != "i want to delete this" ]]; then
  echo "Aborted."
  exit 1
fi

git rm -r "$TARGET"
git commit -m "$MSG"
git push

echo "Removed and pushed: $TARGET"
}

MENU="
      GITHUB MENU

1) Add files to github
2) Delete a file/dir off github
q) Quit
"

echo "$MENU"
read -rp "Select option: " choice

if [[ "$choice" == "1" ]]; then
    git_add
elif [[ "$choice" == "2" ]]; then
    git_delete
elif [[ "$choice" == "q" ]]; then
    exit 0
else
    echo "Invalid option"
fi
