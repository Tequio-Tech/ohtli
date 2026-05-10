# Quarto Configuration

> **Note:** The contents of this file are just examples. Agents and users are not expected to enforce these examples. Only the rules or expectations set up in `AGENTS.md` should be enforced.

This file covers the initial project structure, `_quarto.yml` configuration, and navigation options for the Quarto blog.

## Project Structure

Running `quarto create project blog blog/` generates the following files:

| File | Purpose |
|------|---------|
| `_quarto.yml` | Site config (title, navbar, theme, RSS metadata) |
| `index.qmd` | Listing page (home) |
| `about.qmd` | Author/about page |
| `posts/` | Blog post directory |
| `posts/_metadata.yml` | Shared post options (e.g. `freeze: true`) |
| `styles.css` | Custom CSS |

## `_quarto.yml` Skeleton

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

### Top Navbar

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

### Side Navigation

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
