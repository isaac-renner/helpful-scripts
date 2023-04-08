#!/bin/bash
open_or_cd() {
  if [ -z "$1" ]; then
    echo "Usage: open_or_cd <path_to_change_to>"
    return 1
  fi

  path_to_change_to="$1"

  if [ ! -e "$path_to_change_to" ]; then
    echo "Error: path_to_change_to not found"
    return 1
  fi

  if [ -d "$path_to_change_to" ]; then
    cd "$path_to_change_to" && echo "Changed directory to: $(pwd)"
  else
    vim "$path_to_change_to"
  fi
}

# If the script is sourced as a Zsh function, do not execute the function
if [ "$0" != "${BASH_SOURCE[0]}" ]; then
  return 0
fi

open_or_cd "$@"
