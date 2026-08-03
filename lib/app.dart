/// Root application widget for LessonTrack.
///
/// Configures:
/// - [MaterialApp.router] with GoRouter
/// - Material 3 light and dark themes
/// - Localization delegates
/// - Riverpod-driven theme mode
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';

// TODO(phase-3): Import and wire GoRouter provider.
// import 'routing/app_router.dart';

// TODO(phase-7): Import and wire settings provider for theme mode.
// import 'features/settings/presentation/providers/settings_provider.dart';

/// The root widget of LessonTrack.
///
/// Uses [ConsumerWidget] to reactively rebuild when the theme mode changes
/// based on the user's settings (stored in Hive via [SettingsProvider]).
class LessonTrackApp extends ConsumerWidget {
  const LessonTrackApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(phase-3): Replace with GoRouter provider.
    // final router = ref.watch(appRouterProvider);

    // TODO(phase-7): Read theme mode from settings provider.
    // final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'LessonTrack',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      // Default to system theme until settings are wired.
      themeMode: ThemeMode.system,
      // Placeholder home — replaced by GoRouter in Phase 3.
      home: const _PlaceholderHome(),
    );
  }
}

/// Temporary placeholder home screen shown until routing is implemented.
///
/// Remove this class in Phase 3 when GoRouter replaces [MaterialApp.home].
class _PlaceholderHome extends StatelessWidget {
  const _PlaceholderHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school_rounded,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'LessonTrack',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Foundation ready 🎉',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
