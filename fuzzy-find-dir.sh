#!/bin/bash

DEFAULT_PATH=$(echo ~)
PATH_TO_DIR=${1:=$DEFAULT_PATH}

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
  echo "Error: fzf is not installed or not in the system's PATH"
  exit 1
fi

# get list of dirs at path
SELECTED_DIR=$(cd $PATH_TO_DIR && ls -d * | fzf) 

if [[ "$SELECTED_DIR" == "" ]]; then
  exit 0
fi

echo "${PATH_TO_DIR}/${SELECTED_DIR}"
