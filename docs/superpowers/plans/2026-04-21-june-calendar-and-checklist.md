# June Calendar & Pre-Departure Checklist Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add two new pages to the Pre-Trip Planning section of the Columbus Quarto site: a printable June 2026 calendar showing day-by-day trip activities, and a comprehensive pre-departure checklist.

**Architecture:** Both pages are Quarto `.qmd` files in `research/`. The calendar uses a raw HTML table with inline print CSS. The checklist uses standard Quarto markdown. Both are registered in `_quarto.yml` sidebar and navbar. No R code, no external dependencies.

**Tech Stack:** Quarto Markdown, raw HTML (calendar), CSS print media queries, YAML (`_quarto.yml`)

**June 2026 Trip Timeline (source of truth for all content):**
- Jun 5 (Fri): Day 1 — Depart Madison → Frankfurt (LH 8835 + LH 0433)
- Jun 6 (Sat): Day 2 — Frankfurt → Florence, arrive 6:30pm (LH 9498)
- Jun 7 (Sun): Day 3 — Florence: Duomo + Uffizi
- Jun 8 (Mon): Day 4 — Florence: Accademia (David) + Medici Chapels
- Jun 9 (Tue): Day 5 — Florence: Bargello + Santa Croce
- Jun 10 (Wed): Day 6 — Italo train #8902 12:28→15:28, Florence→Naples
- Jun 11 (Thu): Day 7 — Naples: Herculaneum
- Jun 12 (Fri): Day 8 — Naples: MANN + Cappella Sansevero
- Jun 13 (Sat): Day 9 — Fly Naples→Rome→Brindisi (AZ 1270 + AZ 1623)
- Jun 14 (Sun): Day 10 — First full Puglia day (Brindisi)
- Jun 15 (Mon): Day 11 — Puglia Tour Day 1
- Jun 16 (Tue): Day 12 — Puglia Tour Day 2
- Jun 17 (Wed): Day 13 — Puglia Tour Day 3
- Jun 18 (Thu): Day 14 — Puglia Tour Day 4
- Jun 19 (Fri): Day 15 — Puglia Tour Day 5
- Jun 20 (Sat): Day 16 — Fly Brindisi→Munich→Chicago→Madison

---

## File Map

| Action | File | Purpose |
|--------|------|---------|
| **Create** | `research/june-calendar.qmd` | Printable June 2026 calendar grid |
| **Create** | `research/pre-departure-checklist.qmd` | All pre-trip tasks & bookings |
| **Modify** | `_quarto.yml` | Register both pages in sidebar + navbar |

---

## Task 1: Create the June 2026 Calendar Page

**File:** `research/june-calendar.qmd`

**Calendar grid (June 2026 — June 1 = Monday):**

```
Sun   Mon   Tue   Wed   Thu   Fri   Sat
 —     1     2     3     4     5     6
 7     8     9    10    11    12    13
14    15    16    17    18    19    20
21    22    23    24    25    26    27
28    29    30     —     —     —     —
```

**Color coding:**
- Gray: Pre-trip / post-trip days at home
- Blue: Travel/flight days (Jun 5, 6, 13, 20)
- Green: Florence (Jun 7–10)
- Orange: Naples (Jun 11–12); Jun 13 = orange/blue (depart)
- Olive/gold: Puglia (Jun 14–19)

- [ ] **Step 1: Create `research/june-calendar.qmd` with this content:**

```markdown
---
title: "June 2026 — Trip Calendar"
subtitle: "Florence · Naples · Puglia"
categories: [planning, overview]
toc: false
---

```{=html}
<style>
/* ── Screen styles ── */
.cal-wrap { overflow-x: auto; margin: 1.5rem 0; }

table.june-cal {
  width: 100%;
  border-collapse: collapse;
  font-family: inherit;
  table-layout: fixed;
}

table.june-cal th {
  background: #2c3e50;
  color: #fff;
  text-align: center;
  padding: 0.5rem 0.25rem;
  font-size: 0.85rem;
  letter-spacing: 0.05em;
  text-transform: uppercase;
}

table.june-cal td {
  border: 1px solid #ccc;
  vertical-align: top;
  padding: 0.4rem 0.5rem;
  height: 90px;
  width: 14.28%;
  font-size: 0.78rem;
  line-height: 1.35;
}

.day-num {
  font-size: 1rem;
  font-weight: 700;
  display: block;
  margin-bottom: 0.2rem;
}

.day-label {
  font-size: 0.72rem;
  font-weight: 600;
  display: block;
  margin-bottom: 0.15rem;
}

.day-detail {
  font-size: 0.68rem;
  color: #444;
  display: block;
  line-height: 1.3;
}

/* Cell color classes */
td.home    { background: #f5f5f5; color: #888; }
td.depart  { background: #dbeafe; border: 2px solid #2563eb; }
td.arrive  { background: #dbeafe; border: 2px solid #2563eb; }
td.travel  { background: #bfdbfe; border: 2px solid #1d4ed8; }
td.florence{ background: #dcfce7; border: 1px solid #16a34a; }
td.naples  { background: #ffedd5; border: 1px solid #ea580c; }
td.depart-naples { background: linear-gradient(135deg, #ffedd5 50%, #bfdbfe 50%); border: 2px solid #9333ea; }
td.puglia  { background: #fef9c3; border: 1px solid #ca8a04; }
td.home-return { background: #f0fdf4; border: 2px solid #16a34a; }
td.empty   { background: #fafafa; }

/* ── Print styles ── */
@media print {
  .quarto-sidebar, .quarto-navbar, .page-navigation,
  .sidebar-navigation, nav.quarto-secondary-nav,
  #quarto-sidebar, #quarto-header, footer,
  .callout, .quarto-title-meta { display: none !important; }

  body, .content, .page-columns { margin: 0 !important; padding: 0 !important; }
  .column-page, .column-body { max-width: 100% !important; }

  h1.title { font-size: 18pt; margin-bottom: 4pt; }
  h1.subtitle { font-size: 12pt; margin-bottom: 8pt; }

  table.june-cal { width: 100%; font-size: 8pt; }
  table.june-cal td { height: 72pt; padding: 3pt 4pt; }
  .day-num { font-size: 11pt; }
  .day-label { font-size: 7pt; }
  .day-detail { font-size: 6.5pt; }

  .legend-wrap { font-size: 8pt; }
}
</style>

<div class="cal-wrap">
<table class="june-cal">
<thead>
<tr>
  <th>Sunday</th>
  <th>Monday</th>
  <th>Tuesday</th>
  <th>Wednesday</th>
  <th>Thursday</th>
  <th>Friday</th>
  <th>Saturday</th>
</tr>
</thead>
<tbody>

<!-- Week 1 -->
<tr>
  <td class="empty"></td>
  <td class="home"><span class="day-num">1</span></td>
  <td class="home"><span class="day-num">2</span></td>
  <td class="home"><span class="day-num">3</span></td>
  <td class="home"><span class="day-num">4</span></td>
  <td class="depart">
    <span class="day-num">5</span>
    <span class="day-label">✈️ Day 1 — Depart</span>
    <span class="day-detail">MSN → ORD → Frankfurt<br>LH 8835 + LH 0433<br>10:30pm overnight</span>
  </td>
  <td class="arrive">
    <span class="day-num">6</span>
    <span class="day-label">✈️ Day 2 — Arrive Florence</span>
    <span class="day-detail">FRA → FLR (LH 9498)<br>Land 6:30pm<br>First night in Italy!</span>
  </td>
</tr>

<!-- Week 2 -->
<tr>
  <td class="florence">
    <span class="day-num">7</span>
    <span class="day-label">🏛 Day 3 — Florence</span>
    <span class="day-detail">Duomo dome climb<br>Uffizi Gallery<br>Ponte Vecchio</span>
  </td>
  <td class="florence">
    <span class="day-num">8</span>
    <span class="day-label">🏛 Day 4 — Florence</span>
    <span class="day-detail">Accademia — David<br>Medici Chapels<br>Mercato Centrale</span>
  </td>
  <td class="florence">
    <span class="day-num">9</span>
    <span class="day-label">🏛 Day 5 — Florence</span>
    <span class="day-detail">Bargello Museum<br>Santa Croce<br>Local neighborhood</span>
  </td>
  <td class="travel">
    <span class="day-num">10</span>
    <span class="day-label">🚄 Day 6 — Train South</span>
    <span class="day-detail">Italo #8902 12:28pm<br>Arrive Naples 3:28pm<br>First night in Naples</span>
  </td>
  <td class="naples">
    <span class="day-num">11</span>
    <span class="day-label">🏺 Day 7 — Naples</span>
    <span class="day-detail">Herculaneum ruins<br>Ancient Roman city<br>Circumvesuviana train</span>
  </td>
  <td class="naples">
    <span class="day-num">12</span>
    <span class="day-label">🏺 Day 8 — Naples</span>
    <span class="day-detail">MANN Museum<br>Cappella Sansevero<br>Spaccanapoli</span>
  </td>
  <td class="depart-naples">
    <span class="day-num">13</span>
    <span class="day-label">✈️ Day 9 — Fly to Puglia</span>
    <span class="day-detail">AZ 1270: NAP→FCO 3:05pm<br>AZ 1623: FCO→BDS 5:15pm<br>Arrive Brindisi 6:25pm</span>
  </td>
</tr>

<!-- Week 3 -->
<tr>
  <td class="puglia">
    <span class="day-num">14</span>
    <span class="day-label">🫒 Day 10 — Brindisi</span>
    <span class="day-detail">First full Puglia day<br>Historic harbor walk<br>Colonne Romane</span>
  </td>
  <td class="puglia">
    <span class="day-num">15</span>
    <span class="day-label">🫒 Day 11 — Puglia</span>
    <span class="day-detail">Tour Day 1<br>(TBD when confirmed)</span>
  </td>
  <td class="puglia">
    <span class="day-num">16</span>
    <span class="day-label">🫒 Day 12 — Puglia</span>
    <span class="day-detail">Tour Day 2<br>(TBD when confirmed)</span>
  </td>
  <td class="puglia">
    <span class="day-num">17</span>
    <span class="day-label">🫒 Day 13 — Puglia</span>
    <span class="day-detail">Tour Day 3<br>(TBD when confirmed)</span>
  </td>
  <td class="puglia">
    <span class="day-num">18</span>
    <span class="day-label">🫒 Day 14 — Puglia</span>
    <span class="day-detail">Tour Day 4<br>(TBD when confirmed)</span>
  </td>
  <td class="puglia">
    <span class="day-num">19</span>
    <span class="day-label">🫒 Day 15 — Puglia</span>
    <span class="day-detail">Tour Day 5<br>Pack for departure</span>
  </td>
  <td class="travel">
    <span class="day-num">20</span>
    <span class="day-label">✈️ Day 16 — Fly Home</span>
    <span class="day-detail">BDS → MUC 10:55am<br>MUC → ORD 3:40pm<br>ORD → MSN 9:15pm</span>
  </td>
</tr>

<!-- Week 4 -->
<tr>
  <td class="home-return">
    <span class="day-num">21</span>
    <span class="day-label">🏠 Home</span>
    <span class="day-detail">Arrive ~10:30pm Jun 20<br>Recover &amp; unpack</span>
  </td>
  <td class="home"><span class="day-num">22</span></td>
  <td class="home"><span class="day-num">23</span></td>
  <td class="home"><span class="day-num">24</span></td>
  <td class="home"><span class="day-num">25</span></td>
  <td class="home"><span class="day-num">26</span></td>
  <td class="home"><span class="day-num">27</span></td>
</tr>

<!-- Week 5 -->
<tr>
  <td class="home"><span class="day-num">28</span></td>
  <td class="home"><span class="day-num">29</span></td>
  <td class="home"><span class="day-num">30</span></td>
  <td class="empty"></td>
  <td class="empty"></td>
  <td class="empty"></td>
  <td class="empty"></td>
</tr>

</tbody>
</table>
</div>

<div class="legend-wrap" style="display:flex; flex-wrap:wrap; gap:0.75rem; margin-top:1rem; font-size:0.8rem;">
  <span style="background:#dbeafe;border:2px solid #2563eb;padding:3px 8px;border-radius:4px;">✈️ Travel / Flight Days</span>
  <span style="background:#bfdbfe;border:2px solid #1d4ed8;padding:3px 8px;border-radius:4px;">🚄 Train Days</span>
  <span style="background:#dcfce7;border:1px solid #16a34a;padding:3px 8px;border-radius:4px;">🏛 Florence</span>
  <span style="background:#ffedd5;border:1px solid #ea580c;padding:3px 8px;border-radius:4px;">🏺 Naples</span>
  <span style="background:#fef9c3;border:1px solid #ca8a04;padding:3px 8px;border-radius:4px;">🫒 Puglia</span>
  <span style="background:#f5f5f5;border:1px solid #ccc;padding:3px 8px;border-radius:4px;">Home</span>
</div>
```

---

::: {.callout-tip}
## Print This Calendar

Use your browser's **File → Print** (or Ctrl+P / Cmd+P). The sidebar and navigation will be hidden automatically and the calendar will fill the page. Print to **landscape** orientation for best results.
:::

## Quick Reference

**Reservations in Hand:**

| What | Code | Date |
|------|------|------|
| Outbound flights (LH) | FMWYOJ | Jun 5–6 |
| Return flights (LH/UA) | FMWYOJ | Jun 20 |
| Italo train FLR→NAP | PIDCMA | Jun 10 |
| ITA flights NAP→BDS | IXYZMT | Jun 13 |
```

- [ ] **Step 2: Verify the file exists and has no syntax errors**

```bash
cat /home/gramps/rstudio/quarto/columbus/research/june-calendar.qmd | head -20
```

Expected: YAML frontmatter visible at top.

---

## Task 2: Create the Pre-Departure Checklist Page

**File:** `research/pre-departure-checklist.qmd`

- [ ] **Step 1: Create `research/pre-departure-checklist.qmd` with this content:**

```markdown
---
title: "Pre-Departure Checklist"
subtitle: "Everything to do before June 5, 2026"
categories: [planning, checklist]
toc: true
toc-depth: 2
---

::: {.callout-note}
## What's Already Booked

- ✅ **Outbound flights** (FMWYOJ): MSN → ORD → Frankfurt → Florence, Jun 5–6
- ✅ **Return flights** (FMWYOJ): Brindisi → Munich → Chicago → Madison, Jun 20
- ✅ **Florence → Naples train** (PIDCMA): Italo #8902, Jun 10, 12:28pm
- ✅ **Naples → Brindisi flights** (IXYZMT): AZ 1270 + AZ 1623 via Rome, Jun 13
:::

---

## Museum & Attraction Tickets

Book these as soon as possible — summer slots fill weeks ahead.

### Florence (Days 3–5, Jun 7–9)

| Priority | Attraction | Day | Date | Notes |
|----------|-----------|-----|------|-------|
| 🔴 URGENT | Duomo Complex (combo, €30) | Day 3 | Jun 7 (Sun) | Timed dome climb — sells out |
| 🔴 URGENT | Uffizi Gallery | Day 3 | Jun 7 (Sun) | June Sundays sell out weeks ahead |
| 🔴 URGENT | Galleria dell'Accademia (David, €20) | Day 4 | Jun 8 (Mon) | Timed entry required |
| 🟡 Soon | Medici Chapels | Day 4 | Jun 8 (Mon) | Less pressure but still book ahead |
| 🟢 Optional | Basilica di San Lorenzo / Laurentian Library | Day 4 | Jun 8 (Mon) | Check Sunday hours |
| 🟢 Optional | Palazzo Vecchio | Day 4 | Jun 8 (Mon) | Walk-in often OK |
| 🟢 Optional | Museum of San Marco | Day 4 or 5 | Jun 8–9 | Closed Tuesdays |

**Booking links:** See [Florence Tickets page](tickets-florence.qmd)

- [ ] Book Uffizi Gallery timed entry (Jun 7)
- [ ] Book Duomo Complex combo ticket / dome climb (Jun 7)
- [ ] Book Galleria dell'Accademia (Jun 8)
- [ ] Book Medici Chapels (Jun 8)

### Naples (Days 7–9, Jun 11–13)

| Priority | Attraction | Day | Date | Notes |
|----------|-----------|-----|------|-------|
| 🔴 URGENT | Cappella Sansevero (€9) | Day 8 | Jun 12 (Fri) | Tiny chapel — sells out FAST |
| 🟡 Soon | Herculaneum entry | Day 7 | Jun 11 (Thu) | Check if guided tour includes |
| 🟡 Soon | MANN Museum (€18) | Day 8 | Jun 12 (Fri) | Closed Tuesdays — Fri is fine |
| 🟢 Optional | Napoli Sotterranea | Day 9 morning | Jun 13 (Sat) | Book 10am slot — flight is 3pm |

**Booking links:** See [Naples Tickets page](tickets-naples.qmd)

- [ ] Book Cappella Sansevero timed entry (Jun 12) ← **Do this first**
- [ ] Book Herculaneum entry (Jun 11) — or confirm if guided tour covers it
- [ ] Book MANN Museum (Jun 12) — walk-in often OK but reserve to be safe
- [ ] Book Napoli Sotterranea 10am slot (Jun 13) — optional

---

## Accommodations

Confirm all hotel bookings and note check-in/check-out details.

| City | Arrival | Departure | Nights |
|------|---------|-----------|--------|
| **Florence** | Sat Jun 6 (~7pm) | Wed Jun 10 (checkout by train) | 4 nights |
| **Naples** | Wed Jun 10 (~3:30pm) | Sat Jun 13 (checkout, fly 3pm) | 3 nights |
| **Brindisi/Puglia** | Sat Jun 13 (~7pm) | Sat Jun 20 (early flight 10:55am) | 6 nights |

- [ ] Florence hotel: book / confirm reservation — note early evening arrival Jun 6
- [ ] Naples hotel: book / confirm reservation — note Jun 10 afternoon check-in, Jun 13 checkout by noon
- [ ] Brindisi / Puglia accommodations: book / confirm — note Jun 20 departure requires 8am hotel checkout

---

## Tours

- [ ] **Herculaneum guided tour** — book with licensed guide for Jun 11; check tour confirmation for meeting time/place
- [ ] **Puglia organized tour** — confirm tour operator, pickup location, all 6 days (Jun 15–19); get daily schedule
- [ ] Confirm tour meeting points are in writing (hotel address and guide contact)

---

## Restaurant Reservations

Florence and Naples are busy in June — reserve ahead for any notable restaurant.

### Florence
- [ ] **Bistecca alla fiorentina dinner** — the T-bone steak experience; needs a reservation at a proper Tuscan steakhouse
- [ ] Any other special dinners — ask hotel concierge for current favorites

### Naples
- [ ] **50 Kalò** (upscale pizza) — reserve in advance
- [ ] Any special seafood restaurant on Lungomare — reserve ahead for Saturday dinner if desired

---

## Documents & Admin

- [ ] Verify **passports are valid** at least 6 months beyond Jun 20, 2026 (i.e., valid through December 2026)
- [ ] Purchase **travel insurance** covering medical, trip cancellation, and baggage
- [ ] **Notify credit card companies** of travel dates and countries (Italy, Germany)
- [ ] Check that cards have no foreign transaction fees; confirm backup card
- [ ] Get some **euros in cash** before departing (ATMs in Italy are plentiful, but handy for arrival)

**Print and carry (physical copies):**
- [ ] All four flight reservations (FMWYOJ outbound, FMWYOJ return, IXYZMT Naples-Brindisi)
- [ ] Italo train ticket (PIDCMA)
- [ ] Hotel confirmation for each city
- [ ] Emergency contacts: hotel addresses, tour operator phone
- [ ] One copy each: passports (stored separately from originals)
- [ ] This [June calendar](june-calendar.qmd)

---

## Phone & Technology

- [ ] **International phone plan** — confirm Italy coverage with your carrier; add international data if needed
- [ ] Download **offline maps** for Florence, Naples, and Brindisi (Google Maps or Maps.me — do before you leave, not at the airport)
- [ ] Download **Google Translate** — Italian language pack for offline use
- [ ] Download **Trenitalia app** (for Circumvesuviana updates from Naples)
- [ ] Download **Lufthansa app** (for flight check-in and boarding passes)
- [ ] Download **ITA Airways (AZ)** app or save boarding passes for NAP→BDS flights
- [ ] Download entertainment (shows, podcasts, audiobooks) for 9-hour transatlantic flights

---

## Health & Safety

- [ ] Visit doctor/travel medicine clinic if needed for any vaccinations or prescriptions
- [ ] Refill all regular medications — pack **more than enough** for the trip plus extras
- [ ] Pack a small travel medical kit: ibuprofen, antihistamine, blister pads, antidiarrheal
- [ ] Purchase **compression socks** for the transatlantic flights (reduces DVT risk)
- [ ] Confirm travel insurance covers emergency medical evacuation

---

## Packing

See the full [Packing List](packing-list.qmd) for detailed items.

**Key pre-packing tasks:**
- [ ] Weigh all bags — checked max 23kg (50 lbs) per person; carry-on max 8kg
- [ ] Test that all electronics work and have appropriate adapters (Italy uses Type L / Type F outlets)
- [ ] Buy a **universal travel adapter** if you don't have one (Type C/E/F works in Italy)
- [ ] Break in any new walking shoes — do NOT bring brand-new shoes to Italy

---

## One Week Before Departure

- [ ] Check in online for all flights (opens 24 hours before each flight)
- [ ] Confirm all museum/attraction tickets are accessible on phone
- [ ] Reconfirm hotel reservations (email/call each)
- [ ] Reconfirm tour operator for Herculaneum and Puglia
- [ ] Check weather forecast for each city
- [ ] Charge and pack all electronics
- [ ] Empty refrigerator of perishables
- [ ] Arrange pet/plant care
- [ ] Set home thermostat, lock windows and doors
- [ ] Let a trusted contact know the full itinerary

---

## Day Before Departure (Jun 4)

- [ ] Final packing — nothing left out
- [ ] Weigh bags one last time
- [ ] Arrange transportation to Madison airport for 5:45pm flight
- [ ] Set **two alarms** — this flight cannot be missed
- [ ] Check MSN → ORD and ORD → FRA flight status
- [ ] Charge phone and all devices to 100%
- [ ] Passport, tickets, and credit cards in carry-on — confirmed
```

---

## Task 3: Register Both Pages in `_quarto.yml`

**File:** `_quarto.yml`

The two new pages go at the **top** of the Pre-Trip Planning sidebar section (before Flights), and as new entries in the Research navbar menu.

- [ ] **Step 1: Add to sidebar `contents:` under `section: "Pre-Trip Planning"`**

Find this block in `_quarto.yml`:

```yaml
      - section: "Pre-Trip Planning"
        contents:
          - research/flights.qmd
```

Replace with:

```yaml
      - section: "Pre-Trip Planning"
        contents:
          - research/june-calendar.qmd
          - research/pre-departure-checklist.qmd
          - research/flights.qmd
```

- [ ] **Step 2: Add to the navbar Research menu**

Find the `text: "Research"` menu in `_quarto.yml`. Add two entries at the top of the menu list:

```yaml
      - text: "Research"
        menu:
          - text: "June Calendar"
            href: research/june-calendar.qmd
          - text: "Pre-Departure Checklist"
            href: research/pre-departure-checklist.qmd
          - text: "---"
          - text: "Flights"
            href: research/flights.qmd
          # ... (rest of existing menu items unchanged)
```

---

## Task 4: Render and Verify

- [ ] **Step 1: Render the site**

```bash
docker exec rstudio quarto render /home/rstudio/Quarto/columbus 2>&1 | tail -20
```

Expected: `Output created: _site/index.html` with no errors. Two new files should appear in render output: `research/june-calendar.qmd` and `research/pre-departure-checklist.qmd`.

- [ ] **Step 2: Spot-check the calendar**

Open `_site/research/june-calendar.html` in a browser and verify:
- June 1 is in the Monday column (not Sunday)
- Jun 5 (Fri) shows departure info
- Jun 10 (Wed) shows train details
- Jun 13 (Sat) shows the flight info
- Legend displays at the bottom
- Color coding is visible and distinct

- [ ] **Step 3: Spot-check the checklist**

Open `_site/research/pre-departure-checklist.html` and verify:
- Already-booked callout at top shows all four reservations
- Section headers are correct
- TOC renders in sidebar

- [ ] **Step 4: Commit**

```bash
git add research/june-calendar.qmd research/pre-departure-checklist.qmd _quarto.yml _site/
git commit -m "feat: add June calendar and pre-departure checklist pages"
```

---

## Self-Review

**Spec coverage:**
- ✅ June calendar: Sun–Sat format, all 16 trip days, printable
- ✅ Calendar in Pre-Trip Planning section
- ✅ Pre-departure checklist: museum/attraction tickets with priority, restaurant reservations, flights/trains (notes what's booked), accommodations, documents, tech, packing
- ✅ Both pages in sidebar and navbar

**Placeholder scan:**
- No TBD content except Puglia tour days 1–5 (those are genuinely TBD in the actual trip planning)

**Type/link consistency:**
- `tickets-florence.qmd` and `tickets-naples.qmd` referenced with relative paths — correct
- `june-calendar.qmd` referenced from checklist page — path is `june-calendar.qmd` (same directory) — correct
- All daily itinerary cross-links use relative paths consistent with existing site

---
