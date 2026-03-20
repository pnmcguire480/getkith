# Designer Brief — Phase A2: Dual-Path "Get Involved" Flow

## Context
The main CTA ("Get Involved") now opens a modal with a **path-selection step** before showing a form. This replaces the old single "Apply Now" → builder form flow.

## User Flow

```
[User taps "Get Involved" CTA]
        │
        ▼
┌─────────────────────────┐
│   PATH SELECTOR MODAL   │
│                         │
│  "Get Involved"         │
│  "Two ways in. One      │
│   mission."             │
│                         │
│  ┌───────────────────┐  │
│  │ I want to build   │  │
│  │ Engineers,         │  │
│  │ designers,         │  │
│  │ strategists        │  │
│  └───────────────────┘  │
│                         │
│  ┌───────────────────┐  │
│  │ I want to join    │  │
│  │ Early adopters,    │  │
│  │ believers, future  │  │
│  │ members            │  │
│  └───────────────────┘  │
│                         │
└─────────────────────────┘
        │
   ┌────┴────┐
   ▼         ▼
[BUILD]   [JOIN]
   │         │
   ▼         ▼
Builder   Early Adopter
 Form       Form
   │         │
   └────┬────┘
        ▼
  [SUCCESS STATE]
  "Signal received."
```

## States & Interactions

### 1. Path Selector (initial state)
- **Headline:** "Get Involved"
- **Subtext:** "Two ways in. One mission."
- **Two large tappable cards** stacked vertically:
  - Each has an icon, a bold label, and a short descriptor line
  - On hover/tap, visual feedback (border highlight, background shift)
- **Close button** (×) top-right
- Clicking overlay or pressing Escape closes modal
- **Design decision for you:** How large should these cards be? Should they be side-by-side on desktop and stacked on mobile? Icon style? The functional content is set — the visual treatment is yours.

### 2. Builder Application Form (after selecting "I want to build")
- **Back arrow** top-left returns to path selector
- **Headline:** "Apply to build"
- **Required fields (4):** Name, Contact, Role (dropdown), What have you shipped (textarea)
- **Optional fields (3):** Portfolio/GitHub, Timezone, Availability (dropdown)
- **Submit button:** "Send Signal"
- **Validation state:** Error message appears above form if required fields empty
- **Sending state:** Button disables, text changes to "Sending..."
- **Content hierarchy:** The question "What have you shipped?" is the most important field — it should feel prominent

### 3. Early Adopter Form (after selecting "I want to join")
- **Back arrow** top-left returns to path selector
- **Headline:** "Join the wave"
- **Required fields (2):** Name, Contact
- **Optional fields (2):** What draws you to Kith (textarea), How did you hear about us
- **Submit button:** "Count me in"
- **Same validation/sending states as builder form**
- **Content hierarchy:** This form is intentionally shorter and lower-friction. It should feel welcoming and easy, not intimidating.

### 4. Success State (shared)
- Both paths land here after successful submission
- Checkmark icon, "Signal received." headline
- Subtext: "If it's a fit, you'll hear from a person. Not an autoresponder."
- Submit button stays disabled (rate limiting — one submission per modal open)

## Edge Cases
- **Rate limiting:** After successful submission, submit button remains disabled. User must close and reopen modal to submit again (form resets on open).
- **Error recovery:** If submission fails, error message appears and submit button re-enables so user can retry.
- **Mobile:** All content must be scrollable within the modal at small viewports.
- **Keyboard:** Escape closes modal. Tab order should flow naturally through form fields.

## What I've Built (Code)
The HTML structure, form fields, JS logic, and basic CSS are in place. The path selector has placeholder styling that works functionally. Your job is to make the path-selection moment feel like a meaningful choice — not a speed bump.
