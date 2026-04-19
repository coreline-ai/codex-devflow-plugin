---
name: dev-plan-generator
description: Create or update lightweight phased development plan markdown documents for implementation work. Use when the user asks for a 개발 계획 문서, 구현 계획, dev plan, phased implementation plan, implement_*.md, checkbox-based task plan, or asks to formalize scope before coding.
---

# Dev Plan Generator

## Overview

Create a focused implementation plan that fixes scope, prevents uncontrolled expansion, and gives the project a checkbox-based execution history.

## Workflow

1. Read relevant local docs first: `README.md`, `AGENTS.md`, `CLAUDE.md`, `docs/*.md`, and existing `dev-plan/*.md`.
2. Clarify the goal, scope, non-goals, constraints, and verification expectations.
3. Create a new file under `dev-plan/implement_YYYYMMDD_HHMMSS.md` unless the user explicitly asks to update an existing plan.
4. Keep the plan implementation-oriented, not a PRD or meeting note.
5. Break the work into phases with checkboxes.
6. Add self-tests and done criteria for every phase.
7. Update checkboxes to match real progress while implementing.

## Required Sections

Every plan should include:

- `개발 목적`
- `개발 범위`
- `제외 범위`
- `참조 문서`
- `공통 진행 규칙`
- `Phase 상태 요약`
- one or more `Phase` sections

Use `references/dev-plan-template.md` when a full skeleton is needed.

## Rules

- Do not overwrite old plan files.
- Do not add features outside the stated scope.
- Put ambiguous or risky work into a separate phase or follow-up section.
- If parallel implementation is likely, include ownership boundaries and merge order.
- If engineering review is requested, add an `Engineering Review` section or call the `plan-eng-review` skill separately.

## Script

Use `scripts/new_dev_plan.py` to scaffold a timestamped plan:

```bash
python3 path/to/scripts/new_dev_plan.py --dir dev-plan --title "Short goal"
```
