#!/usr/bin/env python3
"""Create a timestamped dev-plan skeleton."""

from __future__ import annotations

import argparse
from datetime import datetime
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser(description="Create dev-plan/implement_YYYYMMDD_HHMMSS.md")
    parser.add_argument("--dir", default="dev-plan", help="Output directory")
    parser.add_argument("--title", default="Implementation plan", help="Short purpose line")
    parser.add_argument("--timezone", default="local", help="Display timezone label")
    args = parser.parse_args()

    now = datetime.now()
    stamp = now.strftime("%Y%m%d_%H%M%S")
    display = now.strftime("%Y-%m-%d %H:%M:%S")
    tz = args.timezone if args.timezone != "local" else now.astimezone().tzname() or "local"
    out_dir = Path(args.dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    path = out_dir / f"implement_{stamp}.md"
    if path.exists():
        raise SystemExit(f"File already exists: {path}")
    content = f"""# implement_{stamp}.md

작성 일시: `{display} {tz}`

이 문서는 이번 개발의 범위를 고정하고, 구현이 목적 밖으로 확장되지 않도록 하기 위한 작업 문서다.

## 개발 목적
- {args.title}

## 개발 범위
- ...

## 제외 범위
- ...

## 참조 문서
- 없음

## 공통 진행 규칙
- 각 Phase는 자체 테스트를 포함한다.
- 체크박스 상태를 실제 진행 상태와 맞게 업데이트한다.
- 문서에 없는 범위 확장은 하지 않는다.

## Phase 상태 요약
- [ ] Phase 1 완료

## Phase 1. 범위 고정 및 구현
### 목표
- ...

### 구현 태스크
- [ ] ...

### 자체 테스트
- [ ] ...

### 이슈 및 수정
- [ ] 발견 이슈 없음

### 완료 조건
- [ ] 구현 완료
- [ ] 자체 테스트 완료
"""
    path.write_text(content, encoding="utf-8")
    print(path)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
