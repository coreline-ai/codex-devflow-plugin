---
name: parallel-dev
description: Plan and coordinate parallel development workstreams across a codebase. Use when the user asks to parallelize implementation, split work into multiple PRs/agents, define file ownership boundaries, coordinate sub-agents, reduce merge conflicts, manage dependencies, or create a merge/integration plan for concurrent changes.
---

# Parallel Dev

## Overview

Turn one implementation goal into safe, independently executable workstreams. The priority is **maximum concurrency without hidden file conflicts**.

## Workflow

1. Confirm goal, non-goals, active local changes, and existing plans.
2. Map likely touch points with `rg --files`, `rg`, and docs.
3. Put shared contracts/types/interfaces into a small foundation workstream.
4. Split leaf work by path ownership wherever possible.
5. For each workstream, define objective, deliverables, owned paths, non-owned paths, dependencies, tests, and done criteria.
6. Decide whether each slice is safe to run in parallel or must be sequential.
7. Merge foundation first, then leaf workstreams, then shared wiring/docs.
8. Run targeted tests per workstream and full verification after integration.

## Sub-Agent Assignment Rules

When using sub-agents:

- Give each worker explicit file ownership and non-ownership.
- Tell workers they are not alone in the codebase.
- Tell workers not to revert or overwrite edits made by others.
- Prefer bounded implementation tasks over broad exploration.
- Keep final integration and full verification in the main agent.

## Output Shape

1. Parallel workstreams
2. Ownership boundaries and contracts
3. Integration/merge order
4. Tests and smoke checks
5. Risks and required coordination

Read `references/parallel-templates.md` when a structured workstream card or sub-agent prompt is useful.
