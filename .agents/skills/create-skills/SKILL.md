---
name: create-skills
description: Use when authoring, scaffolding, reviewing, or auditing an Agent Skill (SKILL.md file) in this repo or elsewhere. Covers frontmatter rules, progressive disclosure, file layout, and security review.
---

# Create Skills

Authoring guide for Anthropic Agent Skills. A Skill is a directory containing a
`SKILL.md` file (plus optional resources) that Claude loads on demand when its
description matches the user's request.

## When to use

- Creating a new skill (`.agents/skills/<name>/SKILL.md`).
- Reviewing or auditing an existing skill for correctness or security.
- Deciding whether content belongs in a skill, in `CLAUDE.md`, or in `docs/`.

Not for *invoking* existing skills — Claude does that automatically from the
metadata index.

## File layout

```
<skill-name>/
├── SKILL.md          # required, with YAML frontmatter
├── REFERENCE.md      # optional: large reference material
├── FORMS.md          # optional: task-specific guidance
└── scripts/          # optional: executable helpers (Python, bash, …)
    └── do_thing.py
```

In Ohtli, repo-shared skills live under `.agents/skills/<name>/`. User-scope
skills live under `~/.claude/skills/<name>/`. Do not scaffold empty
subdirectories — only create `scripts/` or extra `.md` files when there is real
content for them.

## Frontmatter contract

```yaml
---
name: your-skill-name
description: What it does AND when Claude should trigger it.
---
```

Rules (validated by the runtime — getting these wrong silently disables the
skill):

- `name`: ≤64 chars, only lowercase letters, digits, and hyphens; no XML tags;
  must not contain the reserved words `anthropic` or `claude`.
- `description`: non-empty, ≤1024 chars, no XML tags. Must state both *what*
  the skill does and *when* to use it — this is the only text Claude sees at
  startup, so it must be discriminative against other skills.

## Progressive disclosure (the model that makes skills cheap)

Claude loads skill content in three levels. Design with this in mind to keep
context small.

| Level | When loaded            | Budget         | Content                                  |
| ----- | ---------------------- | -------------- | ---------------------------------------- |
| L1    | Always (startup)       | ~100 tok       | `name` + `description` from frontmatter  |
| L2    | When skill is triggered| target <5k tok | SKILL.md body                            |
| L3    | On demand              | unlimited      | Sibling `.md` files, `scripts/`, data    |

Implications:

- Keep the SKILL.md body tight. Push large reference material into L3 files and
  link to them from the body (`see [REFERENCE.md](REFERENCE.md)`).
- Prefer **scripts** over inline code for deterministic operations. Script
  source never enters context — only the script's stdout does.
- There is no context penalty for L3 files Claude never opens.

## Authoring checklist

- [ ] `name` is short, hyphenated, and unambiguous.
- [ ] `description` names both the action and the trigger conditions.
- [ ] SKILL.md body is concise; long content lives in L3 files.
- [ ] No duplication of repo-wide rules already in `CLAUDE.md` / `AGENTS.md`.
- [ ] Match the tone/structure of `.agents/skills/onboard/SKILL.md`.
- [ ] No emojis unless the user explicitly asked for them.
- [ ] If the skill bundles scripts, they install no global packages and have
      no side effects beyond what the description promises.

## Surface differences

- **Claude Code**: filesystem-based, no upload step. Skills get the same
  network and filesystem access as the user's shell.
- **Claude API**: skills are uploaded via `/v1/skills`; runtime has *no*
  network access and only pre-installed packages.
- **Claude.ai**: zip upload via Settings → Features; per-user, not shared.
- Skills do **not** sync across surfaces — manage each independently.

## Security review

Treat installing a third-party skill like installing software. When auditing:

- Read every file in the skill directory, not just SKILL.md.
- Flag external URL fetches and any network calls in scripts.
- Flag tool invocations (file ops, bash, code exec) that don't match the
  stated purpose.
- Be wary of skills whose behavior depends on remote content that can change
  after the audit.

## Repo conventions

- New shared skills: `.agents/skills/<name>/SKILL.md`.
- Never modify `CLAUDE.md` directly (it is a symlink — see project rules).
- Run `uv run ruff check .` and `uv run ruff format --check .` after changes
  that touch Python tooling, even if the skill itself is markdown-only.
