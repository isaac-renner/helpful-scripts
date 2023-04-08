#!/bin/bash
open_or_cd() {
  if [ -z "$1" ]; then
    echo "Usage: open_or_cd <path>"
    return 1
  fi

  path="$1"

  if [ ! -e "$path" ]; then
    echo "Error: Path not found"
    return 1
  fi

  if [ -d "$path" ]; then
    cd "$path" && echo "Changed directory to: $(pwd)"
  else
    vim "$path"
  fi
}

# If the script is sourced as a Zsh function, execute the function
if [ "$IS_ZSH_FUNCTION" = "1" ]; then
  open_or_cd "$@"
  return 0
fi

# The script continues to execute as a standalone shell script
if [ -z "$1" ]; then
  echo "Usage: $0 <path>"
  exit 1
fi

path="$1"

if [ ! -e "$path" ]; then
  echo "Error: Path not found"
  exit 1
fi

if [ -d "$path" ]; then
  cd "$path" && echo "Changed directory to: $(pwd)"
  $SHELL
else
  vim "$path"
fi
