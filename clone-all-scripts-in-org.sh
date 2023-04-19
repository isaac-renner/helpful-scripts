#!/bin/bash

# Should probs write in bb and make it multi threaded 
gh repo list ailohq --json sshUrl -q ".[].sshUrl" --no-archived --limit 1000 | xargs -n 1 git clone --bare
