-- ══════════════════════════════════════════════════════════
-- Kith Phase A2 — Supabase Table Setup
-- Run this in your Supabase SQL Editor (Database > SQL Editor)
-- ══════════════════════════════════════════════════════════

-- ── TABLE 1: Builder Applications ──
create table if not exists builder_applications (
  id uuid default gen_random_uuid() primary key,
  created_at timestamptz default now() not null,
  name text not null,
  contact text not null,
  role text not null,
  portfolio text,
  timezone text,
  availability text,
  message text not null
);

-- ── TABLE 2: Early Adopters ──
create table if not exists early_adopters (
  id uuid default gen_random_uuid() primary key,
  created_at timestamptz default now() not null,
  name text not null,
  contact text not null,
  why_kith text,
  heard_from text
);

-- ══════════════════════════════════════════════════════════
-- ROW LEVEL SECURITY — anon can INSERT only, never read
-- ══════════════════════════════════════════════════════════

-- Enable RLS on both tables
alter table builder_applications enable row level security;
alter table early_adopters enable row level security;

-- Builder applications: anon can insert, cannot select/update/delete
create policy "Allow anon insert" on builder_applications
  for insert
  to anon
  with check (true);

-- Early adopters: anon can insert, cannot select/update/delete
create policy "Allow anon insert" on early_adopters
  for insert
  to anon
  with check (true);

-- ══════════════════════════════════════════════════════════
-- VERIFY: After running, check:
--   1. Tables appear in Table Editor
--   2. RLS is enabled (lock icon on both tables)
--   3. Only INSERT policies exist for anon role
-- ══════════════════════════════════════════════════════════
