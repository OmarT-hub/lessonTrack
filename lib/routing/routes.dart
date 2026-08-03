/// Route name constants for LessonTrack.
///
/// All navigation in the app uses these constants.
/// Never hardcode route strings in screens or widgets.
///
/// Route naming convention:
/// - All lowercase with forward slashes.
/// - Path parameters use colon prefix (e.g., ':id').
/// - Query parameters are NOT listed here (handled at call site).
library;

/// Named route constants for the GoRouter configuration.
abstract class Routes {
  // ── Onboarding ────────────────────────────────────────────
  static const String onboarding = '/onboarding';
  static const String onboardingFamily = '/onboarding/family';
  static const String onboardingDone = '/onboarding/complete';

  // ── Shell / Main Navigation ───────────────────────────────
  static const String home = '/home';
  static const String dashboard = '/home/dashboard';
  static const String scheduleToday = '/home/schedule/today';
  static const String scheduleWeekly = '/home/schedule/weekly';
  static const String children = '/home/children';

  // ── Children CRUD ─────────────────────────────────────────
  static const String addChild = '/children/add';
  static const String childDetail = '/children/:id';
  static const String editChild = '/children/:id/edit';

  /// Returns the child detail path for a given [childId].
  static String childDetailPath(String childId) => '/children/$childId';

  /// Returns the edit child path for a given [childId].
  static String editChildPath(String childId) => '/children/$childId/edit';

  // ── Lessons CRUD ──────────────────────────────────────────
  static const String lessons = '/lessons';
  static const String addLesson = '/lessons/add';
  static const String lessonDetail = '/lessons/:id';
  static const String editLesson = '/lessons/:id/edit';

  /// Returns the lesson detail path for a given [lessonId].
  static String lessonDetailPath(String lessonId) => '/lessons/$lessonId';

  /// Returns the edit lesson path for a given [lessonId].
  static String editLessonPath(String lessonId) => '/lessons/$lessonId/edit';

  /// Returns the add lesson path, optionally pre-selecting a child.
  static String addLessonPath({String? childId}) {
    if (childId != null) return '/lessons/add?childId=$childId';
    return addLesson;
  }

  // ── Search ────────────────────────────────────────────────
  static const String search = '/search';

  // ── Settings ──────────────────────────────────────────────
  static const String settings = '/settings';
  static const String about = '/settings/about';
}
