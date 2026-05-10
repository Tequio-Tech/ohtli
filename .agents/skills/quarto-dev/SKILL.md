---
name: quarto-dev
description: Use when working on the Quarto blog under blog/. Covers project initialization, site preview, and routing to configuration, theming, and authoring reference guides.
---

# Quarto Dev

Skill covering Quarto project initialization, previewing, and configuration
for the blog living under `blog/`.

## Project Operations

Initialize the blog:

```sh
quarto create project blog blog/
```

Run the local preview server (live-reloads on save):

```sh
quarto preview blog/
```

## Reference Material

> **Note:** The files in the `reference/` folder are provided strictly as examples. Neither agents nor the user are expected to enforce these examples. Only the rules or expectations set up in `AGENTS.md` should be enforced.

To keep context small, detailed configuration and authoring guides are split into separate files. Read these on-demand:

- **[CONFIG.md](reference/CONFIG.md)**: Site configuration (`_quarto.yml`), project structure, and navigation setups.
- **[BLOG.md](reference/BLOG.md)**: Post authoring, freeze, drafts, and RSS.
- **[THEMING.md](reference/THEMING.md)**: Theming, dark mode, and Sass variables.
