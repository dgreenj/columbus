# Columbus Continuity Audit Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Fix all continuity errors between the Columbus site's daily itinerary pages, ticket include files, and the June calendar so every surface agrees with the confirmed bookings.

**Architecture:** Pure content edits — no code, no scripts. Seven files change. The confirmed booking details on Day 4, 5, 7, and 8 pages are the source of truth; all other pages must align to them.

**Tech Stack:** Quarto Markdown (.qmd), plain Markdown (.md)

---

## Files Changing

| File | What changes |
|------|-------------|
| `daily_itineraries/day-03-2026-06-07-florence.qmd` | Full body rewrite — free exploration day replacing wrong Duomo/Uffizi content |
| `research/tickets-florence.md` | Full rewrite — old research plan → confirmed bookings (Ghiberti Pass, Private Tour) |
| `research/tickets-naples.md` | Full rewrite — old research plan → confirmed bookings (Walking Tour, Herculaneum) |
| `research/june-calendar.qmd` | Add 2 missing reservations; update Day 8 calendar cell |
| `daily_itineraries/day-06-2026-06-10-florence.qmd` | Fix "Next" nav link label |
| `daily_itineraries/day-09-2026-06-13-naples.qmd` | Fix "Previous" nav link label |
| `daily_itineraries/day-11-2026-06-15-puglia.qmd` | Fix tour duration (6 days → 5 days) |

---

## Task 1: Rewrite Day 3 as Free Exploration Day

**Files:**
- Modify: `daily_itineraries/day-03-2026-06-07-florence.qmd`

- [ ] **Step 1: Replace the entire file content**

Write the following complete content to `daily_itineraries/day-03-2026-06-07-florence.qmd`:

```markdown
---
title: "Day 3 — June 7: Florence — Explore at Leisure"
subtitle: "Day 3 - 6: Florence"
date: "2026-06-07"
day-of-week: "Sunday"
location: "Florence"
categories: [itinerary, florence, shopping, dining]
---

## Overview

First full day in Florence. No timed entries, no museum queues — today is for discovering the city at your own pace. Wander, eat, sit in a piazza, and get your bearings.

------------------------------------------------------------------------

## Morning: Coffee and the City Center

### Breakfast

Stand at the bar at a neighborhood café — order *un cappuccino e un cornetto, per favore*. Sitting down doubles the price and removes you from the local experience. Cost: €3–5.

### San Lorenzo & Mercato Centrale

The San Lorenzo market area (leather goods, scarves, souvenirs) surrounds the Mercato Centrale covered market. The ground floor has butchers, cheese, and produce; the upstairs food court is excellent for a late-morning snack or early lunch. Lively and genuine.

### Piazza della Repubblica

Florence's main square — built on the old Roman forum grid, with grand 19th-century arcades. Have a coffee at one of the historic cafés (Gilli, Paszkowski) if you want to splurge. Watch the street performers and the Florentine pace.

### Piazza della Signoria & the Loggia

The political heart of Renaissance Florence. Donatello's *Judith and Holofernes*, Cellini's *Perseus*, and a copy of Michelangelo's *David* stand in the open-air Loggia dei Lanzi — no ticket, no queue. Walk through slowly.

The Uffizi facade runs along one side. You'll be inside it Tuesday — today, just walk past it.

------------------------------------------------------------------------

## Afternoon: Oltrarno

### Cross the Ponte Vecchio

The 1345 medieval bridge, with jewelry shops built over the Arno. Cross it into the Oltrarno neighborhood — less touristed, quieter, more artisan.

### Oltrarno Streets

- Artisan workshops: leather, wood, bookbinding — many still open to the street
- Via Maggio and Via dei Serragli for antique shops
- Piazza Santo Spirito — a neighborhood square with a local café culture; the Basilica di Santo Spirito (free, worth a look inside) faces it

### Boboli Gardens (Optional)

Formal Renaissance gardens behind Palazzo Pitti. €10 entry. Good option if you want green space and shade in the afternoon.

------------------------------------------------------------------------

## Late Afternoon: Arno and the Bridge

Stroll back along the Arno embankment (Lungarno Acciaiuoli or Lungarno Corsini). The views of Ponte Vecchio from upstream are the best photos you'll take of it. Find a bench and sit.

------------------------------------------------------------------------

## Evening: Piazzale Michelangelo Sunset

### Getting There (Arrive 30 Min Before Sunset)

Sunset in Florence in June is around 8:30 PM.

- **Walk:** 20–25 min uphill from Ponte Vecchio — earn the view
- **Bus:** #12 or #13 from the station area
- **Taxi:** ~€10

### At Piazzale Michelangelo

Panoramic view of the entire city from the south hill. Bronze copy of *David* in the center. Street vendors, gelato cart, tourists from everywhere — none of that diminishes the view. Bring the camera and stay through golden hour.

------------------------------------------------------------------------

## Dinner (9–10 PM)

Walk or bus back down after sunset. Dinner in Oltrarno (convenient, less crowded than centro storico) or back in the center.

**What to try tonight:**

- *Pappardelle al cinghiale* — wide pasta with wild boar ragù (quintessentially Tuscan)
- *Ribollita* — thick Tuscan bread and vegetable soup
- House Chianti — ask for the *vino della casa rosso*, usually a carafe

See [Restaurants](../research/restaurants.qmd#florence-restaurants) for specific spots.

------------------------------------------------------------------------

## What to Bring

- [ ] Comfortable shoes (10,000+ steps)
- [ ] Water bottle (refill at public fountains — they're everywhere)
- [ ] Sunscreen, hat, sunglasses
- [ ] Camera (charge it tonight for tomorrow's Duomo visit)
- [ ] Light jacket (evenings cool)
- [ ] Some cash for markets

------------------------------------------------------------------------

## Notes & Reflections

**First impressions of the city:**

**Best thing stumbled upon:**

**Favorite café:**

**Steps walked today:**

------------------------------------------------------------------------

**Previous:** [Day 2: Arrive Florence](day-02-2026-06-06-arrive-florence.qmd) \| **Next:** [Day 4: Duomo Complex](day-04-2026-06-08-florence.qmd)
```

- [ ] **Step 2: Verify the file**

Open `daily_itineraries/day-03-2026-06-07-florence.qmd` and confirm:
- No mention of "Duomo dome climb," "timed entry," or "Uffizi Gallery"
- No "Reservations & Bookings" checklist
- Nav links: Previous = Day 2, Next = "Day 4: Duomo Complex"

- [ ] **Step 3: Commit**

```bash
git add daily_itineraries/day-03-2026-06-07-florence.qmd
git commit -m "Rewrite Day 3 as free Florence exploration day

Day 3 (June 7) previously contained Duomo and Uffizi content that
belongs to Days 4 and 5 respectively. Rewrites as an unscheduled
wandering day: San Lorenzo market, Oltrarno, Piazzale Michelangelo
sunset — no timed entries."
```

---

## Task 2: Rewrite tickets-florence.md to Reflect Confirmed Bookings

**Files:**
- Modify: `research/tickets-florence.md`

- [ ] **Step 1: Replace the entire file content**

Write the following complete content to `research/tickets-florence.md`:

```markdown
# Florence Ticket Booking — Days 4–5

> Generated by `scripts/ticket_agent.py` on 2026-04-19 13:48  
> **Manually updated 2026-05-25** — both Florence bookings are confirmed. The generator reflects the old research plan; do not re-run it without also updating the confirmed booking details below.

---

## Day 4 — Monday June 8

### Ghiberti Pass — Duomo Complex

**Confirmed booking**

| | |
|---|---|
| **Booking ref** | 87-MKTRBNH |
| **External confirmation** | SPW9A3V3D333 |
| **Valid dates** | June 8–10 |

**What's included:**

- **Santa Reparata crypt** — timed entry **10:30 AM, Porta Campanile entrance** — fixed, cannot be rescheduled. Arrive by 10:20 AM.
- **Baptistery of San Giovanni** — North Door entrance; Ghiberti's bronze doors
- **Opera del Duomo Museum** — Piazza del Duomo 9; originals of Gates of Paradise, Michelangelo's Bandini Pietà, Donatello's Mary Magdalene

⚠️ **No backpacks** — mandatory luggage storage at Piazza Duomo 38/r before entering any component.

---

## Day 5 — Tuesday June 9

### Private Uffizi Gallery + Accademia Tour (David)

**Confirmed booking**

| | |
|---|---|
| **Booking ref** | 1391099919 (Viator) |
| **Guests** | 2 adults |
| **Cost** | USD $536.82 |
| **Tour type** | Private, English-language |

**Meeting point:** Via dei Castellani, 14, 50122 Firenze FI — the street running along the east side of the Uffizi, facing the Arno.  
**Time:** 9:00 AM sharp — arrive by 8:50 AM. Look for your guide at the entrance.  
**Cancellation deadline:** 9:00 AM Central European Summer Time the day before.

**What's covered:** Uffizi Gallery (Botticelli, Leonardo, Michelangelo, Titian) + Galleria dell'Accademia (Michelangelo's David, the Prisoners).

---

## Booking Summary

| Booking | Ref | Date | Status |
|---------|-----|------|--------|
| Ghiberti Pass — Duomo complex | 87-MKTRBNH | Jun 8–10 | ✅ Confirmed |
| Private Uffizi + Accademia | 1391099919 (Viator) | Jun 9 | ✅ Confirmed |
```

- [ ] **Step 2: Verify the file**

Open `research/tickets-florence.md` and confirm:
- No mention of "Day 3" Duomo or Uffizi
- No checkboxes for Medici Chapels, San Lorenzo, Palazzo Vecchio, or San Marco
- Day 4 = Ghiberti Pass (87-MKTRBNH), Day 5 = Private Tour (1391099919)

- [ ] **Step 3: Commit**

```bash
git add research/tickets-florence.md
git commit -m "Update tickets-florence.md to reflect confirmed bookings

Replace old research plan (Day 3 Duomo + Day 4 Accademia/Medici) with
actual confirmed bookings: Ghiberti Pass on Day 4, Private Uffizi +
Accademia tour on Day 5."
```

---

## Task 3: Rewrite tickets-naples.md to Reflect Confirmed Bookings

**Files:**
- Modify: `research/tickets-naples.md`

- [ ] **Step 1: Replace the entire file content**

Write the following complete content to `research/tickets-naples.md`:

```markdown
# Naples Ticket Booking — Days 7–9

> Generated by `scripts/ticket_agent.py` on 2026-04-19 13:48  
> **Manually updated 2026-05-25** — Days 7 and 8 bookings are confirmed. The generator reflects the old research plan; do not re-run it without also updating the confirmed booking details below.

---

## Day 7 — Thursday June 11

### Naples City Walking Tour with Underground Roman Ruins

**Confirmed booking**

| | |
|---|---|
| **Booking ref** | GYGWZAX648G5 (GetYourGuide) |
| **Provider** | WORLDTOURS S.r.l. |
| **Contact** | Alessia |
| **Group size** | Semi-private, max 8 people |
| **Lunch** | Included |

**Pickup:** 8:30 AM — outside Fontana del Nettuno, Piazza Municipio, 80133 Napoli. Arrive by 8:20 AM. Look for the WORLDTOURS guide.

**What's covered:** Historic center streets and Spaccanapoli above ground; ancient Roman cisterns and tunnels underground; lunch at a local restaurant.

---

## Day 8 — Friday June 12

### From Naples — Mount Vesuvius & Herculaneum Day Trip

**Confirmed booking**

| | |
|---|---|
| **Booking ref** | #31374926 |
| **Provider** | Naples Tickets by Headout |
| **Free cancellation** | Until 9:20 AM, June 11, 2026 |

**Meet:** 9:20 AM — Via Galileo Ferraris n.40, Naples IT 80142 (Naples Center).

**What's covered:** Herculaneum ruins (2–3 hours) + Mount Vesuvius crater hike (~30 min from parking).

### Afternoon Option: Cappella Sansevero (Veiled Christ)

**Not booked** — book timed entry if you want to go after the tour returns.

| | |
|---|---|
| **Cost** | €9 |
| **Notes** | Tiny chapel, very limited timed slots; no photography |
| **Location** | Near Piazza San Domenico Maggiore |
| **Booking** | museosansevero.it/en/tickets |

---

## Day 9 — Saturday June 13

> **Note:** Flight departs Naples 3:05 PM. Morning only for activities — leave for the airport by 1:30 PM.

### Napoli Sotterranea (Underground Naples) — Optional

**Not booked** — book if the morning allows. A 10 AM tour finishes by 11:30 AM, leaving time to get to the airport.

| | |
|---|---|
| **Duration** | 90 minutes |
| **Booking** | napolisotterranea.org |
| **Content** | Ancient Roman theater + WWII air raid shelters, 40 m underground |

---

## Booking Summary

| Booking | Ref | Date | Status |
|---------|-----|------|--------|
| Naples City Walking Tour | GYGWZAX648G5 (GetYourGuide) | Jun 11 | ✅ Confirmed |
| Herculaneum & Vesuvius | #31374926 (Headout) | Jun 12 | ✅ Confirmed |
| Cappella Sansevero | — | Jun 12 afternoon | ⬜ Optional — book if interested |
| Napoli Sotterranea | — | Jun 13 morning | ⬜ Optional — book if time allows |
```

- [ ] **Step 2: Verify the file**

Open `research/tickets-naples.md` and confirm:
- Day 7 = Naples Walking Tour (GYGWZAX648G5), not Herculaneum
- Day 8 = Herculaneum & Vesuvius (#31374926), not MANN
- Cappella Sansevero appears as an optional afternoon item for Day 8, not a primary booking

- [ ] **Step 3: Commit**

```bash
git add research/tickets-naples.md
git commit -m "Update tickets-naples.md to reflect confirmed bookings

Replace old research plan (Day 7 Herculaneum, Day 8 MANN) with actual
confirmed bookings: Naples Walking Tour on Day 7, Herculaneum & Vesuvius
on Day 8. Cappella Sansevero retained as optional afternoon item."
```

---

## Task 4: Fix June Calendar — Missing Reservations and Day 8 Cell

**Files:**
- Modify: `research/june-calendar.qmd`

- [ ] **Step 1: Add the two missing Naples bookings to the Reservations table**

In `research/june-calendar.qmd`, find the "Reservations in Hand" table (near the bottom of the file, after the HTML calendar). The current table ends with:

```markdown
| Hotel Executive Inn, Brindisi          | 73435335535420 | Jun 13–14 |
```

Add two rows immediately after that line so the table becomes:

```markdown
| Hotel Executive Inn, Brindisi          | 73435335535420 | Jun 13–14 |
| Naples Walking Tour (GetYourGuide)     | GYGWZAX648G5   | Jun 11    |
| Herculaneum & Vesuvius (Headout)       | #31374926      | Jun 12    |
```

- [ ] **Step 2: Update the Day 8 calendar cell**

In the same file, find the Day 8 (June 12) table cell. It currently reads:

```html
  <td class="naples">
    <span class="day-num">12</span>
    <span class="day-label">🏺 Day 8 — Naples</span>
    <span class="day-detail">Herculaneum &amp; Vesuvius<br>Tour (details TBD)<br>Cappella Sansevero option</span>
  </td>
```

Replace the `day-detail` span so it reads:

```html
  <td class="naples">
    <span class="day-num">12</span>
    <span class="day-label">🏺 Day 8 — Naples</span>
    <span class="day-detail">Herculaneum &amp; Vesuvius<br>Meet 9:20am Via Galileo Ferraris<br>Booking #31374926</span>
  </td>
```

- [ ] **Step 3: Verify both changes**

Open `research/june-calendar.qmd` and confirm:
- Table has 11 rows total (9 original + 2 new)
- Day 8 cell no longer says "Tour (details TBD)"
- Day 8 cell shows "Meet 9:20am Via Galileo Ferraris" and "Booking #31374926"

- [ ] **Step 4: Commit**

```bash
git add research/june-calendar.qmd
git commit -m "Fix june-calendar: add missing Naples bookings, update Day 8 cell

Add Naples Walking Tour (GYGWZAX648G5) and Herculaneum & Vesuvius
(#31374926) to Reservations in Hand table. Remove 'details TBD' from
Day 8 calendar cell — booking is confirmed."
```

---

## Task 5: Fix Navigation Links and Day 11 Placeholder

**Files:**
- Modify: `daily_itineraries/day-06-2026-06-10-florence.qmd`
- Modify: `daily_itineraries/day-09-2026-06-13-naples.qmd`
- Modify: `daily_itineraries/day-11-2026-06-15-puglia.qmd`

- [ ] **Step 1: Fix Day 6 "Next" nav link**

In `daily_itineraries/day-06-2026-06-10-florence.qmd`, find the last line:

```markdown
**Previous:** [Day 5](day-05-2026-06-09-florence.qmd) | **Next:** [Day 7: Naples — Herculaneum](day-07-2026-06-11-florence-to-naples.qmd)
```

Replace with:

```markdown
**Previous:** [Day 5: Uffizi & Accademia](day-05-2026-06-09-florence.qmd) | **Next:** [Day 7: Naples Walking Tour](day-07-2026-06-11-florence-to-naples.qmd)
```

- [ ] **Step 2: Fix Day 9 "Previous" nav link**

In `daily_itineraries/day-09-2026-06-13-naples.qmd`, find the last line:

```markdown
**Previous:** [Day 8: Naples Museums & City](day-08-2026-06-12-naples-herculaneum.qmd) | **Next:** [Day 10: First Day in Puglia](day-10-2026-06-14-naples-to-brindisi.qmd)
```

Replace with:

```markdown
**Previous:** [Day 8: Herculaneum & Vesuvius](day-08-2026-06-12-naples-herculaneum.qmd) | **Next:** [Day 10: First Day in Puglia](day-10-2026-06-14-naples-to-brindisi.qmd)
```

- [ ] **Step 3: Fix Day 11 tour duration**

In `daily_itineraries/day-11-2026-06-15-puglia.qmd`, find:

```markdown
**Tour Duration:** 6 days (June 14-19)
```

Replace with:

```markdown
**Tour Duration:** 5 days (June 15–19)
```

- [ ] **Step 4: Verify all three changes**

- Day 6 last line: "Next" says "Day 7: Naples Walking Tour"
- Day 9 last line: "Previous" says "Day 8: Herculaneum & Vesuvius"
- Day 11 body: says "5 days (June 15–19)" not "6 days (June 14–19)"

- [ ] **Step 5: Commit**

```bash
git add daily_itineraries/day-06-2026-06-10-florence.qmd \
        daily_itineraries/day-09-2026-06-13-naples.qmd \
        daily_itineraries/day-11-2026-06-15-puglia.qmd
git commit -m "Fix nav link labels and Day 11 tour duration

- Day 6 Next: 'Naples — Herculaneum' → 'Naples Walking Tour'
- Day 9 Previous: 'Naples Museums & City' → 'Herculaneum & Vesuvius'
- Day 11: tour duration 6 days (June 14–19) → 5 days (June 15–19)"
```

---

## Self-Review

**Spec coverage check:**

| Spec item | Task |
|-----------|------|
| Day 3 rewrite — free exploration day | Task 1 |
| tickets-florence.md → confirmed bookings | Task 2 |
| tickets-naples.md → confirmed bookings | Task 3 |
| June calendar — add 2 missing reservations | Task 4 Step 1 |
| June calendar — Day 8 cell remove TBD | Task 4 Step 2 |
| Day 6 nav "Next" label fix | Task 5 Step 1 |
| Day 9 nav "Previous" label fix | Task 5 Step 2 |
| Day 11 tour duration fix | Task 5 Step 3 |

All 8 spec requirements covered. No gaps.

**Placeholder scan:** No TBDs or incomplete steps. All file content is complete and ready to paste.

**Consistency check:** File paths and booking references are used consistently across tasks:
- Ghiberti Pass = 87-MKTRBNH throughout
- Private tour = 1391099919 (Viator) throughout
- Naples Walking Tour = GYGWZAX648G5 throughout
- Herculaneum tour = #31374926 throughout
