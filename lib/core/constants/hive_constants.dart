/// Hive box names and type ID registry for LessonTrack.
///
/// ⚠️ IMPORTANT RULES:
/// 1. Box names must NEVER change after first release (they identify persisted data).
/// 2. Type IDs must NEVER be reused, even after a type is deleted.
/// 3. Any change here requires a corresponding update in DATABASE.md.
library;

/// Hive box name constants.
abstract class HiveBoxNames {
  /// Stores app settings as key-value pairs.
  static const String settings = 'settings_box';

  /// Stores onboarding completion flag.
  static const String onboarding = 'onboarding_box';

  /// Stores the single family record.
  static const String family = 'family_box';

  /// Stores all child profiles, keyed by child UUID.
  static const String children = 'children_box';

  /// Stores all lesson definitions, keyed by lesson UUID.
  static const String lessons = 'lessons_box';
}

/// Hive type ID registry.
///
/// ⚠️ These IDs are PERMANENT. Do not reassign retired IDs.
///
/// | ID | Class           | Status  |
/// |----|-----------------|---------|
/// |  0 | FamilyModel     | Active  |
/// |  1 | ChildModel      | Active  |
/// |  2 | LessonModel     | Active  |
/// |  3 | DayOfWeek       | Active  |
abstract class HiveTypeIds {
  static const int familyModel = 0;
  static const int childModel = 1;
  static const int lessonModel = 2;
  static const int dayOfWeek = 3;
}

/// Settings box key constants.
abstract class SettingsKeys {
  static const String themeMode = 'theme_mode';
  static const String defaultReminderMinutes = 'default_reminder_minutes';
  static const String notificationsEnabled = 'notifications_enabled';
  static const String firstDayOfWeek = 'first_day_of_week';
  static const String schemaVersion = 'schema_version';
}

/// Settings value constants.
abstract class ThemeModeValues {
  static const String light = 'light';
  static const String dark = 'dark';
  static const String system = 'system';
}
