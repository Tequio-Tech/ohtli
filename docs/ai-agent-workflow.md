# AI Agent Workflow

`AGENTS.md` is the single source of truth for repo-level agent instructions.
Claude Code, Gemini CLI, Antigravity-compatible tools, and Codex should consume
the same guidance instead of maintaining separate copies.

## Shared Skills

Project skills live under `.agents/skills/`. Tool-specific skills folders should
symlink to that directory:

```text
.claude/skills -> ../.agents/skills
.gemini/skills -> ../.agents/skills
```

Each skill must include a `SKILL.md` file with `name` and `description`
frontmatter.

## Handoffs

When handing work to another agent, include:

- Goal and current status.
- Files changed or intentionally left untouched.
- Verification commands run and their results.
- Known blockers or assumptions.
