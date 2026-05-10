# Ohtli Overview

Ohtli is the tequio.tech monorepo for AI engineering, healthcare automation, and
build-in-public research. The name comes from the Nahuatl word for "path". This
document is the durable reference for how the repository is organized, how to
develop in it, and how AI agents collaborate inside it.

## Philosophy

Ohtli is a practical path for building AI-assisted healthcare software in
public. The repository should make design decisions, implementation tradeoffs,
and operational lessons easy to inspect over time.

Principles:

- Build with clear clinical and operational context.
- Prefer small, auditable systems over opaque complexity.
- Document durable decisions close to the work.
- Use AI agents as collaborators with shared instructions and reproducible
  tools.
- Keep experiments distinguishable from production paths.

## Monorepo Structure

Ohtli is a uv-managed workspace-only monorepo. The repository root is not a
Python package and is not a runnable app.

Top-level layout:

- `AGENTS.md`: canonical shared instructions for AI coding agents.
- `.agents/skills/`: canonical shared skill definitions.
- `.codex/`, `.claude/`, `.gemini/`: project-level tool configuration.
- `docs/`: durable documentation.
- `packages/`: future workspace packages.
- `blog/`: Quarto site for tequio.tech writing — see [blog.md](blog.md).

`packages/` intentionally starts empty. Add files only when there is real
package work to commit.

## Development Setup

Ohtli uses Python 3.14 and uv.

Install:

```sh
uv sync --dev
```

Check:

```sh
uv run ruff check .
uv run ruff format --check .
```

Future Python projects should be added under `packages/` and included through
the uv workspace configuration in `pyproject.toml`.

## AI Agent Workflow

`AGENTS.md` is the single source of truth for repo-level agent instructions.
Claude Code, Gemini CLI, Antigravity-compatible tools, and Codex should consume
the same guidance instead of maintaining separate copies. Tool-specific
instruction files (`CLAUDE.md`, `GEMINI.md`) should symlink to `AGENTS.md` to
avoid drift.

Shared skills live under `.agents/skills/`. Tool-specific skills folders should
symlink to that directory:

```text
.claude/skills -> ../.agents/skills
.gemini/skills -> ../.agents/skills
```

Each skill must include a `SKILL.md` file with `name` and `description`
frontmatter.

When handing work to another agent, include:

- Goal and current status.
- Files changed or intentionally left untouched.
- Verification commands run and their results.
- Known blockers or assumptions.

## Roadmap

Near term:

- Establish shared monorepo tooling and agent conventions.
- Add package scaffolding only when a concrete project needs it.
- Capture architecture and product decisions in `docs/`.

Later:

- Add healthcare automation packages under `packages/`.
- Expand shared skills as recurring workflows become clear.
