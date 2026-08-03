/// Spacing constants for LessonTrack based on an 8px grid.
///
/// All padding, margin, and gap values in the app must use these constants.
/// Never hardcode spacing values (e.g., `SizedBox(height: 24)` is forbidden;
/// use `SizedBox(height: AppSpacing.lg)` instead).
library;

/// Spacing values based on an 8px base grid.
abstract class AppSpacing {
  /// 4px — Extra small. Tight internal spacing within components.
  static const double xs = 4.0;

  /// 8px — Small. Gap between related items within a card.
  static const double sm = 8.0;

  /// 16px — Medium. Standard padding inside cards and containers.
  static const double md = 16.0;

  /// 24px — Large. Space between sections.
  static const double lg = 24.0;

  /// 32px — Extra large. Generous spacing for visual breathing room.
  static const double xl = 32.0;

  /// 48px — Double extra large. Hero section spacing.
  static const double xxl = 48.0;

  /// 64px — Used sparingly for screen-level top padding.
  static const double xxxl = 64.0;
}

/// Border radius constants for LessonTrack.
///
/// Consistent rounded corners throughout the app.
abstract class AppRadius {
  /// 6px — Small. Subtle rounding for chips, tags.
  static const double sm = 6.0;

  /// 12px — Medium. Input fields, small cards.
  static const double md = 12.0;

  /// 16px — Large. Standard cards.
  static const double lg = 16.0;

  /// 24px — Extra large. Hero cards, bottom sheets.
  static const double xl = 24.0;

  /// 100px — Full radius for pills, circular buttons, FABs.
  static const double full = 100.0;
}

/// Box shadow definitions for LessonTrack.
abstract class AppShadows {
  /// Subtle shadow for cards and elevated surfaces.
  static List<BoxShadow> get card => [
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.06),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  /// Slightly more pronounced shadow for floating elements.
  static List<BoxShadow> get elevated => [
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.10),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];
}
