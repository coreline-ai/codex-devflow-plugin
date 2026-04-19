# Engineering Review Checklist

## Architecture

- [ ] The source of truth is clear.
- [ ] Data flow is described from input to output.
- [ ] Shared contracts are named and located.
- [ ] Existing architecture is extended, not bypassed.
- [ ] New abstractions are justified.

## Parallel Safety

- [ ] Shared files have owners.
- [ ] Foundation work lands first.
- [ ] Workstreams have non-owned path boundaries.
- [ ] Merge order is deterministic.

## Edge Cases

- [ ] Empty input / missing config.
- [ ] Invalid input / schema errors.
- [ ] Abort/cancel path.
- [ ] Permission denied / user declined.
- [ ] Partial failure / retry / timeout.
- [ ] Resume/restart behavior if relevant.

## Security And Safety

- [ ] Secrets are not logged.
- [ ] External network calls are bounded or avoidable.
- [ ] Destructive operations are permission-gated.
- [ ] File writes are scoped and recoverable.

## Tests

- [ ] Unit tests for pure logic.
- [ ] Integration tests for wiring.
- [ ] Regression tests for previously fragile behavior.
- [ ] Smoke test for actual user flow.
- [ ] Full typecheck/build/test listed as final gate.

## Verdict Labels

- `ready`: plan can be implemented now.
- `needs revision`: plan is mostly right but requires edits.
- `blocked`: missing information or unsafe architecture.
