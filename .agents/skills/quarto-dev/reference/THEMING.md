# Theming

> **Note:** The contents of this file are just examples. Agents and users are not expected to enforce these examples. Only the rules or expectations set up in `AGENTS.md` should be enforced.

## Bootswatch themes

Set in `_quarto.yml`:

```yaml
format:
  html:
    theme: cosmo   # default
```

Available themes: `default`, `cerulean`, `cosmo`, `cyborg`, `darkly`, `flatly`,
`journal`, `litera`, `lumen`, `lux`, `materia`, `minty`, `morph`, `pulse`,
`quartz`, `sandstone`, `simplex`, `sketchy`, `slate`, `solar`, `spacelab`,
`superhero`, `united`, `vapor`, `yeti`, `zephyr`

## Custom SCSS

Extend a base theme with a custom file:

```yaml
theme:
  - cosmo
  - custom.scss
```

`custom.scss` structure:

```scss
/*-- scss:defaults --*/
$h2-font-size: 1.6rem !default;
$headings-font-weight: 500 !default;

/*-- scss:rules --*/
h1, h2, h3, h4, h5, h6 {
  text-shadow: -1px -1px 0 rgba(0, 0, 0, .3);
}
```

Variables go in `scss:defaults`; CSS rules go in `scss:rules`.

## Dark mode

```yaml
theme:
  light: flatly
  dark: darkly
```

Quarto adds a light/dark toggle automatically (top-right corner). Browser
`localStorage` persists the user's choice.

To default to the user's OS preference:

```yaml
format:
  html:
    respect-user-color-scheme: true
```

Without that flag, the first entry in `theme` determines the default appearance.

### Mode-specific content

```markdown
::: {.light-content}
Shown only in light mode.
:::

::: {.dark-content}
Shown only in dark mode.
:::
```

Provide both blocks at the same location to avoid layout shifts on toggle.

## Key Sass variables

### Colors

| Variable | Purpose |
|----------|---------|
| `$body-bg` | Page background |
| `$body-color` | Page text |
| `$link-color` | Link color |
| `$input-bg` | HTML input background |
| `$popover-bg` | Citation preview background |

### Fonts

| Variable | Purpose |
|----------|---------|
| `$font-family-sans-serif` | Body font stack |
| `$font-family-monospace` | Monospace font stack |
| `$font-size-root` | Base font size |
| `$toc-font-size` | TOC text size |
| `$h1-font-size` … `$h5-font-size` | Heading sizes |

### Navigation

| Variable | Purpose |
|----------|---------|
| `$navbar-bg` | Navbar background (defaults to `$primary`) |
| `$navbar-fg` | Navbar text/links (auto-computed if unset) |
| `$navbar-hl` | Navbar active link highlight |
| `$sidebar-bg` | Sidebar background |
| `$sidebar-fg` | Sidebar text |
| `$sidebar-hl` | Sidebar active link |
| `$footer-bg` | Footer background |
| `$footer-fg` | Footer text |

### Code blocks

| Variable | Purpose |
|----------|---------|
| `$code-block-bg` | Block background (derived from `progress-bg` by default) |
| `$code-block-bg-alpha` | Transparency adjustment (default `-0.35`) |
| `$code-block-border-left` | Left border color; set to enable |
| `$code-block-border-left-size` | Border thickness (default `3px`) |
| `$code-bg` | Inline code background |
| `$code-color` | Inline code text |

### Callouts

| Variable | Purpose |
|----------|---------|
| `$callout-border-width` | Left border width (default `5px`) |
| `$callout-color-note` | Note callout color (default `$blue`) |
| `$callout-color-tip` | Tip callout color (default `$green`) |
| `$callout-color-warning` | Warning callout color (default `$yellow`) |
| `$callout-color-important` | Important callout color (default `$red`) |

Full Bootstrap variable reference: https://github.com/twbs/bootstrap/blob/main/scss/_variables.scss
