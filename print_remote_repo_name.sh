#!/bin/bash

# Check if git is installed
if ! command -v git &> /dev/null; then
  echo "Error: git is not installed or not in the system's PATH"
  exit 1
fi

# Check if the current directory is a git repository
if ! git rev-parse --is-inside-work-tree &> /dev/null; then
  echo "Error: Not a git repository"
  exit 1
fi

# Get the remote repository name
remote_repo_name=$(git remote get-url $(git remote) | rev | cut -d'/' -f1 | cut -d'.' -f2- | rev)

if [ -z "$remote_repo_name" ]; then
  echo "Error: No remote repository found"
  exit 1
else
  echo "Remote repository name: $remote_repo_name"
fi
