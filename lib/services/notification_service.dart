/// Notification service wrapper for LessonTrack.
///
/// Wraps [flutter_local_notifications] to provide a simplified API
/// for scheduling, cancelling, and managing lesson reminders.
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// App-level wrapper around [FlutterLocalNotificationsPlugin].
///
/// Initialize via [NotificationService.init] at app startup,
/// after [WidgetsFlutterBinding.ensureInitialized].
///
/// All notification operations go through this service — never access
/// [FlutterLocalNotificationsPlugin] directly from use cases or widgets.
class NotificationService {
  NotificationService._();

  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  /// Notification channel ID for lesson reminders.
  static const String _reminderChannelId = 'lesson_reminders';
  static const String _reminderChannelName = 'Lesson Reminders';
  static const String _reminderChannelDesc =
      'Reminders before a lesson starts';

  /// Notification channel ID for lesson start alerts.
  static const String _startChannelId = 'lesson_start';
  static const String _startChannelName = 'Lesson Started';
  static const String _startChannelDesc = 'Alert when a lesson begins';

  /// Whether the user has granted notification permission.
  static bool _permissionGranted = false;

  /// Returns whether notifications are permitted on this device.
  static bool get isPermissionGranted => _permissionGranted;

  /// Initializes the notification plugin and requests permission on Android 13+.
  ///
  /// Must be called once at app startup, before any lesson is added.
  static Future<void> init() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);

    await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Request permission for Android 13+ (API 33+)
    final androidPlugin =
        _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    if (androidPlugin != null) {
      _permissionGranted =
          await androidPlugin.requestNotificationsPermission() ?? false;
    }

    if (kDebugMode) {
      debugPrint(
        '✅ NotificationService: initialized. Permission: $_permissionGranted',
      );
    }
  }

  /// Called when the user taps a notification.
  ///
  /// Navigation to the relevant lesson screen is handled here.
  static void _onNotificationTapped(NotificationResponse response) {
    // TODO(phase-9): Navigate to lesson detail from notification tap.
    // The payload will contain the lessonId.
    if (kDebugMode) {
      debugPrint('🔔 Notification tapped: ${response.payload}');
    }
  }

  /// Schedules a one-time notification at [scheduledDate].
  ///
  /// [id] must be unique per notification (use a deterministic hash of lessonId + day).
  /// [payload] should contain the lessonId for navigation on tap.
  ///
  /// This is a placeholder implementation — full scheduling with timezone
  /// support will be added in Phase 9.
  static Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  }) async {
    if (!_permissionGranted) return;

    // Full implementation added in Phase 9 with timezone scheduling.
    // Placeholder to define the API contract.
    if (kDebugMode) {
      debugPrint(
        '🔔 [STUB] Schedule notification id=$id at $scheduledDate: $title',
      );
    }
  }

  /// Cancels the notification with the given [id].
  static Future<void> cancelNotification(int id) async {
    await _plugin.cancel(id);
  }

  /// Cancels all currently scheduled notifications.
  static Future<void> cancelAllNotifications() async {
    await _plugin.cancelAll();
  }

  /// Returns all currently pending notification requests.
  static Future<List<PendingNotificationRequest>>
  getPendingNotifications() async {
    return _plugin.pendingNotificationRequests();
  }
}
