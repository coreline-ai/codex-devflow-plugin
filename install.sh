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

available_skill() {
  [[ -d "$SOURCE_ROOT/$1" && -f "$SOURCE_ROOT/$1/SKILL.md" ]]
}

frontmatter_name() {
  awk -F': *' '/^name:/{print $2; exit}' "$1/SKILL.md"
}

warn_name_conflicts() {
  local skill="$1"
  local target="$TARGET_ROOT/$skill"
  [[ -d "$TARGET_ROOT" ]] || return 0
  for existing in "$TARGET_ROOT"/*; do
    [[ -e "$existing" && -f "$existing/SKILL.md" ]] || continue
    [[ "$(basename "$existing")" == "$skill" ]] && continue
    local existing_name
    existing_name="$(frontmatter_name "$existing" 2>/dev/null || true)"
    if [[ "$existing_name" == "$skill" ]]; then
      echo "Warning: another installed skill declares name '$skill': $existing" >&2
    fi
  done
}

install_one() {
  local skill="$1"
  if ! available_skill "$skill"; then
    echo "Unknown skill: $skill" >&2
    usage >&2
    exit 1
  fi

  mkdir -p "$TARGET_ROOT"
  warn_name_conflicts "$skill"

  local source="$SOURCE_ROOT/$skill"
  local target="$TARGET_ROOT/$skill"
  if [[ -e "$target" ]]; then
    local backup="$target.backup.$(date +%Y%m%d_%H%M%S)"
    mv "$target" "$backup"
    echo "Backed up existing $skill to: $backup"
  fi

  cp -R "$source" "$target"
  echo "Installed $skill to: $target"
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
  install_one "$skill"
done
