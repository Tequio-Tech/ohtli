---
name: create-skills
description: Use when authoring, scaffolding, reviewing, or auditing an Agent Skill (SKILL.md file) in this repo or elsewhere. Covers frontmatter rules, progressive disclosure, file layout, and security review.
---

# Create Skills

Authoring guide for Agent Skills. A Skill is a directory containing a `SKILL.md` file (plus optional resources) that the AI agent loads on demand when its description matches the user's request.

## When to use

- Creating a new skill (`.agents/skills/<name>/SKILL.md`).
- Reviewing or auditing an existing skill for correctness or security.
- Deciding whether content belongs in a skill, in global instruction files (e.g., `AGENTS.md`), or in `docs/`.

Not for *invoking* existing skills — the agent does that automatically from the metadata index.

## File layout

```text
<skill-name>/
├── SKILL.md          # required, with YAML frontmatter
├── reference/        # optional: large reference material
│   ├── REFERENCE.md
│   └── FORMS.md
└── scripts/          # optional: executable helpers (Python, bash, …)
    └── do_thing.py
```

- Repo-shared skills live under `.agents/skills/<name>/`.
- Do not scaffold empty subdirectories — only create `scripts/` or extra `.md` files when there is real content for them.

## Frontmatter contract

```yaml
---
name: your-skill-name
description: What it does AND when it should be triggered
---
```

Rules (validated by the runtime — getting these wrong silently disables the skill):

- `name`: ≤64 chars, only lowercase letters, digits, and hyphens; no XML tags. Do not use vendor-specific reserved words.
- `description`: non-empty, ≤1024 chars, no XML tags. Must state both *what* the skill does and *when* to use it — this is the only text the agent sees at startup, so it must be discriminative against other skills.

## Progressive disclosure

Agents load skill content in three levels. Design with this in mind to keep context small.

| Level | When loaded             | Budget         | Content                                  |
| ----- | ----------------------- | -------------- | ---------------------------------------- |
| L1    | Always (startup)        | ~100 tok       | `name` + `description` from frontmatter  |
| L2    | When skill is triggered | target <5k tok | SKILL.md body                            |
| L3    | On demand               | unlimited      | Sibling `.md` files, `scripts/`, data    |

Implications:

- Keep the `SKILL.md` body tight. Push large reference material into L3 files and link to them from the body (`see [REFERENCE.md](REFERENCE.md)`).
- Prefer **scripts** over inline code for deterministic operations. Script source never enters context — only the script's stdout does.
- There is no context penalty for L3 files the agent never opens.

## Platform considerations

Different AI platforms expose tools and context differently:

- **Local runtime**: Often filesystem-based; skills get the same network and filesystem access as the user's shell.
- **API runtime**: Sometimes restricted with no network access and only pre-installed packages.
- Treat skills as environment-agnostic as possible, but document expected local dependencies.
- Skills do **not** inherently sync across platforms — manage them within the shared repository.

## Security review

Treat installing a third-party skill like installing software. When auditing:

- Read every file in the skill directory, not just `SKILL.md`.
- Flag external URL fetches and any network calls in scripts.
- Flag tool invocations (file ops, bash, code exec) that don't match the stated purpose.
- Be wary of skills whose behavior depends on remote content that can change after the audit.

## Authoring checklist

- [ ] `name` is short, hyphenated, and unambiguous.
- [ ] `description` names both the action and the trigger conditions.
- [ ] `SKILL.md` body is concise; long content lives in L3 files.
- [ ] No duplication of repo-wide rules already in `AGENTS.md`.
- [ ] Match the tone/structure of `.agents/skills/onboard/SKILL.md`.
- [ ] No emojis unless the user explicitly asked for them.
- [ ] Bundled scripts install no global packages and have no side effects beyond what the description promises.