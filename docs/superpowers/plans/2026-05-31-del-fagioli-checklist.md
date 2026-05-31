# Del Fagioli & Checklist Update Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development or superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add Del Fagioli dinner reservation guidance to the Florence itinerary pages and update the pre-departure checklist's Restaurant Reservations section (which is stale — still lists 50 Kalò as the Naples pizza pick and has no specific Florence restaurant).

**Architecture:** Three targeted file edits. No new pages. Pre-departure checklist Restaurant Reservations section is replaced wholesale. Day 5 (preferred night) and Day 4 (backup night) each get a Del Fagioli callout-tip in their evening sections, same pattern as the Naples pizza callouts already on this site.

**Tech Stack:** Quarto markdown, callout blocks (`::: {.callout-tip}`), render via `docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus`

---

## Research: Del Fagioli Confirmed Details

| | |
|---|---|
| **Address** | Corso dei Tintori 47R, 50122 Firenze |
| **Phone** | +39 055 244285 |
| **Hours** | Mon: 12:30–2:30 PM / 7:30–10:30 PM (Tue same — verify when calling) |
| **Reservations** | Call directly — required well in advance (Michelin) |
| **Recognition** | Michelin Bib Gourmand |
| **Known for** | Bistecca alla Fiorentina, pici with aglione, pappa al pomodoro, house cantucci |
| **Character** | Historic landmark, rustic Tuscan trattoria, open kitchen, familial, affordable (€) |

**Call window from Madison:** 8:00–9:30 AM CDT = 3:00–4:30 PM Italy | Call Monday June 1 or Tuesday June 2
**Script:** *"Hello, I'd like to reserve a table for 2 people for [Tuesday June 9 / Monday June 8] at 7:30 PM."*

**Preferred night: June 9 (Tuesday, Day 5)** — Uffizi tour ends at 1 PM, relaxed afternoon before dinner.
**Backup night: June 8 (Monday, Day 4)** — Duomo complex day; Monday confirmed open per Yelp.

---

## File Map

| Action | File | What changes |
|---|---|---|
| **Modify** | `research/pre-departure-checklist.qmd` | Replace Restaurant Reservations section (Florence + Naples) |
| **Modify** | `daily_itineraries/day-05-2026-06-09-florence.qmd` | Replace dinner bullets in Evening section with Del Fagioli callout |
| **Modify** | `daily_itineraries/day-04-2026-06-08-florence.qmd` | Replace "Dinner in Florence" placeholder with Del Fagioli callout |

---

## Task 1: Update `research/pre-departure-checklist.qmd`

**Files:**
- Modify: `research/pre-departure-checklist.qmd`

The current Restaurant Reservations section (lines ~92–105) has outdated Naples content (50 Kalò as the pizza pick) and a generic Florence placeholder. Replace the entire section.

- [ ] **Step 1: Replace the Restaurant Reservations section**

Find this entire block:

```markdown
## Restaurant Reservations

June is busy — reserve ahead for any restaurant worth going to.

### Florence

- [ ] **Bistecca alla fiorentina dinner** — book a proper Florentine steakhouse for one evening (Days 3–6); ask hotel concierge for current best
- [ ] Any other special dinners — ask hotel on arrival for current favorites

### Naples

- [ ] **50 Kalò** (upscale pizza, Via Serapide 1) — reserve in advance for any night
- [ ] Special seafood dinner on Lungomare — consider reserving for evening of Jun 12
```

Replace it with:

```markdown
## Restaurant Reservations

June is busy — reserve ahead for any restaurant worth going to.

### Florence

- [ ] **Del Fagioli** (Corso dei Tintori 47R) — **call +39 055 244285** to reserve; table for 2, prefer **Tuesday June 9** at 7:30 PM (backup: Monday June 8); Michelin Bib Gourmand, classic Tuscan trattoria — bistecca alla fiorentina, pici with aglione, pappa al pomodoro
  - **Call Monday June 1 or Tuesday June 2, 8:00–9:30 AM CDT** (= 3:00–4:30 PM Italy)
  - Say: *"Hello, I'd like to reserve a table for 2 people for Tuesday June 9th at 7:30 PM."*
- [ ] Any other special Florence dinners — ask hotel on arrival for current favorites

### Naples

See [Naples Pizza Guide](naples-pizza.qmd) for the full three-night assignment and call scripts.

- [ ] **Concettina ai Tre Santi** (Fri Jun 12 — farewell pizza) — book via web form: [concettinaaitresanti.com/en/contacts](https://www.concettinaaitresanti.com/en/contacts/) — table for 2, 7:30 PM ← **Do this today**
- [ ] **Starita a Materdei** (Thu Jun 11 — post-tour dinner) — call +39 081 544 1485; table for 2, 7:30 PM; **call Tue June 2 or Wed June 3, 8:00–9:30 AM CDT**
- [ ] **Da Attilio** (Wed Jun 10 — arrival night) — walk-in only; arrive by 7:00–7:30 PM; no reservation needed
```

- [ ] **Step 2: Render to verify**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/research/pre-departure-checklist.qmd
```

Expected: clean render; no broken links.

- [ ] **Step 3: Commit**

```bash
git add research/pre-departure-checklist.qmd
git commit -m "Update pre-departure checklist restaurant reservations: Del Fagioli + Naples pizza"
```

---

## Task 2: Add Del Fagioli callout to Day 5 (June 9 — preferred night)

**Files:**
- Modify: `daily_itineraries/day-05-2026-06-09-florence.qmd`

The Evening section currently says "Dinner — last chance for: Bistecca alla Fiorentina, Final pasta, final wine, final gelato" — generic. Replace the dinner bullets with the Del Fagioli callout. Keep the "Pack for tomorrow's train" preamble.

- [ ] **Step 1: Replace the dinner bullets**

Find this block in `day-05-2026-06-09-florence.qmd`:

```markdown
Dinner — last chance for:
- Bistecca alla Fiorentina (the great T-bone, shared between two)
- Final pasta, final wine, final gelato
```

Replace it with:

```markdown
::: {.callout-tip}
## Tonight: Del Fagioli — Last Dinner in Florence

**Michelin Bib Gourmand.** Reservations required — confirm this is your booked night.

| | |
|---|---|
| **Address** | Corso dei Tintori 47R (Santa Croce neighborhood) |
| **Phone** | +39 055 244285 |
| **Dinner hours** | 7:30–10:30 PM |
| **What to order** | Bistecca alla Fiorentina (shared T-bone) or pici with aglione sauce; house cantucci to finish |
| **Walk from hotel** | ~15 min from most centro storico hotels |

Historic, rustic trattoria — open kitchen, familial atmosphere. The real thing.
:::
```

- [ ] **Step 2: Render to verify**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/daily_itineraries/day-05-2026-06-09-florence.qmd
```

Expected: clean render; callout tip box appears in Evening section.

- [ ] **Step 3: Commit**

```bash
git add daily_itineraries/day-05-2026-06-09-florence.qmd
git commit -m "Add Del Fagioli callout to Day 5 last Florence dinner"
```

---

## Task 3: Add Del Fagioli callout to Day 4 (June 8 — backup night)

**Files:**
- Modify: `daily_itineraries/day-04-2026-06-08-florence.qmd`

The Evening section is currently just: "Dinner in Florence. Let the day determine where you end up." — a placeholder. Replace it with the Del Fagioli callout noting this is the backup option if the Tuesday reservation wasn't available.

- [ ] **Step 1: Replace the evening placeholder**

Find this block in `day-04-2026-06-08-florence.qmd`:

```markdown
## Evening

Dinner in Florence. Let the day determine where you end up.
```

Replace it with:

```markdown
## Evening

::: {.callout-tip}
## Tonight: Del Fagioli — If Your Reservation Is June 8

**Michelin Bib Gourmand.** If you secured the Monday reservation instead of Tuesday, tonight is your Del Fagioli night.

| | |
|---|---|
| **Address** | Corso dei Tintori 47R (Santa Croce neighborhood) |
| **Phone** | +39 055 244285 |
| **Dinner hours** | 7:30–10:30 PM |
| **What to order** | Bistecca alla Fiorentina (shared T-bone) or pici with aglione sauce; house cantucci to finish |
| **Walk from hotel** | ~15 min from most centro storico hotels |

Historic, rustic trattoria — open kitchen, familial atmosphere. The real thing.
:::
```

- [ ] **Step 2: Render to verify**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/daily_itineraries/day-04-2026-06-08-florence.qmd
```

Expected: clean render; callout tip box replaces the placeholder.

- [ ] **Step 3: Commit**

```bash
git add daily_itineraries/day-04-2026-06-08-florence.qmd
git commit -m "Add Del Fagioli callout to Day 4 evening (backup Florence dinner night)"
```

---

## Task 4: Full Site Render + Verification

- [ ] **Step 1: Render full site**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus
```

Expected: clean render, ~36 files, no errors.

- [ ] **Step 2: Verify Del Fagioli appears in rendered HTML**

```bash
grep -l "Del Fagioli" \
  /home/gramps/rstudio/quarto/columbus/_site/research/pre-departure-checklist.html \
  /home/gramps/rstudio/quarto/columbus/_site/daily_itineraries/day-04-2026-06-08-florence.html \
  /home/gramps/rstudio/quarto/columbus/_site/daily_itineraries/day-05-2026-06-09-florence.html
```

Expected: all three filenames returned.

- [ ] **Step 3: Verify Naples pizza section is gone from checklist**

```bash
grep "50 Kalò\|50 Kalo" /home/gramps/rstudio/quarto/columbus/_site/research/pre-departure-checklist.html
```

Expected: no output (50 Kalò reference removed from checklist).

- [ ] **Step 4: Final commit if anything unstaged**

```bash
git status
```

If clean: report done. If changes: stage and commit with message "Del Fagioli and checklist updates complete".
