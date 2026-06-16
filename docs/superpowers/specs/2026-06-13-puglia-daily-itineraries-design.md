# Design Spec: Puglia Daily Itineraries (Days 10–16)

**Date:** 2026-06-13\
**Source:** https://stradatoscana.com/puglia/\
**Status:** Approved, ready for implementation

------------------------------------------------------------------------

## Overview

Replace placeholder daily itinerary files for the Strada Toscana Puglia tour (Days 11–15) with actual tour content. Extend Day 10 with arrival-at-masseria and welcome dinner. Prepend departure logistics to Day 16. Update sidebar labels.

**Tone:** Practical planning reference — logistics-first, minimal prose.

------------------------------------------------------------------------

## Files Changed

| File | Change |
|----|----|
| `daily_itineraries/day-10-2026-06-14-naples-to-brindisi.qmd` | Extend — add afternoon + evening sections |
| `daily_itineraries/day-11-2026-06-15-puglia.qmd` | Replace — Otranto day |
| `daily_itineraries/day-12-2026-06-16-puglia.qmd` | Replace — Lecce day |
| `daily_itineraries/day-13-2026-06-17-puglia.qmd` | Replace — Ostuni → Putignano day |
| `daily_itineraries/day-14-2026-06-18-puglia.qmd` | Replace — Alberobello day |
| `daily_itineraries/day-15-2026-06-19-puglia.qmd` | Replace — Matera day |
| `daily_itineraries/day-16-2026-06-20-brindisi-departure.qmd` | Extend — prepend group transport section |
| `_quarto.yml` | Update sidebar labels for days 11–15 |

------------------------------------------------------------------------

## Tour Day Template (Days 11–15)

Each touring day file uses this structure:

```         
---
title: "Day NN — June XX: [City]"
subtitle: "[One-line description]"
date: "2026-06-XX"
day-of-week: "..."
location: "..."
categories: [itinerary, puglia, ...]
---

## Day at a Glance

| | |
|---|---|
| **Date** | [Day, Month Date] |
| **Base** | [accommodation name] |
| **Meals included** | [e.g. Breakfast + Dinner] |
| **Transport** | Tour drivers (all included) |

---

## Morning
[Excursion, guided tour, departure]

## Afternoon
[Free time, pool, lunch on own, etc.]

## Evening
[Dinner location, food experience, etc.]

---

## Practical Notes
- [1–3 bullets: logistics not obvious from narrative]
```

------------------------------------------------------------------------

## Day-by-Day Content Map

### Day 10 — June 14: Extensions only

Existing file covers: Brindisi morning + 12:30 PM pickup at Brindisi Airport by Strada Toscana.

**Add:** - **Afternoon:** \~2hr drive to Masseria dei Monaci (near Otranto), check in, unpack, pool/relax - **Evening:** Welcome overview with Pamela & Paola, welcome dinner by Pugliese chef at masseria

Accommodation: **Masseria dei Monaci** (Night 1 of 3)

------------------------------------------------------------------------

### Day 11 — June 15: Otranto

YAML: `title: "Day 11 — June 15: Otranto"`, `subtitle: "Ancient port town on the Adriatic, guided tour and dinner"`, `location: "Otranto / Masseria dei Monaci"`

| Section | Content |
|----|----|
| **Day at a Glance** | Base: Masseria dei Monaci; Meals: Breakfast + Dinner; Transport: tour drivers |
| **Morning** | Shuttle to Otranto; guided tour of ancient town (Greek/Roman history, UNESCO "messenger site of peace," white buildings over Adriatic) |
| **Afternoon** | Free time in historic center; lunch on own (seafood café recommended); return to masseria — pool, cool drink, or shuttle to local beach |
| **Evening** | Return to Otranto; dinner at local trattoria (included) |
| **Practical Notes** | Lunch is on own — budget €15–25; comfortable walking shoes for cobblestones |

------------------------------------------------------------------------

### Day 12 — June 16: Lecce

YAML: `title: "Day 12 — June 16: Lecce"`, `subtitle: "The Florence of the South — Baroque limestone and a guided tour"`, `location: "Lecce / Masseria dei Monaci"`

| Section | Content |
|----|----|
| **Day at a Glance** | Base: Masseria dei Monaci; Meals: Breakfast + Lunch; Transport: tour drivers |
| **Morning** | Excursion to Lecce; cream-colored Baroque limestone architecture; ornate churches, grand piazzas, Roman ruins |
| **Midday** | Guided walking tour of historic center; arranged lunch at restaurant (included) |
| **Afternoon** | Return to masseria; pool, relax |
| **Evening** | Free — dinner at masseria or shuttle to Otranto |
| **Practical Notes** | Dinner on own tonight; masseria or drivers can shuttle to Otranto; Lecce shops sell local olive oil, wine, ceramics |

------------------------------------------------------------------------

### Day 13 — June 17: Ostuni → Putignano

YAML: `title: "Day 13 — June 17: Ostuni and the Move to Putignano"`, `subtitle: "The White City, an ancient olive grove, and a new home base"`, `location: "Ostuni → Putignano"`

| Section | Content |
|----|----|
| **Day at a Glance** | Accommodation changes today: Masseria dei Monaci → Petrantiche, Putignano; Meals: Breakfast + Lunch + Dinner; Transport: private drivers |
| **Morning** | Check out of Masseria dei Monaci; stop at Ostuni (La Città Bianca — whitewashed hilltop town); free time to explore and shop |
| **Midday** | Olive grove tour (ancient trees, family-run); olive oil tasting + light lunch (included) |
| **Afternoon** | Arrive Petrantiche Albergo Diffuso, Putignano — unique apartment-style rooms distributed through historic center; check in |
| **Evening** | Walking tour of Putignano; regional dinner (included) |
| **Practical Notes** | Ostuni has steep hills and stairs — good shoes essential; pack bags the night before for easy checkout; Petrantiche rooms are spread across the village within 200m of reception |

------------------------------------------------------------------------

### Day 14 — June 18: Alberobello

YAML: `title: "Day 14 — June 18: Alberobello"`, `subtitle: "UNESCO trulli, dry-stone architecture, and an evening food experience"`, `location: "Alberobello / Putignano"`

| Section | Content |
|----|----|
| **Day at a Glance** | Base: Petrantiche, Putignano; Meals: Breakfast + Dinner (food experience); Transport: tour drivers |
| **Morning** | Drive to Alberobello; walking tour of trulli (conical limestone dwellings, UNESCO World Heritage, prehistoric dry-stone construction) |
| **Afternoon** | Free lunch on own in Alberobello; return to Putignano, relax and refresh |
| **Evening** | Return to Alberobello; food experience (details provided by tour) |
| **Practical Notes** | Lunch on own — €15–25; trulli district can be crowded — morning walking tour beats the peak heat and crowds |

------------------------------------------------------------------------

### Day 15 — June 19: Matera

YAML: `title: "Day 15 — June 19: Matera"`, `subtitle: "UNESCO cave city, a lunch in a cave, and a farewell dinner"`, `location: "Matera / Putignano"`

| Section | Content |
|----|----|
| **Day at a Glance** | Base: Petrantiche, Putignano (last night); Meals: Breakfast + Lunch + Dinner; Transport: tour drivers |
| **Morning** | Drive to Matera (Basilicata); guided tour of Sassi di Matera — UNESCO World Heritage cave city, evidence of human settlement from Palaeolithic; cave churches |
| **Midday** | Lunch at cave restaurant (included) |
| **Afternoon** | Return to Putignano; free time for last-minute shopping or shuttle to Alberobello |
| **Evening** | Farewell dinner at local trattoria (included); celebration of the week |
| **Practical Notes** | Matera is technically in Basilicata, not Puglia — about 1.5hr drive; lots of walking on uneven stone paths; bring a layer (cave interiors are cool) |

------------------------------------------------------------------------

### Day 16 — June 20: Extensions only

Existing file covers: flights BDS → MUC → ORD → MSN.

**Prepend:** - New opening section: **Morning — Group Transport to Brindisi Airport** - Tour provides group transport from Putignano to Brindisi Airport (BDS) - Drivers depart early — confirm exact time via WhatsApp group the night before - Flight LH 1895 departs 10:55 AM — allow adequate time for check-in

------------------------------------------------------------------------

## Sidebar Updates (`_quarto.yml`)

Replace the five "Placeholder" sidebar entries:

``` yaml
# Before:
- text: "Day 11 (Jun 15) - Placeholder"
- text: "Day 12 (Jun 16) - Placeholder"
- text: "Day 13 (Jun 17) - Placeholder"
- text: "Day 14 (Jun 18) - Placeholder"
- text: "Day 15 (Jun 19) - Placeholder"

# After:
- text: "Day 11 (Jun 15) — Otranto"
- text: "Day 12 (Jun 16) — Lecce"
- text: "Day 13 (Jun 17) — Ostuni → Putignano"
- text: "Day 14 (Jun 18) — Alberobello"
- text: "Day 15 (Jun 19) — Matera"
```

------------------------------------------------------------------------

## Accommodations Reference

| Nights | Property | Location |
|----|----|----|
| Jun 14–16 (Days 10–12) | Masseria dei Monaci | Near Otranto, coastal |
| Jun 17–19 (Days 13–15) | Petrantiche Albergo Diffuso | Putignano historic center |

------------------------------------------------------------------------

## Out of Scope

-   `regions/puglia.qmd` — not updated in this implementation (separate pass)
-   `posts/puglia/` — left empty for trip journal entries written during/after the tour
-   No new files created — only existing files modified
