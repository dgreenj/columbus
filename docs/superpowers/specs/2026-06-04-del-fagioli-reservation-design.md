# Del Fagioli Reservation — Design Spec

**Date:** 2026-06-04\
**Project:** columbus (Italy trip planning)

## Summary

Record confirmed Del Fagioli reservation across three files: the day-5 itinerary, the restaurants reference page, and the June calendar.

## Reservation Details

-   **Restaurant:** Del Fagioli, Corso dei Tintori 47R, Santa Croce, Florence
-   **Date:** June 9, 2026 (Day 5)
-   **Party:** 2 people
-   **Time:** 7:30 PM
-   **Confirmation:** Confirmed (no reference code)

## Changes

### 1. `daily_itineraries/day-05-2026-06-09-florence.qmd`

-   **Callout line:** Change `Reservations required — confirm this is your booked night.` → `**Reservation confirmed** — 2 people, 7:30 PM.`
-   **Checklist:** Add `- [x] Del Fagioli reservation confirmed — 2 people, 7:30 PM`

### 2. `research/restaurants.qmd`

Add Del Fagioli to the Florence Traditional Tuscan section:

```         
**Del Fagioli** (Santa Croce — Corso dei Tintori 47R)
- Michelin Bib Gourmand — historic trattoria, open kitchen
- Bistecca alla Fiorentina (shared) or pici with aglione sauce
- House cantucci to finish
- Dinner hours 7:30–10:30 PM
- ✅ Reserved: June 9, 2 people, 7:30 PM
```

### 3. `research/june-calendar.qmd`

Two edits: - **June 9 cell `day-detail`:** Append `🍽 Del Fagioli 7:30pm` on a new `<br>` line - **"Reservations in Hand" table:** Add row `| Del Fagioli dinner | Confirmed | Jun 9 |`

## Out of Scope

-   No other restaurant reservations to add at this time
-   No changes to day-6 or other daily itineraries
