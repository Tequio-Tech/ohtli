---
name: coding-guidelines
description: Use when writing or reviewing Python code in Ohtli. Covers deep-module design (Ousterhout) and managing cognitive and cyclomatic complexity to stay within the repo's lint thresholds (ruff C90 max-complexity 10, flake8-cognitive-complexity max 7).
---

# Coding Guidelines

Two principles govern Python code in Ohtli: build **deep modules** that hide
work behind simple interfaces, and keep per-function **complexity** low enough
that a reader can follow the logic in one pass.

## Deep Modules

A module is *deep* when its interface is narrower than its implementation:
callers ask for one thing and a lot happens behind it. Shallow wrappers,
classitis, and getter/setter chains add interface surface without earning it
back in encapsulation, so prefer them only when mutable state or a resource
lifetime demands a class.

Read [deep-modules.md](reference/deep-modules.md) for the concept and Python
applications. Use [rubric-deep-modules.md](reference/rubric-deep-modules.md)
when reviewing a class or module.

## Complexity

Two complementary lint gates run alongside the standard checks documented in
`AGENTS.md`:

- **Cyclomatic complexity** — ruff `C90`, threshold **10**
  (`pyproject.toml`). Counts branching paths; bounds how many test cases
  reach full branch coverage.
- **Cognitive complexity** — `flake8-cognitive-complexity`, threshold **7**
  (`.flake8`). Weighs nesting and structure, approximating how hard the code
  is to read.

Read [cyclomatic-complexity.md](reference/cyclomatic-complexity.md) and
[cognitive-complexity.md](reference/cognitive-complexity.md) for what each
metric counts and how they differ. Use
[rubric-cognitive-complexity.md](reference/rubric-cognitive-complexity.md)
to spot likely violations before the linters do.

## Verification

After Python changes that touch logic, run `uv run ruff check .` and
`uv run flake8 .` to confirm both complexity gates pass. The full
verification command list lives in `AGENTS.md`.
