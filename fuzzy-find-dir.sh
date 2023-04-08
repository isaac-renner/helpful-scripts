#!/bin/bash
select_dir() {
  DEFAULT_PATH=$(echo ~)
  PATH_TO_DIR=${1:=$DEFAULT_PATH}

  # Check if fzf is installed
  if ! command -v fzf &> /dev/null; then
    echo "Error: fzf is not installed or not in the system's PATH"
    return 1
  fi

  # Get list of dirs at path
  SELECTED_DIR=$(cd "$PATH_TO_DIR" && ls -d * | fzf)

  if [[ "$SELECTED_DIR" == "" ]]; then
    return 0
  fi

  echo "${PATH_TO_DIR}/${SELECTED_DIR}"
}

# If the script is sourced as a Zsh function, do not execute the function
if [ "$0" != "${BASH_SOURCE[0]}" ]; then
  return 0
fi

select_dir "$@"
