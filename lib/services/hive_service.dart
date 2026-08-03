/// Hive initialization and box management service for LessonTrack.
///
/// This service must be initialized before [runApp] is called.
/// It registers all Hive adapters and opens all required boxes.
library;

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../core/constants/hive_constants.dart';

// Data model imports — added as each feature is built.
// Uncomment each line when the corresponding model is created:
//
// import '../features/family/data/models/family_model.dart';
// import '../features/children/data/models/child_model.dart';
// import '../features/lessons/data/models/lesson_model.dart';

/// Service responsible for initializing Hive and managing box lifecycle.
///
/// Call [HiveService.init] once at app startup before [runApp].
///
/// Example:
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await HiveService.init();
///   runApp(const ProviderScope(child: LessonTrackApp()));
/// }
/// ```
abstract class HiveService {
  /// Initializes Hive for Flutter, registers all adapters, and opens all boxes.
  ///
  /// Must be called after [WidgetsFlutterBinding.ensureInitialized].
  /// Throws a [StateError] if called more than once.
  static Future<void> init() async {
    // Initialize Hive with Flutter path provider
    await Hive.initFlutter();

    // ── Register Adapters ──────────────────────────────────────
    // Adapters are registered here in typeId order.
    // Uncomment each line when the model class is created.
    //
    // typeId: 0 — FamilyModel
    // Hive.registerAdapter(FamilyModelAdapter());
    //
    // typeId: 1 — ChildModel
    // Hive.registerAdapter(ChildModelAdapter());
    //
    // typeId: 2 — LessonModel
    // Hive.registerAdapter(LessonModelAdapter());

    // ── Open Boxes ────────────────────────────────────────────
    await Future.wait([
      Hive.openBox<dynamic>(HiveBoxNames.settings),
      Hive.openBox<bool>(HiveBoxNames.onboarding),
      // Boxes below are opened without type params until models exist:
      Hive.openBox<dynamic>(HiveBoxNames.family),
      Hive.openBox<dynamic>(HiveBoxNames.children),
      Hive.openBox<dynamic>(HiveBoxNames.lessons),
    ]);

    if (kDebugMode) {
      debugPrint('✅ HiveService: All boxes initialized successfully.');
    }
  }

  /// Closes all open Hive boxes.
  ///
  /// Call this when the app is shutting down (if needed).
  /// In most Flutter apps, Hive closes automatically on exit.
  static Future<void> dispose() async {
    await Hive.close();
  }

  /// Clears all data from all boxes.
  ///
  /// ⚠️ DESTRUCTIVE — Used only from the "Clear all data" settings option.
  /// Requires explicit user confirmation before calling.
  static Future<void> clearAll() async {
    final boxes = [
      HiveBoxNames.settings,
      HiveBoxNames.onboarding,
      HiveBoxNames.family,
      HiveBoxNames.children,
      HiveBoxNames.lessons,
    ];

    for (final name in boxes) {
      final box = Hive.box<dynamic>(name);
      await box.clear();
    }

    if (kDebugMode) {
      debugPrint('🗑️ HiveService: All data cleared.');
    }
  }
}
