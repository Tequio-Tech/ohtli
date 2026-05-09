# Monorepo Structure

Ohtli is a uv-managed workspace-only monorepo. The repository root is not a
Python package and is not a runnable app.

## Top-Level Layout

- `AGENTS.md`: canonical shared instructions for AI coding agents.
- `.agents/skills/`: canonical shared skill definitions.
- `.codex/`, `.claude/`, `.gemini/`: project-level tool configuration.
- `docs/`: durable documentation.
- `packages/`: future workspace packages.
- `blog/`: future local writing workspace.

`packages/` and `blog/` intentionally start empty. Add files only when there is
real package or publishing work to commit.
