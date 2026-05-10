# Cognitive Complexity

Cognitive complexity is a metric introduced by G. Ann Campbell at SonarSource
to estimate how hard a function is for a human to **read**, as opposed to how
many paths it has. The repo enforces it via `flake8-cognitive-complexity` with
`max-cognitive-complexity = 7` (see `.flake8`).

## What it counts

Three rules drive the score:

1. **Increment for each break in linear flow.** `if`, `elif`, `else`, `for`,
   `while`, `except`, ternary, and `match` arms each add 1.
2. **Nesting penalty.** A break in flow inside another break adds an extra
   point per level of nesting. A triply-nested `if` adds 1 + 2 + 3 = 6 by
   itself.
3. **Mixed boolean operators.** A run of `a and b and c` counts as 1 (one
   logical sequence). Switching operators (`a and b or c`) costs another
   point for each switch, because the reader must re-evaluate precedence.

## What it deliberately ignores

- **Method calls and lambdas** — calling a well-named helper costs nothing in
  cognitive complexity. Extracting code into helpers is the canonical fix.
- **Early-return guard clauses** at the top of a function — these reduce
  apparent complexity by removing nesting from the rest of the body.
- **Straight-line code** of any length. Length is not the same as complexity.

## Difference from cyclomatic

Cyclomatic complexity counts every branch the same way. Cognitive complexity
penalizes nesting and rewards extraction. A function with ten sequential
guard clauses scores 10 cyclomatic but only 10 cognitive — both still trip
the gate, but cognitive correlates better with the time a human takes to
understand the function. A function with one triply-nested `if` scores 4
cyclomatic but 6 cognitive, flagging the harder-to-read version.

## Common ways to bring the score down

- **Early returns.** Guard clauses at the top of the function flatten the
  rest.
- **Extract helpers.** Pull nested loops or condition trees into named
  functions. Each call costs 0.
- **Replace long `if`/`elif` ladders with dispatch.** A dict mapping keys to
  handlers, or polymorphism, replaces N branches with one lookup.
- **Name boolean predicates.** Replace
  `if user.is_active and not user.banned and user.verified:` with
  `if user.can_post():`.
- **Narrow `try` / `except`.** Wrap only the line that can raise, not the
  whole function body.
- **Invert conditionals.** `if not x: continue` flattens what would otherwise
  be a nested `if x: ...` block.

For the scoring rules in detail, see Campbell's paper *Cognitive Complexity:
A new way of measuring understandability* (SonarSource, 2018).
