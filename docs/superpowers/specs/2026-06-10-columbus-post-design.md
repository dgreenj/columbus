# columbus-post Skill Design

**Date:** 2026-06-10 **Status:** Approved

## Purpose

A Claude Code skill that converts cogitate-routed `.qmd` files from `columbus/in-box/` into properly formatted columbus blog posts in `posts/florence/`, `posts/naples/`, or `posts/puglia/`.

Cogitate posts are routed to `columbus/in-box/` via the `cogitate-route` skill when the post has a `columbus` category. This skill is the second half of that pipeline — it takes the in-box file and produces a final columbus post.

## Invocation

```         
/columbus-post florence-final-day-uffizi-accademia-strozzi.qmd
```

Argument: filename only (not a path). Resolves from `columbus/in-box/`.

## Destination Routing

Subdirectory is determined from the filename prefix:

| Prefix       | Destination       |
|--------------|-------------------|
| `florence-*` | `posts/florence/` |
| `naples-*`   | `posts/naples/`   |
| `puglia-*`   | `posts/puglia/`   |

If the prefix does not match any of the three regions, the skill reports an error and stops.

## Front Matter Transformation

**Strip** all cogitate-specific fields: `author`, `execute`, `format`, `other-links`, `subtitle` (keep if present), and any fields not in the target set.

**Remove** `columbus` from the categories list.

**Target format** (6 fields only):

``` yaml
---
title: "..."
subtitle: "..."
date: "YYYY-MM-DD"
date-modified: last-modified
categories: [tag1, tag2]
description: "..."
---
```

The `_metadata.yml` in `posts/` supplies `author`, `toc`, `freeze`, `title-block-banner`, `page-layout`, and `lightbox` — these must NOT appear in the post file.

## Voice Conversion

Auto-convert cogitate's reflective singular/third-person voice to first-person plural ("we"):

-   Singular reflective constructions → "we" equivalents
-   "The day began…" → "We began…"
-   "The morning…" / passive constructions → active "we" constructions
-   Applied silently; user edits after the fact

## Output

-   File written to `posts/[region]/filename.qmd` (same filename as in-box, no subfolder)
-   No `images/` scaffold — photos added manually

## Steps

1.  Read `in-box/<filename>`; error and stop if not found
2.  Determine destination from filename prefix; error and stop if no match
3.  Strip front matter to 6-field target; remove `columbus` from categories
4.  Rewrite content voice to "we"
5.  Write to `posts/[region]/filename.qmd`
6.  Render: `docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/posts/[region]/filename.qmd`
7.  Fix any render errors before committing
8.  Commit: `git add posts/[region]/filename.qmd && git commit -m "Add [title] post"`
9.  Report: post path and that it rendered cleanly

## Environment

-   Project root: `/home/gramps/rstudio/quarto/columbus/`
-   Container path: `/home/rstudio/Quarto/columbus/`
-   Always use `--user rstudio` in `docker exec`
-   Never use `sudo chown/chmod` in the rstudio tree
-   `_site/` is gitignored — never commit rendered HTML
