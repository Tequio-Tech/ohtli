---
name: onboard
description: Use when an agent needs to orient itself in Ohtli, work on Python tooling, or prepare a handoff to another agent.
---

# Onboard

Single skill covering repo orientation, Python workspace conventions, and
agent-to-agent handoffs in Ohtli.

## Repo Orientation

Start with `README.md`, then read `docs/overview.md` for philosophy, monorepo
structure, development setup, agent workflow, and roadmap. Use `AGENTS.md` for
shared operating rules.

## Python Workspace

Ohtli uses Python 3.14 and uv. The repository root is workspace-only and should
not become a runnable package. Runnable packages live under `packages/`.

Run these checks after tooling or Python changes:

```sh
uv sync --dev
uv run ruff check .
uv run ruff format --check .
```

## Agent Handoff

When handing work to another agent, summarize:

- Goal and current status.
- Files changed or intentionally left untouched.
- Verification commands run and their results.
- Known blockers or assumptions.

Keep handoffs concrete enough for another agent to continue without
rediscovering the same context.
