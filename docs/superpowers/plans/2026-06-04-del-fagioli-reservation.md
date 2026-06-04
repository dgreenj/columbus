# Del Fagioli Reservation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Record the confirmed Del Fagioli reservation (June 9, 2 people, 7:30 PM) across the day-5 itinerary, the restaurants reference page, and the June calendar.

**Architecture:** Three targeted content edits to existing `.qmd` files — no new files, no rendering logic changes.

**Tech Stack:** Quarto Markdown, HTML (calendar cell)

---

### Task 1: Update day-5 itinerary

**Files:**
- Modify: `daily_itineraries/day-05-2026-06-09-florence.qmd:75,92-95`

- [ ] **Step 1: Update the callout confirmation line (line 75)**

Change:
```
**Michelin Bib Gourmand.** Reservations required — confirm this is your booked night.
```
To:
```
**Michelin Bib Gourmand.** Reservation confirmed — 2 people, 7:30 PM.
```

- [ ] **Step 2: Add confirmed checklist item**

After line 93 (`- [ ] Booking ref 1391099919 saved to phone`), add:
```
- [x] Del Fagioli reservation confirmed — 2 people, 7:30 PM
```

- [ ] **Step 3: Commit**

```bash
cd /home/gramps/rstudio/quarto/columbus
git add daily_itineraries/day-05-2026-06-09-florence.qmd
git commit -m "Confirm Del Fagioli reservation on day-5 itinerary"
```

---

### Task 2: Add Del Fagioli to restaurants page

**Files:**
- Modify: `research/restaurants.qmd` — insert after line 38 (after Trattoria Za Za block, before `### Mid-Range Favorites`)

- [ ] **Step 1: Insert Del Fagioli entry**

After the Trattoria Za Za block (line 38, which ends with `- Florentine steak (bistecca)`), insert before `### Mid-Range Favorites`:

```markdown
**Del Fagioli** (Santa Croce — Corso dei Tintori 47R)
- Michelin Bib Gourmand — historic trattoria, open kitchen
- Bistecca alla Fiorentina (shared) or pici with aglione sauce
- House cantucci to finish
- Dinner hours 7:30–10:30 PM
- ✅ Reserved: June 9, 2 people, 7:30 PM
```

- [ ] **Step 2: Commit**

```bash
git add research/restaurants.qmd
git commit -m "Add confirmed Del Fagioli reservation to restaurants page"
```

---

### Task 3: Update June calendar

**Files:**
- Modify: `research/june-calendar.qmd:145,263`

- [ ] **Step 1: Add dinner to June 9 calendar cell (line 145)**

Change:
```html
    <span class="day-detail">Private Uffizi + Accademia + David<br>Tour 9:00am sharp<br>Via dei Castellani 14</span>
```
To:
```html
    <span class="day-detail">Private Uffizi + Accademia + David<br>Tour 9:00am sharp<br>Via dei Castellani 14<br>🍽 Del Fagioli 7:30pm</span>
```

- [ ] **Step 2: Add row to "Reservations in Hand" table (after line 263)**

After the Viator row:
```
| Viator — Private Uffizi + Accademia    | 1391099919     | Jun 9     |
```
Add:
```
| Del Fagioli dinner                     | Confirmed      | Jun 9     |
```

- [ ] **Step 3: Commit**

```bash
git add research/june-calendar.qmd
git commit -m "Add Del Fagioli reservation to June 9 calendar cell and reservations table"
```

---

### Task 4: Render and publish

- [ ] **Step 1: Render the three changed pages**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/daily_itineraries/day-05-2026-06-09-florence.qmd
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/research/restaurants.qmd
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/research/june-calendar.qmd
```

Expected: no errors, output created in `_site/` for each.

- [ ] **Step 2: Verify June 9 cell shows dinner**

```bash
grep -A2 "Del Fagioli" /home/gramps/rstudio/quarto/columbus/_site/research/june-calendar.html | head -5
```

Expected: contains `Del Fagioli 7:30pm`.

- [ ] **Step 3: Render full site and push**

Run the `publish` skill to render the full columbus site and push to git.
