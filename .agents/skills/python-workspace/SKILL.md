---
name: python-workspace
description: Use when changing Python tooling, uv workspace configuration, or linting behavior in Ohtli.
---

# Python Workspace

Ohtli uses Python 3.14 and uv. The repository root is workspace-only and should
not become a runnable package.

Run these checks after tooling or Python changes:

```sh
uv sync --dev
uv run ruff check .
uv run ruff format --check .
```
