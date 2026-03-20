# Kith — Project Context

## What is Kith?
A decentralized mutual aid platform — risk pools, rotating savings (tandas), insurance, governance, and a global World Fund. Governed by the Stewardship Commonwealth framework (constraint-based governance binding power to consequence).

## Architecture: Two Products, One Identity
- **The Website** (getkith.build / getKith.org) — public face, recruitment, transparency, app download hub. Currently a static site on Netlify.
- **The Kith App** — iOS, Android, Web, low-tech entry — the actual DAO platform. Separate codebase, not yet started.
- They are **different but one**: separate codebases, unified design system and brand identity.

## Current State (Website)
- Single `index.html` with all HTML/CSS/JS inline (1,267 lines)
- Netlify hosted with security headers (CSP, X-Frame-Options, etc.)
- Supabase JS client loaded but using placeholder credentials
- Placeholder wallet addresses (ETH/BTC)
- Dark theme: navy blues (#1b2a4a), green accent (#4CAF50)
- Fonts: DM Sans, Space Mono, Outfit

## Team
- **Patrick** — vision, engineering with AI assistance
- **UI/UX Designer** — handles all visual and interaction design
- **Claude** — code and requirements only. Does NOT design. Writes designer briefs (user flows, states, functional requirements) in designer language.

## Key Principles
- Financial app = security-first. Every phase rigorously tested.
- Stewardship Commonwealth values: limits, accountability, future consideration, transparency, adaptation.
- No seed capital — platform bootstraps itself.
- Year of Seeding: first 12 months = contributions only, no payouts.

## Build Approach
- Tiny phases, each independently testable and valuable.
- Each phase is a standalone "mission briefing" — can be worked on in a fresh chat session.
- Website first (Track A), then App (Track B).
- See the master plan in `.claude/plans/` or project memory for full roadmap.

## Tech Stack
- **Website:** Vanilla HTML/CSS/JS, Netlify, Supabase
- **App (planned):** React Native + Expo, Supabase, Solidity/Hardhat (smart contracts), Polygon
- **Blockchain:** Ethereum/Polygon, smart contracts for pools, governance, micro-donations

## Important: Do NOT
- Make design decisions (colors, layouts, components) — that's the designer's job
- Commit secrets or real credentials
- Skip security testing on any phase
- Over-engineer — smallest working solution first
