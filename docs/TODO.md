# Master TODO List — LessonTrack

> This is the master task list. For phase-by-phase breakdown see [PHASES.md](PHASES.md).
> Status: ☐ Not Started | 🔄 In Progress | ✅ Done | ⏸ Blocked

---

## 📦 Phase 1: Project Setup

### Dependencies
- ☐ Add all packages to `pubspec.yaml`
- ☐ Run `flutter pub get`
- ☐ Verify `flutter doctor` passes

### Structure
- ☐ Create full feature folder structure
- ☐ Create `docs/` directory with all documents
- ☐ Create `.gitignore`
- ☐ Initialize git repo and first commit

### Core Infrastructure
- ☐ `core/constants/app_constants.dart`
- ☐ `core/constants/hive_constants.dart`
- ☐ `core/constants/asset_paths.dart`
- ☐ `core/errors/exceptions.dart`
- ☐ `core/extensions/datetime_extensions.dart`
- ☐ `core/extensions/string_extensions.dart`
- ☐ `core/extensions/context_extensions.dart`
- ☐ `core/extensions/duration_extensions.dart`
- ☐ `core/utils/date_utils.dart`
- ☐ `core/utils/schedule_utils.dart`
- ☐ `shared/models/day_of_week.dart`

### Services
- ☐ `services/hive_service.dart`
- ☐ `services/notification_service.dart`

### Entry Points
- ☐ `main.dart`
- ☐ `app.dart`

---

## 🎨 Phase 2: Theme & Design System

- ☐ `core/theme/app_colors.dart`
- ☐ `core/theme/app_typography.dart`
- ☐ `core/theme/app_spacing.dart`
- ☐ `core/theme/app_theme.dart` — light ThemeData
- ☐ `core/theme/app_theme.dart` — dark ThemeData
- ☐ `shared/widgets/buttons/primary_button.dart`
- ☐ `shared/widgets/buttons/secondary_button.dart`
- ☐ `shared/widgets/app_bar/custom_app_bar.dart`
- ☐ `shared/widgets/loading/loading_indicator.dart`
- ☐ `shared/widgets/empty_state/empty_state_widget.dart`
- ☐ `shared/widgets/error_view/error_view_widget.dart`
- ☐ `shared/widgets/avatars/child_avatar.dart`
- ☐ `shared/widgets/countdown/countdown_timer_widget.dart`
- ☐ Test light & dark theme renders correctly
- ☐ Test all shared widgets render without overflow

---

## 🗺️ Phase 3: Routing

- ☐ `routing/routes.dart`
- ☐ `routing/app_router.dart`
- ☐ `AppShell` widget with `NavigationBar`
- ☐ Onboarding redirect guard
- ☐ `ShellRoute` for tab navigation
- ☐ All CRUD routes defined
- ☐ Custom route transitions

---

## 👋 Phase 4: Onboarding

- ☐ `OnboardingStatus` entity
- ☐ `OnboardingRepository` interface
- ☐ `OnboardingRepositoryImpl`
- ☐ `CheckOnboardingStatus` use case
- ☐ `CompleteOnboarding` use case
- ☐ `OnboardingProvider`
- ☐ `OnboardingWelcomeScreen`
- ☐ `OnboardingFamilySetupScreen`
- ☐ `OnboardingCompleteScreen`
- ☐ Step indicator widget
- ☐ Redirect guard working
- ☐ Onboarding skipped on relaunch

---

## 👶 Phase 5: Children Management

### Domain
- ☐ `Child` entity
- ☐ `ChildRepository` interface
- ☐ `GetAllChildren` use case
- ☐ `GetChildById` use case
- ☐ `AddChild` use case
- ☐ `UpdateChild` use case
- ☐ `DeleteChild` use case

### Data
- ☐ `ChildModel` with Hive annotations
- ☐ `build_runner` — generate adapter
- ☐ `ChildRepositoryImpl`
- ☐ Register adapter in `HiveService`

### Presentation
- ☐ `childRepositoryProvider`
- ☐ `ChildrenNotifier`
- ☐ `ChildrenListScreen`
- ☐ `AddChildScreen`
- ☐ `EditChildScreen`
- ☐ `ChildDetailScreen`
- ☐ `ChildCard` widget
- ☐ `ChildColorPickerWidget`
- ☐ `ChildAvatarPickerWidget`
- ☐ Delete confirmation dialog
- ☐ Form validation

---

## 📚 Phase 6: Lesson Management

### Domain
- ☐ `Lesson` entity
- ☐ `LessonRepository` interface
- ☐ `GetAllLessons` use case
- ☐ `GetLessonsForChild` use case
- ☐ `GetLessonsForDay` use case
- ☐ `AddLesson` use case
- ☐ `UpdateLesson` use case
- ☐ `DeleteLesson` use case

### Data
- ☐ `LessonModel` with Hive annotations
- ☐ `build_runner` — generate adapter
- ☐ `LessonRepositoryImpl`
- ☐ Register adapter in `HiveService`

### Presentation
- ☐ `lessonRepositoryProvider`
- ☐ `LessonsNotifier`
- ☐ `LessonsListScreen`
- ☐ `AddLessonScreen`
- ☐ `EditLessonScreen`
- ☐ `LessonDetailScreen`
- ☐ `DaySelectorWidget`
- ☐ `TimePickerField`
- ☐ `ReminderSelectorWidget`
- ☐ `LessonCard` widget
- ☐ Form validation (all rules)
- ☐ End time > start time validation

---

## 🏠 Phase 7: Home Dashboard

- ☐ `GetCurrentLesson` use case
- ☐ `GetNextLesson` use case
- ☐ `GetTodaySchedule` use case
- ☐ `liveClockProvider` (StreamProvider)
- ☐ `currentLessonProvider`
- ☐ `nextLessonProvider`
- ☐ `todayScheduleProvider`
- ☐ `LiveClockWidget`
- ☐ `CurrentLessonCard`
- ☐ `NextLessonCard`
- ☐ `TodayTimelineWidget`
- ☐ `QuickActionsRow`
- ☐ `DashboardScreen` assembled
- ☐ Real-time countdown accurate
- ☐ Empty states for no lessons

---

## 📅 Phase 8: Schedule Views

- ☐ `GetTodaySchedule` use case
- ☐ `GetWeeklySchedule` use case
- ☐ `TodayScheduleScreen`
- ☐ `WeeklyScheduleScreen`
- ☐ `ScheduleDayColumn` widget
- ☐ `ScheduleLessonTile` widget
- ☐ `WeekDayTab` widget
- ☐ Past/current/future lesson states
- ☐ Child filter chips on both screens

---

## 🔔 Phase 9: Notifications

- ☐ Complete `NotificationService`
- ☐ Request Android 13+ permission
- ☐ Notification channels setup
- ☐ `ScheduleLessonNotification` use case
- ☐ `CancelLessonNotification` use case
- ☐ `RescheduleAllNotifications` utility
- ☐ Integrate with `AddLesson`
- ☐ Integrate with `UpdateLesson`
- ☐ Integrate with `DeleteLesson`
- ☐ Notification tap → lesson navigation
- ☐ Settings master toggle

---

## 🔍 Phase 10: Search, Settings & Polish

### Search
- ☐ `SearchScreen`
- ☐ Debounced real-time search
- ☐ Results by category
- ☐ Navigation on tap

### Settings
- ☐ `SettingsScreen`
- ☐ Theme mode toggle
- ☐ Default reminder setting
- ☐ Notification master toggle
- ☐ First day of week preference
- ☐ Export JSON button
- ☐ Clear all data (with confirmation)
- ☐ `AboutScreen`

### Filter
- ☐ Child filter chips on schedule screens

### Polish
- ☐ All animations per UI_GUIDELINES.md
- ☐ All empty states
- ☐ All error states
- ☐ All loading states
- ☐ Keyboard handling
- ☐ Pull-to-refresh
- ☐ Haptic feedback
- ☐ Snackbar feedback on CRUD
- ☐ Accessibility audit

### Testing
- ☐ Use case unit tests
- ☐ Provider unit tests
- ☐ Widget tests for key screens
- ☐ Integration test: full happy path

---

## 🚀 Phase 11: Release

- ☐ App icon (all sizes)
- ☐ Splash screen
- ☐ Play Store screenshots
- ☐ Feature graphic
- ☐ Android signing keystore
- ☐ `flutter build apk --release` passes
- ☐ Test on 2+ physical devices
- ☐ All release checklist items
- ☐ Play Store listing drafted
- ☐ Internal testing track published
