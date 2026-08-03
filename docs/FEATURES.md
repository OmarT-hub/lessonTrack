# Features — LessonTrack

## Feature List

---

### 🧩 F-01: Onboarding

**Priority:** Critical | **Phase:** 1

The first-time experience that walks the parent through creating their family and first set of children.

**User Story:**
> As a parent launching LessonTrack for the first time, I want a simple guided setup so I can start managing lessons immediately.

**Acceptance Criteria:**
- [ ] App detects first launch via Hive flag.
- [ ] Onboarding shows a welcome screen with app name and tagline.
- [ ] User is guided to create at least one child profile.
- [ ] Onboarding is skipped on subsequent launches.
- [ ] Skip option available after step 1.

**Screens:** `OnboardingWelcomeScreen`, `OnboardingFamilySetupScreen`, `OnboardingCompleteScreen`

---

### 👨‍👩‍👧‍👦 F-02: Child Management

**Priority:** Critical | **Phase:** 2

Full CRUD for managing child profiles.

**User Story:**
> As a parent, I want to add, edit, and delete my children's profiles so I can assign lessons to the correct child.

**Fields per Child:**
| Field | Required | Notes |
|---|---|---|
| Name | ✅ | 2–40 characters |
| School Grade | ❌ | Free text or dropdown |
| Avatar Color | ✅ | Color picker from preset palette |
| Profile Image | ❌ | Local image from gallery |

**Acceptance Criteria:**
- [ ] Add child with name, grade, color, optional photo.
- [ ] Edit any field of an existing child.
- [ ] Delete child (with confirmation). Deletes all associated lessons.
- [ ] Children displayed as card list with avatar and name.
- [ ] Minimum 1 child, maximum 10 children per family.

**Screens:** `ChildrenListScreen`, `AddChildScreen`, `EditChildScreen`, `ChildDetailScreen`

---

### 📚 F-03: Lesson Management

**Priority:** Critical | **Phase:** 3

Full CRUD for managing lesson entries.

**User Story:**
> As a parent, I want to add weekly recurring lessons for each child so I can track all their private tutoring sessions.

**Fields per Lesson:**
| Field | Required | Notes |
|---|---|---|
| Subject Name | ✅ | e.g., "Math", "English" |
| Child | ✅ | Linked to a child profile |
| Teacher Name | ❌ | Optional free text |
| Location | ❌ | Optional free text |
| Start Time | ✅ | Time picker (HH:mm) |
| End Time | ✅ | Must be after start time |
| Days of Week | ✅ | Multi-select (Sat–Fri) |
| Reminder Before | ✅ | Minutes before lesson (e.g., 15, 30, 60) |
| Notes | ❌ | Multiline text |
| Color | ❌ | Inherits child color, overridable |
| Active | ✅ | Toggle to suspend without deleting |

**Acceptance Criteria:**
- [ ] Add lesson with all fields validated.
- [ ] Edit any lesson field.
- [ ] Delete lesson (with confirmation).
- [ ] Lessons linked to child profile.
- [ ] End time must be after start time (validated).
- [ ] At least one day selected.
- [ ] Inactive lessons excluded from schedule views but preserved in DB.

**Screens:** `LessonsListScreen`, `AddLessonScreen`, `EditLessonScreen`, `LessonDetailScreen`

---

### 🏠 F-04: Home Dashboard

**Priority:** Critical | **Phase:** 4

Real-time dashboard showing the family's lesson status at a glance.

**User Story:**
> As a parent, I want to open the app and immediately see who is in a lesson, who has the next lesson, and how much time is left — all on one screen.

**Dashboard Sections:**

| Section | Content |
|---|---|
| Current Time | Live clock display |
| Current Lesson | Child, subject, teacher, location, time remaining |
| Next Lesson | Child, subject, start time, countdown |
| Today's Timeline | Scrollable list of all today's lessons |
| Remaining Today | Count of lessons left today |
| Quick Actions | Add lesson, view schedule shortcuts |

**Acceptance Criteria:**
- [ ] Current time displayed and updates every second.
- [ ] "No lesson right now" state handled gracefully.
- [ ] Current lesson shows remaining time (mm:ss or hh:mm:ss).
- [ ] Next lesson shows countdown to start time.
- [ ] Empty state for days with no lessons.
- [ ] Lessons pulled in real-time from Hive.
- [ ] Dashboard refreshes on app foreground.

**Screens:** `DashboardScreen`

---

### 📅 F-05: Today's Schedule

**Priority:** High | **Phase:** 4

A detailed timeline view of today's lessons.

**User Story:**
> As a parent, I want to see a clear timeline of all lessons happening today, sorted by time.

**Acceptance Criteria:**
- [ ] All lessons for today displayed chronologically.
- [ ] Each lesson card shows: child name/avatar, subject, teacher, time slot, location.
- [ ] Past lessons shown as "completed" (greyed).
- [ ] Current lesson highlighted.
- [ ] Future lessons shown normally.
- [ ] Empty state for days with no lessons.

**Screens:** `TodayScheduleScreen`

---

### 📆 F-06: Weekly Schedule

**Priority:** High | **Phase:** 5

A 7-day weekly overview of all scheduled lessons.

**User Story:**
> As a parent, I want to see the full week's lesson schedule so I can plan our family's week.

**Acceptance Criteria:**
- [ ] 7 columns (one per day) or tab-based week view.
- [ ] Current day highlighted.
- [ ] Tapping a lesson opens lesson detail.
- [ ] Filter by child available.
- [ ] Scrollable within the day column if many lessons.

**Screens:** `WeeklyScheduleScreen`

---

### 🔔 F-07: Notifications

**Priority:** High | **Phase:** 6

Scheduled local notifications reminding parents of upcoming lessons.

**User Story:**
> As a parent, I want to receive a notification X minutes before a lesson starts so I can prepare on time.

**Notification Types:**
| Type | Trigger | Content |
|---|---|---|
| Lesson Reminder | X minutes before lesson | "[Child] has [Subject] in X minutes" |
| Lesson Started | At lesson start time | "[Child]'s [Subject] lesson has started" |

**Acceptance Criteria:**
- [ ] Notification scheduled when a lesson is created/edited.
- [ ] Notification cancelled when lesson is deleted or deactivated.
- [ ] Reminder offset configurable per lesson (5, 10, 15, 30, 60 min).
- [ ] Notification works when app is in background or terminated.
- [ ] Tapping notification opens the relevant lesson screen.

---

### 🔍 F-08: Search

**Priority:** Medium | **Phase:** 7

Full-text search across lessons and children.

**User Story:**
> As a parent, I want to search for a lesson by subject or teacher name so I can quickly find what I need.

**Acceptance Criteria:**
- [ ] Search bar on main navigation.
- [ ] Results show matching lessons and children.
- [ ] Search is instant (debounced, client-side).
- [ ] Tap result navigates to detail screen.

**Screens:** `SearchScreen`

---

### 🎨 F-09: Settings & Theme

**Priority:** Medium | **Phase:** 7

App settings including theme, notification preferences, and data management.

**Acceptance Criteria:**
- [ ] Toggle light/dark mode.
- [ ] Default reminder time setting.
- [ ] Export data (JSON) option.
- [ ] Clear all data option (with confirmation).
- [ ] About screen with app version.

**Screens:** `SettingsScreen`, `AboutScreen`

---

### 🔎 F-10: Filter by Child

**Priority:** Medium | **Phase:** 7

Filter lesson views to show only lessons for a selected child.

**Acceptance Criteria:**
- [ ] Child filter chip available on schedule screens.
- [ ] "All children" default state.
- [ ] Filter persists within session.

---

## Feature Priority Matrix

| Feature | Priority | Phase | Complexity |
|---|---|---|---|
| Onboarding | Critical | 1 | Low |
| Child Management | Critical | 2 | Medium |
| Lesson Management | Critical | 3 | High |
| Home Dashboard | Critical | 4 | High |
| Today's Schedule | High | 4 | Medium |
| Weekly Schedule | High | 5 | Medium |
| Notifications | High | 6 | High |
| Search | Medium | 7 | Medium |
| Settings | Medium | 7 | Low |
| Filter by Child | Medium | 7 | Low |
