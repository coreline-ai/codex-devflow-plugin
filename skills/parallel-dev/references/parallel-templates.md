# Parallel Dev Templates

## Workstream Card

| Field | Content |
|---|---|
| ID | WS-1 |
| Objective |  |
| Deliverables |  |
| Owned paths |  |
| Non-owned paths |  |
| Shared contracts |  |
| Dependencies |  |
| Tests/checks |  |
| Done criteria |  |
| Merge readiness |  |

## Ownership Matrix

| Workstream | Owned paths | Shared touch points | Conflict risk |
|---|---|---|---|
| WS-1 |  |  | Low/Medium/High |

## Contract Checklist

| Field | Content |
|---|---|
| Contract name |  |
| Location |  |
| Producer |  |
| Consumers |  |
| Schema/signature |  |
| Stub required | Yes/No |
| Acceptance criteria |  |

## Merge Sequence

1. Foundation contracts/types
2. Independent leaf workstreams
3. Shared UI/CLI wiring
4. Documentation
5. Full verification

## Sub-Agent Prompt Template

```text
You are implementing WS-X in a repository where other workers may be editing in parallel.

Objective:
- ...

Owned files/directories:
- ...

Do not edit:
- ...

Contracts to preserve:
- ...

Required tests:
- ...

Rules:
- Do not revert edits made by others.
- Keep changes inside your ownership boundary.
- If a shared change is required, report it instead of editing outside scope.
- In your final answer, list changed files and verification commands.
```
