# Columbus Site Update — Design Spec
**Date:** 2026-04-30  
**Project:** `/home/gramps/rstudio/quarto/columbus/`  
**Scope:** Sync confirmed reservations into site content; add PDF print option to calendar

---

## Summary of Confirmed Reservations

| What | Confirmation | Dates |
|------|-------------|-------|
| Outbound flights (Lufthansa) | FMWYOJ | Jun 5–6 |
| Return flights (Lufthansa/United) | FMWYOJ | Jun 20 |
| Florence hotel (details TBD — in triangle, file not yet added) | — | Jun 6–10 |
| Ghiberti Pass — Duomo complex | 87-MKTRBNH / SPW9A3V3D333 | Jun 8 |
| Viator Private Uffizi + Accademia | 1391099919 | Jun 9 |
| Italo train Florence → Naples | PIDCMA | Jun 10 |
| Naples Airbnb — Casa Wenner | HMTBH3HCCX | Jun 10–13 |
| Naples City Walking Tour (GetYourGuide) | GYGWZAX648G5 | Jun 11 |
| Herculaneum & Vesuvius tour (confirmed, file TBD) | — | Jun 12 |
| ITA Airways NAP→FCO→BDS | IXYZMT | Jun 13 |
| Hotel Executive Inn, Brindisi (Expedia) | 73435335535420 | Jun 13–14 |
| Puglia multi-day tour | — | Jun 15–19 (TBD) |

---

## Files to Update (Chronological — Option A)

### 1. `research/june-calendar.qmd`

**Front-matter:** Add `page-layout: full` — works with existing `@media print` CSS for clean browser print-to-PDF.

**Calendar cell changes:**
- **Jun 8 (Day 4):** Replace "Accademia — David / Medici Chapels / Mercato Centrale"  
  → "Ghiberti Pass / Baptistery + Duomo Museum / Santa Reparata 10:30am ⚠️"
- **Jun 9 (Day 5):** Replace "Bargello Museum / Santa Croce / Local neighborhoods"  
  → "Private Uffizi + Accademia / Tour 9:00am / Via dei Castellani 14"
- **Jun 11 (Day 7):** Update "Herculaneum ruins / Ancient Roman city / MANN Museum option"  
  → "Naples Walking Tour / Underground ruins + lunch / Pickup 8:30am Piazza Municipio"
- **Jun 12 (Day 8):** Update "MANN Museum / Cappella Sansevero / Spaccanapoli"  
  → "Herculaneum & Vesuvius / Tour (details TBD) / Cappella Sansevero option"

**"Reservations in Hand" table** — add four rows:

| What | Code | Date |
|------|------|------|
| Ghiberti Pass — Duomo complex | 87-MKTRBNH | Jun 8 |
| Viator — Private Uffizi + Accademia | 1391099919 | Jun 9 |
| Naples Airbnb — Casa Wenner | HMTBH3HCCX | Jun 10–13 |
| Hotel Executive Inn, Brindisi | 73435335535420 | Jun 13–14 |

---

### 2. `daily_itineraries/day-04-2026-06-08-florence.qmd`

**Complete content rewrite.** New focus: Ghiberti Pass day.

- Title/subtitle: "Day 4: Florence — Duomo Complex" / "Ghiberti Pass: Baptistery, Opera del Duomo Museum & Santa Reparata"
- **Morning anchor: 10:30 AM SHARP** — Santa Reparata timed entry (cannot be rescheduled)
- **Critical warning:** NO backpacks — mandatory luggage storage at Piazza Duomo 38/r before entering
- Also valid same-day on Ghiberti Pass: Baptistery (North Door), Opera del Duomo Museum (Piazza del Duomo 9)
- Booking ref 87-MKTRBNH / external confirmation SPW9A3V3D333
- **Afternoon: open** — no planned activities; rest or wander as desired

---

### 3. `daily_itineraries/day-05-2026-06-09-florence.qmd`

**Complete content rewrite.** New focus: Private Uffizi + Accademia tour.

- Title/subtitle: "Day 5: Florence — Uffizi & Accademia" / "Private Tour: Uffizi Gallery + Accademia (David) — 9:00 AM"
- **Morning anchor: 9:00 AM** — meeting at Via dei Castellani 14, 50122 Firenze (outside Uffizi entrance)
- Private English-language tour, 2 adults; Viator booking 1391099919; USD $536.82
- Cancellation deadline: 09:00 AM CEST
- Afternoon: free for Florence as desired

---

### 4. `daily_itineraries/day-06-2026-06-10-florence.qmd`

**Targeted additions only.** This is the train-to-Naples day.

- Add Naples Airbnb details:
  - Casa Wenner Large, Via Monte di Dio 66, Naples 80132
  - Host: Pierfrancesco (+39 335 607 1111), Antonella (+39 320 118 6998)
  - Check-in: 3:00 PM; confirmation HMTBH3HCCX
- Add timing callout: Italo train arrives Naples 3:28 PM; taxi from Centrale to Via Monte di Dio ~15–20 min; plan on arriving at Airbnb ~3:45–4:00 PM (no problem, well after 3 PM check-in)

---

### 5. `daily_itineraries/day-07-2026-06-11-florence-to-naples.qmd`

**Complete content rewrite.** New focus: Naples City Walking Tour.

- Title/subtitle: "Day 7: Naples — City Walking Tour" / "Underground Roman Ruins, Historic Center & Lunch — 8:30 AM"
- **Morning anchor: 8:30 AM** — pickup at Fontana del Nettuno, Piazza Municipio 80133 Naples (arrive 10 min early)
- Semi-private group, max 8 pax; includes lunch; provider WORLDTOURS S.r.l.
- Booking ref GYGWZAX648G5 (GetYourGuide); contact: Alessia
- Afternoon: free (Cappella Sansevero and Spaccanapoli as optional suggestions)

---

### 6. `daily_itineraries/day-08-2026-06-12-naples-herculaneum.qmd`

**Targeted update.** Herculaneum & Vesuvius moves here (confirmed, booking details TBD).

- Note Herculaneum is the confirmed main event for Jun 12
- Retain existing content structure; add "Confirmed — details to be added when confirmation file is available"
- Remove MANN Museum as primary suggestion (it was already here as an option; keep as afternoon option)

---

### 7. `daily_itineraries/day-09-2026-06-13-naples.qmd`

**Two fixes + additions.**

- Fix checkout: "aim to check out by noon" → **must vacate by 10:00 AM** (Airbnb rule; hard checkout)
- Add Hotel Executive Inn: Via Pozzo Traiano 24, Brindisi 72100
- Check-in: 2:00 PM; Expedia itinerary 73435335535420 (they arrive 6:25 PM — no issue)

---

### 8. `research/accommodations.qmd`

**Update three sections.**

- **Florence:** Replace hypothetical options with placeholder — confirmed booking in the historic triangle; reservation file to be added
- **Naples:** Replace hypothetical options with confirmed Airbnb:  
  Casa Wenner Large, Via Monte di Dio 66, Naples 80132  
  Check-in: Wed Jun 10 3:00 PM / Checkout: Sat Jun 13 10:00 AM  
  Conf HMTBH3HCCX; host Pierfrancesco (+39 335 607 1111), Antonella (+39 320 118 6998)
- **Brindisi:** Replace hypothetical options with confirmed hotel:  
  Hotel Executive Inn, Via Pozzo Traiano 24, Brindisi 72100  
  Check-in: Sat Jun 13 2:00 PM / Checkout: Sun Jun 14  
  Expedia itinerary 73435335535420; total €166.48
- **Puglia (multi-day):** No change — pending tour confirmation

---

### 9. `research/tours.qmd`

**Add three confirmed bookings.**

- **Florence (Jun 8):** Ghiberti Pass — confirmed ticket purchase, not a guided tour; cross-reference to Day 4 itinerary
- **Florence (Jun 9):** Viator Private Uffizi + Accademia — confirmed; booking ref 1391099919; 9:00 AM, Via dei Castellani 14
- **Naples (Jun 11):** Naples City Walking Tour w/ Underground Roman Ruins + Lunch — semi-private max 8; GetYourGuide ref GYGWZAX648G5; 8:30 AM, Piazza Municipio; provider WORLDTOURS S.r.l.
- **Naples (Jun 12):** Herculaneum & Vesuvius — confirmed booked; details TBD (confirmation file pending)
- Puglia: no change — still TBD

---

### 10. `index.qmd`

**One factual correction.**

- Fix "June 13 (Day 10): Journey to Puglia — Scenic train ride through the Apennines and down the Adriatic coast"  
  → Two ITA Airways flights: NAP→FCO (AZ 1270, departs 3:05 PM) then FCO→BDS (AZ 1623, departs 5:15 PM), arrive Brindisi 6:25 PM

---

## Execution Approach

Option A — chronological file order as listed above. Render via `docker exec rstudio quarto render /home/rstudio/Quarto/columbus` after all edits are complete, then commit.

## What Remains Pending (not in scope of this update)

- Florence hotel: confirmation file to be added to `reservations/` when available
- Herculaneum & Vesuvius: confirmation file to be added; Day 8 update will need a follow-up pass
- Puglia multi-day tour: still being finalized
