# Columbus Site Navigation Restructure — Design Spec

**Date:** 2026-05-18  
**Project:** `/home/gramps/rstudio/quarto/columbus`  
**Status:** Approved

---

## Problem

The current site conflates two distinct content types under the "Pre-Trip Planning" sidebar section and the "Research" navbar menu:

- **Actual plans** — confirmed bookings with reservation codes, flight numbers, seat assignments
- **Informational research** — general guidance, comparisons, tips for making decisions

Specifically:
- `research/flights.qmd` ("Flights to Italy") is almost entirely informational research, but sits in Pre-Trip Planning. The only actual booking content (Naples→Brindisi ITA Airways) is buried at the bottom.
- `research/trains.qmd` ("Train Travel in Italy") mixes one booked segment (Florence→Naples Italo), one changed segment (Naples→Brindisi, now a flight), and a large body of general informational content.
- The transatlantic flights (FMWYOJ) are documented in the daily itineraries (Day 1, Day 2, Day 16) but have no dedicated Pre-Trip Planning summary page.

---

## Goal

- Pre-Trip Planning shows only **what we are doing** (confirmed bookings and actual plans)
- Resources shows **how things work** (informational reference, research notes)
- Navigation is unambiguous about what each page contains

---

## Files

### Revised Files

#### `research/flights.qmd` → "Flights to Italy"

Replaces existing content entirely. This page becomes the canonical reference for all booked international flights.

**Content:**

**Outbound — June 5-6 (Reservation FMWYOJ)**

| # | Flight | Operator | Route | Departs | Arrives | Cabin | Seats |
|---|--------|----------|-------|---------|---------|-------|-------|
| 1 | LH 8835 | GoJet/United Express | MSN → ORD | Jun 5, 5:45pm | 7:00pm | Economy | 15C (Dan), 15D (Jane) |
| 2 | LH 0433 | Lufthansa | ORD → FRA | Jun 5, 10:30pm | Jun 6, 2:05pm | Premium Economy | — |
| 3 | LH 9498 | Air Dolomiti | FRA → FLR | Jun 6, 4:50pm | 6:30pm | Economy | — |

**Return — June 20 (Reservation FMWYOJ)**

| # | Flight | Operator | Route | Departs | Arrives | Cabin | Seats |
|---|--------|----------|-------|---------|---------|-------|-------|
| 1 | LH 1895 | Air Dolomiti | BDS → MUC | Jun 20, 10:55am | 12:45pm | Economy | — |
| 2 | UA 8855 | Lufthansa for United | MUC → ORD | Jun 20, 3:40pm | 6:15pm | Premium Economy | — |
| 3 | UA 1400 | United | ORD → MSN | Jun 20, 9:15pm | 10:27pm | Premium Economy | 08D (Dan), 08E (Jane) |

Cross-links: Day 1, Day 2 (outbound); Day 16 (return); Travel in Italy (intra-Italy).

---

#### `research/trains.qmd` — removed from navigation

File remains on disk but is no longer referenced in `_quarto.yml`. Its content is split: booked segments → `research/travel-in-italy.qmd`; informational content → `resources/train-travel.qmd`.

---

### New Files

#### `research/travel-in-italy.qmd` — "Travel in Italy"

New page. Covers all booked intra-Italy transport in trip order.

**Segment 1: Florence → Naples by Train (June 10) — BOOKED**

- Operator: Italo, Train #8902
- Reservation: PIDCMA
- Route: Firenze SMN → Napoli Centrale
- Departs: 12:28pm | Arrives: 3:28pm
- Car: Salotto 1 (Lounge) — Seats: Jane (1), Dan (2)
- Duration: 3 hours

Cross-link: Day 7 (Florence → Naples travel day).

**Segment 2: Naples → Brindisi by Flight (June 13) — BOOKED**

- Operator: ITA Airways (AZ)
- Reservation: IXYZMT | Airline code: BY4EV5
- Baggage: 2×23kg checked + 1×8kg carry-on per person

| Flight | Route | Departs | Arrives |
|--------|-------|---------|---------|
| AZ 1270 | NAP → FCO | 3:05pm | 4:05pm |
| AZ 1623 | FCO → BDS | 5:15pm | 6:25pm |

Note: No direct NAP→BDS service exists; FCO hub connection is the only option.

Cross-link: Day 9 (Naples departure day).

---

#### `resources/flight-research.qmd` — "Flight Research"

New page in new `resources/` directory. Contains all informational content extracted from the old `research/flights.qmd`:

- Pisa vs. Florence airport comparison
- Outbound route options (airline/hub/price/class comparisons)
- Economy, Business, and First Class options
- Return flight considerations (FCO logistics)
- Booking strategy and timing
- Seat selection tips
- Luggage allowances
- Important links (booking sites, airport info, travel docs)
- Pre-flight checklist (3 months / 1 month / 1 week / day before / day of)

Does **not** include: the Naples→Brindisi booking (that's in Travel in Italy).

---

#### `resources/train-travel.qmd` — "Train Travel in Italy"

New page in `resources/` directory. Contains all informational content extracted from `research/trains.qmd`:

- Booking websites (Trenitalia, Italo)
- Booking timing and strategy
- Fare classes (Trenitalia and Italo)
- At the station (arrival times, ticket validation)
- On the train (luggage, seating, quiet cars)
- Station information (SMN Florence, Napoli Centrale, Bari, Brindisi)
- Luggage storage options
- Important links and apps
- Train travel checklist

Does **not** include: Florence→Naples booked segment or Naples→Brindisi changed-to-flight segment (both in Travel in Italy).

---

## Navigation Changes

### Sidebar (`_quarto.yml`)

**Pre-Trip Planning section** — two changes:
1. `research/trains.qmd` removed
2. `research/travel-in-italy.qmd` added after `research/flights.qmd`

```yaml
- section: "Pre-Trip Planning"
  contents:
    - research/june-calendar.qmd
    - research/pre-departure-checklist.qmd
    - research/flights.qmd          # revised: actual international flights
    - research/travel-in-italy.qmd  # NEW: actual intra-Italy transport
    - research/accommodations.qmd
    - research/tours.qmd
    - research/museums.qmd
    - research/tickets-florence.qmd
    - research/tickets-naples.qmd
    - research/restaurants.qmd
    - research/packing-list.qmd
```

**New Resources section** — added after Pre-Trip Planning, before the daily itinerary day sections:

```yaml
- text: "---"

- section: "Resources"
  contents:
    - resources/flight-research.qmd
    - resources/train-travel.qmd
```

### Navbar (`_quarto.yml`)

**Research dropdown** — update two entries, remove one:
- "Flights" → "Flights to Italy" (href: `research/flights.qmd`)
- Remove "Trains" entry
- Add "Travel in Italy" (href: `research/travel-in-italy.qmd`)

**New Resources dropdown** — added after Research:

```yaml
- text: "Resources"
  menu:
    - text: "Flight Research"
      href: resources/flight-research.qmd
    - text: "Train Travel in Italy"
      href: resources/train-travel.qmd
```

---

## Cross-Link Updates

The daily itinerary files reference the old pages. These need updating:

| File | Old Link | New Link |
|------|----------|----------|
| `day-01-*.qmd` | `../research/flights.qmd` | `../research/flights.qmd` (no change — URL stays same) |
| `day-07-*.qmd` (Florence→Naples) | `../research/trains.qmd` | `../research/travel-in-italy.qmd` |
| `day-09-*.qmd` (Naples departure) | `../research/flights.qmd` and/or `../research/trains.qmd` | `../research/travel-in-italy.qmd` |
| `research/trains.qmd` footer | links to accommodations | N/A (file not in nav) |

Also: `resources/flight-research.qmd` and `resources/train-travel.qmd` should cross-link to each other and to the Pre-Trip Planning actual pages.

---

## Out of Scope

- Renaming the "Research" navbar label to "Pre-Trip Planning" (not requested)
- Modifying any daily itinerary content beyond cross-link updates
- Removing `research/trains.qmd` from disk (leave it; just remove from nav)
- Any changes to Accommodations, Tours, Museums, Tickets, Restaurants, or Packing List pages
