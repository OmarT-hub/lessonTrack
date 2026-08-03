# Milestones — LessonTrack

## Milestone Definitions

Milestones are major checkpoints that mark the completion of a significant capability. They are larger than phases and represent "shippable" increments of the product.

---

## M1: Foundation Complete ✅ → 🔜

**Criteria to call complete:**
- [ ] Flutter project created and running
- [ ] All documentation written
- [ ] Complete folder structure in place
- [ ] `pubspec.yaml` with all dependencies
- [ ] `HiveService` initializes all boxes
- [ ] `NotificationService` initializes
- [ ] `main.dart` bootstraps app without errors
- [ ] `flutter analyze` passes with zero issues
- [ ] `flutter run` launches blank app
- [ ] Git repository initialized with initial commit

**Phases included:** Phase 1

---

## M2: Design System Complete 🔜

**Criteria to call complete:**
- [ ] Light and dark Material 3 themes implemented
- [ ] All shared widgets built and tested
- [ ] Typography (Nunito) working
- [ ] Color palette applied consistently
- [ ] Navigation shell with bottom bar working
- [ ] All route definitions in place
- [ ] App navigates between placeholder screens

**Phases included:** Phase 2, Phase 3

---

## M3: Core Data Layer Complete 🔜

**Criteria to call complete:**
- [ ] Hive models for Child and Lesson implemented
- [ ] Code generation (`build_runner`) passes
- [ ] All repository implementations working
- [ ] All use cases implemented and tested
- [ ] Data persists between app restarts
- [ ] Cascade delete (child → lessons) working

**Phases included:** Part of Phase 5, Phase 6

---

## M4: Alpha Build — Internal Testing 🔜

**Criteria:**
- [ ] Onboarding flow working end-to-end
- [ ] Add/edit/delete children
- [ ] Add/edit/delete lessons
- [ ] Home dashboard shows real data
- [ ] Today's and weekly schedule screens working
- [ ] No critical crashes in 1 hour of testing
- [ ] App works fully offline

**Phases included:** Phase 4, Phase 5, Phase 6, Phase 7, Phase 8

---

## M5: Beta Build — Notifications & Polish 🔜

**Criteria:**
- [ ] Notifications fire at correct times
- [ ] Notifications work in background/terminated state
- [ ] Search functional
- [ ] Settings screen complete
- [ ] All empty/error/loading states handled
- [ ] Accessibility audit passed
- [ ] Performance: cold start < 1.5s
- [ ] No memory leaks

**Phases included:** Phase 9, Phase 10

---

## M6: Release Candidate 🔜

**Criteria:**
- [ ] All release checklist items complete
- [ ] App icon and splash screen
- [ ] Play Store listing ready
- [ ] Tested on 2+ physical devices
- [ ] Signed release APK builds successfully
- [ ] Internal testing track on Play Store

**Phases included:** Phase 11

---

## M7: v1.0 Public Release 🔜

**Criteria:**
- [ ] M6 complete
- [ ] Zero P0/P1 bugs in internal testing
- [ ] Privacy policy published
- [ ] Play Store listing approved
- [ ] App available publicly on Google Play

---

## M8: v1.1 — Arabic RTL 🔜

**Criteria:**
- [ ] All UI strings translated to Arabic
- [ ] RTL layout verified on physical device
- [ ] Arabic date/time formatting correct
- [ ] App store listing updated with Arabic description

---

## Timeline Overview

| Milestone | Target | Status |
|---|---|---|
| M1: Foundation | Week 1 | 🔜 In Progress |
| M2: Design System | Week 2 | 🔜 Planned |
| M3: Data Layer | Week 2–3 | 🔜 Planned |
| M4: Alpha | Week 4–5 | 🔜 Planned |
| M5: Beta | Week 6–7 | 🔜 Planned |
| M6: Release Candidate | Week 8 | 🔜 Planned |
| M7: v1.0 Public | Week 9 | 🔜 Planned |
| M8: v1.1 Arabic | TBD | 🔜 Planned |
