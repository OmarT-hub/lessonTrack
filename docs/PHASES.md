# Development Phases — LessonTrack

## Overview

The LessonTrack application is built in **10 structured phases**. Each phase has a clear objective, specific deliverables, and defined completion criteria. Phases are sequential — each phase must be completed and verified before the next begins.

---

## Phase 1: Project Setup & Foundation

**Objective:** Establish a clean, production-ready project foundation with all tooling, dependencies, and infrastructure in place.

**Duration Estimate:** 1–2 days

### Tasks

#### 1.1 — Dependency Setup
- [ ] Update `pubspec.yaml` with all required packages:
  - `flutter_riverpod`, `riverpod_annotation`, `riverpod_generator`
  - `go_router`
  - `hive_flutter`, `hive`
  - `flutter_local_notifications`
  - `google_fonts`
  - `uuid`
  - `intl`
  - `path_provider`
  - `image_picker`
- [ ] Add dev dependencies: `build_runner`, `hive_generator`, `riverpod_generator`, `flutter_lints`
- [ ] Run `flutter pub get`

#### 1.2 — Linting & Analysis
- [ ] Configure `analysis_options.yaml` with strict linting rules
- [ ] Add `very_good_analysis` or custom lint rules
- [ ] Ensure zero lint warnings on project creation

#### 1.3 — Folder Structure
- [ ] Create all feature directories per `FOLDER_STRUCTURE.md`
- [ ] Add `.gitkeep` in empty directories
- [ ] Verify structure matches documentation

#### 1.4 — Core Infrastructure
- [ ] Create `lib/core/constants/app_constants.dart`
- [ ] Create `lib/core/constants/hive_constants.dart`
- [ ] Create `lib/core/errors/exceptions.dart`
- [ ] Create `lib/core/theme/app_colors.dart`
- [ ] Create `lib/core/theme/app_spacing.dart`
- [ ] Create `lib/core/theme/app_typography.dart`
- [ ] Create `lib/core/theme/app_theme.dart` (light + dark ThemeData)
- [ ] Create `lib/core/extensions/datetime_extensions.dart`
- [ ] Create `lib/core/extensions/string_extensions.dart`
- [ ] Create `lib/core/extensions/context_extensions.dart`
- [ ] Create `lib/core/utils/date_utils.dart`
- [ ] Create `lib/core/utils/schedule_utils.dart`
- [ ] Create `lib/shared/models/day_of_week.dart`

#### 1.5 — Services
- [ ] Create `lib/services/hive_service.dart` — Hive init, box registration, open boxes
- [ ] Create `lib/services/notification_service.dart` — Plugin init and permission request

#### 1.6 — App Entry Point
- [ ] Create `lib/main.dart` — Bootstrap: WidgetsFlutterBinding, Hive init, notification init, ProviderScope, runApp
- [ ] Create `lib/app.dart` — Root MaterialApp.router with theme and router

#### 1.7 — Git Setup
- [ ] Initialize git repository
- [ ] Create `.gitignore` with Flutter defaults + `*.hive`, `*.lock` exclusions
- [ ] Create initial commit: "chore: project foundation"

**Completion Criteria:**
- `flutter run` launches a blank app with no errors
- `flutter analyze` returns zero issues
- All directories exist per FOLDER_STRUCTURE.md
- Hive and notification services initialize without crash

---

## Phase 2: Theme & Design System

**Objective:** Implement the complete Material 3 design system so every subsequent phase can use consistent, polished UI components.

**Duration Estimate:** 1–2 days

### Tasks

#### 2.1 — Theme Implementation
- [ ] Implement `AppColors` with full palette (seed, child avatar colors, semantic colors)
- [ ] Implement `AppTypography` using Google Fonts (Nunito)
- [ ] Implement `AppSpacing` constants
- [ ] Implement `AppRadius` constants
- [ ] Implement `AppShadows` constants
- [ ] Implement light `ThemeData` using Material 3 + ColorScheme.fromSeed
- [ ] Implement dark `ThemeData` using Material 3 + ColorScheme.fromSeed (dark)
- [ ] Wire themes in `app.dart` with `MediaQuery`-based or settings-based theme mode

#### 2.2 — Shared Widgets Library
- [ ] `PrimaryButton` — full-width, rounded, with loading state
- [ ] `SecondaryButton` — outlined variant
- [ ] `CustomAppBar` — consistent across app
- [ ] `LoadingIndicator` — centered circular progress
- [ ] `EmptyStateWidget` — icon + title + subtitle + action button
- [ ] `ErrorViewWidget` — error icon + message + retry button
- [ ] `ChildAvatar` — circular avatar with color and initials/image
- [ ] `CountdownTimerWidget` — animated time display

#### 2.3 — Theme Switcher
- [ ] Settings provider reads `theme_mode` from Hive
- [ ] App rebuilds on theme change

**Completion Criteria:**
- Hot reload shows light/dark theme correctly
- All shared widgets render without errors
- Design matches UI_GUIDELINES.md spec

---

## Phase 3: Routing & Navigation

**Objective:** Set up the complete navigation structure with GoRouter.

**Duration Estimate:** 0.5–1 day

### Tasks

#### 3.1 — Route Definitions
- [ ] Create `lib/routing/routes.dart` with all route name constants
- [ ] Create `lib/routing/app_router.dart` with complete GoRouter config
- [ ] Implement onboarding redirect guard
- [ ] Implement `ShellRoute` for bottom navigation bar

#### 3.2 — App Shell
- [ ] Create `AppShell` widget with Material 3 `NavigationBar`
- [ ] Wire tab index to GoRouter location
- [ ] 4 tabs: Dashboard, Today, Week, Children

#### 3.3 — Route Transitions
- [ ] Configure `CustomTransitionPage` for slide/fade transitions
- [ ] Test all routes navigate correctly (placeholder screens)

**Completion Criteria:**
- All routes navigate to placeholder screens
- Bottom nav bar switches tabs correctly
- Back button works throughout
- Onboarding guard redirects correctly (test via toggling Hive flag)

---

## Phase 4: Onboarding Flow

**Objective:** Build the first-launch onboarding experience.

**Duration Estimate:** 1 day

### Tasks

#### 4.1 — Domain Layer
- [ ] Create `OnboardingStatus` entity
- [ ] Create `OnboardingRepository` interface
- [ ] Create `CheckOnboardingStatus` use case
- [ ] Create `CompleteOnboarding` use case

#### 4.2 — Data Layer
- [ ] Create `OnboardingRepositoryImpl` using `onboarding_box`

#### 4.3 — Presentation Layer
- [ ] Create `OnboardingProvider`
- [ ] Create `OnboardingWelcomeScreen` — App logo, tagline, "Get Started" button
- [ ] Create `OnboardingFamilySetupScreen` — Guided child creation form
- [ ] Create `OnboardingCompleteScreen` — Celebration screen, "Start Tracking" button

#### 4.4 — Polish
- [ ] Page indicator widget showing onboarding step
- [ ] Smooth page transitions between onboarding steps
- [ ] Skip button on welcome screen

**Completion Criteria:**
- First launch shows onboarding
- Completing onboarding navigates to dashboard
- Subsequent launches skip onboarding
- At least one child created during onboarding

---

## Phase 5: Child Management

**Objective:** Full CRUD for child profiles.

**Duration Estimate:** 1.5–2 days

### Tasks

#### 5.1 — Domain Layer
- [ ] Create `Child` entity
- [ ] Create `ChildRepository` interface (getAll, getById, add, update, delete)
- [ ] Create use cases: `GetAllChildren`, `GetChildById`, `AddChild`, `UpdateChild`, `DeleteChild`

#### 5.2 — Data Layer
- [ ] Create `ChildModel` with Hive annotations
- [ ] Run `build_runner` to generate `ChildModelAdapter`
- [ ] Create `ChildRepositoryImpl`
- [ ] Register `ChildModelAdapter` in `HiveService`

#### 5.3 — Providers
- [ ] Create `childRepositoryProvider`
- [ ] Create `ChildrenNotifier` (`AsyncNotifier<List<Child>>`)
- [ ] Create `selectedChildProvider`

#### 5.4 — Screens & Widgets
- [ ] `ChildrenListScreen` — List of children cards + FAB
- [ ] `AddChildScreen` — Form with name, grade, color picker, image picker
- [ ] `EditChildScreen` — Same form pre-filled
- [ ] `ChildDetailScreen` — Child info + their lessons list
- [ ] `ChildCard` — Card widget for list
- [ ] `ChildColorPickerWidget` — Grid of preset color circles
- [ ] `ChildAvatarPickerWidget` — Camera/gallery option

#### 5.5 — Polish
- [ ] Delete confirmation dialog
- [ ] Form validation (name required, 2–40 chars)
- [ ] Image crop/resize on selection

**Completion Criteria:**
- Can add, edit, delete children
- Children persist after app restart
- Maximum 10 children enforced
- Deleting child shows confirmation

---

## Phase 6: Lesson Management

**Objective:** Full CRUD for lessons.

**Duration Estimate:** 2–3 days

### Tasks

#### 6.1 — Domain Layer
- [ ] Create `Lesson` entity
- [ ] Create `LessonRepository` interface
- [ ] Create use cases: `GetAllLessons`, `GetLessonsForChild`, `GetLessonsForDay`, `AddLesson`, `UpdateLesson`, `DeleteLesson`

#### 6.2 — Data Layer
- [ ] Create `LessonModel` with all fields and Hive annotations
- [ ] Run `build_runner`
- [ ] Create `LessonRepositoryImpl`
- [ ] Register adapter in `HiveService`

#### 6.3 — Providers
- [ ] `lessonRepositoryProvider`
- [ ] `LessonsNotifier` (all lessons)
- [ ] `LessonsForChildNotifier` (filtered)
- [ ] `LessonsForDayProvider`

#### 6.4 — Screens & Widgets
- [ ] `LessonsListScreen`
- [ ] `AddLessonScreen` — Full form with all fields
- [ ] `EditLessonScreen`
- [ ] `LessonDetailScreen`
- [ ] `DaySelectorWidget` — Multi-select weekday chips
- [ ] `TimePickerField` — Start/end time pickers with validation
- [ ] `ReminderSelectorWidget` — Dropdown: 5, 10, 15, 30, 60 min
- [ ] `LessonCard` — Card for list views

#### 6.5 — Validation
- [ ] Subject required
- [ ] At least 1 day selected
- [ ] End time after start time
- [ ] At least 1 child exists before allowing lesson creation

**Completion Criteria:**
- Full lesson CRUD working
- Lessons link correctly to children
- Lessons persist after restart
- Validation prevents invalid data

---

## Phase 7: Home Dashboard

**Objective:** Build the real-time home dashboard.

**Duration Estimate:** 2 days

### Tasks

#### 7.1 — Use Cases
- [ ] `GetCurrentLesson` — Returns lesson happening right now (if any)
- [ ] `GetNextLesson` — Returns next upcoming lesson today (or nearest future)
- [ ] `GetTodaySchedule` — Returns today's lessons sorted by time

#### 7.2 — Providers
- [ ] `liveClockProvider` (StreamProvider — ticks every second)
- [ ] `currentLessonProvider` (derived from lessons + clock)
- [ ] `nextLessonProvider`
- [ ] `todayScheduleProvider`

#### 7.3 — Widgets
- [ ] `LiveClockWidget` — Animated live clock
- [ ] `CurrentLessonCard` — Hero card with countdown, progress bar
- [ ] `NextLessonCard` — Countdown to next lesson
- [ ] `TodayTimelineWidget` — Sorted list of today's lessons
- [ ] `QuickActionsRow` — "Add Lesson" shortcut button

#### 7.4 — Dashboard Screen Assembly
- [ ] Assemble `DashboardScreen` with all widgets
- [ ] Empty states for "no current lesson" and "no lessons today"
- [ ] Real-time countdown updates (every second)

**Completion Criteria:**
- Dashboard shows correct current lesson in real time
- Countdown timer ticks accurately
- "No lesson" states display correctly
- Smooth real-time updates without jank

---

## Phase 8: Schedule Views

**Objective:** Today's schedule and weekly schedule screens.

**Duration Estimate:** 1.5–2 days

### Tasks

#### 8.1 — Domain Layer
- [ ] `GetTodaySchedule` use case
- [ ] `GetWeeklySchedule` use case — returns Map<DayOfWeek, List<Lesson>>

#### 8.2 — Today's Schedule Screen
- [ ] Chronological timeline list
- [ ] Past/current/future visual states
- [ ] Empty state for days with no lessons
- [ ] Child filter chips

#### 8.3 — Weekly Schedule Screen
- [ ] Day tabs (Mon–Sun, or Sat–Fri for MENA settings)
- [ ] Per-day lesson list
- [ ] Highlighted current day
- [ ] Child filter
- [ ] Tap lesson → LessonDetailScreen

**Completion Criteria:**
- Today's schedule shows correct lessons for today
- Weekly schedule shows all 7 days
- Past lessons visually distinct from upcoming
- Filter by child works on both screens

---

## Phase 9: Notifications

**Objective:** Implement reliable local lesson reminders.

**Duration Estimate:** 1–2 days

### Tasks

#### 9.1 — Notification Service
- [ ] Complete `NotificationService` wrapper
- [ ] Request Android permission at runtime (Android 13+)
- [ ] Create notification channel for lesson reminders
- [ ] Create notification channel for lesson start alerts

#### 9.2 — Scheduling Logic
- [ ] `ScheduleLessonNotification` use case
  - For each active lesson, for each day of week: schedule recurring notification
  - Use `flutter_local_notifications` scheduled notifications
- [ ] `CancelLessonNotification` use case
  - Cancel all notifications for a lesson (on delete/deactivate)
- [ ] `RescheduleAllNotifications` utility (called on app start to ensure consistency)

#### 9.3 — Integration
- [ ] Schedule notifications on `AddLesson`
- [ ] Update notifications on `UpdateLesson`
- [ ] Cancel notifications on `DeleteLesson` / lesson deactivation
- [ ] Handle notification tap → navigate to lesson

#### 9.4 — Settings Integration
- [ ] Master notification toggle in Settings
- [ ] On toggle off → cancel all scheduled notifications
- [ ] On toggle on → reschedule all active lesson notifications

**Completion Criteria:**
- Notification appears at correct time
- Notification works with app in background
- Notification works with app terminated
- Tapping notification navigates to correct lesson
- Deleting lesson cancels its notifications

---

## Phase 10: Search, Settings & Polish

**Objective:** Complete remaining features and apply final polish.

**Duration Estimate:** 2–3 days

### Tasks

#### 10.1 — Search
- [ ] `SearchScreen` with real-time debounced search
- [ ] Search across: lesson subjects, teacher names, child names
- [ ] Results categorized by type
- [ ] Navigate to result on tap

#### 10.2 — Settings Screen
- [ ] Theme mode toggle (light/dark/system)
- [ ] Default reminder duration setting
- [ ] Notification master toggle
- [ ] First day of week preference
- [ ] Export data (JSON) button
- [ ] Clear all data (with confirmation + double-confirm)
- [ ] About screen (version, credits)

#### 10.3 — Filter by Child
- [ ] Child filter chips on schedule screens
- [ ] Filter persists within session

#### 10.4 — Polish & UX
- [ ] Review all animations (per UI_GUIDELINES.md)
- [ ] Review all empty states
- [ ] Review all error states
- [ ] Review all loading states
- [ ] Keyboard handling (dismiss on tap outside, proper `textInputAction`)
- [ ] Pull-to-refresh on list screens
- [ ] Haptic feedback on key actions
- [ ] Snackbar feedback on CRUD operations
- [ ] Accessibility audit (semantic labels, minimum touch targets)

#### 10.5 — Testing
- [ ] Unit tests for all use cases
- [ ] Unit tests for all providers
- [ ] Widget tests for key screens
- [ ] Integration test: add child → add lesson → view on dashboard

#### 10.6 — Performance
- [ ] Profile and fix any jank (use `flutter run --profile`)
- [ ] Cold start time < 1.5 seconds
- [ ] No memory leaks in timer/stream providers

**Completion Criteria:**
- Search returns correct results instantly
- All settings persist after restart
- App passes accessibility audit
- All unit tests pass
- Zero critical bugs

---

## Phase 11: Release Preparation

**Objective:** Prepare the app for release on Google Play Store.

**Duration Estimate:** 1–2 days

### Tasks

#### 11.1 — App Assets
- [ ] App icon (all densities) via `flutter_launcher_icons`
- [ ] Splash screen via `flutter_native_splash`
- [ ] Google Play Store screenshots (at least 2 phone screenshots)
- [ ] Feature graphic (1024×500)

#### 11.2 — Android Configuration
- [ ] Set `applicationId` to `com.lessontrack.app`
- [ ] Set `versionName` to `1.0.0`
- [ ] Set `versionCode` to `1`
- [ ] Configure ProGuard / R8 rules
- [ ] Configure signing keystore
- [ ] Test release build: `flutter build apk --release`

#### 11.3 — Final Checks
- [ ] Run full `RELEASE_CHECKLIST.md`
- [ ] Test on at least 2 physical Android devices
- [ ] Test on Android emulator (API 26, API 33, API 34)
- [ ] Verify all notifications work on release build
- [ ] Verify no debug logs or test data in release

#### 11.4 — Store Listing
- [ ] App title: "LessonTrack"
- [ ] Short description (80 chars)
- [ ] Full description
- [ ] Privacy policy URL
- [ ] Content rating questionnaire

**Completion Criteria:**
- App published to Google Play (internal testing track)
- All release checklist items checked
- Zero crash reports on first test devices
