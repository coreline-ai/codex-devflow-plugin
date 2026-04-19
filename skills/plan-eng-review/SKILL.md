---
name: plan-eng-review
description: Engineering-manager style implementation plan review. Use when asked to review architecture, lock in an execution plan, assess data flow, edge cases, test coverage, performance, rollout risk, or perform an engineering review before coding.
---

# Plan Eng Review

## Overview

Review an implementation plan before coding. The goal is to catch architecture risks, missing contracts, test gaps, and over/under-engineering while the plan is still cheap to change.

## Review Workflow

1. Read the target plan and relevant project docs.
2. Restate the goal and scope in plain language.
3. Check architecture and data flow.
4. Check ownership boundaries, contracts, and dependencies.
5. Check edge cases, failure modes, security, performance, and rollback.
6. Check test strategy and smoke coverage.
7. Produce opinionated recommendations with priority.
8. If requested, update the plan with accepted recommendations.

## Review Standards

Prefer:

- explicit contracts over implicit coupling
- boring technology over clever abstractions
- incremental changes over big-bang rewrites
- deterministic tests over manual-only confidence
- minimal diff with enough edge-case coverage

Flag:

- shared files with unclear owners
- stubs without follow-up path
- tests that only cover happy paths
- hidden migration or rollout risks
- plans that mix unrelated features
- scope creep disguised as cleanup

## Output Shape

Use this compact structure:

1. Verdict: ready / needs revision / blocked
2. Top risks
3. Architecture and contract notes
4. Test coverage notes
5. Required plan edits
6. Recommended next action

Read `references/eng-review-checklist.md` for a full checklist when needed.
