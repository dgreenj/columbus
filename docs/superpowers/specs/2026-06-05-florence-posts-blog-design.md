# Florence Posts — Blog Section Setup

**Date:** 2026-06-05

## Goal

Add two pre-written Florence reference posts to the columbus site's existing blog structure, and rename the listing page to better reflect the mixed planning/reference content.

## Source Files

- `in-box/florence-bookstores.qmd`
- `in-box/florence-stationery.qmd`

Both originated in cogitate and carry cogitate-specific front matter that must be stripped before use here.

## File Placement

Both posts go into `posts/florence/`, matching the existing regional subfolder structure:

```
posts/
  florence/
    florence-bookstores.qmd
    florence-stationery.qmd
  naples/
  puglia/
  _metadata.yml
```

## Front Matter

Strip cogitate-specific fields from each post. Retain:

```yaml
title: "..."
subtitle: "..."
date: "2026-06-05"
date-modified: last-modified
categories: [florence, books, shopping]      # bookstores post
# categories: [florence, stationery, shopping] # stationery post
description: "..."
```

Drop: `author` (handled by `posts/_metadata.yml`), `execute`, `format` (site `_quarto.yml` handles HTML), `other-links`.

## Listing Page (`posts.qmd`)

Rename title from `"Things to See & Do"` to `"Notes & Guides"`. No other changes — listing already uses `contents: posts` which picks up subdirectories.

## `_quarto.yml`

No structural changes needed. Update one label:

- Sidebar "Additional Resources" section: rename `"All Blog Posts"` → `"Notes & Guides"`

## `posts/_metadata.yml`

No changes. Already provides: `freeze: true`, `author: 'Dan Green'`, `toc: true`, `toc-depth: 3`, `page-layout: article`.

## Out of Scope

- Navbar "Blog" label — left as-is
- Any changes to naples/ or puglia/ subfolders
- Re-rendering the full site (render the two new posts only)
