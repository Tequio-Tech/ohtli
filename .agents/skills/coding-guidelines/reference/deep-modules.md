# Deep Modules

A *module* is any unit of code with an interface and an implementation: a
function, a class, a Python module, a package. The principle from John
Ousterhout's *A Philosophy of Software Design* is that good modules are
**deep** — their interface is small relative to the work they do.

## Depth as a ratio

```
depth = functionality / interface size
```

A module is deep when callers see a small surface (few parameters, few public
methods, few exceptions to handle) but the implementation behind it does
substantial work. Unix file I/O is the canonical example: `open`, `read`,
`write`, `close`, `lseek` give five entry points to a subsystem that handles
buffering, permissions, journaling, and device drivers.

A module is **shallow** when its interface is nearly as wide as the work it
performs. The classic anti-patterns:

- **Pass-through wrappers**: a method that does nothing but forward to another
  module, often with renamed arguments.
- **Configuration sprawl**: required parameters that callers always set the
  same way, exposing internal knobs that should be defaults.
- **Classitis**: splitting a small operation into multiple tiny classes
  (`Reader`, `ReaderConfig`, `ReaderFactory`, `ReaderAdapter`) so that callers
  must orchestrate them by hand.
- **Getters and setters**: exposing internal fields one at a time, so the
  caller reconstructs logic the class should own.

Shallow modules increase total complexity because every interface is itself a
thing the reader must learn. Two shallow modules cost more to understand than
one deep module that covers the same work.

## Applying it in Python

- **Module-level functions are first-class.** Python lets you ship behavior as
  free functions in a module; you do not need a class for everything. Use a
  class only when you have mutable state, a resource lifetime to manage
  (`__enter__` / `__exit__`), or a clear set of operations that share data.
- **One thick function beats five thin ones** when the thin ones are only
  called from each other. Inline until the parts have independent reuse.
- **Hide library quirks.** If a caller has to import three names from
  `pandas` to use your function, fold the orchestration inside.
- **Use dataclasses for data and free functions for behavior** when the
  behavior is small. Avoid attaching every operation to the class as a method.
- **Default aggressively.** Optional arguments with sensible defaults shrink
  the apparent interface. Required arguments are part of the cognitive load.
- **Errors are part of the interface.** Raise specific exceptions for cases
  the caller can react to; let unexpected internal failures bubble. Do not
  re-expose every internal exception type — that is interface surface.
- **Dunder methods deepen.** Implementing `__iter__`, `__len__`, `__eq__`
  routes callers through Python's standard protocols instead of your custom
  methods, shrinking the surface they must learn.

## Symptom checklist

If you see any of these, the module is probably too shallow:

- A class with only `__init__` and one other method.
- A method whose body is one line, and that line is a call to another method.
- A public function with more than six parameters and no `*` separator hiding
  optionals.
- Three classes that always appear together at every call site.
- Documentation that has to explain "first do X, then Y, then Z" for what
  should be one operation.
