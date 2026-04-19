# FILE_DESIGN.md

## 목적

`codex-devflow-plugin`의 파일 구조와 책임을 정의한다.

## 구조

```text
codex-devflow-plugin/
├── skills/
│   ├── dev-plan-generator/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   ├── scripts/new_dev_plan.py
│   │   └── references/dev-plan-template.md
│   ├── parallel-dev/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/parallel-templates.md
│   └── plan-eng-review/
│       ├── SKILL.md
│       ├── agents/openai.yaml
│       └── references/eng-review-checklist.md
├── examples/implement_example.md
├── README.md
├── FILE_DESIGN.md
├── LICENSE.md
├── install.sh
├── uninstall.sh
├── validate.sh
└── .gitignore
```

## 책임 분리

| 경로 | 책임 |
|---|---|
| `skills/dev-plan-generator` | phased dev-plan 생성 |
| `skills/parallel-dev` | 병렬 workstream/소유권/병합 순서 설계 |
| `skills/plan-eng-review` | 구현 전 엔지니어링 리뷰 |
| `install.sh` | 전체/개별 스킬 설치 |
| `uninstall.sh` | 전체/개별 스킬 제거 |
| `validate.sh` | 구조 검증 및 temp install smoke |
| `examples/` | 사용자 참고용 예시 |

## 설계 원칙

- 스킬은 독립 설치 가능해야 한다.
- 스킬 내부에는 필요한 파일만 둔다.
- gstack 전용 telemetry/preamble은 포함하지 않는다.
- 플러그인은 Codex 런타임 기능을 구현하지 않고, 작업 운영 규칙만 제공한다.
