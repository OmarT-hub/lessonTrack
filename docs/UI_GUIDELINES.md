# UI Guidelines — LessonTrack

## Design Philosophy

LessonTrack's UI is **minimal, calm, and purposeful.** Every pixel serves a function. The aesthetic is:

- **Modern Material 3** — Following Google's Material You principles.
- **Soft and welcoming** — This is a family app; it should feel warm, not corporate.
- **Information density in balance** — Enough data at a glance, without overwhelming.
- **Optimized for one-hand use** — Important actions within thumb reach.

---

## Design System

### Color Palette

LessonTrack uses a carefully chosen seed color system with Material 3.

**Primary Seed Color:** `#5B8DEF` (a calm, trust-inspiring blue)

```dart
// lib/core/theme/app_colors.dart

class AppColors {
  // Brand
  static const Color seedColor = Color(0xFF5B8DEF);

  // Child Avatar Colors (preset palette)
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
    Color(0xFFE06B6B), // Red
  ];

  // Semantic
  static const Color success = Color(0xFF4CAF8A);
  static const Color warning = Color(0xFFF7C948);
  static const Color error   = Color(0xFFE06B6B);

  // Neutral backgrounds
  static const Color surfaceLight = Color(0xFFF8F9FE);
  static const Color surfaceDark  = Color(0xFF121218);
}
```

### Typography

Font: **[Nunito](https://fonts.google.com/specimen/Nunito)** — Rounded, friendly, readable.

```dart
// lib/core/theme/app_typography.dart

import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextTheme get textTheme => GoogleFonts.nunitoTextTheme();
}
```

**Type Scale (Material 3):**

| Style | Size | Weight | Use |
|---|---|---|---|
| displayLarge | 57 | 400 | Hero stats (countdown timer) |
| headlineLarge | 32 | 700 | Screen titles |
| headlineMedium | 28 | 600 | Section headers |
| titleLarge | 22 | 600 | Card titles |
| titleMedium | 16 | 600 | List item titles |
| bodyLarge | 16 | 400 | Body text |
| bodyMedium | 14 | 400 | Secondary text |
| labelLarge | 14 | 600 | Buttons |
| labelSmall | 11 | 500 | Chips, badges |

### Spacing System

LessonTrack uses an **8px base grid**:

```dart
// lib/core/theme/app_spacing.dart

class AppSpacing {
  static const double xs  = 4.0;
  static const double sm  = 8.0;
  static const double md  = 16.0;
  static const double lg  = 24.0;
  static const double xl  = 32.0;
  static const double xxl = 48.0;
}
```

### Border Radius

```dart
class AppRadius {
  static const double sm   = 8.0;
  static const double md   = 12.0;
  static const double lg   = 16.0;
  static const double xl   = 24.0;
  static const double full = 100.0; // Pills, circular
}
```

### Elevation & Shadows

Use Material 3's `elevation` tones rather than hard drop shadows. For custom shadow:

```dart
class AppShadows {
  static List<BoxShadow> get card => [
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];
}
```

---

## Component Specifications

### Lesson Card

```
┌─────────────────────────────────────────────────────┐
│  🟦  [Child Avatar]  [Subject Name]  [Time Slot]    │
│       [Child Name]   [Teacher Name]  [Location]     │
│                                     [Day chips]     │
└─────────────────────────────────────────────────────┘
```
- Corner radius: `AppRadius.lg` (16px)
- Background: `ColorScheme.surfaceContainerLow`
- Left border: 4px colored border in child's avatar color
- Padding: `AppSpacing.md` (16px)
- Shadow: `AppShadows.card`

### Child Avatar

- Circular container, 44px diameter (list), 64px (detail screen)
- Background: child's `avatarColor`
- Shows child's first letter if no profile image
- Shows profile image if set (clipped circle)

### Current Lesson Card (Dashboard)

```
┌─────────────────────────────────────────────────────┐
│  NOW PLAYING                                        │
│                                                     │
│  [Avatar]  [Subject]           [⏱ HH:MM:SS left]  │
│            [Child Name]                             │
│            [Teacher · Location]                     │
│                                                     │
│  ──────────────── Progress Bar ──────────────────   │
└─────────────────────────────────────────────────────┘
```
- Gradient background using child's avatar color (soft)
- Large countdown display
- Linear progress bar showing lesson completion %

### Navigation Bar

Material 3 `NavigationBar` with:
- 4 destinations: Dashboard, Today, Week, Children
- `indicatorColor`: primary container
- Labels always visible
- Height: 80px

---

## Animation Guidelines

| Interaction | Animation | Duration |
|---|---|---|
| Screen transition | Slide/Fade | 300ms |
| Card appear | Fade + Scale from 0.95 | 200ms |
| Countdown tick | Number crossfade | 150ms |
| Button press | Scale down 0.97 | 100ms |
| Empty state | Fade in + slight slide up | 400ms |
| Bottom sheet open | Slide up | 250ms |
| Progress bar fill | Linear interpolation | 500ms (on first render) |
| Tab switch | Fade | 200ms |

Use `AnimatedSwitcher`, `AnimationController`, or `Hero` widgets as appropriate.

---

## Dark Mode

LessonTrack supports full dark mode via Material 3's `ColorScheme.fromSeed`:

```dart
ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.seedColor,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
)
```

Both light and dark themes use the same seed color; Material 3 generates appropriate surface tones automatically.

**Dark mode specific adjustments:**
- Card surfaces use `surfaceContainerHigh` for better contrast.
- Shadow opacity reduced to 0.12 (shadows are subtle on dark).
- Avatar colors remain vibrant (no desaturation).

---

## Screen Layouts

### Dashboard Screen

```
SafeArea
└── SingleChildScrollView
    └── Column
        ├── LiveClockWidget           (top, centered)
        ├── CurrentLessonCard         (large hero card)
        ├── NextLessonCard            (secondary card)
        ├── SectionHeader("Today's Schedule")
        ├── TodayTimelineWidget       (scrollable list)
        └── QuickActionsRow           (FAB-style row)
```

### Add Lesson Screen

```
Scaffold
├── AppBar("Add Lesson")
└── SingleChildScrollView
    └── Form
        ├── SubjectField
        ├── ChildSelector
        ├── TeacherNameField
        ├── LocationField
        ├── TimePicker (Start → End)
        ├── DaySelectorWidget
        ├── ReminderSelector
        ├── NotesField
        └── SaveButton (sticky bottom)
```

---

## Accessibility

- Minimum touch target size: 48×48px.
- Color is NEVER the only indicator (e.g., past lessons are grey + "Completed" label).
- All interactive elements have semantic labels.
- Font scaling supported up to 1.3× without layout breakage.
- Screen reader (TalkBack) tested on key flows.

---

## Localization & RTL

For Arabic support (v1.1+):
- All padding/margin must use `EdgeInsetsDirectional` (not `EdgeInsets`).
- Icons that imply direction (arrows, list indicators) must be mirrored via `Directionality`.
- Text alignment defaults to `TextAlign.start` (not `left`).
- No hardcoded LTR assumptions in layout.

---

## Icon System

Use only **Material Symbols** (Outlined style as default, Filled on active state):

```dart
// Active tab icon:
Icon(Icons.home)
// Inactive tab icon:
Icon(Icons.home_outlined)
```

Avoid mixing icon libraries. No FontAwesome or custom SVGs unless absolutely necessary.

---

## Empty States

Every list/screen that can be empty must have an illustrated empty state:

```
    [Icon: large, muted]
    [Title: descriptive]
    [Subtitle: actionable hint]
    [Button: primary action]
```

Example — No children:
```
    👶 (large icon)
    "No children yet"
    "Add your first child to start tracking lessons"
    [+ Add Child]
```

---

## Loading States

- Use `Skeletonizer` or shimmer-style placeholders for list loading.
- Do NOT use full-screen spinners for content that loads in <500ms.
- Skeleton cards match the exact shape/size of real cards.

---

## Error States

- Show `SnackBar` for transient errors (failed to save).
- Show inline `ErrorView` widget for critical failures (failed to load data).
- `ErrorView` always has a "Retry" action.
