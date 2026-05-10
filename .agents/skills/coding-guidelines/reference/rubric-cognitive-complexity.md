# Rubric: Cognitive Complexity

Use this when writing or reviewing a Python function, before running the
linter. The repo's gate is `max-cognitive-complexity = 7`. Any "yes" below
is a likely cause of breaching it.

## Read the function and ask

1. **Nesting depth ≥ 3?** Three levels of `if` / `for` / `while` / `try`
   inside one another almost always exceed the threshold by themselves.
2. **Repeated condition?** Is the same predicate (`if user.is_admin`) checked
   in two or more places? Lift the check or split the function.
3. **Boolean chain ≥ 3 operators?** Long `and` / `or` runs, especially mixed,
   are hard to read. Extract a named predicate.
4. **`if` / `elif` ladder with more than 3 arms?** Replace with a dict
   dispatch, a `match` statement, or polymorphism.
5. **Loop body longer than ~10 lines?** Extract the body into a named
   function.
6. **Wide `try` block?** If the `try` covers more than the one line that can
   raise, narrow it.
7. **Mixed levels of abstraction?** Does the function alternate between
   high-level orchestration and low-level detail? Split: keep the
   orchestration, extract the detail.
8. **Unnecessary `else` after `return`?** `if x: return ...; else: ...` is
   one nesting level for nothing. Drop the `else`.

## Quick estimation

Walk the function and add:

- **+1** for each `if`, `elif`, `else`, `for`, `while`, `except`, ternary,
  `match` arm, or boolean-operator switch.
- **+depth** for each one nested inside another control structure (1 for
  one-level nesting, 2 for two-level, etc.).

If the running total reaches 7, it will trip the linter. Refactor before the
test suite tells you to.

## Default fixes

| Symptom                          | Fix                                               |
| -------------------------------- | ------------------------------------------------- |
| Nested `if` chain                | Early-return guard clauses                        |
| Long `if` / `elif` dispatch      | Dict of `key -> handler`, or `match`              |
| Long boolean condition           | Named predicate function                          |
| Loop body too large              | Extract loop body into a helper                   |
| Wide `try` / `except`            | Wrap the single risky call only                   |
| Mixed orchestration and detail   | Thin orchestrator + named detail functions        |
