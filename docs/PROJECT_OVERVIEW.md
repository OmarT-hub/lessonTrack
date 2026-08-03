# Project Overview — LessonTrack

## Summary

**LessonTrack** is a parent-focused, offline-first Flutter mobile application designed to organize private tutoring lessons for children. It replaces scattered notes, WhatsApp messages, and mental reminders with a structured, beautiful, and intelligent scheduling experience.

## Problem Statement

Parents of children attending private lessons face a common challenge:

- They juggle multiple children, multiple subjects, multiple teachers, and multiple time slots — all in their heads or in disorganized notes.
- They forget lesson times, show up late, or miss a lesson entirely.
- They have no single view of "who has a lesson right now" or "what's coming next."
- Existing calendar apps are too generic; they are not designed for this specific workflow.

## Solution

LessonTrack provides a dedicated, distraction-free tool built specifically for managing private lessons:

- A real-time dashboard showing current and next lessons with countdowns.
- A clean onboarding flow to create a family and child profiles.
- Structured lesson entries with subjects, teachers, locations, times, and repeating schedules.
- Customizable notifications so parents are never caught off-guard.
- Full offline functionality — no internet, no account, no subscription.

## Target Users

| User | Description |
|---|---|
| Primary | Parents with 1–5 children attending private lessons |
| Secondary | Guardians, tutoring centers managing multiple students |

## Platform

| Platform | Status |
|---|---|
| Android | ✅ First release |
| iOS | 🔜 Planned |
| Web | ❌ Not planned |

## Language & Localization

- Source code and documentation: **English**
- UI (v1.0): **English**
- UI (v1.1+): **Arabic (RTL)** via Flutter localization

## Project Status

> 🟡 **In Planning & Foundation Phase**
>
> Architecture, documentation, and project scaffolding are being completed before any feature implementation begins.

## Key Constraints

1. **Offline-only** — No backend, no Firebase, no REST APIs.
2. **Local data only** — All data stored using Hive on-device.
3. **No user accounts** — Privacy by default; no personal data leaves the device.
4. **Single family scope** — v1.0 supports one family per device install.
