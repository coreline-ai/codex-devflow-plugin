---
name: readme-style
description: Redesign README.md files with modern GitHub styling — badges, icons, tables, ASCII diagrams, and anchor navigation. Use when asked to restyle, modernize, or redesign a README with shields.io badges, section icons, or visual improvements.
---

# README Style

## Overview

Analyze a project and rewrite its README.md with modern GitHub visual styling. The goal is a README that renders well on GitHub, communicates project purpose at a glance, and follows current open-source conventions.

## Workflow

1. Read the existing README and project root files (`package.json`, `pyproject.toml`, `go.mod`, `Cargo.toml`, `Makefile`, `LICENSE*`).
2. Identify the tech stack, build tools, test tools, and project structure.
3. Check for existing docs (`CHANGELOG`, `CONTRIBUTING`, `docs/`) to link.
4. Decide which sections apply to this project — do not add sections for features that do not exist.
5. Write the README following the style guide in `references/readme-style-guide.md`.
6. Verify all file paths, commands, and feature descriptions match the actual project.

## Rules

- Only include badges for technologies actually present in the project.
- Do not fabricate CI, npm, or PyPI badges if no pipeline or package exists.
- Preserve all essential information from the original README.
- Use ASCII box diagrams over Mermaid for workflow visualization.
- Prefer tables over bullet lists for structured information.
- Scale README length to project size: small tools ~80 lines, libraries ~150, large projects 200+.
- Match the language of the existing README (Korean, English, or mixed).
- Technical terms (commands, file paths, function names) are always in English regardless of document language.
