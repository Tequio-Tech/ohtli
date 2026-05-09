---
name: quarto-dev
description: Use when working on the Quarto blog under blog/. Covers project
  initialization, navigation config, site preview, and when to consult BLOG.md
  (posts/RSS/freeze) or THEMING.md (Sass/dark mode/Bootswatch).
---

# Quarto Dev

Quarto blog lives under `blog/`. This skill covers initializing the project,
configuring navigation, and running the local preview server.

For post authoring, freeze, drafts, and RSS: read [BLOG.md](BLOG.md).
For theming, dark mode, and Sass variables: read [THEMING.md](THEMING.md).

## Project init

```sh
quarto create project blog blog/
```

Generated files:

| File | Purpose |
|------|---------|
| `_quarto.yml` | Site config (title, navbar, theme, RSS metadata) |
| `index.qmd` | Listing page (home) |
| `about.qmd` | Author/about page |
| `posts/` | Blog post directory |
| `posts/_metadata.yml` | Shared post options (e.g. `freeze: true`) |
| `styles.css` | Custom CSS |

## Preview

```sh
quarto preview blog/
```

Live-reloads on save. Opens in browser automatically.

## `_quarto.yml` skeleton

```yaml
project:
  type: website

website:
  title: "My Blog"
  site-url: https://example.com
  description: "A brief description for RSS feeds"
  navbar:
    right:
      - icon: rss
        href: index.xml
  theme: cosmo   # or: theme: {light: flatly, dark: darkly}

format:
  html:
    toc: true
```

`site-url` and `description` are required for RSS feed generation.

## Navigation

### Top navbar

Key options under `website.navbar`:

| Option | Notes |
|--------|-------|
| `background` | `primary`, `secondary`, `dark`, or hex |
| `search: true` | Adds search box |
| `left` / `right` | Lists of nav items (`href`, `text`, `icon`, `menu`) |
| `pinned: true` | Always visible; default uses headroom.js (hides on scroll down) |
| `tools` | Icon links (GitHub, Bluesky, RSS, etc.) using Bootstrap icon names |

Nav item with dropdown:

```yaml
left:
  - text: "More"
    menu:
      - talks.qmd
      - about.qmd
```

### Side navigation

```yaml
website:
  sidebar:
    style: "docked"   # or "floating"
    search: true
    contents:
      - text: "Introduction"
        href: introduction.qmd
      - section: "Basics"
        contents:
          - index.qmd
          - basics.qmd
```
