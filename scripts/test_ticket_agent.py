"""Tests for ticket_agent extraction functions."""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from ticket_agent import extract_ticket_info

# ── Price extraction tests ──────────────────────────────────────────────────

def test_price_extracts_euro_digit():
    """Lines with €+digit are captured."""
    raw = "Adult ticket: €18\nChild: €9\n"
    info = extract_ticket_info(raw, "test")
    assert any("€18" in p for p in info["prices"])
    assert any("€9" in p for p in info["prices"])


def test_price_excludes_nav_text():
    """Lines with 'ticket' but no €+digit are excluded."""
    raw = "[Buy Tickets](https://example.com)\n# Tickets\nGo to ticket office\n"
    info = extract_ticket_info(raw, "test")
    assert info["prices"] == []


def test_price_excludes_word_euro_without_digit():
    """'euro' as a word without a price is excluded."""
    raw = "Pay in euro or card accepted\n"
    info = extract_ticket_info(raw, "test")
    assert info["prices"] == []


# ── Booking link domain whitelist tests ────────────────────────────────────

def test_booking_link_keeps_whitelisted_domain():
    """Links on known ticket domains are kept."""
    raw = "[Buy Tickets](https://tickets.duomo.firenze.it/en/store)\n"
    info = extract_ticket_info(raw, "test")
    assert len(info["book_links"]) == 1
    assert "tickets.duomo.firenze.it" in info["book_links"][0]


def test_booking_link_excludes_facebook():
    """Facebook links are excluded even if they contain 'ticket'."""
    raw = "[Share](https://www.facebook.com/sharer?u=ticket)\n"
    info = extract_ticket_info(raw, "test")
    assert info["book_links"] == []


def test_booking_link_excludes_nav_links():
    """Generic nav links containing 'book' are excluded."""
    raw = "[Book your hotel](https://booking.com/hotel)\n"
    info = extract_ticket_info(raw, "test")
    assert info["book_links"] == []


# ── Double-bullet strip tests ───────────────────────────────────────────────

def test_prices_no_leading_dash():
    """Price lines must not start with '- '."""
    raw = "- €18 adult\n* €9 child\n• €5 student\n"
    info = extract_ticket_info(raw, "test")
    for p in info["prices"]:
        assert not p.startswith("- "), f"Leading dash found: {p!r}"
        assert not p.startswith("* "), f"Leading star found: {p!r}"
        assert not p.startswith("• "), f"Leading bullet found: {p!r}"


def test_book_links_no_leading_dash():
    """Booking link lines must not start with '- '."""
    raw = "- [Buy](https://tickets.duomo.firenze.it/store)\n"
    info = extract_ticket_info(raw, "test")
    for lnk in info["book_links"]:
        assert not lnk.startswith("- "), f"Leading dash found: {lnk!r}"
