# Columbus Site Continuity Audit — Design

**Date:** 2026-05-25  
**Scope:** Approach B — fix all continuity errors across daily pages, tickets include files, and the June calendar

---

## Problem Summary

The site has accumulated several content inconsistencies between the daily itinerary pages and the actual confirmed bookings. The primary source of truth is the confirmed booking details embedded in the daily pages (Days 4, 5, 7, 8) and the June Calendar "Reservations in Hand" table. Everything else should align to those.

---

## Files to Change

### 1. `daily_itineraries/day-03-2026-06-07-florence.qmd` — Full rewrite

**Current state:** Content describes a Duomo morning and Uffizi afternoon — both wrong for this date. Reservations checklist asks about Duomo dome climb and Uffizi timed entry.

**Correct state:** Day 3 is a free exploration day. No timed museum entries. Content should cover:
- Morning: neighborhood walk (Piazza della Repubblica, San Lorenzo market, Mercato Centrale)
- Afternoon: Oltrarno district across the Arno — artisan workshops, piazzas, leather shops; Boboli Gardens if inclined
- Late afternoon: Ponte Vecchio browse, Arno riverbank
- Evening: Piazzale Michelangelo for sunset (~8:30 PM in June) — free, no booking needed
- Dinner suggestions (wild boar pasta, ribollita, house Chianti)
- Checklist: comfortable shoes, camera, no museum confirmations needed
- Notes/reflections section (blank for trip journaling)
- Retain the subtitle ("Day 3–6: Florence") and nav links

Remove: all Duomo Complex section, all Uffizi section, Reservations & Bookings checklist (or replace with dinner-only placeholder).

### 2. `research/tickets-florence.md` — Rewrite to match actual bookings

**Current state (old research plan):**
- Day 3: Duomo combo ticket + Uffizi
- Day 4: Accademia, Medici Chapels, San Lorenzo, Palazzo Vecchio (optional), San Marco (optional)

**Correct state (actual bookings):**
- Day 4 (June 8): Ghiberti Pass (87-MKTRBNH) — Santa Reparata (timed 10:30 AM), Baptistery, Opera del Duomo Museum
- Day 5 (June 9): Private Uffizi + Accademia tour (Viator 1391099919) — meeting point Via dei Castellani 14, 9:00 AM

Booking checklist should reflect only confirmed bookings, marked as booked (not open checkboxes). Remove all unbooked options (Medici Chapels, San Lorenzo, Palazzo Vecchio, San Marco).

Note at top: this file was manually updated — the `scripts/ticket_agent.py` generator reflects the old research plan.

### 3. `research/tickets-naples.md` — Rewrite to match actual bookings

**Current state (old research plan):**
- Day 7 (June 11): Herculaneum
- Day 8 (June 12): MANN + Cappella Sansevero

**Correct state (actual bookings):**
- Day 7 (June 11): Naples City Walking Tour w/ Underground Ruins (GetYourGuide GYGWZAX648G5) — pickup 8:30 AM, Fontana del Nettuno, Piazza Municipio; semi-private max 8; lunch included
- Day 8 (June 12): Herculaneum & Vesuvius Day Trip (Naples Tickets by Headout #31374926) — meet 9:20 AM, Via Galileo Ferraris n.40

Cappella Sansevero remains as an option for Day 8 afternoon (it's on the Day 8 page as an afternoon option, not a confirmed booking).

Note at top: this file was manually updated — the generator reflects the old research plan.

### 4. `research/june-calendar.qmd` — Two fixes

**Fix A — Add missing reservations to "Reservations in Hand" table:**
Add two rows:
| Naples Walking Tour (GetYourGuide) | GYGWZAX648G5 | Jun 11 |
| Herculaneum & Vesuvius (Headout) | #31374926 | Jun 12 |

**Fix B — Day 8 calendar cell:** Remove "Tour (details TBD)" — replace with confirmed details matching the Day 8 page:
```
Herculaneum & Vesuvius
Meet 9:20am Via Galileo Ferraris
Booking #31374926
```

### 5. `daily_itineraries/day-06-2026-06-10-florence.qmd` — Nav link fix

**Current:** `**Next:** [Day 7: Naples — Herculaneum](...)`  
**Fix:** `**Next:** [Day 7: Naples Walking Tour](...)`

### 6. `daily_itineraries/day-09-2026-06-13-naples.qmd` — Nav link fix

**Current:** `**Previous:** [Day 8: Naples Museums & City](...)`  
**Fix:** `**Previous:** [Day 8: Herculaneum & Vesuvius](...)`

### 7. `daily_itineraries/day-11-2026-06-15-puglia.qmd` — Placeholder date fix

**Current:** `**Tour Duration:** 6 days (June 14-19)`  
**Fix:** Remove the date range; Day 10 (June 14) is a free Brindisi day, not a tour day. Change to: `**Tour Duration:** 5 days (June 15–19)` or remove the duration line entirely since it's a placeholder page.

---

## What's Not Changing

- Day 4, 5, 7, 8 pages — these are the source of truth; content is correct
- All other daily pages — no continuity errors found
- Navigation structure, `_quarto.yml`, CSS, accommodations, flights, trains pages
- The `scripts/ticket_agent.py` script itself — out of scope

---

## Success Criteria

After fixes:
- Day 3 content matches its title (free exploration, no museum bookings)
- All three "reservations" surfaces (day pages, tickets pages, june calendar) agree on what's booked and when
- Nav links in Days 6 and 9 use correct day titles
- No page references a Duomo climb or Uffizi visit for June 7
