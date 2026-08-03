/// Color palette for LessonTrack.
///
/// All colors used in the app must come from this file or from
/// [Theme.of(context).colorScheme]. Never hardcode raw color values in widgets.
library;

import 'package:flutter/material.dart';

/// LessonTrack brand and semantic color constants.
abstract class AppColors {
  /// Primary seed color used to generate the Material 3 color scheme.
  ///
  /// A calm, trust-inspiring blue that forms the foundation of the palette.
  static const Color seedColor = Color(0xFF5B8DEF);

  // ── Semantic Colors ────────────────────────────────────────────
  /// Success / active state color.
  static const Color success = Color(0xFF4CAF8A);

  /// Warning state color.
  static const Color warning = Color(0xFFF7C948);

  /// Error state color.
  static const Color error = Color(0xFFE06B6B);

  // ── Child Avatar Colors ────────────────────────────────────────
  /// Preset palette of avatar colors for child profiles.
  ///
  /// Parents choose from this list when creating a child.
  /// Colors are vibrant enough to be distinct, soft enough to be friendly.
  static const List<Color> childAvatarColors = [
    Color(0xFF5B8DEF), // Blue
    Color(0xFF7C67EE), // Purple
    Color(0xFFEF6C8D), // Pink
    Color(0xFF4CAF8A), // Teal
    Color(0xFFFF8C42), // Orange
    Color(0xFF6DAEDB), // Sky
    Color(0xFFF7C948), // Yellow
    Color(0xFFB56BB5), // Violet
    Color(0xFF5BAD8B), // Green
    Color(0xFFE06B6B), // Red / Coral
  ];

  /// Returns the default avatar color for a newly created child.
  static Color get defaultAvatarColor => childAvatarColors.first;

  // ── Surface Overrides ─────────────────────────────────────────
  /// Light mode background override.
  static const Color surfaceLight = Color(0xFFF8F9FE);

  /// Dark mode background override.
  static const Color surfaceDark = Color(0xFF121218);
}
