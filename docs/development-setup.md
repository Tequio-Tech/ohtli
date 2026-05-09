# Development Setup

Ohtli uses Python 3.14 and uv.

## Install

```sh
uv sync --dev
```

## Check

```sh
uv run ruff check .
uv run ruff format --check .
```

## Workspace Packages

Future Python projects should be added under `packages/` and included through
the uv workspace configuration in `pyproject.toml`.
