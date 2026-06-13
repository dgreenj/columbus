# Puglia Daily Itineraries Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace placeholder daily itinerary files for the Puglia tour (Days 11–15) with confirmed Strada Toscana content, and extend Days 10 and 16 with tour-specific sections.

**Architecture:** Eight files modified — six daily itinerary `.qmd` files and `_quarto.yml`. Days 11–15 are complete content replacements using a consistent tour-day template. Days 10 and 16 are partial edits (replace/prepend specific sections). Sidebar labels updated in `_quarto.yml`.

**Tech Stack:** Quarto markdown (`.qmd`), YAML frontmatter, Quarto rendered via Docker (`docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus`)

---

## File Map

| File | Change |
|---|---|
| `daily_itineraries/day-10-2026-06-14-naples-to-brindisi.qmd` | Replace afternoon + evening sections |
| `daily_itineraries/day-11-2026-06-15-puglia.qmd` | Full content replacement — Otranto |
| `daily_itineraries/day-12-2026-06-16-puglia.qmd` | Full content replacement — Lecce |
| `daily_itineraries/day-13-2026-06-17-puglia.qmd` | Full content replacement — Ostuni → Putignano |
| `daily_itineraries/day-14-2026-06-18-puglia.qmd` | Full content replacement — Alberobello |
| `daily_itineraries/day-15-2026-06-19-puglia.qmd` | Full content replacement — Matera |
| `daily_itineraries/day-16-2026-06-20-brindisi-departure.qmd` | Prepend group transport section |
| `_quarto.yml` | Update sidebar labels for days 11–15 |

---

### Task 1: Update Day 10 — Replace Afternoon and Evening Sections

**File:** `daily_itineraries/day-10-2026-06-14-naples-to-brindisi.qmd`

The current file's afternoon/evening sections describe Brindisi activities that are superseded once the group is picked up at 12:30 PM. Replace everything from `## Afternoon: Rest & Puglia Context` through the end of `## Evening: Prepare for Tour Days` with tour content.

- [ ] **Step 1: Make the edit**

Use the Edit tool. Replace this exact block (lines 65–112):

```
## Afternoon: Rest & Puglia Context (1–5 PM)

**This is a recovery afternoon.** You've spent a week in Florence and nearly four days in Naples. Puglia is beautiful but it's also six more days of exploration. Spend this afternoon reading, resting, or strolling lightly.

**Use the time for:**
- [ ] Read [Puglia Overview](../regions/puglia.qmd) to understand what you'll be visiting
- [ ] Review tour details and confirm pickup times/meeting points
- [ ] Check accommodations for the coming days
- [ ] Get cash if needed — ATMs are easy to find in centro
- [ ] A leisurely lunch near the harbor

**Light option:** Walk to the Tempio di San Giovanni al Sepolcro (a small round Crusader church from the 11th century — easy to miss, worth finding).

---

## Evening: Dinner in Puglia (7–9 PM)

You started getting acquainted with Puglian food last night. Tonight, go deeper.

**Puglia's table:**

| Dish | What to Know |
|------|--------------|
| **Orecchiette alle cime di rapa** | The definitive Puglian pasta — "little ears" with bitter turnip greens and anchovy. Get it if it's on the menu. |
| **Burrata** | If you haven't had it fresh in Puglia yet, this is the night. Born in the region — nothing like what you get abroad. |
| **Fave e cicorie** | Fava bean purée with bitter greens — ancient peasant dish, stunning |
| **Tiella di riso, patate e cozze** | Layered bake of rice, potatoes, and mussels — a Bari/Puglia classic |
| **Primitivo** | Fuller-bodied red from Manduria — don't skip it |

**Seafood:** Brindisi is a fishing port. Whatever the restaurant says is fresh today, get that.

**Where to look:**
- Side streets off Corso Garibaldi heading into centro storico
- Avoid restaurants with multilingual photo menus on the waterfront
- Ask the hotel for a specific recommendation — they know

---

## Evening: Prepare for Tour Days

**Tonight, get organized:**

- [x] Meeting point confirmed: arrivals area, look for **STRADA TOSCANA** sign — hotel is Masseria dei Monaci (~2 hrs drive)
- [ ] Review what you'll see this week in Puglia
- [ ] Charge all devices
- [ ] Lay out comfortable walking shoes and sun protection
- [ ] Early night — Puglia begins in earnest tomorrow
```

With:

```
## Afternoon: Drive to Masseria dei Monaci

After the 12:30 PM pickup at Brindisi Airport, tour drivers transport the group ~2 hours south to **Masseria dei Monaci** — a restored 4-star farm estate near Otranto. Converted from a historic masseria while preserving its past: spacious rooms, inviting courtyards, sea breezes, and ancient olive trees.

Check in, unpack, and settle in. Pool and grounds available.

---

## Evening: Welcome Overview & Dinner

Pamela and Paola present an overview of the week's itinerary. Then: a special **welcome dinner** prepared by the masseria's Pugliese chef (included with local wine).

**Tonight — get organized:**

- [ ] Note pickup times and meeting points from the welcome overview
- [ ] Charge all devices overnight
- [ ] Lay out comfortable walking shoes and sun protection for tomorrow's Otranto day
- [ ] Early night — the first full tour day begins tomorrow
```

- [ ] **Step 2: Commit**

```bash
git add daily_itineraries/day-10-2026-06-14-naples-to-brindisi.qmd
git commit -m "Update Day 10: replace afternoon/evening with tour arrival content"
```

---

### Task 2: Write Day 11 — Otranto

**File:** `daily_itineraries/day-11-2026-06-15-puglia.qmd`

- [ ] **Step 1: Replace entire file content**

Write the complete file:

```markdown
---
title: "Day 11 — June 15: Otranto"
subtitle: "Ancient port town on the Adriatic, guided tour and dinner"
date: "2026-06-15"
day-of-week: "Monday"
location: "Otranto / Masseria dei Monaci"
categories: [itinerary, puglia, otranto]
---

## Day at a Glance

| | |
|---|---|
| **Date** | Monday, June 15 |
| **Base** | Masseria dei Monaci (Night 2 of 3) |
| **Meals included** | Breakfast + Dinner |
| **Transport** | Tour drivers (all included) |

---

## Morning

After breakfast at the masseria, drivers shuttle the group to **Otranto** — an ancient town perched on a rocky bluff overlooking the Adriatic Sea. Its roots are the Greek city Hydrus; its coastal position facing the Balkans and Greece runs through its history as a Roman port. UNESCO designated it a "messenger site of peace."

A local guide leads a walking tour of the town's most important historic sites.

## Afternoon

Free time in Otranto's historic center — explore, browse shops, or find a seaside café for lunch on your own.

Return to the masseria in the afternoon. Options: pool, cool drink under the olive trees, or arrange a shuttle to a local beach.

## Evening

Return to Otranto for dinner at a local trattoria (included).

---

## Practical Notes

- Lunch is on your own — budget €15–25; seafood cafés along the waterfront
- Cobblestone streets throughout the historic center — comfortable walking shoes
- Albania is visible on a clear day from the Adriatic coast

---

**Previous:** [Day 10: First Full Day in Puglia](day-10-2026-06-14-naples-to-brindisi.qmd) | **Next:** [Day 12: Lecce](day-12-2026-06-16-puglia.qmd)
```

---

### Task 3: Write Day 12 — Lecce

**File:** `daily_itineraries/day-12-2026-06-16-puglia.qmd`

- [ ] **Step 1: Replace entire file content**

```markdown
---
title: "Day 12 — June 16: Lecce"
subtitle: "The Florence of the South — Baroque limestone and a guided tour"
date: "2026-06-16"
day-of-week: "Tuesday"
location: "Lecce / Masseria dei Monaci"
categories: [itinerary, puglia, lecce]
---

## Day at a Glance

| | |
|---|---|
| **Date** | Tuesday, June 16 |
| **Base** | Masseria dei Monaci (Night 3 of 3) |
| **Meals included** | Breakfast + Lunch |
| **Transport** | Tour drivers (all included) |

---

## Morning

After breakfast, excursion to **Lecce** — often called the Florence of the South. Built in the local cream-colored limestone in the Baroque style, architectural surprises are around every corner: ornate churches, grand piazzas, ancient Roman ruins, and artisan shops selling local olive oil, wine, and ceramics.

A local guide leads a walking tour of the historic center.

## Midday

Arranged lunch at an exceptional restaurant (included with local wine).

## Afternoon

Return to the masseria. Afternoon free — pool, relax, refresh.

## Evening

Free — dinner on your own at the masseria, or drivers can shuttle to nearby Otranto.

---

## Practical Notes

- Dinner tonight is on your own — budget €20–35
- Lecce has excellent shops for olive oil, ceramics, and Baroque-inspired gifts
- Last night at Masseria dei Monaci — pack bags tonight for tomorrow's checkout

---

**Previous:** [Day 11: Otranto](day-11-2026-06-15-puglia.qmd) | **Next:** [Day 13: Ostuni → Putignano](day-13-2026-06-17-puglia.qmd)
```

- [ ] **Step 2: Commit Days 11–12**

```bash
git add daily_itineraries/day-11-2026-06-15-puglia.qmd daily_itineraries/day-12-2026-06-16-puglia.qmd
git commit -m "Add Day 11 (Otranto) and Day 12 (Lecce) itinerary content"
```

---

### Task 4: Write Day 13 — Ostuni → Putignano

**File:** `daily_itineraries/day-13-2026-06-17-puglia.qmd`

- [ ] **Step 1: Replace entire file content**

```markdown
---
title: "Day 13 — June 17: Ostuni → Putignano"
subtitle: "The White City, an ancient olive grove, and a new home base"
date: "2026-06-17"
day-of-week: "Wednesday"
location: "Ostuni → Putignano"
categories: [itinerary, puglia, ostuni, putignano]
---

## Day at a Glance

| | |
|---|---|
| **Date** | Wednesday, June 17 |
| **Accommodation change** | Masseria dei Monaci → Petrantiche Albergo Diffuso, Putignano |
| **Meals included** | Breakfast + Lunch + Dinner |
| **Transport** | Private drivers (all included) |

---

## Morning

Check out of Masseria dei Monaci. Private drivers transport the group north toward trulli country.

**Stop: Ostuni (La Città Bianca)** — a whitewashed hilltop town surrounded by olive groves stretching to the Adriatic. Free time to wander the winding avenues, shop, and explore on your own.

## Midday

**Olive grove tour:** Visit a family-run ancient olive grove — the scale and age of the trees is remarkable. Followed by an olive oil tasting and light lunch (included with local wine).

## Afternoon

Arrive **Petrantiche Albergo Diffuso** in Putignano. A unique accommodation: apartment-style rooms with Pugliese character (limestone arches, whitewashed exteriors) distributed through the historic center — all within 200 meters of reception. Check in and settle in.

## Evening

Evening walking tour of Putignano's historic center with Pamela & Paola. Regional dinner (included).

---

## Practical Notes

- Pack bags the night before — checkout is this morning
- Ostuni has steep hills and stairs — good shoes essential
- Petrantiche rooms are spread across the village; confirm your room address at check-in
- Olive oil from the grove packs well if wrapped carefully for the flight home

---

**Previous:** [Day 12: Lecce](day-12-2026-06-16-puglia.qmd) | **Next:** [Day 14: Alberobello](day-14-2026-06-18-puglia.qmd)
```

---

### Task 5: Write Day 14 — Alberobello

**File:** `daily_itineraries/day-14-2026-06-18-puglia.qmd`

- [ ] **Step 1: Replace entire file content**

```markdown
---
title: "Day 14 — June 18: Alberobello"
subtitle: "UNESCO trulli, dry-stone architecture, and an evening food experience"
date: "2026-06-18"
day-of-week: "Thursday"
location: "Alberobello / Putignano"
categories: [itinerary, puglia, alberobello]
---

## Day at a Glance

| | |
|---|---|
| **Date** | Thursday, June 18 |
| **Base** | Petrantiche Albergo Diffuso, Putignano (Night 2 of 3) |
| **Meals included** | Breakfast + Dinner (food experience) |
| **Transport** | Tour drivers (all included) |

---

## Morning

After breakfast, drivers to **Alberobello** — known for its trulli, the characteristic limestone dwellings with conical roofs built in a prehistoric dry-stone technique still practiced in the region. Dating back centuries, Alberobello has the highest concentration and best-preserved examples. UNESCO World Heritage since 1996.

Walking tour of the trulli district.

## Afternoon

Free time and lunch on your own in Alberobello. Return to Putignano to relax and refresh before the evening.

## Evening

Return to Alberobello for a **food experience** (details and meeting time provided by Pamela & Paola on the day — monitor the WhatsApp group).

---

## Practical Notes

- Lunch on your own in Alberobello — €15–25; cafés and trattorias near the trulli district
- Morning walking tour is optimal — beats peak heat and afternoon crowds
- Check WhatsApp group for food experience meeting point and time

---

**Previous:** [Day 13: Ostuni → Putignano](day-13-2026-06-17-puglia.qmd) | **Next:** [Day 15: Matera](day-15-2026-06-19-puglia.qmd)
```

---

### Task 6: Write Day 15 — Matera

**File:** `daily_itineraries/day-15-2026-06-19-puglia.qmd`

- [ ] **Step 1: Replace entire file content**

```markdown
---
title: "Day 15 — June 19: Matera"
subtitle: "UNESCO cave city, a lunch in a cave, and a farewell dinner"
date: "2026-06-19"
day-of-week: "Friday"
location: "Matera / Putignano"
categories: [itinerary, puglia, matera]
---

## Day at a Glance

| | |
|---|---|
| **Date** | Friday, June 19 |
| **Base** | Petrantiche Albergo Diffuso, Putignano (last night) |
| **Meals included** | Breakfast + Lunch + Dinner |
| **Transport** | Tour drivers (all included) |

---

## Morning

After breakfast, drivers to **Matera** (Basilicata) — a UNESCO World Heritage site and one of the oldest continuously inhabited cities in the world. The Sassi di Matera are ancient cave dwellings and rock churches with evidence of human settlement from the Palaeolithic period. A local guide leads exploration of the historic core.

## Midday

**Lunch at a cave restaurant** (included with local wine) — a Matera specialty.

## Afternoon

Return to Putignano. Free time for last-minute shopping or optional shuttle to Alberobello.

## Evening

**Farewell dinner** at a local trattoria (included with local wine) — a celebration of the week together.

---

## Practical Notes

- Matera is ~1.5 hours from Putignano, in Basilicata (not technically Puglia)
- Extensive walking on uneven stone paths — best footwear choice of the trip
- Bring a light layer: cave interiors stay cool regardless of outside temperature
- Last night at Petrantiche — pack bags tonight for tomorrow's early group transport to Brindisi Airport

---

**Previous:** [Day 14: Alberobello](day-14-2026-06-18-puglia.qmd) | **Next:** [Day 16: Departure](day-16-2026-06-20-brindisi-departure.qmd)
```

- [ ] **Step 2: Commit Days 13–15**

```bash
git add daily_itineraries/day-13-2026-06-17-puglia.qmd daily_itineraries/day-14-2026-06-18-puglia.qmd daily_itineraries/day-15-2026-06-19-puglia.qmd
git commit -m "Add Day 13 (Ostuni→Putignano), Day 14 (Alberobello), Day 15 (Matera) itinerary content"
```

---

### Task 7: Update Day 16 — Prepend Group Transport Section

**File:** `daily_itineraries/day-16-2026-06-20-brindisi-departure.qmd`

The current file opens with `## Overview`. Prepend a new section before it so readers see the group transport logistics first.

- [ ] **Step 1: Make the edit**

Use the Edit tool. Replace this exact string at the top of the body (after the YAML frontmatter closing `---`):

Old:
```
## Overview

**The journey home begins in Puglia.**
```

New:
```
## Morning: Group Transport to Brindisi Airport

Strada Toscana provides group transport from Putignano to Brindisi Airport (BDS) this morning.

::: {.callout-important}
## Confirm departure time via WhatsApp

The exact departure time from Putignano will be confirmed by Pamela & Paola the night before — watch the WhatsApp group.

**Flight LH 1895 departs 10:55 AM** — group transport is timed to arrive well before check-in opens.
:::

---

## Overview

**The journey home begins in Puglia.**
```

---

### Task 8: Update `_quarto.yml` — Remove Placeholder Labels

**File:** `_quarto.yml`

- [ ] **Step 1: Make the edit**

Use the Edit tool. Replace this exact block:

```yaml
          - text: "Day 11 (Jun 15) - Placeholder"
            href: daily_itineraries/day-11-2026-06-15-puglia.qmd
          - text: "Day 12 (Jun 16) - Placeholder"
            href: daily_itineraries/day-12-2026-06-16-puglia.qmd
          - text: "Day 13 (Jun 17) - Placeholder"
            href: daily_itineraries/day-13-2026-06-17-puglia.qmd
          - text: "Day 14 (Jun 18) - Placeholder"
            href: daily_itineraries/day-14-2026-06-18-puglia.qmd
          - text: "Day 15 (Jun 19) - Placeholder"
            href: daily_itineraries/day-15-2026-06-19-puglia.qmd
```

With:

```yaml
          - text: "Day 11 (Jun 15) — Otranto"
            href: daily_itineraries/day-11-2026-06-15-puglia.qmd
          - text: "Day 12 (Jun 16) — Lecce"
            href: daily_itineraries/day-12-2026-06-16-puglia.qmd
          - text: "Day 13 (Jun 17) — Ostuni → Putignano"
            href: daily_itineraries/day-13-2026-06-17-puglia.qmd
          - text: "Day 14 (Jun 18) — Alberobello"
            href: daily_itineraries/day-14-2026-06-18-puglia.qmd
          - text: "Day 15 (Jun 19) — Matera"
            href: daily_itineraries/day-15-2026-06-19-puglia.qmd
```

- [ ] **Step 2: Commit Days 16 + sidebar**

```bash
git add daily_itineraries/day-16-2026-06-20-brindisi-departure.qmd _quarto.yml
git commit -m "Update Day 16 with group transport section; update sidebar labels"
```

---

### Task 9: Render and Verify

- [ ] **Step 1: Render the full site**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus
```

Expected: completes without errors. Output ends with `Output created: _site/index.html` (or similar). No missing file warnings, no YAML parse errors.

- [ ] **Step 2: Check the six modified pages rendered**

```bash
ls -la /home/gramps/rstudio/quarto/columbus/_site/daily_itineraries/ | grep -E "day-1[0-6]"
```

Expected: all seven files present with recent timestamps.

- [ ] **Step 3: Spot-check content in rendered HTML**

```bash
grep -l "Day at a Glance" /home/gramps/rstudio/quarto/columbus/_site/daily_itineraries/*.html
```

Expected: 5 files returned (days 11–15).

```bash
grep "Masseria dei Monaci" /home/gramps/rstudio/quarto/columbus/_site/daily_itineraries/day-10-2026-06-14-naples-to-brindisi.html
```

Expected: at least one match.

```bash
grep "Group Transport" /home/gramps/rstudio/quarto/columbus/_site/daily_itineraries/day-16-2026-06-20-brindisi-departure.html
```

Expected: at least one match.

- [ ] **Step 4: Final commit**

```bash
git add _site/
git commit -m "Render site: Puglia daily itineraries complete (Days 10-16)"
```
