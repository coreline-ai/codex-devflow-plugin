#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_ROOT="$ROOT_DIR/skills"
VALIDATOR="${SKILL_VALIDATOR:-$HOME/.codex/skills/.system/skill-creator/scripts/quick_validate.py}"

basic_validate_skill() {
  local skill_dir="$1"
  python3 - <<'PY' "$skill_dir"
from pathlib import Path
import re
import sys
skill_dir = Path(sys.argv[1])
skill = skill_dir.name
text = (skill_dir / "SKILL.md").read_text(encoding="utf-8")
if not text.startswith("---\n"):
    raise SystemExit(f"{skill}: SKILL.md must start with frontmatter")
front = text.split("---\n", 2)[1]
if f"name: {skill}" not in front:
    raise SystemExit(f"{skill}: frontmatter name must be {skill}")
match = re.search(r"^description:\s*(.+)$", front, re.M)
if not match or "TODO" in match.group(1) or len(match.group(1).strip()) < 30:
    raise SystemExit(f"{skill}: description is missing or too short")
if "TODO" in text:
    raise SystemExit(f"{skill}: TODO placeholder remains")
PY
}

validate_skill() {
  local skill_dir="$1"
  if [[ -f "$VALIDATOR" ]]; then
    local log
    log="$(mktemp)"
    if python3 "$VALIDATOR" "$skill_dir" >"$log" 2>&1; then
      cat "$log"
    elif grep -q "ModuleNotFoundError: No module named 'yaml'" "$log"; then
      echo "Official validator unavailable because PyYAML is missing; running bundled basic validator for $(basename "$skill_dir")."
      basic_validate_skill "$skill_dir"
    else
      cat "$log" >&2
      rm -f "$log"
      exit 1
    fi
    rm -f "$log"
  else
    basic_validate_skill "$skill_dir"
  fi
}

for script in "$ROOT_DIR/install.sh" "$ROOT_DIR/uninstall.sh" "$ROOT_DIR/validate.sh"; do
  bash -n "$script"
done

for skill_dir in "$SOURCE_ROOT"/*; do
  [[ -d "$skill_dir" ]] || continue
  validate_skill "$skill_dir"
done

smoke_dir="$(mktemp -d)"
python3 "$SOURCE_ROOT/dev-plan-generator/scripts/new_dev_plan.py" --dir "$smoke_dir" --title "Validation smoke" >/tmp/codex-devflow-new-plan.log
rm -rf "$smoke_dir"

tmp_root="$(mktemp -d)"
trap 'rm -rf "$tmp_root"' EXIT
CODEX_HOME="$tmp_root/.codex" "$ROOT_DIR/install.sh" all >/tmp/codex-devflow-install.log
for skill_dir in "$SOURCE_ROOT"/*; do
  skill="$(basename "$skill_dir")"
  [[ -f "$tmp_root/.codex/skills/$skill/SKILL.md" ]]
done
CODEX_HOME="$tmp_root/.codex" "$ROOT_DIR/uninstall.sh" all >/tmp/codex-devflow-uninstall.log
for skill_dir in "$SOURCE_ROOT"/*; do
  skill="$(basename "$skill_dir")"
  [[ ! -e "$tmp_root/.codex/skills/$skill" ]]
done

echo "codex-devflow-plugin validation passed"
