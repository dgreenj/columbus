# Columbus Travel Website

## Italy Trip 2026: Florence, Naples & Puglia

A comprehensive travel planning and documentation website for our June 2026 Italy trip.

### Trip Overview

- **Dates:** June 4-20, 2026 (17 days)
- **Destinations:** Pisa, Florence, Naples, Puglia
- **Framework:** Quarto static site generator
- **Deployment:** GitHub Pages

### Trip Schedule

- **Days 1-2 (Jun 4-5):** Madison → Pisa → Florence
- **Days 3-6 (Jun 6-9):** Florence (4 full days)
- **Days 7-9 (Jun 10-12):** Naples + Herculaneum
- **Day 10 (Jun 13):** Naples → Brindisi (Puglia)
- **Days 11-16 (Jun 14-19):** Puglia tour (details TBD)
- **Day 17 (Jun 20):** Departure from Rome

### Website Structure

```
columbus/
├── daily_itineraries/    # 17 daily itinerary pages
├── research/             # Travel logistics (flights, trains, tours, etc.)
├── regions/              # Florence, Naples, Puglia overviews
├── posts/                # Blog posts about attractions
│   ├── florence/
│   ├── naples/
│   └── puglia/
├── notes/                # Personal travel notes
└── assets/              # Images and documents
```

### Key Features

- **Daily Itineraries:** Detailed day-by-day schedules for all 17 days
- **Research Pages:** Comprehensive travel logistics including flights, trains, accommodations, tours, and museums
- **Regional Guides:** Overview pages for Florence, Naples, and Puglia
- **Blog Posts:** Detailed information about specific attractions and sites
- **Personal Notes:** Space for reflections and observations during the trip
- **Search Functionality:** Built-in search across all content
- **Mobile Responsive:** Works on all devices

### Building the Site

**Local Development:**
```bash
# Preview with live reload
quarto preview

# Build static site
quarto render
```

**Deployment:**
The site is automatically deployed to GitHub Pages via GitHub Actions when changes are pushed to the main branch.

**Site URL:** https://dgreenj.github.io/columbus/

### Content Sources

- Primary travel planning document: `/mnt/nas/Data/Projects/Italy/florence naples puglia v3.docx`
- Additional research and planning materials
- Personal notes and reflections

### Puglia Section Status

Days 11-16 (Puglia tour) are currently placeholders as the tour details are being finalized. These pages will be updated once the tour operator and itinerary are confirmed.

**Update Checklist:** See `docs/puglia-update-checklist.md` (to be created)

### Privacy & Security

Sensitive information (booking confirmations, personal details, confirmation numbers) should be stored in:
- `assets/docs/booking-confirmations/` (git-ignored)
- Local-only files not pushed to GitHub

### Technology Stack

- **Framework:** Quarto
- **Theme:** Lux (Bootstrap-based)
- **Languages:** Markdown, YAML
- **Deployment:** GitHub Pages
- **Version Control:** Git/GitHub

### Contributing

This is a personal travel website. During the trip, both travelers can:
1. Edit files via GitHub web interface
2. Use local Quarto installation for full edits
3. Add photos to `assets/images/`
4. Update daily notes and observations

### Project History

- **Created:** February 2026
- **Based on:** anjins repository (Korea & Japan trip 2025)
- **Last Updated:** February 28, 2026

### References

- [Quarto Documentation](https://quarto.org)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Original Plan](/home/gramps/.claude/plans/sprightly-tickling-knuth.md)

---

**Buon viaggio! 🇮🇹**
