# Ohtli Agent Guide

Ohtli is a workspace-only monorepo. Keep the root focused on shared tooling,
documentation, and cross-agent conventions. Do not add a root application entry
point unless the project direction changes explicitly.

## Working Rules

- Use Python 3.14 and uv for environment management.
- Put runnable Python packages under `packages/`; do not scaffold empty packages.
- Keep local blog content under `blog/` when it exists; do not add a framework
  until the publishing approach is chosen.
- Keep `README.md` concise. Put durable explanations in `docs/`.
- Treat `.agents/skills/` as the canonical shared skills directory.
- Keep tool-specific instruction files as symlinks to this file when possible to`
  avoid drift.
- never modify CLAUDE.md directly (is a sym file)
## Verification

Before handing off changes that touch Python or repo tooling, run:

```sh
uv sync --dev
uv run ruff check .
uv run ruff format --check .
uv run flake8 .
```

If a command cannot run in the current environment, report the exact failure and
what remains unverified.

## Repo conventions

- New shared skills: `.agents/skills/<name>/SKILL.md`.
- Never modify `CLAUDE.md` directly (it is a symlink — see project rules).
- Run `uv run ruff check .` and `uv run ruff format --check .` after changes
  that touch Python tooling, even if the skill itself is markdown-only.
