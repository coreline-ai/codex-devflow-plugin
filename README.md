<div align="center">

# codex-devflow-plugin

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE.md)
[![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnubash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Python](https://img.shields.io/badge/Python-3.9+-3776AB?logo=python&logoColor=white)](https://www.python.org/)
[![Codex Skills](https://img.shields.io/badge/Codex-Skills_Bundle-8A2BE2)](https://github.com/coreline-ai/codex-devflow-plugin)

**구현 전 작업 흐름을 표준화하는 Codex 스킬 번들**

Standardize your pre-implementation workflow with four focused Codex skills.

[설치](#-설치--installation) · [스킬 소개](#-스킬--skills) · [검증](#-검증--validation) · [예시](#-예시--example)

</div>

---

## Overview

`codex-devflow-plugin`은 구현 계획 → 엔지니어링 리뷰 → 병렬 분해 → README 스타일링까지의 워크플로를 하나의 번들로 제공합니다.

```text
  Plan             Review            Parallelize         Polish
┌──────────┐    ┌──────────┐    ┌────────────────┐    ┌──────────┐
│ dev-plan │ ─▶ │ eng-     │ ─▶ │ parallel-dev   │ ─▶ │ readme-  │
│ generator│    │ review   │    │ (workstreams)  │    │ style    │
└──────────┘    └──────────┘    └────────────────┘    └──────────┘
```

각 스킬은 **독립 설치** 가능하며, 함께 사용하면 구현 전 과정을 체계적으로 관리할 수 있습니다.

---

## 📦 스킬 / Skills

### 1. `dev-plan-generator`

> 페이즈별 체크박스 기반 구현 계획서 생성

| 항목 | 내용 |
|---|---|
| **트리거** | `개발 계획`, `구현 계획`, `dev plan`, `implement_*.md` |
| **출력** | `dev-plan/implement_YYYYMMDD_HHMMSS.md` |
| **핵심 섹션** | 개발 목적 · 개발 범위 · 제외 범위 · Phase별 태스크 · 자체 테스트 · 완료 조건 |

```bash
# 스캐폴딩 스크립트
python3 skills/dev-plan-generator/scripts/new_dev_plan.py \
  --dir dev-plan --title "Short goal"
```

### 2. `parallel-dev`

> 구현 목표를 안전한 병렬 워크스트림으로 분해

| 항목 | 내용 |
|---|---|
| **트리거** | `병렬 구현`, `split work`, `parallel workstreams`, `ownership boundaries` |
| **출력** | Workstream Card · Ownership Matrix · Merge Sequence |
| **핵심 기능** | 파일 소유권 분리 · 공유 계약 정의 · Sub-Agent 프롬프트 생성 |

### 3. `plan-eng-review`

> 코딩 전 구현 계획 엔지니어링 리뷰

| 항목 | 내용 |
|---|---|
| **트리거** | `엔지니어링 리뷰`, `review plan`, `architecture review`, `lock in plan` |
| **출력** | Verdict (`ready` / `needs revision` / `blocked`) + 리스크 · 아키텍처 · 테스트 노트 |
| **체크 항목** | 아키텍처 · 병렬 안전성 · 엣지케이스 · 보안 · 테스트 커버리지 |

### 4. `readme-style`

> README.md를 최신 GitHub 스타일로 리디자인

| 항목 | 내용 |
|---|---|
| **트리거** | `README 스타일링`, `README 다시 만들어줘`, `modernize README`, `add badges` |
| **출력** | 배지 · 아이콘 · 테이블 · ASCII 다이어그램 · 앵커 네비게이션이 적용된 README.md |
| **핵심 기능** | shields.io 배지 생성 · 섹션 아이콘 매핑 · 프로젝트 트리 포맷 · 스타일 가이드 참조 |

---

## 🚀 설치 / Installation

### 전체 설치

```bash
./install.sh all
```

### 개별 설치

```bash
./install.sh dev-plan-generator
./install.sh parallel-dev
./install.sh plan-eng-review
```

### 복수 선택

```bash
./install.sh dev-plan-generator parallel-dev
```

> **설치 위치:** `${CODEX_HOME:-$HOME/.codex}/skills/<skill-name>`

### 기존 스킬 충돌 처리

| 상황 | 동작 |
|---|---|
| 같은 폴더명이 이미 존재 | 자동 백업 → `<skill>.backup.YYYYMMDD_HHMMSS` |
| 다른 폴더에 동일 `name:` 스킬 존재 | 경고 메시지 출력 |

---

## 🗑️ 제거 / Uninstall

```bash
# 전체 제거
./uninstall.sh all

# 개별 제거
./uninstall.sh parallel-dev
```

---

## ✅ 검증 / Validation

```bash
./validate.sh
```

| 검증 항목 | 설명 |
|---|---|
| Frontmatter | `SKILL.md`의 `name:`, `description:` 필드 확인 |
| TODO check | 미완성 placeholder 잔류 여부 |
| Shell syntax | `install.sh`, `uninstall.sh`, `validate.sh` 문법 검사 |
| Script smoke | `new_dev_plan.py` 실행 테스트 |
| Install smoke | 임시 `CODEX_HOME`에서 전체 설치/제거 라운드트립 |

---

## 📄 예시 / Example

[`examples/implement_example.md`](./examples/implement_example.md)에서 3개 스킬이 함께 동작하는 결과를 확인할 수 있습니다:

```text
implement_example.md
├── 개발 목적 / 범위 / 제외 범위      ← dev-plan-generator
├── Engineering Review 테이블         ← plan-eng-review
├── Parallel Workstreams 테이블       ← parallel-dev
└── Merge Sequence                    ← parallel-dev
```

---

## 📁 프로젝트 구조

```text
codex-devflow-plugin/
├── skills/
│   ├── dev-plan-generator/
│   │   ├── SKILL.md                    # 스킬 정의
│   │   ├── agents/openai.yaml          # Agent UI 메타데이터
│   │   ├── scripts/new_dev_plan.py     # 계획서 스캐폴딩 스크립트
│   │   └── references/dev-plan-template.md
│   ├── parallel-dev/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/parallel-templates.md
│   ├── plan-eng-review/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/eng-review-checklist.md
│   └── readme-style/
│       ├── SKILL.md
│       ├── agents/openai.yaml
│       └── references/readme-style-guide.md
├── examples/implement_example.md       # 통합 사용 예시
├── install.sh                          # 설치 스크립트
├── uninstall.sh                        # 제거 스크립트
├── validate.sh                         # 검증 스크립트
├── FILE_DESIGN.md                      # 파일 설계 문서
├── LICENSE.md                          # MIT License
└── .gitignore
```

---

## 🤝 Contributing

1. Fork this repository
2. Create a feature branch (`git checkout -b feature/my-skill`)
3. Run validation (`./validate.sh`)
4. Commit and open a Pull Request

---

## 📜 License

MIT License — see [`LICENSE.md`](./LICENSE.md) for details.

Copyright (c) 2026 [Coreline AI](https://github.com/coreline-ai)
