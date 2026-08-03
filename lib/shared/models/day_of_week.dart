/// Shared domain model representing a day of the week.
///
/// Uses ISO 8601 weekday numbering (Monday = 1, Sunday = 7),
/// which matches [DateTime.weekday] for seamless comparisons.
library;

/// The days of the week, following ISO 8601 ordering.
///
/// Values match [DateTime.weekday] directly:
/// ```dart
/// DayOfWeek.fromDateTime(DateTime.now());
/// ```
enum DayOfWeek {
  monday(1, 'Monday', 'Mon'),
  tuesday(2, 'Tuesday', 'Tue'),
  wednesday(3, 'Wednesday', 'Wed'),
  thursday(4, 'Thursday', 'Thu'),
  friday(5, 'Friday', 'Fri'),
  saturday(6, 'Saturday', 'Sat'),
  sunday(7, 'Sunday', 'Sun');

  const DayOfWeek(this.isoValue, this.fullName, this.shortName);

  /// The ISO 8601 weekday integer (1 = Monday, 7 = Sunday).
  final int isoValue;

  /// The full English name of the day.
  final String fullName;

  /// A 3-letter abbreviation.
  final String shortName;

  /// Returns the [DayOfWeek] that matches [DateTime.weekday].
  static DayOfWeek fromIsoValue(int isoValue) {
    return DayOfWeek.values.firstWhere(
      (d) => d.isoValue == isoValue,
      orElse: () => throw ArgumentError('Invalid ISO weekday: $isoValue'),
    );
  }

  /// Returns the [DayOfWeek] for the given [DateTime].
  static DayOfWeek fromDateTime(DateTime dateTime) {
    return fromIsoValue(dateTime.weekday);
  }
}
