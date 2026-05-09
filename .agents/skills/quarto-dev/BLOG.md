# Blog Posts, Freeze, Drafts, RSS

## Post structure

Each post is a directory under `posts/`:

```
posts/
  my-post-slug/
    index.qmd
    image.png   # optional thumbnail
```

Minimal post frontmatter:

```yaml
---
title: "Post Title"
description: "One-sentence summary shown in listings."
author: "Your Name"
date: "2026-01-15"
date-modified: "2026-01-20"  # optional; preserves original pub date
categories:
  - news
  - code
---
```

Do not use `today` or `last-modified` as dynamic dates — they break listing sort order on each render.

## Listing page (index.qmd)

```yaml
---
title: "My Blog"
listing:
  contents: posts
  sort: "date desc"
  type: default       # or: grid, table
  categories: true
  feed: true
---
```

Categories appear in the right margin and are read from each post's `categories` frontmatter.

## Drafts

```yaml
draft: true
```

Draft posts:
- Visible during `quarto preview`
- Excluded from rendered output, listings, sitemap, and search
- To publish: remove `draft: true` and re-render

## Freeze

Add to `posts/_metadata.yml` to apply to all posts:

```yaml
# options apply to all posts in this folder
freeze: true
```

Freeze saves Jupyter/Knitr output alongside the source. When the site renders,
frozen posts skip re-execution. Re-render a single post explicitly to update:

```sh
quarto render blog/posts/my-post-slug/index.qmd
```

Use freeze when:
- Post uses packages that may break across time/environments
- Multiple contributors don't share the same compute environment
- Accumulated render time is slowing full-site builds

## RSS feed

Requirements in `_quarto.yml`:
- `website.site-url` must be set
- `website.description` must be set
- `feed: true` on the listing page

Category-specific feeds:

```yaml
listing:
  feed:
    categories: [news, code]
```

Generates `index.xml`, `index-news.xml`, `index-code.xml`.

Navbar RSS icon:

```yaml
navbar:
  right:
    - icon: rss
      href: index.xml
```

## About page

```yaml
---
title: "About"
image: profile.jpg
about:
  template: jolla    # jolla, trestles, solana, marquee, broadside
  links:
    - icon: bluesky
      text: Bluesky
      href: https://bsky.app
    - icon: github
      text: GitHub
      href: https://github.com/yourhandle
---

## About this blog

Body text here.
```
