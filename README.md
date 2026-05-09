# Ohtli

Ohtli is the tequio.tech monorepo for AI engineering, healthcare automation, and
build-in-public research. The name comes from the Nahuatl word for "path".

This repository is intentionally workspace-first: the root owns shared tooling,
documentation, and agent conventions, while runnable code will live under
`packages/` as projects mature.

## Documentation

See [docs/overview.md](docs/overview.md) for the project's philosophy,
monorepo structure, development setup, AI agent workflow, and roadmap.

## Quick Start

```sh
uv sync --dev
uv run ruff check .
uv run ruff format --check .
```

## Agent Setup

Shared agent instructions live in [AGENTS.md](AGENTS.md). Tool-specific
entrypoints should point back to that file so Codex, Gemini CLI, and Claude Code
receive the same repo guidance:

- [CLAUDE.md](CLAUDE.md) -> `AGENTS.md`
- [GEMINI.md](GEMINI.md) -> `AGENTS.md`

Shared skills live under `.agents/skills/`. Tool-specific skill directories
should symlink to that shared directory when the tool supports project skills:

- `.claude/skills` -> `../.agents/skills`
- `.gemini/skills` -> `../.agents/skills`

Keep `.codex/`, `.claude/`, and `.gemini/` limited to tool-specific
configuration. Keep cross-tool conventions in this README and operational agent
rules in [AGENTS.md](AGENTS.md).
