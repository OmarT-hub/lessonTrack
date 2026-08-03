/// Typography configuration for LessonTrack.
///
/// Uses the Nunito font family via [google_fonts] for a rounded,
/// friendly appearance that suits a family-oriented application.
library;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography helpers for LessonTrack.
abstract class AppTypography {
  /// Returns a [TextTheme] using the Nunito font family.
  ///
  /// Applied to both light and dark [ThemeData] via [ThemeData.textTheme].
  static TextTheme get textTheme => GoogleFonts.nunitoTextTheme();

  /// Returns a dark [TextTheme] using the Nunito font family.
  ///
  /// Used for [ThemeData.dark] to ensure correct text colors on dark surfaces.
  static TextTheme get darkTextTheme => GoogleFonts.nunitoTextTheme(
    ThemeData.dark().textTheme,
  );
}
