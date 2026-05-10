# Deployment

The Quarto blog at `blog/` is deployed to Cloudflare Pages.

## How it works

Cloudflare Pages is connected to the GitHub repo and watches `main` for
production deploys; PR branches get preview URLs automatically. Cloudflare's
default build image does not include the Quarto CLI, so we render inside the
build step using `scripts/cf-pages-build.sh`, which downloads a pinned Quarto
release and runs `quarto render blog`. Output lands in `blog/_site/`, matching
`output-dir` in `blog/_quarto.yml`.

## Cloudflare project settings

Project name: **`tequio-tech-blog`**.

Settings → Builds & deployments:

| Setting                | Value                              |
| ---------------------- | ---------------------------------- |
| Production branch      | `main`                             |
| Build command          | `bash scripts/cf-pages-build.sh`   |
| Build output directory | `blog/_site`                       |
| Root directory         | `/`                                |

## Bumping Quarto

Set `QUARTO_VERSION` as an environment variable in the Cloudflare Pages
dashboard (Settings → Environment variables). Default in the script is the
fallback when the variable is unset.

## Local preview

```sh
quarto preview blog
```

Requires a local Quarto install (the build script's tarball is Linux-only).
