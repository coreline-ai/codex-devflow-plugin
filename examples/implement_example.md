# implement_example.md

작성 일시: `2026-04-19 16:35:57 KST`

## 개발 목적
- 예시 기능을 안전하게 구현한다.

## 개발 범위
- Phase 0 공유 계약
- WS-1 backend
- WS-2 CLI/TUI
- WS-3 tests/docs

## 제외 범위
- 배포 자동화
- 외부 API 연동

## Engineering Review

| 항목 | 판정 | 메모 |
|---|---|---|
| 아키텍처 | ready | 기존 모듈 확장 |
| 공유 계약 | needs attention | Phase 0에서 타입 먼저 고정 |
| 테스트 | ready | unit + integration + smoke |

## Parallel Workstreams

| WS | 목적 | 소유 파일 | 비소유 파일 | 의존성 | 테스트 |
|---|---|---|---|---|---|
| Phase 0 | 공유 타입 | `src/types.ts` | 전체 구현 파일 | 없음 | typecheck |
| WS-1 | backend | `src/backend/*` | `src/tui/*` | Phase 0 | backend tests |
| WS-2 | UI | `src/tui/*` | `src/backend/*` | Phase 0 | UI tests |
| WS-3 | docs/tests | `tests/*`, `README.md` | 구현 파일 | WS-1/2 | full test |

## Merge Sequence

1. Phase 0
2. WS-1 + WS-2 병렬
3. WS-3
4. full verification
