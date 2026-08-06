#!/usr/bin/env bash
# Install the pi configuration from this repo into ~/.pi/agent via symlinks.
#
# After this, the repo is the single source of truth: edits to pi/agents,
# pi/prompts, or pi/extensions take effect on the next pi restart.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${HOME}/.pi/agent"

if [ ! -d "$TARGET" ]; then
  echo "error: $TARGET does not exist — is pi installed?" >&2
  exit 1
fi

link_dir() {
  local name="$1"
  if [ -L "$TARGET/$name" ]; then
    rm "$TARGET/$name"
  elif [ -e "$TARGET/$name" ]; then
    echo "backing up $TARGET/$name -> $TARGET/$name.bak"
    mv "$TARGET/$name" "$TARGET/$name.bak"
  fi
  ln -s "$REPO_DIR/$name" "$TARGET/$name"
  echo "linked $TARGET/$name -> $REPO_DIR/$name"
}

link_dir agents
link_dir prompts
link_dir extensions

echo "Done. Restart pi to pick up the extensions."
