#!/bin/bash

# Check if the argument is provided
if [ -z "$1" ]; then
  echo "Usage: ./open_or_cd.sh <path>"
  exit 1
fi

path="$1"

# Check if the path exists
if [ ! -e "$path" ]; then
  echo "Error: Path not found"
  exit 1
fi

# Check if it's a directory
if [ -d "$path" ]; then
  cd "$path" && echo "Changed directory to: $(pwd)"
  # Execute a new shell to keep the user in the new directory
  $SHELL
else
  vim "$path"
fi
