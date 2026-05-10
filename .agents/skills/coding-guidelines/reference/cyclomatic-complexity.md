# Cyclomatic Complexity

Cyclomatic complexity, defined by Thomas McCabe in 1976, counts the number
of linearly independent paths through a function. The repo enforces it via
ruff's McCabe check (`C90`) with `max-complexity = 10` (see `pyproject.toml`).

## What it counts

Start at 1 (the straight-line path through the function), then add 1 for
each:

- `if`, `elif`
- `for`, `while`
- `except` clause
- `case` arm in a `match` (Python 3.10+)
- boolean operator (`and`, `or`) inside a condition
- `assert`

`else` and the `try` itself do not add — they are part of paths counted
elsewhere.

## What the number means

Cyclomatic complexity is an upper bound on the number of test cases needed
to exercise every branch. A function with cyclomatic complexity 5 needs at
most five test cases to cover all branches. The threshold of 10 is McCabe's
original recommendation: above it, the function tends to be hard to test
exhaustively.

## Limitations

The metric treats every branch as equal. Two functions with cyclomatic 8
read very differently: one with eight sequential guard clauses is easy to
follow; one with three levels of nested `if`s is not. That is why this repo
also enforces the lower **cognitive complexity** threshold (`7`) — see
[cognitive-complexity.md](cognitive-complexity.md).

## When ruff's `C90` fires

The function has too many branches. The fixes are the same as for cognitive
complexity:

- Extract a chunk of the branching into a helper function (each call costs
  1 in McCabe, but the helper itself can stay below the threshold).
- Replace an `if` / `elif` ladder with a dict dispatch or `match`.
- Split the function along a natural boundary (validation vs. execution,
  parsing vs. processing).

If ruff says a function is at 11 and cognitive complexity is happy at 4,
the function is likely a long flat dispatch — replacing it with a dict often
brings both metrics down at once.
