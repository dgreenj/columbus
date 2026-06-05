# Florence Posts — Blog Section Setup Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Place two Florence reference posts into `posts/florence/` with clean front matter, and rename the listing page from "Things to See & Do" to "Notes & Guides".

**Architecture:** The blog infrastructure already exists (`posts/`, `posts.qmd` listing, navbar + sidebar links). This plan copies two files from `in-box/`, rewrites their front matter to columbus standards, and updates two labels in `posts.qmd` and `_quarto.yml`.

**Tech Stack:** Quarto website project; Docker container `rstudio` for rendering (path `/home/rstudio/Quarto/columbus/`).

---

### Task 1: Create `posts/florence/florence-bookstores.qmd`

**Files:**
- Create: `posts/florence/florence-bookstores.qmd`

- [ ] **Step 1: Write the file**

Create `/home/gramps/rstudio/quarto/columbus/posts/florence/florence-bookstores.qmd` with this exact content:

```markdown
---
title: "Florence Bookstores Worth Finding"
subtitle: "A short list for the trip — from English titles to spectacular spaces"
date: "2026-06-05"
date-modified: last-modified
categories: [florence, books, shopping]
description: "A quick-reference guide to Florence bookstores worth visiting, organized by English titles, atmosphere, and rare books."
---

We're staying near the Duomo and Piazza della Signoria next week, and I did a little research on Florence bookstores worth making time for. Given my reading tastes — Conrad, McCarthy, Mantel, O'Brian, historical fiction, classics — there's a real chance I lose a couple of hours in at least one of these places.

## English-Language Books

**Paperback Exchange**
The best-known English-language bookstore in Florence. Large selection of new and used titles, plus a book-exchange program. Only a few minutes from the Duomo, and consistently recommended by travelers and expats as the go-to spot for English books.

**laFeltrinelli Book Store**
Big mainstream bookstore with a solid English-language section. Easy walk from both the Duomo and the train station.

**laFeltrinelli (Santa Maria Novella station)**
The station branch is handy if you arrive by train and want something to read before you've even checked in.

## Best Atmosphere

**Todo Modo**
Independent bookstore and café/wine bar — one of the more interesting literary spaces in the city. The kind of place you sit down with a book and suddenly it's been an hour.

**Giunti Odeon**
Built into a restored movie theater near Piazza Strozzi. Spectacular space. Worth a look even if you're not buying anything.

**La Cité**
Bookshop-café in the Oltrarno with readings, events, coffee, and wine. Apparently a local favorite rather than a tourist stop.

## Rare & Antique Books

**Libreria Gozzini**
Historic antiquarian bookstore operating out of a Florentine palace. On the list if we have a slow afternoon.

**Libreria Giorni**
Small specialist rare-book shop near the Duomo.

## If We Only Have Time for Two

1. **Paperback Exchange** — for English books worth actually buying and carrying home.
2. **Todo Modo** (or Giunti Odeon) — for the uniquely Florentine bookstore experience.
```

- [ ] **Step 2: Render to verify**

```bash
docker exec --user rstudio rstudio quarto render \
  /home/rstudio/Quarto/columbus/posts/florence/florence-bookstores.qmd
```

Expected: no errors, output line confirming HTML rendered.

- [ ] **Step 3: Commit**

```bash
git -C /home/gramps/rstudio/quarto/columbus \
  add posts/florence/florence-bookstores.qmd
git -C /home/gramps/rstudio/quarto/columbus \
  commit -m "Add Florence bookstores post to blog"
```

---

### Task 2: Create `posts/florence/florence-stationery.qmd`

**Files:**
- Create: `posts/florence/florence-stationery.qmd`

- [ ] **Step 1: Write the file**

Create `/home/gramps/rstudio/quarto/columbus/posts/florence/florence-stationery.qmd` with this exact content:

```markdown
---
title: "Florence Stationery Shops Worth Finding"
subtitle: "Marbled paper, fountain pens, and bookbinding near the Duomo"
date: "2026-06-05"
date-modified: last-modified
categories: [florence, stationery, shopping]
description: "A walking guide to Florence's best stationery, marbled paper, and fountain pen shops, with a suggested route from the Duomo across the Ponte Vecchio."
---

Florence is apparently one of the best cities in the world for stationery — not office supplies, but the real stuff: hand-marbled paper, leather-bound journals, fountain pens, bookbinding workshops that have been doing it the same way for centuries. We're staying near the Duomo next week, so I did some research on where to go. There's a natural walking route that takes you from the center across the Ponte Vecchio, which is convenient.

## Closest to the Duomo / Piazza della Signoria

**Il Papiro**
The classic Florence stationery stop. Famous for hand-marbled paper, journals, and traditional Florentine craftsmanship. This is the one everyone mentions first.

**Visconti Flagship Store**
Florence's renowned fountain pen maker. Worth browsing even if you're not in the market for a pen.

**Eredi Paperone Bottega d'Arte**
Near Piazza della Signoria. Beautiful papers, notebooks, and artistic paper goods.

**Moleskine Store — via degli Speziali**
Convenient if you want a travel journal without venturing far from the center. Less artisan, more practical.

## For Handmade Florentine Craftsmanship

**Riccardo Luci Marbled Paper**
Family bookbinding and marbled-paper workshop where many items are still handmade using traditional techniques. This one sounds like it could eat an hour easily.

**Alberto Cozzi Rilegatore Firenze**
One of Florence's classic bookbinding and paper ateliers. Known for leather-bound journals and marbled papers.

**Il Papiro (Oltrarno location)**
The Oltrarno branch is worth a stop if you're crossing the river toward the Pitti Palace anyway.

## For Fountain Pens

**Casa della Stilografica SRL**
One of Italy's best pen shops — fountain pens, inks, notebooks, accessories. Pen enthusiasts apparently make special trips here. I may be one of them.

## Suggested Walking Route

Starting at the Duomo:

1. **Il Papiro**
2. Walk to Piazza della Signoria → **Eredi Paperone Bottega d'Arte**
3. Continue to **Visconti Flagship Store**
4. Cross the Ponte Vecchio and finish at **Riccardo Luci Marbled Paper** and **Alberto Cozzi Rilegatore Firenze**

If I had to pick three priorities: Il Papiro, Riccardo Luci, and Casa della Stilografica. Those are the ones most likely to produce something I'll still be using years after the trip.
```

- [ ] **Step 2: Render to verify**

```bash
docker exec --user rstudio rstudio quarto render \
  /home/rstudio/Quarto/columbus/posts/florence/florence-stationery.qmd
```

Expected: no errors, output line confirming HTML rendered.

- [ ] **Step 3: Commit**

```bash
git -C /home/gramps/rstudio/quarto/columbus \
  add posts/florence/florence-stationery.qmd
git -C /home/gramps/rstudio/quarto/columbus \
  commit -m "Add Florence stationery shops post to blog"
```

---

### Task 3: Rename listing page and sidebar label

**Files:**
- Modify: `posts.qmd`
- Modify: `_quarto.yml`

- [ ] **Step 1: Update `posts.qmd` title**

In `/home/gramps/rstudio/quarto/columbus/posts.qmd`, change:

```yaml
title: "Things to See & Do"
```

to:

```yaml
title: "Notes & Guides"
```

Full file after edit:

```yaml
---
title: "Notes & Guides"
listing: 
  contents: posts
  type: grid
  sort: "date desc"
  categories: true
---
```

- [ ] **Step 2: Update sidebar label in `_quarto.yml`**

In `/home/gramps/rstudio/quarto/columbus/_quarto.yml`, find the "Additional Resources" sidebar section and change:

```yaml
- text: "All Blog Posts"
  href: posts.qmd
```

to:

```yaml
- text: "Notes & Guides"
  href: posts.qmd
```

- [ ] **Step 3: Render the listing page to verify both posts appear**

```bash
docker exec --user rstudio rstudio quarto render \
  /home/rstudio/Quarto/columbus/posts.qmd
```

Expected: no errors. The rendered listing should show two cards — "Florence Bookstores Worth Finding" and "Florence Stationery Shops Worth Finding".

- [ ] **Step 4: Commit**

```bash
git -C /home/gramps/rstudio/quarto/columbus \
  add posts.qmd _quarto.yml
git -C /home/gramps/rstudio/quarto/columbus \
  commit -m "Rename blog listing to Notes & Guides"
```
