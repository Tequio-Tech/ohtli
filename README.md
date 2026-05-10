# Ohtli

Ohtli is the tequio.tech monorepo for AI engineering, healthcare automation, and
build-in-public research. The name comes from the Nahuatl word for "path".

This repository is intentionally workspace-first: the root owns shared tooling,
documentation, and agent conventions, while runnable code will live under
`packages/` as projects mature.

## Documentation

- [docs/overview.md](docs/overview.md) — project philosophy, monorepo
  structure, development setup, AI agent workflow, and roadmap.
- [docs/blog.md](docs/blog.md) — building and authoring the Tequio Tech
  blog under `blog/`.

## Quick Start

```sh
uv sync --dev
uv run ruff check .
uv run ruff format --check .
```

## Agent Setup

Shared agent instructions live in [AGENTS.md](AGENTS.md). 

Keep `.codex/`, `.claude/`, and `.gemini/` limited to tool-specific configuration. 
Cross-tool conventions and skill setups are documented in [docs/overview.md](docs/overview.md), 
while operational agent rules live in [AGENTS.md](AGENTS.md).
