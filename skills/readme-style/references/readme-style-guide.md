# README Style Guide

## Header Block

```html
<div align="center">

# Project Name

[![Badge](https://img.shields.io/badge/...)](link)

**Bold one-line description**

Secondary description sentence.

[Section1](#anchor) · [Section2](#anchor) · [Section3](#anchor)

</div>
```

- Wrap header in `<div align="center">`
- Badges immediately below project name
- Anchor navigation limited to 3–5 key sections
- Separator: ` · ` (middle dot)

## Badges

### Required

| Type | Format |
|---|---|
| License | `[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)` |

### Tech Stack (include only when present)

| Tech | Format |
|---|---|
| Python | `[![Python](https://img.shields.io/badge/Python-3.x+-3776AB?logo=python&logoColor=white)](...)` |
| TypeScript | `[![TypeScript](https://img.shields.io/badge/TypeScript-5.x-3178C6?logo=typescript&logoColor=white)](...)` |
| Node.js | `[![Node.js](https://img.shields.io/badge/Node.js-18+-339933?logo=nodedotjs&logoColor=white)](...)` |
| Go | `[![Go](https://img.shields.io/badge/Go-1.21+-00ADD8?logo=go&logoColor=white)](...)` |
| Rust | `[![Rust](https://img.shields.io/badge/Rust-1.70+-DEA584?logo=rust&logoColor=white)](...)` |
| Bash | `[![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnubash&logoColor=white)](...)` |
| React | `[![React](https://img.shields.io/badge/React-18+-61DAFB?logo=react&logoColor=black)](...)` |
| Docker | `[![Docker](https://img.shields.io/badge/Docker-ready-2496ED?logo=docker&logoColor=white)](...)` |

### Status (include only when pipeline/package exists)

| Type | Format |
|---|---|
| CI | `[![CI](https://github.com/OWNER/REPO/actions/workflows/ci.yml/badge.svg)](...)` |
| npm | `[![npm](https://img.shields.io/npm/v/PACKAGE.svg)](...)` |
| PyPI | `[![PyPI](https://img.shields.io/pypi/v/PACKAGE.svg)](...)` |

## Section Icons

| Section | Icon |
|---|---|
| Features / Skills | `📦` |
| Installation | `🚀` |
| Usage / Quick Start | `⚡` |
| Configuration | `⚙️` |
| Project Structure | `📁` |
| API / Reference | `📖` |
| Examples | `📄` |
| Testing / Validation | `✅` |
| Uninstall / Remove | `🗑️` |
| Contributing | `🤝` |
| License | `📜` |
| Troubleshooting | `🔧` |
| Changelog | `📝` |
| Roadmap | `🗺️` |
| Requirements | `📋` |
| Architecture | `🏗️` |
| Security | `🔒` |
| FAQ | `❓` |
| Acknowledgments | `🙏` |

## Diagrams

Use ASCII box diagrams for workflows:

```text
┌──────────┐    ┌──────────┐    ┌──────────┐
│ Step 1   │ ─▶ │ Step 2   │ ─▶ │ Step 3   │
└──────────┘    └──────────┘    └──────────┘
```

Prefer ASCII over Mermaid for GitHub rendering compatibility.

## Tables Over Lists

Use tables when presenting structured key-value information:

```markdown
| Item | Description |
|---|---|
| Feature A | Does X |
| Feature B | Does Y |
```

## Code Blocks

- Always use ` ```bash ` for shell commands
- Provide copy-pasteable exact commands
- Add `#` comments explaining each command's purpose

## Project Tree

```text
project/
├── src/
│   ├── module-a/        # Module description
│   └── module-b/        # Module description
├── tests/               # Tests
└── package.json         # Config
```

Use `├──` / `└──` / `│` tree characters with inline `# comments`.

## Full Section Order (maximum — omit what doesn't apply)

1. Header (centered, badges, nav)
2. Overview
3. Features / Skills
4. Prerequisites
5. Installation
6. Quick Start / Usage
7. Configuration
8. Project Structure
9. Testing / Validation
10. Examples
11. Uninstall
12. Contributing
13. License
