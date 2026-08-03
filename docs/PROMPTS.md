# AI Prompts — LessonTrack

This document contains ready-to-use prompts for AI coding assistants (e.g., Antigravity, GitHub Copilot, Claude) working on the LessonTrack project. Use these prompts to produce consistent, architecture-aligned code.

---

## Context Prompt (Use at the start of every session)

```
You are a senior Flutter developer working on LessonTrack, a parent-focused lesson tracking app.

Architecture: Feature-first Clean Architecture
State Management: Riverpod (with code generation via riverpod_annotation)
Navigation: GoRouter
Database: Hive (offline-first)
Theme: Material 3
Font: Nunito (via google_fonts)
Platform: Android first

Key rules:
- Domain layer has NO dependencies on data or presentation.
- Hive is only accessed inside *RepositoryImpl classes.
- All UI state comes through Riverpod providers.
- Use const constructors everywhere possible.
- Use AppSpacing, AppColors, AppRadius constants instead of magic numbers.
- Use EdgeInsetsDirectional (not EdgeInsets) for RTL support.
- Every async widget handles data/loading/error states.
- Every list screen has an empty state widget.

Refer to the docs/ folder for full architecture, feature specs, and coding standards.
```

---

## Phase-Specific Prompts

### Phase 1: Foundation

```
Create the Hive service file for LessonTrack.
File: lib/services/hive_service.dart

Requirements:
- Static async init() method
- Register all adapters: FamilyModelAdapter, ChildModelAdapter, LessonModelAdapter
- Open all boxes: settings_box, onboarding_box, family_box, children_box, lessons_box
- Box names from HiveConstants class
- Use hive_flutter package (Hive.initFlutter())
- Add doc comments
```

---

### Phase 2: Theme

```
Create the complete Material 3 theme for LessonTrack.
File: lib/core/theme/app_theme.dart

Requirements:
- Light ThemeData using ColorScheme.fromSeed(seedColor: Color(0xFF5B8DEF), brightness: Brightness.light)
- Dark ThemeData using ColorScheme.fromSeed(seedColor: Color(0xFF5B8DEF), brightness: Brightness.dark)
- useMaterial3: true
- Apply Nunito font via GoogleFonts.nunitoTextTheme()
- CardTheme: rounded corners (16px), no elevation, colored surface
- NavigationBarTheme: height 80, labels always visible
- FilledButton: fully rounded (radius 100)
- InputDecoration: outlined, rounded (12px)
```

---

### Phase 3: Routing

```
Create the GoRouter configuration for LessonTrack.
File: lib/routing/app_router.dart

Requirements:
- Provider<GoRouter> named appRouterProvider
- Redirect guard: if not onboarded → /onboarding, if onboarded + on onboarding → /home/dashboard
- ShellRoute for bottom nav (dashboard, today, weekly, children tabs)
- All routes as per ROUTING.md
- Custom slide transition for push, fade for tab switch
- Use named routes from Routes class in lib/routing/routes.dart
```

---

### Phase 5: Child Management

```
Create the Child domain entity for LessonTrack.
File: lib/features/children/domain/entities/child.dart

Requirements:
- Immutable class (all final fields)
- Fields: id (String), name (String), schoolGrade (String?), avatarColor (Color), profileImagePath (String?), createdAt (DateTime), updatedAt (DateTime)
- Add copyWith() method
- Add == and hashCode overrides
- Add doc comment explaining this is the domain entity (no Hive annotations)
```

```
Create the ChildModel Hive model for LessonTrack.
File: lib/features/children/data/models/child_model.dart

Requirements:
- @HiveType(typeId: 1)
- All fields from Child entity, but avatarColor stored as int (Color.value)
- Add toEntity() method that converts ChildModel → Child
- Add fromEntity() factory constructor
- HiveField indices must never be reused (see DATABASE.md)
```

---

### Phase 6: Lesson Management

```
Create the AddLessonScreen for LessonTrack.
File: lib/features/lessons/presentation/screens/add_lesson_screen.dart

Requirements:
- ConsumerStatefulWidget
- Form with GlobalKey<FormState>
- Fields: subject (required), child selector (dropdown of children), teacher name (optional), location (optional), start time picker, end time picker (must be after start), day of week multi-selector, reminder minutes selector, notes (optional)
- Validates: subject non-empty, at least 1 day selected, end > start
- On save: calls addLessonProvider, shows SnackBar on success, pops on success
- Uses AppSpacing constants for all padding
- Sticky Save button at bottom using PrimaryButton widget
```

---

### Phase 7: Dashboard

```
Create the CurrentLessonCard widget for LessonTrack's dashboard.
File: lib/features/dashboard/presentation/widgets/current_lesson_card.dart

Requirements:
- Shows: "NOW" chip, subject, child name + avatar, teacher, location, countdown timer (HH:MM:SS remaining)
- Linear progress bar showing lesson % complete
- Background is a soft gradient using the child's avatarColor with opacity 0.15
- Handles null (no current lesson) → shows "No lesson right now" empty state
- CountdownTimer updates every second using liveClockProvider StreamProvider
- Rounded card with AppRadius.xl (24px) corners
- Material 3 styling
```

---

### Phase 9: Notifications

```
Create the notification scheduling use case for LessonTrack.
File: lib/features/notifications/domain/usecases/schedule_lesson_notification.dart

Requirements:
- Takes a Lesson entity as input
- For each day in lesson.daysOfWeek, schedule a weekly recurring notification X minutes before lesson starts
- Notification ID: hash of lessonId + dayOfWeek (to allow cancellation per day)
- Notification title: "[Child name] has [Subject] in [X] minutes"
- Notification body: "[Location if any] • [Start time] – [End time]"
- Uses NotificationService wrapper (not flutter_local_notifications directly)
- Does nothing if lesson.isActive == false
```

---

## Refactoring Prompts

```
Refactor this widget to extract the lesson card into a separate LessonCard widget.
Apply these rules:
- No magic numbers (use AppSpacing, AppRadius)
- No hardcoded colors (use Theme.of(context).colorScheme)
- Use const where possible
- Add doc comment to the new widget class
```

```
This use case is doing too much. Extract the notification scheduling into the NotificationService.
Keep the use case focused on the business rule only.
The use case should not know about notification IDs or platform details.
```

---

## Review Prompts

```
Review this Dart file for LessonTrack and check:
1. Architecture violations (domain importing data/presentation?)
2. Magic numbers (should use AppSpacing/AppRadius/AppColors)
3. Missing const constructors
4. Missing error handling in async code
5. Missing empty state handling
6. Missing doc comments on public APIs
List each issue with file and line number.
```

---

## Test Generation Prompts

```
Write unit tests for the GetCurrentLesson use case.
Test cases:
1. Returns null when lessons list is empty
2. Returns the correct lesson when now is within lesson time on a matching day
3. Returns null when time matches but day does not match
4. Returns the lesson with earliest start time if two lessons overlap (edge case)
Use mocktail for mocking. Follow LessonTrack's test naming convention.
```
