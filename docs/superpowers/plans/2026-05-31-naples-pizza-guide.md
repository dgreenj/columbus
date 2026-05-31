# Naples Pizza Guide Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a research-backed Naples pizza guide page and inject per-night callout boxes into three daily itinerary pages so Dan Green and Jane Mooney always know exactly which pizzeria to visit each evening (June 10–12, 2026).

**Architecture:** One new Quarto page (`research/naples-pizza.qmd`) handles all planning detail. Four existing files get targeted edits: `_quarto.yml` (nav wiring), `research/restaurants.qmd` (replace Naples pizza section with link), and three daily itinerary `.qmd` files (each gets a `callout-tip` box in its evening section). No R code, no Shiny — pure Quarto markdown.

**Tech Stack:** Quarto markdown (`.qmd`), YAML front matter, Quarto callout blocks (`::: {.callout-tip}`), HTML render via `docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus`

---

## File Map

| Action | File | What changes |
|---|---|---|
| **Create** | `research/naples-pizza.qmd` | Full new pizza guide page |
| **Modify** | `_quarto.yml` | Add Naples Pizza to navbar menu + sidebar |
| **Modify** | `research/restaurants.qmd` | Replace Naples pizza section with 3-line summary + link callout |
| **Modify** | `daily_itineraries/day-06-2026-06-10-florence.qmd` | Replace "Top options" bullet list in Evening section with Da Attilio callout-tip |
| **Modify** | `daily_itineraries/day-07-2026-06-11-florence-to-naples.qmd` | Replace generic dinner bullets in Evening section with Starita callout-tip |
| **Modify** | `daily_itineraries/day-08-2026-06-12-naples-herculaneum.qmd` | Replace "Final Dinner" bullets in Evening section with Concettina callout-tip |

---

## Task 1: Create `research/naples-pizza.qmd`

**Files:**
- Create: `research/naples-pizza.qmd`

- [ ] **Step 1: Create the file with full content**

Create `/home/gramps/rstudio/quarto/columbus/research/naples-pizza.qmd` with this exact content:

```markdown
---
title: "Naples Pizza Guide"
subtitle: "Where to go, when to book, what to order — June 10–12"
date: "2026-05-31"
categories: [naples, food, pizza, planning]
toc: true
---

## Overview

Naples invented pizza. Not as a figure of speech — the Margherita was created here in 1889 and the city has been perfecting it ever since. You have three evenings in Naples (June 10–12) and three specific places to be.

---

## Your 3 Nights

| Night | Date | Pizzeria | Reservation |
|---|---|---|---|
| Arrival evening | Wed June 10 | **Da Attilio** | Walk-in — no action needed |
| After walking tour | Thu June 11 | **Starita a Materdei** | ✅ Call ahead — see below |
| Farewell Naples | Fri June 12 | **Concettina ai Tre Santi** | ✅ Web form — see below |

---

## Call This Week {#call-this-week}

::: {.callout-important}
## Time-Sensitive: Make These Contacts Now

Italy (CEST) is **7 hours ahead** of Madison (CDT).
**Best call window from Madison:** 8:00–9:30 AM CDT = 3:00–4:30 PM Italy (afternoon prep)
:::

### ① Concettina ai Tre Santi — June 12 (Friday) — Do This First

- **How:** Web contact form — no phone call needed
- **URL:** <https://www.concettinaaitresanti.com/en/contacts/>
- **Request:** Table for 2 people, Friday June 12, 7:30 PM (backup: 8:00 PM)
- **Do this:** Today — this is the time-sensitive one

### ② Starita a Materdei — June 11 (Thursday)

- **Phone:** +39 081 544 1485
- **When to call:** Tuesday June 2 or Wednesday June 3, **8:00–9:30 AM CDT**
- **Closed Monday** — do not call on Sunday or Monday
- **What to say:**

> "Hello, I'd like to reserve a table for 2 people for Thursday June 11th at 7:30 PM. Is that possible?"
>
> *(Backup time: 8:00 PM)*

### ③ Da Attilio — June 10 (Wednesday Arrival) — No Call Needed

- Walk-in, open daily until 11:45 PM
- Arrive by 7:00–7:30 PM to minimize any wait
- Optional email: pizzeria.attilio@gmail.com

---

## The Six Pizzerias

### 1. Da Attilio ⭐

**Rated #1 in a 31-pizzeria independent head-to-head (2026)**

| | |
|---|---|
| **Address** | Via Pignasecca 17, 80134 Napoli |
| **Phone** | +39 081 552 0479 |
| **Email** | pizzeria.attilio@gmail.com |
| **Hours** | Daily 10:00 AM – 11:45 PM |
| **Reservations** | Walk-in; email works for advance notice |
| **Price** | €8–14 per pizza |

**What to order:** Margherita. The reviewer who visited all 31 called it "perfection — nothing more, nothing less. The perfect amount of sauce. The perfect amount of cheese. The intense kiss of the dome." Skip the star-shaped specialty pizzas on a first visit.

**Character:** Since 1938, in the Pignasecca market district. AVPN certified. Understated, serious, and completely focused on the dough.

**Our night:** June 10 — walk-in, no stress, first night in Naples.

---

### 2. Concettina ai Tre Santi ⭐

**Rated #2 in the same 31-pizzeria guide**

| | |
|---|---|
| **Address** | Via Arena della Sanità 137/bis, Rione Sanità, Napoli |
| **Hours** | Fri–Sat confirmed 11:00–23:30; verify weekday hours via website |
| **Reservations** | Web form: [concettinaaitresanti.com/en/contacts](https://www.concettinaaitresanti.com/en/contacts/) |
| **Price** | €10–18 per pizza |

**What to order:** Margherita or Marinara. The menu includes creative seasonal options — fine to explore once you've had the classic.

**Character:** The Oliva family opened this in 1951 in the Rione Sanità quarter. Spirited, intimate atmosphere with art by local Sanità artists on the walls. Ciro Oliva is the current pizzaiolo. A step above the tourist trail.

**Getting there:** ~20 min taxi from the Airbnb (Via Monte di Dio). Rione Sanità is uphill from centro — easier by taxi at night.

**Our night:** June 12 — farewell Naples pizza. Reserve via web form.

---

### 3. Starita a Materdei

| | |
|---|---|
| **Address** | Via Materdei 27/28, 80136 Napoli |
| **Phone** | +39 081 544 1485 |
| **Hours** | Tue–Sun: 12:00–15:30 / 19:00–23:30 |
| **Closed** | Monday |
| **Reservations** | Call ahead — recommended |
| **Price** | €9–16 per pizza |

**What to order:** Margherita or the *montanara* — Starita's signature fried pizza dough topped after frying. One independent guide called it "100% worthy of any itinerary."

**Character:** Since 1901, in the Materdei neighborhood north of the historic center. Known for frying pizza dough before topping it. Unassuming location; serious quality.

**Getting there:** ~25 min walk from centro storico, or Metro Line 1 to Materdei stop, or taxi.

**Our night:** June 11 — call ahead.

---

### 4. L'Antica Pizzeria Da Michele

| | |
|---|---|
| **Address** | Via Cesare Sersale 1, 80139 Napoli |
| **Hours** | ~10:30 AM – close (varies) |
| **Closed** | Sunday |
| **Reservations** | None — ticket number at door |
| **Price** | €5–7 |

**What to order:** Two choices only — **Margherita** or **Marinara**. Cash only.

**Character:** Since 1870. Made famous internationally by the film *Eat Pray Love*. One deep-dive reviewer called the pizza "spectacularly average" and noted mass fame has moved attention away from the craft. Still a genuine Naples experience — the stripped-down menu and chaotic pace are the point. Temper expectations vs. the hype.

**Walk-in strategy:** Get a paper number at the door and wait. Arrive before 12:00 PM for lunch or before 7:00 PM for dinner to avoid the longest queues.

---

### 5. Gino Sorbillo

| | |
|---|---|
| **Address** | Via dei Tribunali 32, 80138 Napoli |
| **Phone** | +39 081 446643 |
| **Hours** | ~12:00–15:30 / 19:00–23:00 |
| **Closed** | Sunday |
| **Reservations** | Walk-in norm; arrive early |
| **Price** | €7–12 |

**What to order:** Margherita or the daily specials — more variety than Da Michele.

**Character:** The most famous address on Via dei Tribunali, Naples' main pizza street. One independent reviewer was harsh ("overhyped tourist trap"), though many visitors disagree. Good pizza, very busy, undeniably a Naples landmark. Worth it if you're passing Via dei Tribunali spontaneously.

**Walk-in strategy:** Before 12:30 PM for lunch, before 7:00 PM for dinner.

---

### 6. 50 Kalò (di Ciro Salvo)

| | |
|---|---|
| **Address** | Piazza Sannazzaro 201/b, 80122 Napoli |
| **Phone** | +39 081 19204667 |
| **Hours** | ~12:30–15:30 / 19:30–23:30 |
| **Reservations** | Wait list at door — leave your name |
| **Price** | €12–18 |

**What to order:** Any house pizza — Ciro Salvo's specialty is extremely hydrated dough (very light, highly digestible crust). Michelin-listed; one of only six Naples pizzerias in Italy's Michelin Guide.

**Character:** Piazza Sannazzaro in the Chiaia neighborhood — upscale, outdoor seating, fashionable crowd. Ranked above Sorbillo in the independent guide. The Michelin Guide confirms no reservations; leave your name and wait.

---

## What to Order

**Margherita or Marinara?**

The Margherita (tomato, buffalo mozzarella, basil) was invented here in 1889 for Queen Margherita of Savoy. The Marinara (tomato, garlic, oregano, olive oil — no cheese) is older and more elemental; it existed before mozzarella became a pizza topping. Order Marinara at least once. It's the pizza that tells you everything about the dough and sauce without cheese to compensate.

**The rule on creative toppings:** Some pizzerias offer elaborate seasonal or signature pizzas. On your first visit to any place, order the Margherita — it's the true quality test, nowhere to hide. Once you've established the baseline, experiment.

**Street food add-on: Pizza fritta**

Fried pizza is separate from the sit-down pizzerias. Look for street-side vendors near Quartieri Spagnoli — a filled, folded dough fried in oil (ricotta and salumi inside). €3–5. Eat standing on the street. €3–5.

---

## Getting There

All distances from Airbnb at Via Monte di Dio, Chiaia.

| Pizzeria | Neighborhood | From Airbnb | Notes |
|---|---|---|---|
| **Da Attilio** | Pignasecca | ~15 min walk | Pass through Piazza dei Martiri |
| **Concettina** | Rione Sanità | ~20 min taxi | Uphill; easier by taxi at night |
| **Starita** | Materdei | ~25 min walk or Metro L1 | Materdei stop |
| **Da Michele** | Pendino | ~20 min walk | Near port area |
| **Sorbillo** | Centro Storico | ~20 min walk | Via dei Tribunali |
| **50 Kalò** | Chiaia | ~10 min walk | Same neighborhood as Airbnb |

---

**See also:** [Restaurant Overview](restaurants.qmd) | [Naples Overview](../regions/naples.qmd)
```

- [ ] **Step 2: Render to verify the new page builds cleanly**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/research/naples-pizza.qmd
```

Expected: no errors; a `_site/research/naples-pizza.html` is produced.

If you get a YAML error, check the front matter dashes. If you get a link error, Quarto may warn about unresolved cross-references — those will resolve in Task 2 once `_quarto.yml` is updated.

- [ ] **Step 3: Commit**

```bash
git add research/naples-pizza.qmd
git commit -m "Add Naples pizza guide research page"
```

---

## Task 2: Wire Naples Pizza into `_quarto.yml`

**Files:**
- Modify: `_quarto.yml`

The navbar Research menu currently lists "Restaurants" then "Packing List". The sidebar Pre-Trip Planning section lists `research/restaurants.qmd` then `research/packing-list.qmd`. Both need the new page inserted between those two entries.

- [ ] **Step 1: Add to navbar Research menu**

In `_quarto.yml`, find this block inside the navbar left menu:

```yaml
          - text: "Restaurants"
            href: research/restaurants.qmd
          - text: "Packing List"
            href: research/packing-list.qmd
```

Replace it with:

```yaml
          - text: "Restaurants"
            href: research/restaurants.qmd
          - text: "Naples Pizza"
            href: research/naples-pizza.qmd
          - text: "Packing List"
            href: research/packing-list.qmd
```

- [ ] **Step 2: Add to sidebar Pre-Trip Planning**

In `_quarto.yml`, find this block inside the sidebar contents:

```yaml
          - research/restaurants.qmd
          - research/packing-list.qmd
```

Replace it with:

```yaml
          - research/restaurants.qmd
          - research/naples-pizza.qmd
          - research/packing-list.qmd
```

- [ ] **Step 3: Render full site to verify nav wires correctly**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus
```

Expected: clean render; "Naples Pizza" appears in the Research navbar menu and in the Pre-Trip Planning sidebar between Restaurants and Packing List.

- [ ] **Step 4: Commit**

```bash
git add _quarto.yml
git commit -m "Add Naples Pizza page to navbar and sidebar"
```

---

## Task 3: Update `research/restaurants.qmd`

**Files:**
- Modify: `research/restaurants.qmd`

The current Naples pizza section (lines ~69–94) lists Da Michele, Sorbillo, and 50 Kalò with bullet details. Replace that section with a short summary + link callout pointing to the new dedicated page.

- [ ] **Step 1: Replace the Naples pizza section**

Find this entire block in `research/restaurants.qmd`:

```markdown
### Pizza (Essential!)

**Da Michele** (Via Cesare Sersale)
- Since 1870
- Only 2 pizzas: Marinara or Margherita
- Cash only, expect lines
- €5-7 per pizza

**Sorbillo** (Via dei Tribunali)
- Famous, always crowded
- More variety than Da Michele
- Reservations possible for dinner
- €7-12

**50 Kalò** (Piazza Sannazzaro)
- Modern, upscale pizza
- Reservation essential
- €12-18
```

Replace it with:

```markdown
### Pizza (Essential!)

Naples invented pizza. You have three evenings there and three specific pizzerias pre-assigned — with reservations handled and call scripts included.

::: {.callout-tip}
## Full Naples Pizza Guide

Six pizzeria profiles, the three-night assignment (June 10–12), reservation call scripts with Madison CDT timing, and what to order:

**[→ Naples Pizza Guide](naples-pizza.qmd)**
:::
```

- [ ] **Step 2: Render to verify**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/research/restaurants.qmd
```

Expected: clean render; the Naples pizza section now shows the callout with a working link.

- [ ] **Step 3: Commit**

```bash
git add research/restaurants.qmd
git commit -m "Replace Naples pizza section in restaurants.qmd with link to dedicated page"
```

---

## Task 4: Add Da Attilio callout to Day 6 (June 10 Arrival)

**Files:**
- Modify: `daily_itineraries/day-06-2026-06-10-florence.qmd`

The Evening section currently says "Pizza is the only correct choice for tonight" and lists Da Michele, Sorbillo, 50 Kalò as options. Replace the "See:" link and "Top options:" through the "What to order:" block with a Da Attilio callout-tip.

- [ ] **Step 1: Replace the generic pizza options with the Da Attilio callout**

Find this block in `day-06-2026-06-10-florence.qmd`:

```markdown
**See:** [Restaurants — Naples Pizza](../research/restaurants.qmd#pizza-essential)

**Top options:**

- **Da Michele** — Legendary, cash only, expect a line, worth it. Only two pizzas: Margherita or Marinara.
- **Sorbillo** — Via dei Tribunali, excellent, often crowded
- **50 Kalò** — More upscale, worth reserving ahead

**What to order:**
- *Margherita* (tomato, mozzarella, basil) — the original, invented here
- *Marinara* (tomato, garlic, oregano, no cheese) — older than the Margherita, equally essential
- Cost: €5–12 depending on place
```

Replace it with:

```markdown
::: {.callout-tip}
## Tonight: Da Attilio — First Pizza in Naples

**Rated #1 in a 31-pizzeria independent head-to-head.** Walk-in only — no reservation needed.

| | |
|---|---|
| **Address** | Via Pignasecca 17 (Mercato Pignasecca) |
| **Walk from Airbnb** | ~15 minutes |
| **Arrive by** | 7:00–7:30 PM |
| **What to order** | Margherita |
| **Price** | €8–14 per pizza |

First night — keep it simple. Walk over, get a table, eat the best Margherita in the city.

→ [Full Naples Pizza Guide](../research/naples-pizza.qmd)
:::
```

- [ ] **Step 2: Render to verify**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/daily_itineraries/day-06-2026-06-10-florence.qmd
```

Expected: clean render; Evening section shows the callout tip box with the Da Attilio table.

- [ ] **Step 3: Commit**

```bash
git add daily_itineraries/day-06-2026-06-10-florence.qmd
git commit -m "Add Da Attilio callout to Day 6 arrival evening"
```

---

## Task 5: Add Starita callout to Day 7 (June 11 Walking Tour day)

**Files:**
- Modify: `daily_itineraries/day-07-2026-06-11-florence-to-naples.qmd`

The Evening section has a generic "Dinner:" bullet list. Replace those dinner bullets with the Starita callout.

- [ ] **Step 1: Replace the generic dinner bullets with the Starita callout**

Find this block in `day-07-2026-06-11-florence-to-naples.qmd`:

```markdown
**Dinner:**
- Another pizzeria if you can face it (Via dei Tribunali has different options than last night)
- Seafood — Naples is a port city; fresh catch
- Quartieri Spagnoli for a grittier local atmosphere
```

Replace it with:

```markdown
::: {.callout-tip}
## Tonight: Starita a Materdei — Confirm Your Reservation

**Since 1901.** Call ahead required — see the [pizza guide](../research/naples-pizza.qmd#call-this-week) for timing.

| | |
|---|---|
| **Address** | Via Materdei 27/28 |
| **Phone** | +39 081 544 1485 |
| **Dinner hours** | 7:00–11:30 PM |
| **Leave Airbnb by** | 7:00 PM (25 min walk or taxi) |
| **What to order** | Margherita + try the *montanara* (fried pizza) |

→ [Full Naples Pizza Guide](../research/naples-pizza.qmd)
:::
```

- [ ] **Step 2: Render to verify**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/daily_itineraries/day-07-2026-06-11-florence-to-naples.qmd
```

Expected: clean render; Evening section shows the Starita callout tip box.

- [ ] **Step 3: Commit**

```bash
git add daily_itineraries/day-07-2026-06-11-florence-to-naples.qmd
git commit -m "Add Starita callout to Day 7 evening (Jun 11)"
```

---

## Task 6: Add Concettina callout to Day 8 (June 12 Herculaneum day)

**Files:**
- Modify: `daily_itineraries/day-08-2026-06-12-naples-herculaneum.qmd`

The Evening section has a "Final Dinner:" bullet list. Replace those bullets with the Concettina callout.

- [ ] **Step 1: Replace the Final Dinner bullets with the Concettina callout**

Find this block in `day-08-2026-06-12-naples-herculaneum.qmd`:

```markdown
**Final Dinner:**
- Return to favorite pizzeria?
- Or seafood at a Lungomare restaurant
- Quartieri Spagnoli (Spanish Quarter) has excellent trattorie and a gritty local feel
```

Replace it with:

```markdown
::: {.callout-tip}
## Tonight: Concettina ai Tre Santi — Farewell Naples Pizza

**Rated #2 in Naples.** Confirm your reservation via the web form if not already done.

| | |
|---|---|
| **Address** | Via Arena della Sanità 137/bis, Rione Sanità |
| **Dinner hours** | From 7:30 PM (Fri confirmed until 23:30) |
| **Getting there** | ~20 min taxi from Airbnb |
| **What to order** | Margherita — or explore the seasonal menu |

→ [Full Naples Pizza Guide](../research/naples-pizza.qmd)
:::
```

- [ ] **Step 2: Render to verify**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/daily_itineraries/day-08-2026-06-12-naples-herculaneum.qmd
```

Expected: clean render; Evening section shows the Concettina callout tip box.

- [ ] **Step 3: Commit**

```bash
git add daily_itineraries/day-08-2026-06-12-naples-herculaneum.qmd
git commit -m "Add Concettina ai Tre Santi callout to Day 8 farewell evening"
```

---

## Task 7: Full Site Render and Final Verification

**Files:** None created/modified — verification only.

- [ ] **Step 1: Render the full site**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus
```

Expected: clean render with no errors or warnings about missing files.

- [ ] **Step 2: Spot-check these pages in the rendered output**

Check `_site/` for these files exist and are non-empty:
```bash
ls -la /home/gramps/rstudio/quarto/columbus/_site/research/naples-pizza.html
ls -la /home/gramps/rstudio/quarto/columbus/_site/daily_itineraries/day-06-2026-06-10-florence.html
ls -la /home/gramps/rstudio/quarto/columbus/_site/daily_itineraries/day-07-2026-06-11-florence-to-naples.html
ls -la /home/gramps/rstudio/quarto/columbus/_site/daily_itineraries/day-08-2026-06-12-naples-herculaneum.html
```

- [ ] **Step 3: Verify callout boxes rendered**

```bash
grep -l "Da Attilio" /home/gramps/rstudio/quarto/columbus/_site/daily_itineraries/day-06-2026-06-10-florence.html
grep -l "Starita" /home/gramps/rstudio/quarto/columbus/_site/daily_itineraries/day-07-2026-06-11-florence-to-naples.html
grep -l "Concettina" /home/gramps/rstudio/quarto/columbus/_site/daily_itineraries/day-08-2026-06-12-naples-herculaneum.html
```

Expected: each command returns the filename (grep found the text).

- [ ] **Step 4: Verify nav wiring in site index**

```bash
grep "naples-pizza" /home/gramps/rstudio/quarto/columbus/_site/index.html
```

Expected: one or more hits (the nav bar link is present in the rendered HTML).

- [ ] **Step 5: Final commit**

```bash
git add -A
git status
```

Verify only expected files are staged (no `_site/` files — that directory is gitignored). Then:

```bash
git commit -m "Naples pizza guide complete: new page, nav wiring, daily itinerary callouts"
```

---

## Summary

| Task | Files | Key outcome |
|---|---|---|
| 1 | `research/naples-pizza.qmd` | Full 6-pizzeria guide, 3-night plan, call-this-week action |
| 2 | `_quarto.yml` | Page appears in navbar + sidebar |
| 3 | `research/restaurants.qmd` | Naples pizza section replaced with link |
| 4 | `day-06-…-florence.qmd` | Da Attilio callout in arrival evening |
| 5 | `day-07-…-florence-to-naples.qmd` | Starita callout in post-tour evening |
| 6 | `day-08-…-naples-herculaneum.qmd` | Concettina callout in farewell evening |
| 7 | — | Full render + verification |
