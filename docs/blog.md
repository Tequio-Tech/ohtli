# Blog

The Tequio Tech blog lives under [`blog/`](../blog) and is built with
[Quarto](https://quarto.org). It uses the Jade Obsidian design system
(see [`.agents/skills/design/`](../.agents/skills/design)) on top of the
`cosmo` (light) and `darkly` (dark) Bootswatch themes.

## Prerequisites

Install Quarto once per machine:

```sh
brew install quarto
quarto --version   # tested with 1.9.37
```

No Python or `uv` setup is required to build the blog itself, but the
repo-wide checks (`uv run ruff check .`, `uv run ruff format --check .`,
`uv run flake8 .`) should still pass after any change.

## Local preview

Live-reload server (open the printed URL in a browser):

```sh
quarto preview blog/
```

One-shot render to `blog/_site/`:

```sh
quarto render blog/
```

`blog/_site/` and `blog/.quarto/` are gitignored.

## Project layout

```
blog/
  _quarto.yml              site config, navbar, theme wiring
  theme.scss               Jade Obsidian overrides + .tt-hero card
  index.qmd                landing hero (no listing)
  blog.qmd                 single-page post listing
  about.qmd                about page with social links
  posts/
    _metadata.yml          shared post defaults (author, freeze)
    <slug>/index.qmd       one directory per post
```

## Authoring a new post

1. Create a directory under `blog/posts/<slug>/` and an `index.qmd` inside.
2. Use this frontmatter (dates must be explicit, not `today`):

   ```yaml
   ---
   title: "Post Title"
   description: "One-sentence summary shown in listings."
   author: "Your Name"
   date: "2026-05-10"
   ---
   ```

3. Write the post body in Markdown below the frontmatter.
4. Run `quarto preview blog/` and confirm the post appears at the top of
   `/blog.html` (sorted by date descending).

## Theming

Design tokens (jade `#1A6B5A`, marigold `#D17A00`, Outfit + Space Grotesk
fonts) are declared in `blog/theme.scss`. Background colors are left to
the base Bootswatch theme so the dark mode toggle keeps its dark surfaces;
mode-specific overrides use the `[data-bs-theme="light|dark"]` selector.

For deeper Quarto theming guidance, see the `quarto-dev` skill at
[`.agents/skills/quarto-dev/`](../.agents/skills/quarto-dev).
