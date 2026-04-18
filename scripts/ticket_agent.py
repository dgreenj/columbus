#!/usr/bin/env python3
"""
Florence Ticket Agent — Days 3 & 4
Fetches official booking info for each site and writes research/tickets-days-3-4.md
"""

import subprocess
import json
import sys
from pathlib import Path
from datetime import datetime

PROJECT_ROOT = Path(__file__).parent.parent
OUTPUT_FILE = PROJECT_ROOT / "research" / "tickets-days-3-4.md"

SITES = [
    {
        "day": 3,
        "date": "Saturday June 7",
        "name": "Duomo Complex (combo ticket)",
        "url": "https://www.museumflorence.com/museum/3/tickets-for-brunelleschi-dome",
        "notes": "€30 combo; timed dome climb; go first thing in morning",
    },
    {
        "day": 3,
        "date": "Saturday June 7",
        "name": "Uffizi Gallery",
        "url": "https://www.uffizi.it/en/tickets",
        "notes": "Timed entry; June weekends sell out weeks ahead",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Galleria dell'Accademia (David)",
        "url": "https://www.b-ticket.com/b-ticket/uffizi/default.aspx",
        "notes": "Timed entry; 8:15 AM slot best — before crowds",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Medici Chapels",
        "url": "https://www.b-ticket.com/b-ticket/uffizi/default.aspx",
        "notes": "Book same session; walk from Accademia ~10 min",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Basilica di San Lorenzo & Laurentian Library",
        "url": "https://www.operamedicealaurenziana.org",
        "notes": "Separate ticket for library; confirm Sunday hours",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Palazzo Vecchio (optional)",
        "url": "https://www.museumflorence.com/museum/1/palazzo-vecchio",
        "notes": "Secret passages tour extra; afternoon slot",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Museum of San Marco (optional)",
        "url": "https://www.b-ticket.com/b-ticket/uffizi/default.aspx",
        "notes": "Fra Angelico frescoes; closed Tuesday — open Sunday",
    },
]

if __name__ == "__main__":
    print(f"Florence Ticket Agent — {len(SITES)} sites to check")
    print(f"Output: {OUTPUT_FILE}\n")
    # Tasks 2 and 3 add scraping and report writing here
