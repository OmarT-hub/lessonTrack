/// LessonTrack — Application Entry Point.
///
/// Bootstrap order:
/// 1. Bind Flutter engine ([WidgetsFlutterBinding.ensureInitialized])
/// 2. Initialize Hive ([HiveService.init])
/// 3. Initialize Notifications ([NotificationService.init])
/// 4. Wrap app in [ProviderScope] (Riverpod)
/// 5. Launch app ([runApp])
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'services/hive_service.dart';
import 'services/notification_service.dart';

Future<void> main() async {
  // Ensure Flutter engine is bound before any plugin calls.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive — opens all boxes and registers adapters.
  await HiveService.init();

  // Initialize local notifications — sets up channels and requests permission.
  await NotificationService.init();

  // Launch the app wrapped in ProviderScope for Riverpod.
  runApp(
    const ProviderScope(
      child: LessonTrackApp(),
    ),
  );
}
