#!/bin/bash

if ! command -v git &> /dev/null; then
  echo "Error: git is not installed or not in the system's PATH"
  exit 1
fi

change-worktree () {
    cd $(git worktree list --porcelain | grep  'worktree ' --line-buffered | sed 's/worktree//' | sed "s/ //" | fzf)
}

# If the script is sourced as a Zsh function, do not execute the function
if [ "$0" != "${BASH_SOURCE[0]}" ]; then
  return 0
fi

change-worktree "$@"
