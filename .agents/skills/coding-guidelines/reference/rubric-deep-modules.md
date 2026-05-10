# Rubric: Deep Modules

Use this when reviewing a Python module, class, or public function. Each item
is a yes/no. Two or more "no" answers means the module is likely shallow and
should be reworked.

## Interface

1. **Small surface** — Does the public API have ~6 or fewer entry points
   (functions, methods, exported names)? If higher, can related ones collapse
   into one richer call?
2. **Minimal required parameters** — Does each public function have ~4 or
   fewer required parameters? Optional, defaulted parameters do not count.
3. **No leaked internals** — Can a caller use this module without importing
   anything from its `_private` modules, and without knowing the names of
   internal helper classes?

## Implementation

4. **Substantive body** — Does each public function do meaningful work
   (real branching, transformation, I/O), not just forward to one other call?
5. **Class is justified** — If this is a class, does it (a) hold mutable
   state across calls, (b) manage a resource lifetime, or (c) implement a
   Python protocol (iterator, context manager, mapping)? If none, prefer
   module-level functions.
6. **One level of abstraction per function** — Does the body stay at one
   level (orchestration **or** detail, not both)?

## Errors and configuration

7. **Specific exceptions** — Are raised exceptions ones the caller can
   reasonably catch and act on? Library-internal exceptions should be
   wrapped or allowed to bubble, not re-exposed.
8. **No dead knobs** — Is every public configuration option actually varied
   by at least two callers? Unused knobs are interface debt.

## Naming

9. **Names describe intent** — Do public names describe *what* the module
   does for the caller (`fetch_invoices`, `Cache`), not *how* it works
   (`InvoiceFetcherAdapterImpl`, `LRUCacheBackedDict`)?

## Score

- 9/9 yes — ship it.
- 7–8 yes — note the weak spots in the PR.
- 6 or fewer yes — refactor before merging.
