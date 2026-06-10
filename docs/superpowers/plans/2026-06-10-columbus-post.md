# columbus-post Skill Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a `columbus-post` skill that converts cogitate-routed in-box `.qmd` files into properly formatted columbus blog posts with stripped front matter, auto-converted "we" voice, and correct subdirectory routing.

**Architecture:** Single skill file at `/home/gramps/.claude/commands/columbus-post.md`. The skill is pure markdown instructions — Claude interprets and executes them. No external scripts. Region routing derives from the filename prefix; front matter is stripped to 6 fields; voice is rewritten in-place.

**Tech Stack:** Claude Code skill (markdown), Bash, Docker exec for Quarto render

---

### Task 1: Write the skill file

**Files:**
- Create: `/home/gramps/.claude/commands/columbus-post.md`

- [ ] **Step 1: Write the skill file with the full content below**

Write `/home/gramps/.claude/commands/columbus-post.md` with this exact content:

````markdown
# Columbus Post

Convert a cogitate-routed `.qmd` from `columbus/in-box/` into a properly formatted columbus blog post.

## When to Use

When a cogitate post has been routed to `columbus/in-box/` and needs to be published to the columbus site.

**Argument:** filename only, e.g. `/columbus-post florence-final-day-uffizi-accademia-strozzi.qmd`

## Destination Routing

Subdirectory is determined by filename prefix:

| Prefix | Destination |
|--------|-------------|
| `florence-*` | `posts/florence/` |
| `naples-*` | `posts/naples/` |
| `puglia-*` | `posts/puglia/` |

If the prefix does not match, report: `Unknown region prefix in filename — expected florence-, naples-, or puglia-` and stop.

## Front Matter Target

Strip all cogitate-specific fields. The output front matter must contain exactly these 6 fields:

```yaml
---
title: "..."
subtitle: "..."
date: "YYYY-MM-DD"
date-modified: last-modified
categories: [tag1, tag2]
description: "..."
---
```

- Remove: `author`, `execute`, `format`, `other-links`, `location`, `source_itinerary`, `status`, and any other non-target fields
- Remove `columbus` from the categories list
- Keep all other category tags

## Voice Conversion

Rewrite the post body to first-person plural ("we") voice:

- Replace third-person or singular-reflective constructions with "we" equivalents
- "The day began…" → "We began…"
- "The morning…" / passive constructions → active "we" constructions
- Apply silently — the user will edit after

## Process

### Step 1: Read the source file

Read `in-box/<filename>` from the project root `/home/gramps/rstudio/quarto/columbus/`.

If the file does not exist, report `File not found: in-box/<filename>` and stop.

### Step 2: Determine destination

Match the filename prefix to the routing table above. Derive `[region]` and the full destination path `posts/[region]/<filename>`.

### Step 3: Transform front matter and body

1. Strip front matter to the 6-field target (title, subtitle, date, date-modified, categories, description)
2. Remove `columbus` from categories
3. Rewrite body content in "we" voice

### Step 4: Write the output file

Write the transformed content to `/home/gramps/rstudio/quarto/columbus/posts/[region]/<filename>`.

### Step 5: Render to verify

```bash
docker exec --user rstudio rstudio quarto render \
  /home/rstudio/Quarto/columbus/posts/[region]/<filename>
```

Fix any YAML or Quarto errors before committing.

### Step 6: Commit

```bash
git -C /home/gramps/rstudio/quarto/columbus \
  add posts/[region]/<filename> && \
git -C /home/gramps/rstudio/quarto/columbus \
  commit -m "Add [title] post"
```

### Step 7: Report back

Tell the user the post path and that it rendered cleanly.

## Environment Notes

- Project root: `/home/gramps/rstudio/quarto/columbus/`
- Container path mapping: `/home/gramps/rstudio/quarto/` → `/home/rstudio/Quarto/`
- Always use `--user rstudio` in `docker exec`
- Never use `sudo chown/chmod` in the rstudio tree
- `_site/` is gitignored — never commit rendered HTML
````

- [ ] **Step 2: Confirm the file exists**

```bash
ls -la /home/gramps/.claude/commands/columbus-post.md
```

Expected: file present, non-zero size.

- [ ] **Step 3: Commit the skill file**

```bash
git -C /home/gramps/rstudio/quarto/columbus \
  add docs/superpowers/plans/2026-06-10-columbus-post.md && \
git -C /home/gramps/rstudio/quarto/columbus \
  commit -m "Add columbus-post implementation plan"
```

---

### Task 2: Smoke-test with the waiting in-box file

**Files:**
- Read: `/home/gramps/rstudio/quarto/columbus/in-box/florence-final-day-uffizi-accademia-strozzi.qmd`
- Create: `/home/gramps/rstudio/quarto/columbus/posts/florence/florence-final-day-uffizi-accademia-strozzi.qmd`

- [ ] **Step 1: Invoke the new skill**

Run `/columbus-post florence-final-day-uffizi-accademia-strozzi.qmd`

- [ ] **Step 2: Verify front matter is correct**

Read the output file and confirm:
- Exactly 6 front matter fields: `title`, `subtitle`, `date`, `date-modified`, `categories`, `description`
- No `author`, `execute`, `format`, `other-links`, or cogitate-specific fields present
- `columbus` is absent from categories
- `date-modified: last-modified` is present

- [ ] **Step 3: Verify voice conversion**

Read the body and confirm:
- No third-person constructions remain ("the day began", "the morning was", etc.)
- "We" voice is used throughout

- [ ] **Step 4: Verify render succeeded**

Confirm the skill reported a clean render (no LaTeX or YAML errors).

- [ ] **Step 5: Verify commit**

```bash
git -C /home/gramps/rstudio/quarto/columbus log --oneline -3
```

Expected: top commit adds the florence post.
