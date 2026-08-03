/// Custom exception classes for LessonTrack.
///
/// All domain-level errors extend [LessonTrackException].
/// Data layer maps lower-level errors to these exceptions.
library;

/// Base exception for all LessonTrack-specific errors.
abstract class LessonTrackException implements Exception {
  /// Human-readable error message.
  final String message;

  const LessonTrackException(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

/// Thrown when a requested entity is not found in the database.
class NotFoundException extends LessonTrackException {
  const NotFoundException(super.message);
}

/// Thrown when provided data fails validation rules.
class ValidationException extends LessonTrackException {
  const ValidationException(super.message);
}

/// Thrown when a storage operation (Hive read/write) fails.
class StorageException extends LessonTrackException {
  const StorageException(super.message);
}

/// Thrown when a notification operation fails.
class NotificationException extends LessonTrackException {
  const NotificationException(super.message);
}

/// Thrown when the maximum allowed limit is exceeded.
/// Example: adding more than [AppConstants.maxChildren] children.
class LimitExceededException extends LessonTrackException {
  const LimitExceededException(super.message);
}
