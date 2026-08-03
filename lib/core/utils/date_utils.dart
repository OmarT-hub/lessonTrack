/// Date and time utility functions for LessonTrack.
///
/// Centralizes all time-related calculations to avoid duplication
/// across the codebase. Never perform time math inline in widgets or providers.
library;

import 'package:flutter/material.dart';

import '../../shared/models/day_of_week.dart';

/// Date and time helpers used throughout LessonTrack.
abstract class DateUtils {
  /// Converts minutes-from-midnight to a [TimeOfDay].
  ///
  /// Example: `minutesToTimeOfDay(540)` → `TimeOfDay(hour: 9, minute: 0)`
  static TimeOfDay minutesToTimeOfDay(int minutes) {
    assert(minutes >= 0 && minutes < 1440, 'Minutes must be 0–1439');
    return TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60);
  }

  /// Converts a [TimeOfDay] to minutes from midnight.
  ///
  /// Example: `timeOfDayToMinutes(TimeOfDay(hour: 9, minute: 30))` → `570`
  static int timeOfDayToMinutes(TimeOfDay time) {
    return time.hour * 60 + time.minute;
  }

  /// Returns the current time as minutes from midnight.
  static int nowInMinutes() {
    final now = DateTime.now();
    return now.hour * 60 + now.minute;
  }

  /// Formats a [TimeOfDay] as a human-readable string (e.g., "9:30 AM").
  static String formatTimeOfDay(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  /// Formats a [Duration] as a countdown string (e.g., "1:23:45" or "23:45").
  static String formatCountdown(Duration duration) {
    if (duration.isNegative) return '0:00';
    final hours = duration.inHours;
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    if (hours > 0) return '$hours:$minutes:$seconds';
    return '$minutes:$seconds';
  }

  /// Returns the [DayOfWeek] for [DateTime.now()].
  static DayOfWeek get today => DayOfWeek.fromDateTime(DateTime.now());
}
