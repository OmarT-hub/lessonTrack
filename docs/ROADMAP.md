# Roadmap — LessonTrack

## Vision Roadmap

```
v1.0  ──────────────────────────────────────────── NOW
      Foundation, Core Features, Android Release

v1.1  ──────────────────────────────────────────── Q4 2026
      Arabic RTL Support

v1.2  ──────────────────────────────────────────── Q1 2027
      Payment Tracking

v1.3  ──────────────────────────────────────────── Q2 2027
      Teacher Profiles

v2.0  ──────────────────────────────────────────── Q3 2027
      Optional Cloud Backup, iOS Release

v2.1  ──────────────────────────────────────────── Q4 2027
      Teacher-Facing Schedule Sharing

v3.0  ──────────────────────────────────────────── 2028
      Multi-family, Tablet Support
```

---

## v1.0 — Core Release (Current)

**Theme:** Foundation & Essentials

| Feature | Status |
|---|---|
| Onboarding flow | 🔜 Planned |
| Child management (CRUD) | 🔜 Planned |
| Lesson management (CRUD) | 🔜 Planned |
| Home dashboard (live) | 🔜 Planned |
| Today's schedule | 🔜 Planned |
| Weekly schedule | 🔜 Planned |
| Lesson notifications | 🔜 Planned |
| Search | 🔜 Planned |
| Settings + dark mode | 🔜 Planned |
| Filter by child | 🔜 Planned |
| Offline-first Hive storage | 🔜 Planned |
| Android release | 🔜 Planned |

---

## v1.1 — Arabic & RTL (Q4 2026)

**Theme:** Localization

| Feature | Notes |
|---|---|
| Full Arabic translation | ARB file translated |
| RTL layout support | All `EdgeInsetsDirectional` already in place |
| Arabic date formatting | `intl` package, Arabic locale |
| RTL-aware icons | Directional icons mirrored |
| First day of week: Saturday | Already in settings design |

---

## v1.2 — Payment Tracking (Q1 2027)

**Theme:** Financial Awareness

| Feature | Notes |
|---|---|
| Per-lesson fee field | Added to `Lesson` model |
| Per-teacher fee | Added to teacher profile |
| Monthly payment summary | New "Payments" screen |
| Payment status per lesson | Paid / Unpaid / Pending |
| Payment history | Exportable report |

---

## v1.3 — Teacher Profiles (Q2 2027)

**Theme:** Organization

| Feature | Notes |
|---|---|
| Teacher entity (name, phone, subject) | New `teachers` feature module |
| Link lessons to teacher profiles | Lesson.teacherId FK |
| Teacher detail screen | Contact info, linked lessons |
| Contact teacher shortcut | Opens phone/WhatsApp |

---

## v2.0 — Cloud Backup & iOS (Q3 2027)

**Theme:** Cross-Device & Multi-Platform

| Feature | Notes |
|---|---|
| Optional Google Drive backup | End-to-end encrypted JSON |
| Optional iCloud backup | iOS only |
| Restore from backup | Import flow |
| iOS release | New Flutter targets |
| iPad layout | Responsive layouts |

---

## v2.1 — Sharing (Q4 2027)

**Theme:** Collaboration

| Feature | Notes |
|---|---|
| Share schedule as image/PDF | Export weekly schedule |
| Share with teacher | QR code or link |
| Read-only teacher view | Teacher sees only their lessons |

---

## v3.0 — Multi-family & Tablets (2028)

**Theme:** Scale

| Feature | Notes |
|---|---|
| Multiple family profiles | Account switching |
| Tablet-optimized layouts | Two-panel navigation |
| Widget support (home screen) | Android Glance widget |
| Wear OS companion | Wrist notifications |

---

## What Will NOT Be Built

The following are explicitly out of scope, now and in the foreseeable future:

- ❌ Social features (sharing publicly, following other parents)
- ❌ Marketplace for tutors
- ❌ In-app messaging
- ❌ Subscription monetization
- ❌ Advertising
- ❌ Analytics / tracking of user behavior
- ❌ School management system (LessonTrack is parent-to-parent, not school-to-parent)
