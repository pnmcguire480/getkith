# Kith — Phase Prompts

Copy-paste one prompt per fresh chat session. Complete each phase before moving to the next.

---

## PHASE A1 — Repo Hygiene & Commit Current Work
**STATUS: COMPLETE**

---

## PHASE A2 — Configure Supabase & Dual-Path "Get Involved" Flow

```
PROJECT: Kith (getkith.build) — decentralized mutual aid platform
REPO: c:\Dev\GetKith
CONTEXT: Read CLAUDE.md for full project context. Check .claude memory for details.

TASK: Phase A2 — Configure Supabase & build dual-path "Get Involved" flow.

The current "Apply Now" button needs to become a two-path entry point:

PATH 1: "I want to build" — Builder application form
  Fields: name, contact (encrypted preferred), role (Frontend/Backend/Smart Contract/Security/Design/Community/Legal/Other), portfolio/GitHub, timezone, availability (Full-time/Part-time/Volunteer/Advisory), what have you shipped

PATH 2: "I want to join" — Early adopter signup
  Fields: name, contact, what draws you to Kith, how did you hear about us

USER FLOW: User taps main CTA → popup asks which path → user selects → appropriate form appears

ENGINEERING WORK:
1. Create Supabase project (I'll provide the URL and anon key when prompted)
2. Replace YOUR_SUPABASE_URL / YOUR_SUPABASE_ANON_KEY placeholders in index.html
3. Create two Supabase tables with RLS (INSERT only for anon):
   - builder_applications
   - early_adopters
4. Build the path-selection popup and both form variants in index.html
5. Add rate limiting (disable submit button after success)

NOTE: I have a UI/UX designer. You handle code and functional requirements only — do not prescribe visual design. Write a designer brief describing the user flow, states, and content hierarchy for the path-selection moment and both forms.

TEST:
- Both paths submit to correct Supabase tables
- Data appears in Supabase dashboard
- RLS blocks reads from anon key
- Rate limiting prevents rapid-fire submissions

DONE WHEN: Patrick receives both builder applications AND early adopter signups through the site.
```

---

## PHASE A3 — Referral System & Share Mechanics

```
PROJECT: Kith (getkith.build) — decentralized mutual aid platform
REPO: c:\Dev\GetKith
CONTEXT: Read CLAUDE.md for full project context. Check .claude memory for details.

TASK: Phase A3 — Build referral system and share mechanics.

PREREQUISITE: Phase A2 is complete. Supabase is configured. Two signup paths exist (builders + early adopters).

FUNCTIONAL REQUIREMENT: Every signup generates a unique referral link. Sharing that link and getting others to sign up earns the referrer credit toward founding badges at app launch.

ENGINEERING WORK:
1. Generate unique referral code (short hash) per signup, stored in Supabase
2. Add referral tracking table in Supabase: referrals (referrer_id, referred_id, created_at)
3. Detect referral code from URL query param (?ref=XXXX) on page load
4. After signup, show success screen with:
   - Referral link (one-tap copyable)
   - Social share buttons: Twitter/X, Instagram, WhatsApp, copy link — each appends referral code
   - Message explaining badge rewards
5. Track referral counts per user in Supabase
6. Handle edge cases: duplicate signups, self-referral, invalid codes

FOUNDING BADGE TIERS (earned at app launch based on referral count):
- 5+ referrals → "Torchbearer"
- 25+ referrals → "Signal Fire"
- 100+ referrals → "First Light"

NOTE: I have a UI/UX designer. Write a designer brief for the post-signup success/share moment. Describe user flow and states, not visual specs.

TEST:
- Referral codes generate uniquely
- Tracking works (referrer gets credit when someone signs up via their link)
- Share links include referral code
- Duplicate signups handled gracefully
- Self-referral prevented

DONE WHEN: Viral loop is active — every signup generates a shareable link with tracking.
```

---

## PHASE A4 — Set Real Wallet Addresses & Live Transparency

```
PROJECT: Kith (getkith.build) — decentralized mutual aid platform
REPO: c:\Dev\GetKith
CONTEXT: Read CLAUDE.md for full project context. Check .claude memory for details.

TASK: Phase A4 — Wire real wallet addresses and live transparency dashboard.

PREREQUISITE: Phases A1-A3 complete.

ENGINEERING WORK:
1. Replace YOUR_ETH_WALLET / YOUR_BTC_WALLET placeholders with real addresses (I'll provide them when prompted)
2. Integrate Etherscan/Polygonscan API to read wallet balances and transaction history
3. Create a caching layer for API responses (avoid rate limits — 5-minute cache)
4. Wire the transparency dashboard section to display real data:
   - Total raised
   - Contributor count
   - Recent transactions
5. Make "Verify on-chain" link point to actual block explorer address page
6. Handle API failures gracefully (show cached data or loading state, never crash)

TEST:
- Wallet addresses display correctly
- Copy-to-clipboard works with real addresses
- Dashboard shows real (likely zero initially) balances
- API rate limits handled gracefully
- Dashboard handles API failures without crashing

DONE WHEN: Transparency section is live with real on-chain data.
```

---

## PHASE A5 — SEO, Meta, & Public Visibility

```
PROJECT: Kith (getkith.build) — decentralized mutual aid platform
REPO: c:\Dev\GetKith
CONTEXT: Read CLAUDE.md for full project context. Check .claude memory for details.

TASK: Phase A5 — Make the site discoverable and trackable.

PREREQUISITE: Phases A1-A4 complete. Referral system is live, so social sharing previews matter.

ENGINEERING WORK:
1. Update robots.txt — allow crawling (currently Disallow: /)
2. Verify OG image exists and renders correctly for social sharing (og-image.png was added in A1)
3. Ensure all OG meta tags are correct (og:title, og:description, og:image, og:url)
4. Add structured data (JSON-LD) for the organization
5. Verify Lighthouse scores (target 90+ across all categories)
6. Add privacy-respecting analytics (Plausible or Umami — NOT Google Analytics)
7. Test social share previews on: Twitter/X, WhatsApp, iMessage, LinkedIn, Discord

FILES: robots.txt, index.html (head section)

TEST:
- Social share previews render correctly on all major platforms
- Lighthouse scores 90+ (Performance, Accessibility, Best Practices, SEO)
- Analytics collecting page views
- robots.txt allows crawling

DONE WHEN: Site is discoverable, trackable, and looks great when shared.
```

---

## PHASE A6 — Content Polish & Stewardship Commonwealth Integration

```
PROJECT: Kith (getkith.build) — decentralized mutual aid platform
REPO: c:\Dev\GetKith
CONTEXT: Read CLAUDE.md and .claude memory for full project context. Specifically read the Stewardship Commonwealth memory file for the governance framework details.

TASK: Phase A6 — Polish landing page content and integrate Stewardship Commonwealth values.

PREREQUISITE: Phases A1-A5 complete.

CONTENT WORK:
1. Review and refine manifesto copy on the landing page
2. Add a "Values" or "Charter" section referencing Stewardship Commonwealth principles:
   - Limits on extraction and irreversible harm
   - Accountability tied to traceable responsibility
   - Future consideration as a real stakeholder
   - Transparency and auditability
   - Adaptation based on evidence, not ideology
3. Add "What This Is / What This Is Not" section:
   What This Is: governance framework, shared constraints, accountability model, tool institutions can adopt
   What This Is Not: political party, religion, anti-technology, utopian escapism, personality-driven movement
4. Tone must be: calm, grounded, institutional — NOT activist, preachy, or revolutionary

NOTE: I have a UI/UX designer. Write a designer brief for where these new content sections should live in the page flow and what content hierarchy they need. Do not prescribe layout.

TEST:
- Content reads clearly to a skeptical but curious adult
- Tone is consistent throughout — no jargon, no hype
- Values section accurately represents Stewardship Commonwealth
- "What This Is / What This Is Not" is skimmable

DONE WHEN: Landing page communicates both the product AND the governance philosophy.
```

---

## PHASE A7 — getKith.org Domain & Multi-Domain Setup

```
PROJECT: Kith (getkith.build) — decentralized mutual aid platform
REPO: c:\Dev\GetKith
CONTEXT: Read CLAUDE.md for full project context.

TASK: Phase A7 — Configure getKith.org domain and multi-domain setup.

PREREQUISITE: Phases A1-A6 complete. I need to have purchased getKith.org first.

ENGINEERING WORK:
1. Configure DNS for getKith.org pointing to Netlify
2. Set canonical URL strategy (one primary domain, the other redirects)
3. Update netlify.toml with redirect rules for both domains
4. Ensure SSL/HTTPS works on both domains
5. Update any hardcoded domain references in index.html

FILES: netlify.toml, index.html (canonical URL, OG tags)

TEST:
- Both domains resolve correctly
- Redirects work (non-primary → primary with 301)
- No duplicate content issues
- SSL works on both
- OG tags reference the canonical domain

DONE WHEN: Both domains are live and properly configured.
```

---

## PHASE A8 — App Download Landing Section

```
PROJECT: Kith (getkith.build) — decentralized mutual aid platform
REPO: c:\Dev\GetKith
CONTEXT: Read CLAUDE.md for full project context.

TASK: Phase A8 — Add "Download Kith" placeholder section to the website.

PREREQUISITE: Phases A1-A7 complete.

ENGINEERING WORK:
1. Add a "Download Kith" section to the site (placeholder — app doesn't exist yet)
2. Include: iOS App Store badge, Google Play badge, Web App link (all placeholder/coming soon)
3. If user is already signed up as an early adopter, show "You're on the list" instead of another signup
4. If user hasn't signed up, this section should funnel them to the early adopter signup from Phase A2

NOTE: I have a UI/UX designer. Write a designer brief for this section — placement in page flow, states (signed up vs not), and content hierarchy.

TEST:
- Download section displays correctly
- Integrates with existing early adopter signup (no duplicate signups)
- Coming soon badges look professional
- Mobile responsive

DONE WHEN: Visitors see the app is coming and can sign up if they haven't already.
```

---

## TRACK B PROMPTS

Track B (The Kith App) prompts will be generated when Track A is complete. They follow the same format but target a separate codebase.

Epochs: B0 (Foundation) → B1 (Tanda Mode) → B2 (Smart Contracts) → B3 (Governance) → B4 (Insure Mode) → B5 (World Fund) → B6 (Scale)
