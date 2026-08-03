/// Extensions on [DateTime] for LessonTrack.
library;

import 'package:intl/intl.dart';

/// Convenience extension methods on [DateTime].
extension DateTimeExtensions on DateTime {
  /// Returns `true` if this [DateTime] falls on the same calendar day as [other].
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Returns `true` if this [DateTime] is today.
  bool get isToday => isSameDay(DateTime.now());

  /// Returns a formatted date string (e.g., "Monday, August 3").
  String get formattedDayAndDate => DateFormat('EEEE, MMMM d').format(this);

  /// Returns a short formatted date string (e.g., "Aug 3").
  String get shortDate => DateFormat('MMM d').format(this);

  /// Returns a time string (e.g., "9:30 AM").
  String get formattedTime => DateFormat('h:mm a').format(this);
}
