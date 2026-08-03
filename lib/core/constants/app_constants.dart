/// Application-wide constants for LessonTrack.
///
/// All constants should be referenced from this file rather than
/// hardcoded throughout the codebase.
library;

/// General application constants.
abstract class AppConstants {
  /// The app's display name.
  static const String appName = 'LessonTrack';

  /// Maximum number of children allowed per family.
  static const int maxChildren = 10;

  /// Maximum character length for a child's name.
  static const int childNameMaxLength = 40;

  /// Minimum character length for a child's name.
  static const int childNameMinLength = 2;

  /// Maximum character length for a subject name.
  static const int subjectMaxLength = 60;

  /// Maximum character length for a teacher name.
  static const int teacherNameMaxLength = 60;

  /// Maximum character length for a location.
  static const int locationMaxLength = 100;

  /// Maximum character length for lesson notes.
  static const int notesMaxLength = 500;

  /// Reminder options available to the user, in minutes.
  static const List<int> reminderOptions = [5, 10, 15, 30, 60];

  /// Default reminder offset in minutes before a lesson.
  static const int defaultReminderMinutes = 15;

  /// Hive schema version. Increment when the schema changes.
  static const int schemaVersion = 1;
}
