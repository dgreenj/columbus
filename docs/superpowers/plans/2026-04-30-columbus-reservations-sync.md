# Columbus Reservations Sync Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Sync all confirmed reservation details into the Columbus Quarto site — updating the calendar, 6 daily itinerary files, the accommodations page, the tours page, and the homepage.

**Architecture:** Chronological file-by-file edits (Option A). Complete rewrites for day-04, day-05, and day-07 where the current content is entirely wrong; targeted edits for all other files. Render each file individually after editing to catch YAML/Quarto errors before the next task.

**Tech Stack:** Quarto `.qmd` files (YAML front-matter + Markdown + HTML blocks); rendered via `docker exec rstudio quarto render /home/rstudio/Quarto/columbus/<path> --quiet`

---

## File Map

| File | Change Type |
|------|-------------|
| `research/june-calendar.qmd` | Front-matter + 4 cell edits + table additions |
| `daily_itineraries/day-04-2026-06-08-florence.qmd` | Complete rewrite |
| `daily_itineraries/day-05-2026-06-09-florence.qmd` | Complete rewrite |
| `daily_itineraries/day-06-2026-06-10-florence.qmd` | Targeted additions (Airbnb details + timing) |
| `daily_itineraries/day-07-2026-06-11-florence-to-naples.qmd` | Complete rewrite |
| `daily_itineraries/day-08-2026-06-12-naples-herculaneum.qmd` | Targeted update (Herculaneum confirmed, restructure) |
| `daily_itineraries/day-09-2026-06-13-naples.qmd` | Two targeted fixes + hotel addition |
| `research/accommodations.qmd` | Three section updates |
| `research/tours.qmd` | Add confirmed tours, update Herculaneum status |
| `index.qmd` | One factual correction |

---

## Task 1: June Calendar — Front-Matter, Cells & Reservations Table

**Files:**
- Modify: `research/june-calendar.qmd`

- [ ] **Step 1: Add `page-layout: full` to front-matter**

Replace the existing front-matter block:

```yaml
---
title: "June 2026 — Trip Calendar"
subtitle: "Florence · Naples · Puglia"
categories: [planning, overview]
toc: false
---
```

With:

```yaml
---
title: "June 2026 — Trip Calendar"
subtitle: "Florence · Naples · Puglia"
categories: [planning, overview]
toc: false
page-layout: full
---
```

- [ ] **Step 2: Update Day 4 calendar cell (Jun 8)**

Replace:

```html
  <td class="florence">
    <span class="day-num">8</span>
    <span class="day-label">🏛 Day 4 — Florence</span>
    <span class="day-detail">Accademia — David<br>Medici Chapels<br>Mercato Centrale</span>
  </td>
```

With:

```html
  <td class="florence">
    <span class="day-num">8</span>
    <span class="day-label">🏛 Day 4 — Florence</span>
    <span class="day-detail">Ghiberti Pass<br>Baptistery + Duomo Museum<br>⚠️ Santa Reparata 10:30am sharp</span>
  </td>
```

- [ ] **Step 3: Update Day 5 calendar cell (Jun 9)**

Replace:

```html
  <td class="florence">
    <span class="day-num">9</span>
    <span class="day-label">🏛 Day 5 — Florence</span>
    <span class="day-detail">Bargello Museum<br>Santa Croce<br>Local neighborhoods</span>
  </td>
```

With:

```html
  <td class="florence">
    <span class="day-num">9</span>
    <span class="day-label">🏛 Day 5 — Florence</span>
    <span class="day-detail">Private Uffizi + Accademia<br>Tour 9:00am sharp<br>Via dei Castellani 14</span>
  </td>
```

- [ ] **Step 4: Update Day 7 calendar cell (Jun 11)**

Replace:

```html
  <td class="naples">
    <span class="day-num">11</span>
    <span class="day-label">🏺 Day 7 — Naples</span>
    <span class="day-detail">Herculaneum ruins<br>Ancient Roman city<br>MANN Museum option</span>
  </td>
```

With:

```html
  <td class="naples">
    <span class="day-num">11</span>
    <span class="day-label">🏺 Day 7 — Naples</span>
    <span class="day-detail">Naples Walking Tour<br>Underground ruins + lunch<br>Pickup 8:30am Piazza Municipio</span>
  </td>
```

- [ ] **Step 5: Update Day 8 calendar cell (Jun 12)**

Replace:

```html
  <td class="naples">
    <span class="day-num">12</span>
    <span class="day-label">🏺 Day 8 — Naples</span>
    <span class="day-detail">MANN Museum<br>Cappella Sansevero<br>Spaccanapoli</span>
  </td>
```

With:

```html
  <td class="naples">
    <span class="day-num">12</span>
    <span class="day-label">🏺 Day 8 — Naples</span>
    <span class="day-detail">Herculaneum &amp; Vesuvius<br>Tour (details TBD)<br>Cappella Sansevero option</span>
  </td>
```

- [ ] **Step 6: Add four rows to "Reservations in Hand" table**

Replace the existing table:

```markdown
| What | Code | Date |
|------|------|------|
| Outbound flights (Lufthansa) | FMWYOJ | Jun 5–6 |
| Return flights (Lufthansa/United) | FMWYOJ | Jun 20 |
| Italo train Florence → Naples | PIDCMA | Jun 10 |
| ITA flights Naples → Brindisi via Rome | IXYZMT | Jun 13 |
```

With:

```markdown
| What | Code | Date |
|------|------|------|
| Outbound flights (Lufthansa) | FMWYOJ | Jun 5–6 |
| Return flights (Lufthansa/United) | FMWYOJ | Jun 20 |
| Ghiberti Pass — Duomo complex | 87-MKTRBNH | Jun 8 |
| Viator — Private Uffizi + Accademia | 1391099919 | Jun 9 |
| Italo train Florence → Naples | PIDCMA | Jun 10 |
| Naples Airbnb — Casa Wenner | HMTBH3HCCX | Jun 10–13 |
| ITA flights Naples → Brindisi via Rome | IXYZMT | Jun 13 |
| Hotel Executive Inn, Brindisi | 73435335535420 | Jun 13–14 |
```

- [ ] **Step 7: Render to verify**

```bash
docker exec rstudio quarto render /home/rstudio/Quarto/columbus/research/june-calendar.qmd --quiet
```

Expected: no errors, file renders cleanly.

- [ ] **Step 8: Commit**

```bash
git add research/june-calendar.qmd
git commit -m "Update June calendar: print layout, correct Day 4/5/7/8 cells, add 4 reservations"
```

---

## Task 2: Day 4 — Ghiberti Pass (Complete Rewrite)

**Files:**
- Modify: `daily_itineraries/day-04-2026-06-08-florence.qmd`

- [ ] **Step 1: Replace entire file content**

```markdown
---
title: "Day 4: Florence — Duomo Complex"
subtitle: "Ghiberti Pass: Baptistery, Opera del Duomo Museum & Santa Reparata"
date: "2026-06-08"
day-of-week: "Monday"
location: "Florence"
categories: [itinerary, florence, duomo]
---

## Overview

**Confirmed booking: Ghiberti Pass** — valid June 8–10 for the Baptistery (North Door entrance), Opera del Duomo Museum, and Santa Reparata crypt.

**Booking ref:** 87-MKTRBNH | External confirmation: SPW9A3V3D333

::: {.callout-warning}
## No Backpacks Allowed

The Duomo complex has a strict no-backpack policy. **Mandatory luggage storage** is at Piazza Duomo 38/r before you enter any component. Small shoulder bags and day bags are fine.
:::

---

## Morning: Santa Reparata — Timed Entry (10:30 AM SHARP)

::: {.callout-important}
## Timed Entry — Cannot Be Changed

**Santa Reparata: 10:30 AM — Porta Campanile entrance**

This is a fixed timed ticket that cannot be rescheduled. Arrive by 10:20 AM. Drop any backpacks at luggage storage (Piazza Duomo 38/r) *before* arriving at the entrance.
:::

### What Is Santa Reparata?

The crypt beneath the Duomo floor — the original 4th-century cathedral on which the current Duomo was built. Excavations reveal layer upon layer of Florentine history: Roman remains, the medieval church, Brunelleschi's tomb.

| Element | What to Know |
|---------|-------------|
| **Brunelleschi's Tomb** | The architect who built the Dome is buried here — simple, almost anonymous slab |
| **Roman remains** | Sections of Roman-era structure visible in the foundations |
| **Medieval mosaics** | Fragments of the original floor, remarkably preserved |
| **Depth of history** | Walking over 2,000 years of layers beneath the cathedral floor |

**Time:** Allow 45–60 minutes.

---

## Also Valid on Your Ghiberti Pass

Your pass (87-MKTRBNH) is valid June 8–10 for these components — visit any that fit around the 10:30 timed entry:

### Baptistery of San Giovanni — North Door Entrance

The octagonal baptistery across from the Duomo facade. Lorenzo Ghiberti's bronze doors (the ones that gave this pass its name) are on the North and East sides.

| Door | What It Is |
|------|-----------|
| **East Doors (Gates of Paradise)** | Ghiberti's masterpiece — Michelangelo called them worthy of paradise. What you see are high-quality reproductions; originals in the museum. |
| **North Doors** | Ghiberti's earlier work — still extraordinary; your pass enters here |

**Time:** 30–45 minutes inside.

### Opera del Duomo Museum (Museo dell'Opera)

Piazza del Duomo 9 — the museum housing the actual originals removed from the Duomo exterior for preservation.

| Highlight | What to See |
|-----------|------------|
| **Ghiberti's Gates of Paradise (originals)** | The actual bronze panels — extraordinary up close |
| **Michelangelo's Bandini Pietà** | Late Michelangelo, unfinished, raw, extraordinary — carved for his own tomb |
| **Donatello's Mary Magdalene** | Haunting carved wood figure; one of his most powerful works |
| **Luca della Robbia's Cantoria** | Marble choir gallery with children singing and dancing |
| **Arnolfo's Madonna** | 13th-century sculpture from the original cathedral facade |

**Time:** 1–1.5 hours. This museum is excellent and undervisited — give it time.

---

## Afternoon: Open

No scheduled activities. The Duomo complex is intense — rest, wander, or follow whatever draws you.

---

## Evening

Dinner in Florence. Let the day determine where you end up.

---

## Checklist

- [ ] Luggage storage at Piazza Duomo 38/r (NO backpacks inside)
- [ ] Santa Reparata timed entry — 10:30 AM Porta Campanile
- [ ] Baptistery visit
- [ ] Opera del Duomo Museum
- [ ] Pass ref 87-MKTRBNH saved to phone

---

**Previous:** [Day 3](day-03-2026-06-07-florence.qmd) | **Next:** [Day 5: Uffizi & Accademia](day-05-2026-06-09-florence.qmd)
```

- [ ] **Step 2: Render to verify**

```bash
docker exec rstudio quarto render /home/rstudio/Quarto/columbus/daily_itineraries/day-04-2026-06-08-florence.qmd --quiet
```

Expected: no errors.

- [ ] **Step 3: Commit**

```bash
git add daily_itineraries/day-04-2026-06-08-florence.qmd
git commit -m "Rewrite Day 4: Ghiberti Pass day (replaces incorrect Accademia/Medici content)"
```

---

## Task 3: Day 5 — Private Uffizi + Accademia (Complete Rewrite)

**Files:**
- Modify: `daily_itineraries/day-05-2026-06-09-florence.qmd`

- [ ] **Step 1: Replace entire file content**

```markdown
---
title: "Day 5: Florence — Uffizi & Accademia"
subtitle: "Private Tour: Uffizi Gallery + Accademia (David) — 9:00 AM"
date: "2026-06-09"
day-of-week: "Tuesday"
location: "Florence"
categories: [itinerary, florence, museums, art]
---

## Overview

**Confirmed booking: Private Tour of Uffizi and Accademia Gallery with David**

A private English-language guided tour covering both the Uffizi Gallery and the Accademia (Michelangelo's David) — the two essential Florence museums in one morning.

**Booking ref:** 1391099919 (Viator) | 2 adults | USD $536.82

---

## Morning: Private Tour (9:00 AM–1 PM)

::: {.callout-important}
## Meeting Point — 9:00 AM Sharp

**Via dei Castellani, 14, 50122 Firenze FI**

This is the street running along the east side of the Uffizi, facing the Arno. Look for your guide at the entrance. Arrive by 8:50 AM.

Cancellation deadline: **9:00 AM Central European Summer Time** (the day before).
:::

### What You'll See

**Uffizi Gallery**

The world's finest collection of Italian Renaissance painting, housed in the building Vasari designed for the Medici.

| Work | Artist | Why It Matters |
|------|--------|---------------|
| *Birth of Venus* | Botticelli | The defining image of Renaissance humanism |
| *Primavera* | Botticelli | Mythological allegory; 500+ plant species identifiable |
| *Annunciation* | Leonardo da Vinci | One of his earliest works; remarkable spatial depth |
| *Doni Tondo* | Michelangelo | His only finished panel painting; precursor to the Sistine ceiling |
| *Duke and Duchess of Urbino* | Piero della Francesca | Dual portraits; landscapes are the first true Italian landscapes |
| *Venus of Urbino* | Titian | Benchmark for every reclining nude that followed |

A private guide makes the Uffizi genuinely comprehensible — the collection is enormous and context transforms everything.

**Galleria dell'Accademia**

- **Michelangelo's David** — 17 feet of marble, carved when Michelangelo was 26. Stand in front and walk around it. The Prisoners (unfinished figures in the corridor) show his process: figures emerging from stone.
- Musical instrument collection (Stradivari violins, etc.)

---

## Afternoon: Free (1–6 PM)

The morning tour ends around 1 PM. The afternoon is yours.

**Options worth considering:**
- Bargello Museum — Renaissance sculpture; Donatello's bronze David, early Michelangelo. Often uncrowded.
- Santa Croce — Tombs of Michelangelo, Galileo, Machiavelli; Giotto frescoes
- Boboli Gardens — If you want air and space
- Lunch near the Uffizi and a long afternoon nap — equally valid

---

## Evening: Last Night in Florence

Pack for tomorrow's train to Naples (12:28pm departure — checkout by 11am).

Dinner — last chance for:
- Bistecca alla Fiorentina (the great T-bone, shared between two)
- Final pasta, final wine, final gelato

---

## Checklist

- [ ] Meeting point confirmed: Via dei Castellani 14 at 8:50 AM
- [ ] Booking ref 1391099919 saved to phone
- [ ] Afternoon activity chosen
- [ ] Start packing for Naples tonight

---

**Previous:** [Day 4: Duomo Complex](day-04-2026-06-08-florence.qmd) | **Next:** [Day 6: Train to Naples](day-06-2026-06-10-florence.qmd)
```

- [ ] **Step 2: Render to verify**

```bash
docker exec rstudio quarto render /home/rstudio/Quarto/columbus/daily_itineraries/day-05-2026-06-09-florence.qmd --quiet
```

Expected: no errors.

- [ ] **Step 3: Commit**

```bash
git add daily_itineraries/day-05-2026-06-09-florence.qmd
git commit -m "Rewrite Day 5: Private Uffizi+Accademia tour (replaces incorrect Bargello/Santa Croce content)"
```

---

## Task 4: Day 6 — Add Naples Airbnb Details & Timing Note

**Files:**
- Modify: `daily_itineraries/day-06-2026-06-10-florence.qmd`

- [ ] **Step 1: Replace "Hotel Check-In" section**

Find:

```markdown
### Hotel Check-In (~4:00–4:30pm)

- Drop bags, freshen up, breathe
- Ask for restaurant recommendations and a neighborhood map
- Get the WiFi password
- Note: Naples is louder and more chaotic than Florence. That's the charm — lean into it.
```

Replace with:

```markdown
### Airbnb Check-In — Casa Wenner (~4:00pm)

**Casa Wenner Large — Naples Center Chiaia Plebiscito**
Via Monte di Dio, 66, Naples 80132
Host: Pierfrancesco (+39 335 607 1111) | Antonella (+39 320 118 6998)
Confirmation: HMTBH3HCCX | Check-in: 3:00 PM

::: {.callout-note}
## Timing Note

The train arrives Napoli Centrale at 3:28 PM. Taxi from the station to Via Monte di Dio takes 15–20 minutes. Plan on arriving at the Airbnb around 3:45–4:00 PM — well after the 3:00 PM check-in opens, no problem.
:::

- Drop bags, freshen up, breathe
- Contact Pierfrancesco or Antonella if any check-in questions
- Note: Naples is louder and more chaotic than Florence. That's the charm — lean into it.
```

- [ ] **Step 2: Update "Prepare for Tomorrow" checklist**

Find:

```markdown
**Herculaneum:**

- [ ] Check tour confirmation for exact time and meeting point
- [ ] Lay out comfortable shoes (lots of uneven ancient cobblestones)
- [ ] Bring: water, sunscreen, hat, camera
- [ ] Set an alarm — likely an early start
```

Replace with:

```markdown
**Tomorrow — Naples Walking Tour (Day 7):**

- [ ] Pickup is 8:30 AM at Fontana del Nettuno, Piazza Municipio — arrive 10 min early
- [ ] Lay out comfortable shoes (lots of uneven cobblestones)
- [ ] Bring: water, sunscreen, hat, camera
- [ ] Set alarm for early start
```

- [ ] **Step 3: Render to verify**

```bash
docker exec rstudio quarto render /home/rstudio/Quarto/columbus/daily_itineraries/day-06-2026-06-10-florence.qmd --quiet
```

Expected: no errors.

- [ ] **Step 4: Commit**

```bash
git add daily_itineraries/day-06-2026-06-10-florence.qmd
git commit -m "Add Casa Wenner Airbnb details and timing note to Day 6 (train to Naples)"
```

---

## Task 5: Day 7 — Naples Walking Tour (Complete Rewrite)

**Files:**
- Modify: `daily_itineraries/day-07-2026-06-11-florence-to-naples.qmd`

- [ ] **Step 1: Replace entire file content**

```markdown
---
title: "Day 7: Naples — City Walking Tour"
subtitle: "Underground Roman Ruins, Historic Center & Lunch — 8:30 AM"
date: "2026-06-11"
day-of-week: "Thursday"
location: "Naples"
categories: [itinerary, naples, archaeology, walking]
---

## Overview

**Confirmed booking: Naples City Walking Tour w/ Underground Roman Ruins Ticket**
Semi-private group, max 8 people, with lunch included.

**Booking ref:** GYGWZAX648G5 (GetYourGuide) | Provider: WORLDTOURS S.r.l. | Contact: Alessia

---

## Morning: Walking Tour (8:30 AM–~1 PM)

::: {.callout-important}
## Pickup — 8:30 AM Sharp

**Outside Fontana del Nettuno, Piazza Municipio, 80133 Napoli**

Fontana del Nettuno is the large Neptune fountain in front of the Palazzo San Giacomo (Naples City Hall) on Piazza Municipio. Hard to miss.

**Arrive 10 minutes early** — 8:20 AM. Look for the WORLDTOURS guide.
:::

### What the Tour Covers

A semi-private walking tour (max 8 people) through Naples' historic center with entry to the underground Roman ruins and lunch included.

**Above ground:**
- Historic center streets and piazzas
- Spaccanapoli — the ancient straight street following the Greek city grid
- Churches and baroque architecture
- Authentic Naples neighborhoods away from the waterfront

**Underground:**
- Naples sits on top of a 2,400-year-old Greek and Roman city
- The underground tour typically includes sections of the ancient Roman city below the modern streets
- Cisterns, tunnels, and remains of Greek-era structures

**Lunch:**
Included in the tour — typically at a local restaurant in the historic center.

---

## Afternoon: Free (1–6 PM)

The tour ends around 1 PM. Afternoon is unscheduled.

**Options:**

| Option | Notes |
|--------|-------|
| **Cappella Sansevero** | The Veiled Christ — one of the most extraordinary sculptures in existence. **Book timed entry in advance** — tiny chapel, very limited slots. €9, no photography. Near Piazza San Domenico Maggiore. |
| **MANN Museum** | National Archaeological Museum — treasures from Pompeii and Herculaneum. 2–3 hours; €18. Metro to Museo stop. |
| **Rest** | The walking tour is full-on. Returning to the Airbnb for a couple of hours is completely reasonable. |

---

## Evening: Naples (7–10 PM)

**Dinner:**
- Another pizzeria if you can face it (Via dei Tribunali has different options than last night)
- Seafood — Naples is a port city; fresh catch
- Quartieri Spagnoli for a grittier local atmosphere

**After dinner:** Short walk, early night — Herculaneum & Vesuvius tour tomorrow.

---

## Prepare for Tomorrow

**Day 8 — Herculaneum & Vesuvius tour (details TBD — check confirmation):**

- [ ] Review tour confirmation for exact time and meeting point
- [ ] Wear comfortable shoes (very uneven ancient surfaces at Herculaneum)
- [ ] Bring: water, sunscreen, hat, camera, sturdy shoes for Vesuvius hike
- [ ] Set alarm — likely an early start
- [ ] Charge camera/phone

---

**Previous:** [Day 6: Florence to Naples](day-06-2026-06-10-florence.qmd) | **Next:** [Day 8: Herculaneum & Vesuvius](day-08-2026-06-12-naples-herculaneum.qmd)
```

- [ ] **Step 2: Render to verify**

```bash
docker exec rstudio quarto render /home/rstudio/Quarto/columbus/daily_itineraries/day-07-2026-06-11-florence-to-naples.qmd --quiet
```

Expected: no errors.

- [ ] **Step 3: Commit**

```bash
git add daily_itineraries/day-07-2026-06-11-florence-to-naples.qmd
git commit -m "Rewrite Day 7: Naples walking tour (replaces incorrect Herculaneum content)"
```

---

## Task 6: Day 8 — Herculaneum & Vesuvius (Targeted Update)

**Files:**
- Modify: `daily_itineraries/day-08-2026-06-12-naples-herculaneum.qmd`

- [ ] **Step 1: Update front-matter title and subtitle**

Replace:

```yaml
title: "Day 8: Naples — Museums & City"
subtitle: "MANN, Cappella Sansevero & Spaccanapoli"
```

With:

```yaml
title: "Day 8: Naples — Herculaneum & Vesuvius"
subtitle: "Confirmed Tour — Details to be Updated When Confirmation File Is Available"
```

- [ ] **Step 2: Replace the Overview section**

Replace:

```markdown
## Overview

**Second full day in Naples:** MANN museum (if not done yesterday), Cappella Sansevero, and an afternoon in the historic center. This is the day for the things that don't require a day trip.
```

With:

```markdown
## Overview

**Confirmed booking: Herculaneum & Vesuvius tour** — June 12, 2026.

::: {.callout-note}
## Confirmation Details Pending

The Herculaneum & Vesuvius tour is confirmed but the confirmation file has not yet been added to the reservations folder. This page will be updated with exact time, meeting point, booking reference, and provider details once the confirmation is available.
:::

Check the confirmation email/document for:
- Exact departure time and meeting point
- Provider name and contact
- What's included (tickets, transportation, guide)
- Physical requirements for Vesuvius hike
```

- [ ] **Step 3: Replace the Morning section**

Replace:

```markdown
## Morning: Museums (9 AM–1 PM)

**Priority 1: MANN — Museo Archeologico Nazionale** (if not done yesterday)

**See:** [Museums - MANN](../research/museums.qmd#mann)

- Allow 2–3 hours
- Highlights: treasures from Pompeii & Herculaneum, Farnese Collection, Alexander Mosaic, Secret Cabinet
- Now that you've been to Herculaneum, the objects have context — this visit lands differently
- €18 entry; closed Tuesdays (not an issue — today is Friday); metro to Museo stop

**Priority 2: Cappella Sansevero**

**See:** [Museums - Cappella Sansevero](../research/museums.qmd#cappella-sansevero)

- **Book timed entry in advance** — this tiny chapel has very limited slots and sells out
- The Veiled Christ by Giuseppe Sanmartino (1753) is one of the most extraordinary sculptures in existence — a marble veil that appears genuinely transparent
- 30–45 minutes; €9 entry; no photography (enforced)
- Located in the historic center near Piazza San Domenico Maggiore

**Do Both if Possible:**
- MANN 9am–12pm
- Cappella Sansevero 12:30–1:30pm (a short walk away)
```

With:

```markdown
## Morning/Day: Herculaneum & Vesuvius Tour

Check your tour confirmation for the exact schedule. A typical Herculaneum + Vesuvius day:

**Herculaneum ruins (2–3 hours)**

Herculaneum was buried under a 20-meter lava flow when Vesuvius erupted in 79 AD — which preserved far more than Pompeii's ash burial.

| Site | Why It Matters |
|------|----------------|
| **The Boat Houses** | 300 skeletons of people who fled to the shore — the most emotionally powerful moment on the site |
| **House of Neptune & Amphitrite** | Vivid blue-and-gold mosaics, astonishingly preserved |
| **Casa dei Cervi** | Elite villa with original frescoes and garden statues |
| **Thermopolium** | Ancient fast-food counter with food residue still identifiable |
| **Wooden structures** | Actual original wood — doors, furniture, beams — impossible at Pompeii |

**Mount Vesuvius (1–1.5 hours)**

Drive up the volcano, then hike ~30 minutes to the crater rim. Looking down into the crater and back across the bay to Naples — this is the source of the destruction you just walked through.

- Wear sturdy shoes — the path is volcanic gravel
- Bring water and layers (wind at the top)
- Views of Naples, the bay, and Capri on clear days
```

- [ ] **Step 4: Update the Afternoon section to optional activities**

Replace the current afternoon sections (everything from `## Afternoon: Spaccanapoli & Historic Center` through the end of the `## Late Afternoon: Waterfront` section) with:

```markdown
## Afternoon: Optional (If Tour Ends Early)

If the tour finishes with time to spare before dinner:

- **Cappella Sansevero** — The Veiled Christ. Book timed entry in advance; €9; 30–45 min. Near Piazza San Domenico Maggiore.
- **MANN Museum** — Now that you've seen Herculaneum, the objects have context. €18; 2–3 hours; metro to Museo stop.
- **Rest** — A long day in the ruins and on the volcano earns a rest.
```

- [ ] **Step 5: Update the "Prepare for Tomorrow" section**

Replace:

```markdown
**Saturday morning: fly Naples → Rome → Brindisi**

- [ ] Pack completely tonight — bags closed and ready
- [ ] Have flight details accessible: Reservation IXYZMT, AZ 1270 NAP→FCO 3:05pm
- [ ] Get to Naples Airport (Capodichino) by **1:30pm** — allow 30–45 min taxi from centro
- [ ] Set alarm and confirm hotel checkout time
- [ ] Keep tomorrow morning free for a final espresso and a short walk — flight isn't until 3pm
```

With:

```markdown
**Saturday — Fly Naples → Rome → Brindisi (Day 9):**

- [ ] **Pack completely tonight** — bags closed and ready by morning
- [ ] Airbnb checkout: **10:00 AM SHARP** — hard checkout, no extensions
- [ ] Flight details: Reservation IXYZMT | AZ 1270 NAP→FCO departs 3:05 PM
- [ ] Leave for Naples Airport (Capodichino) by **1:30 PM** — 20–30 min taxi from centro
- [ ] Morning is free: final espresso, short walk — flight isn't until 3 PM
```

- [ ] **Step 6: Update the Previous/Next nav links**

Replace:

```markdown
**Previous:** [Day 7: Herculaneum](day-07-2026-06-11-florence-to-naples.qmd) | **Next:** [Day 9: Depart Naples to Brindisi](day-09-2026-06-13-naples.qmd)
```

With:

```markdown
**Previous:** [Day 7: Naples Walking Tour](day-07-2026-06-11-florence-to-naples.qmd) | **Next:** [Day 9: Depart Naples to Brindisi](day-09-2026-06-13-naples.qmd)
```

- [ ] **Step 7: Render to verify**

```bash
docker exec rstudio quarto render /home/rstudio/Quarto/columbus/daily_itineraries/day-08-2026-06-12-naples-herculaneum.qmd --quiet
```

Expected: no errors.

- [ ] **Step 8: Commit**

```bash
git add daily_itineraries/day-08-2026-06-12-naples-herculaneum.qmd
git commit -m "Update Day 8: Herculaneum & Vesuvius confirmed (details TBD), restructure content"
```

---

## Task 7: Day 9 — Fix Checkout Time & Add Hotel Executive Inn

**Files:**
- Modify: `daily_itineraries/day-09-2026-06-13-naples.qmd`

- [ ] **Step 1: Fix checkout time**

Replace:

```markdown
- Aim to check out by noon; ask for luggage storage if you want more morning time
```

With:

```markdown
- **Airbnb checkout: 10:00 AM SHARP** — hard checkout, no luggage storage available. Have bags packed the night before.
```

- [ ] **Step 2: Add Hotel Executive Inn to the Brindisi arrival section**

Find:

```markdown
### Getting to Your Hotel

**Taxi:**
- ~€12–15 to Brindisi centro
- ~10–15 minutes
- Official taxis are at the stand outside arrivals
```

Replace with:

```markdown
### Getting to Your Hotel

**Hotel Executive Inn**
Via Pozzo Traiano, 24, Brindisi 72100
Expedia itinerary: 73435335535420 | Check-in: 2:00 PM (arriving 6:25 PM — no issue)

**Taxi from BDS airport:**
- ~€12–15 to Brindisi centro
- ~10–15 minutes
- Official taxis are at the stand outside arrivals
```

- [ ] **Step 3: Render to verify**

```bash
docker exec rstudio quarto render /home/rstudio/Quarto/columbus/daily_itineraries/day-09-2026-06-13-naples.qmd --quiet
```

Expected: no errors.

- [ ] **Step 4: Commit**

```bash
git add daily_itineraries/day-09-2026-06-13-naples.qmd
git commit -m "Fix Day 9: Airbnb checkout 10am (not noon), add Hotel Executive Inn Brindisi details"
```

---

## Task 8: Accommodations — Update Three Sections

**Files:**
- Modify: `research/accommodations.qmd`

- [ ] **Step 1: Replace Florence hotel options with confirmed placeholder**

Find the Florence section from `## Florence (4 Nights: June 5-9)` through (but not including) `## Naples (2 Nights: June 10-12)`.

Replace the entire Florence section with:

```markdown
## Florence (4 Nights: June 6–10)

### Confirmed Booking

**Hotel booked** — details to be added when confirmation file is available.

Location: Historic center triangle area (Duomo / Uffizi / Accademia).

*This section will be updated with hotel name, address, confirmation number, and check-in/check-out details once the reservation file is added to the reservations folder.*

---
```

- [ ] **Step 2: Replace Naples hotel options with confirmed Airbnb**

Find the Naples section from `## Naples (2 Nights: June 10-12)` through (but not including) `## Puglia (6 Nights: June 13-19)`.

Replace the entire Naples section with:

```markdown
## Naples (3 Nights: June 10–13)

### Confirmed Booking — Casa Wenner Large

**Casa Wenner Large — Naples Center Chiaia Plebiscito**

| Detail | Info |
|--------|------|
| **Address** | Via Monte di Dio, 66, Naples 80132 |
| **Check-in** | Wednesday June 10, 3:00 PM |
| **Check-out** | Saturday June 13, **10:00 AM sharp** |
| **Guests** | Daniel Green, Jane Mooney |
| **Confirmation** | HMTBH3HCCX |
| **Platform** | Airbnb |
| **Cost** | $826.57 |

**Host contacts:**
- Pierfrancesco: +39 335 607 1111
- Antonella: +39 320 118 6998

**Location:** Chiaia neighborhood — upscale, safe, excellent restaurants, 10-minute walk to the historic center and Spaccanapoli. Via Monte di Dio is a quiet street running up from the waterfront toward the hill.

::: {.callout-warning}
## Checkout Is 10:00 AM — Hard

The Airbnb checkout is 10:00 AM with no flexibility. Pack the night before. On Day 9 (June 13), your flight to Brindisi isn't until 3:05 PM — the airport taxi departs around 1:30 PM — so you'll have 3+ hours with your bags after checkout. Ask about luggage storage or find a café nearby.
:::

---
```

- [ ] **Step 3: Replace Brindisi options with confirmed Hotel Executive Inn**

Find the `### Brindisi (1 Night: June 13)` section through (but not including) `### Possible Tour Locations`.

Replace with:

```markdown
### Brindisi (1 Night: June 13–14)

**Confirmed Booking — Hotel Executive Inn**

| Detail | Info |
|--------|------|
| **Hotel** | Hotel Executive Inn |
| **Address** | Via Pozzo Traiano, 24, Brindisi 72100 |
| **Check-in** | Saturday June 13, 2:00 PM |
| **Check-out** | Sunday June 14 |
| **Room** | 1 Deluxe Double Room, 2 adults |
| **Platform** | Expedia |
| **Itinerary** | 73435335535420 |
| **Total cost** | €166.48 (room €145.89 + taxes €14.59 + fees €6.00) |

Arriving from Brindisi airport at 6:25 PM — taxi to hotel is ~€12–15, 10–15 minutes. Check-in will be evening arrival, well after 2 PM opening.

```

- [ ] **Step 4: Render to verify**

```bash
docker exec rstudio quarto render /home/rstudio/Quarto/columbus/research/accommodations.qmd --quiet
```

Expected: no errors.

- [ ] **Step 5: Commit**

```bash
git add research/accommodations.qmd
git commit -m "Update accommodations: confirmed Airbnb Naples, Hotel Executive Inn Brindisi, Florence placeholder"
```

---

## Task 9: Tours — Add Confirmed Bookings

**Files:**
- Modify: `research/tours.qmd`

- [ ] **Step 1: Add confirmed tours summary at top of page**

After the `## Overview` section (after the numbered list ending `2. **Puglia Regional Tour**...`), insert:

```markdown
---

## Confirmed Bookings

| Tour | Date | Ref | Status |
|------|------|-----|--------|
| Ghiberti Pass — Duomo complex (Florence) | Jun 8 | 87-MKTRBNH | ✅ Confirmed |
| Private Uffizi + Accademia with David (Viator) | Jun 9 | 1391099919 | ✅ Confirmed |
| Naples City Walking Tour w/ Underground Ruins (GetYourGuide) | Jun 11 | GYGWZAX648G5 | ✅ Confirmed |
| Herculaneum & Vesuvius | Jun 12 | TBD | ✅ Confirmed (details TBD) |
| Puglia Regional Tour | Jun 14–19 | TBD | 🔄 Being finalized |

---
```

- [ ] **Step 2: Add Naples Walking Tour section before the Puglia section**

Find `## Puglia Regional Tour (June 14-19)` and insert before it:

```markdown
## Naples City Walking Tour (June 11)

### Confirmed Booking

**Naples: City Walking Tour w/ Underground Roman Ruins Ticket**

| Detail | Info |
|--------|------|
| **Type** | Semi-private group, max 8 people, with lunch |
| **Date** | Thursday, June 11, 2026 |
| **Pickup time** | **8:30 AM** — arrive 10 minutes early |
| **Pickup location** | Outside Fontana del Nettuno, Piazza Municipio, 80133 Napoli |
| **Booking ref** | GYGWZAX648G5 (GetYourGuide) |
| **Provider** | WORLDTOURS S.r.l. |
| **Contact** | Alessia |
| **Includes** | Tour + underground ruins entry + lunch |

**What to Bring:**
- Comfortable walking shoes
- Water bottle
- Camera
- Light layers (underground sections are cooler)

**Meeting point note:** Fontana del Nettuno is the large Neptune fountain in front of Naples City Hall (Palazzo San Giacomo) on Piazza Municipio. Impossible to miss.

---
```

- [ ] **Step 3: Update Herculaneum section header and status**

Replace:

```markdown
## Herculaneum Archaeological Tour (June 11)

### Why Herculaneum?
```

With:

```markdown
## Herculaneum & Vesuvius Tour (June 12)

### Status: Confirmed — Details Pending

The Herculaneum & Vesuvius tour is confirmed for **June 12, 2026**. This section will be updated with booking reference, provider name, meeting point, and exact timing once the confirmation file is added to the reservations folder.

### Why Herculaneum?
```

- [ ] **Step 4: Render to verify**

```bash
docker exec rstudio quarto render /home/rstudio/Quarto/columbus/research/tours.qmd --quiet
```

Expected: no errors.

- [ ] **Step 5: Commit**

```bash
git add research/tours.qmd
git commit -m "Update tours: add confirmed bookings summary, Naples walking tour, Herculaneum Jun 12 confirmed"
```

---

## Task 10: Homepage — Fix June 13 Journey Description

**Files:**
- Modify: `index.qmd`

- [ ] **Step 1: Fix the June 13 journey description**

Replace:

```markdown
**June 13 (Day 10): Journey to Puglia**
Scenic train ride through the Apennines and down the Adriatic coast, entering Puglia and arriving in Brindisi
```

With:

```markdown
**June 13 (Day 10): Journey to Puglia**
Two ITA Airways flights: Naples → Rome Fiumicino (AZ 1270, departs 3:05 PM), then Rome → Brindisi (AZ 1623, departs 5:15 PM), arriving Brindisi 6:25 PM. Reservation IXYZMT.
```

- [ ] **Step 2: Render to verify**

```bash
docker exec rstudio quarto render /home/rstudio/Quarto/columbus/index.qmd --quiet
```

Expected: no errors.

- [ ] **Step 3: Commit**

```bash
git add index.qmd
git commit -m "Fix homepage: June 13 is two ITA Airways flights, not a train"
```

---

## Task 11: Full Site Render & Final Commit

- [ ] **Step 1: Render entire site**

```bash
docker exec rstudio quarto render /home/rstudio/Quarto/columbus --quiet
```

Expected: clean render, no errors.

- [ ] **Step 2: Verify key pages look correct**

Check that `_site/` output exists and is current. Spot-check that the rendered calendar cells show the updated content.

- [ ] **Step 3: Push to remote**

```bash
git push
```

---

## Pending Items (Not In This Plan)

These require new confirmation files to be added to `reservations/` before the site can be fully updated:

| Item | Action When Available |
|------|-----------------------|
| Florence hotel confirmation | Update `research/accommodations.qmd` Florence section; no daily itinerary changes needed |
| Herculaneum & Vesuvius booking ref | Update `research/tours.qmd` and `daily_itineraries/day-08-2026-06-12-naples-herculaneum.qmd` with exact time, meeting point, provider |
