# Routing — LessonTrack

## Overview

LessonTrack uses **GoRouter** for all navigation. Routes are declared declaratively in `lib/routing/app_router.dart`. All route name constants are in `lib/routing/routes.dart`.

---

## Package

```yaml
dependencies:
  go_router: ^14.2.7
```

---

## Route Map

```
/                           → Redirect based on onboarding status
/onboarding                 → OnboardingWelcomeScreen
  /onboarding/family        → OnboardingFamilySetupScreen
  /onboarding/complete      → OnboardingCompleteScreen
/home                       → Shell (BottomNavBar)
  /home/dashboard           → DashboardScreen       [Tab 0]
  /home/schedule/today      → TodayScheduleScreen   [Tab 1]
  /home/schedule/weekly     → WeeklyScheduleScreen  [Tab 2]
  /home/children            → ChildrenListScreen    [Tab 3]
/children/add               → AddChildScreen
/children/:id               → ChildDetailScreen
/children/:id/edit          → EditChildScreen
/lessons                    → LessonsListScreen
/lessons/add                → AddLessonScreen        (query: ?childId=)
/lessons/:id                → LessonDetailScreen
/lessons/:id/edit           → EditLessonScreen
/search                     → SearchScreen
/settings                   → SettingsScreen
/settings/about             → AboutScreen
```

---

## Route Name Constants

```dart
// lib/routing/routes.dart

abstract class Routes {
  // Onboarding
  static const onboarding       = '/onboarding';
  static const onboardingFamily = '/onboarding/family';
  static const onboardingDone   = '/onboarding/complete';

  // Shell / Home
  static const home             = '/home';
  static const dashboard        = '/home/dashboard';
  static const scheduleToday    = '/home/schedule/today';
  static const scheduleWeekly   = '/home/schedule/weekly';
  static const children         = '/home/children';

  // Children CRUD
  static const addChild         = '/children/add';
  static const childDetail      = '/children/:id';
  static const editChild        = '/children/:id/edit';

  // Lessons CRUD
  static const lessons          = '/lessons';
  static const addLesson        = '/lessons/add';
  static const lessonDetail     = '/lessons/:id';
  static const editLesson       = '/lessons/:id/edit';

  // Search
  static const search           = '/search';

  // Settings
  static const settings         = '/settings';
  static const about            = '/settings/about';
}
```

---

## Router Configuration

```dart
// lib/routing/app_router.dart

final appRouterProvider = Provider<GoRouter>((ref) {
  final onboardingCompleted = ref.watch(onboardingStatusProvider);

  return GoRouter(
    initialLocation: '/home/dashboard',
    redirect: (context, state) {
      final isOnboarded = onboardingCompleted.valueOrNull ?? false;
      final isOnboardingRoute = state.fullPath?.startsWith('/onboarding') ?? false;

      if (!isOnboarded && !isOnboardingRoute) return Routes.onboarding;
      if (isOnboarded && isOnboardingRoute) return Routes.dashboard;
      return null;
    },
    routes: [
      // Onboarding flow
      GoRoute(
        path: Routes.onboarding,
        builder: (_, __) => const OnboardingWelcomeScreen(),
        routes: [
          GoRoute(path: 'family', builder: (_, __) => const OnboardingFamilySetupScreen()),
          GoRoute(path: 'complete', builder: (_, __) => const OnboardingCompleteScreen()),
        ],
      ),

      // Main Shell with Bottom Navigation
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(path: Routes.dashboard, builder: (_, __) => const DashboardScreen()),
          GoRoute(path: Routes.scheduleToday, builder: (_, __) => const TodayScheduleScreen()),
          GoRoute(path: Routes.scheduleWeekly, builder: (_, __) => const WeeklyScheduleScreen()),
          GoRoute(path: Routes.children, builder: (_, __) => const ChildrenListScreen()),
        ],
      ),

      // Children CRUD (outside shell, full screen)
      GoRoute(path: '/children/add', builder: (_, __) => const AddChildScreen()),
      GoRoute(
        path: '/children/:id',
        builder: (_, state) => ChildDetailScreen(childId: state.pathParameters['id']!),
        routes: [
          GoRoute(
            path: 'edit',
            builder: (_, state) => EditChildScreen(childId: state.pathParameters['id']!),
          ),
        ],
      ),

      // Lessons CRUD
      GoRoute(path: '/lessons', builder: (_, __) => const LessonsListScreen()),
      GoRoute(
        path: '/lessons/add',
        builder: (_, state) => AddLessonScreen(
          preselectedChildId: state.uri.queryParameters['childId'],
        ),
      ),
      GoRoute(
        path: '/lessons/:id',
        builder: (_, state) => LessonDetailScreen(lessonId: state.pathParameters['id']!),
        routes: [
          GoRoute(
            path: 'edit',
            builder: (_, state) => EditLessonScreen(lessonId: state.pathParameters['id']!),
          ),
        ],
      ),

      // Search
      GoRoute(path: Routes.search, builder: (_, __) => const SearchScreen()),

      // Settings
      GoRoute(
        path: Routes.settings,
        builder: (_, __) => const SettingsScreen(),
        routes: [
          GoRoute(path: 'about', builder: (_, __) => const AboutScreen()),
        ],
      ),
    ],
  );
});
```

---

## Navigation Helpers

Use GoRouter's `context.go()` and `context.push()`:

```dart
// Navigate (replace current stack)
context.go(Routes.dashboard);

// Push (add to stack)
context.push(Routes.addChild);

// Push with path parameter
context.push('/children/${child.id}/edit');

// Push with query parameter
context.push('/lessons/add?childId=${child.id}');

// Pop
context.pop();
```

---

## Shell & Bottom Navigation Bar

The `AppShell` widget wraps the main tabs and renders the `NavigationBar`:

```
Tab 0: Dashboard  (home_outlined / home)
Tab 1: Today      (today_outlined / today)
Tab 2: Week       (calendar_view_week_outlined / calendar_view_week)
Tab 3: Children   (people_outline / people)
```

The active tab index is derived from the current GoRouter location.

---

## Transitions

All route transitions use a custom `FadeTransition` or `SlideTransition` for a polished feel:
- **Push (forward):** Slide from right.
- **Pop (back):** Slide to right.
- **Tab switch:** Fade.
- **Modal sheets:** Bottom sheet or fade up.

These are configured via `GoRoute.pageBuilder` using `CustomTransitionPage`.

---

## Deep Linking

For v1.0, deep linking is not required (no backend). GoRouter's URL-based system is used purely for internal navigation. Deep linking can be enabled in a future version for notification tap routing.
