/// Extensions on [BuildContext] for LessonTrack.
library;

import 'package:flutter/material.dart';

/// Convenience extension methods on [BuildContext].
extension ContextExtensions on BuildContext {
  // ── Theme ────────────────────────────────────────────────

  /// The app's [ThemeData].
  ThemeData get theme => Theme.of(this);

  /// The app's [ColorScheme].
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// The app's [TextTheme].
  TextTheme get textTheme => Theme.of(this).textTheme;

  // ── Screen Size ──────────────────────────────────────────

  /// Screen width in logical pixels.
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// Screen height in logical pixels.
  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// `true` if the screen width is at least 600dp (tablet breakpoint).
  bool get isTablet => screenWidth >= 600;

  // ── Navigation ───────────────────────────────────────────

  /// Pops the current route off the navigator stack.
  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);

  // ── Snack Bar ─────────────────────────────────────────────

  /// Shows a [SnackBar] with the given [message].
  void showSnackBar(
    String message, {
    bool isError = false,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        backgroundColor:
            isError ? colorScheme.errorContainer : null,
      ),
    );
  }
}
