# codex-devflow-plugin

A small Codex skill bundle for implementation planning workflows.

It packages three independently installable skills:

1. `dev-plan-generator` — create phased implementation plans.
2. `parallel-dev` — split work into safe parallel workstreams.
3. `plan-eng-review` — review plans for architecture, risk, edge cases, and tests.

---

## 한국어

### 목적

`codex-devflow-plugin`은 구현 전 작업 흐름을 표준화하기 위한 Codex 스킬 번들입니다.

```text
개발 계획 작성
→ 엔지니어링 리뷰
→ 병렬 워크스트림 분해
→ 구현 가능 체크리스트
```

각 스킬은 독립 설치가 가능합니다.

### 설치

전체 설치:

```bash
./install.sh all
```

개별 설치:

```bash
./install.sh dev-plan-generator
./install.sh parallel-dev
./install.sh plan-eng-review
```

설치 위치:

```text
${CODEX_HOME:-$HOME/.codex}/skills/<skill-name>
```

### 제거

```bash
./uninstall.sh all
./uninstall.sh parallel-dev
```

### 검증

```bash
./validate.sh
```

검증 내용:

- `SKILL.md` frontmatter 확인
- TODO placeholder 확인
- shell script syntax 확인
- `new_dev_plan.py` smoke
- temp `CODEX_HOME` 전체 설치/제거 smoke

### 기존 스킬 충돌

설치 스크립트는 같은 폴더명이 이미 있으면 자동 백업합니다.

```text
~/.codex/skills/parallel-dev.backup.YYYYMMDD_HHMMSS
```

또한 다른 폴더에 동일한 `name:`을 가진 스킬이 있으면 경고합니다. 예를 들어 gstack 계열 `plan-eng-review`가 이미 설치되어 있으면 중복 경고가 날 수 있습니다.

---

## English

### Overview

`codex-devflow-plugin` bundles three focused Codex skills for implementation planning:

- `dev-plan-generator`
- `parallel-dev`
- `plan-eng-review`

Each skill can be installed independently or all at once.

### Install

```bash
./install.sh all
./install.sh dev-plan-generator parallel-dev
```

### Uninstall

```bash
./uninstall.sh all
./uninstall.sh plan-eng-review
```

### Validate

```bash
./validate.sh
```

## License

MIT. See [`LICENSE.md`](./LICENSE.md).
