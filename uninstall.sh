#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_ROOT="$ROOT_DIR/skills"
CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"
TARGET_ROOT="$CODEX_HOME_DIR/skills"

usage() {
  echo "Usage: $0 [all|skill-name ...]"
  echo "Available skills:"
  find "$SOURCE_ROOT" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort | sed 's/^/  - /'
}

remove_one() {
  local skill="$1"
  if [[ ! -d "$SOURCE_ROOT/$skill" ]]; then
    echo "Unknown packaged skill: $skill" >&2
    usage >&2
    exit 1
  fi
  local target="$TARGET_ROOT/$skill"
  if [[ ! -e "$target" ]]; then
    echo "Not installed: $target"
    return 0
  fi
  rm -rf "$target"
  echo "Removed $skill from: $target"
}

if [[ $# -eq 0 ]]; then
  set -- all
fi

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  usage
  exit 0
fi

if [[ "$1" == "all" ]]; then
  skills=()
  while IFS= read -r skill_name; do
    skills+=("$skill_name")
  done < <(find "$SOURCE_ROOT" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort)
else
  skills=("$@")
fi

for skill in "${skills[@]}"; do
  remove_one "$skill"
done
