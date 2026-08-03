# Folder Structure — LessonTrack

## Complete Directory Tree

```
lessontrack/
│
├── android/                          # Android native project
├── docs/                             # All project documentation
│   ├── ARCHITECTURE.md
│   ├── CHANGELOG.md
│   ├── CODING_STANDARDS.md
│   ├── CONTRIBUTING.md
│   ├── DATABASE.md
│   ├── FEATURES.md
│   ├── FOLDER_STRUCTURE.md
│   ├── LICENSE.md
│   ├── MILESTONES.md
│   ├── PHASES.md
│   ├── PROJECT_OVERVIEW.md
│   ├── PROMPTS.md
│   ├── RELEASE_CHECKLIST.md
│   ├── ROADMAP.md
│   ├── ROUTING.md
│   ├── RULES.md
│   ├── STATE_MANAGEMENT.md
│   ├── TESTING.md
│   ├── TODO.md
│   ├── UI_GUIDELINES.md
│   └── VISION.md
│
├── test/                             # Tests (mirrors lib/ structure)
│   ├── core/
│   ├── features/
│   │   ├── children/
│   │   ├── dashboard/
│   │   ├── lessons/
│   │   └── schedule/
│   └── shared/
│
├── pubspec.yaml                      # Dependencies
├── analysis_options.yaml             # Dart analyzer rules
└── lib/
    │
    ├── main.dart                     # App entry point
    ├── app.dart                      # MaterialApp.router root widget
    │
    ├── core/                         # App-wide utilities & shared infrastructure
    │   ├── constants/
    │   │   ├── app_constants.dart    # App-wide constants (strings, numbers)
    │   │   ├── hive_constants.dart   # Hive box names and type IDs
    │   │   └── asset_paths.dart      # Image / icon paths
    │   │
    │   ├── errors/
    │   │   └── exceptions.dart       # Custom exception classes
    │   │
    │   ├── extensions/
    │   │   ├── datetime_extensions.dart
    │   │   ├── string_extensions.dart
    │   │   ├── context_extensions.dart
    │   │   └── duration_extensions.dart
    │   │
    │   ├── theme/
    │   │   ├── app_theme.dart        # ThemeData light & dark
    │   │   ├── app_colors.dart       # Color palette constants
    │   │   ├── app_typography.dart   # TextTheme definitions
    │   │   └── app_spacing.dart      # Spacing constants (8px grid)
    │   │
    │   └── utils/
    │       ├── date_utils.dart       # Date/time helpers
    │       ├── schedule_utils.dart   # Lesson scheduling logic
    │       └── notification_utils.dart
    │
    ├── routing/
    │   ├── app_router.dart           # GoRouter configuration
    │   └── routes.dart               # Route name constants
    │
    ├── l10n/                         # Localization
    │   ├── app_en.arb                # English strings
    │   └── app_ar.arb                # Arabic strings (planned)
    │
    ├── shared/                       # Reusable across features
    │   ├── models/
    │   │   └── day_of_week.dart      # Enum: Mon, Tue, ... Sun
    │   └── widgets/
    │       ├── app_bar/
    │       │   └── custom_app_bar.dart
    │       ├── buttons/
    │       │   ├── primary_button.dart
    │       │   └── secondary_button.dart
    │       ├── cards/
    │       │   └── lesson_card.dart
    │       ├── avatars/
    │       │   └── child_avatar.dart
    │       ├── empty_state/
    │       │   └── empty_state_widget.dart
    │       ├── error_view/
    │       │   └── error_view_widget.dart
    │       ├── loading/
    │       │   └── loading_indicator.dart
    │       └── countdown/
    │           └── countdown_timer_widget.dart
    │
    ├── services/                     # App-level services
    │   ├── hive_service.dart         # Hive initialization & box management
    │   └── notification_service.dart # flutter_local_notifications wrapper
    │
    └── features/
        │
        ├── onboarding/
        │   ├── data/
        │   │   ├── models/
        │   │   │   └── onboarding_model.dart
        │   │   └── repositories/
        │   │       └── onboarding_repository_impl.dart
        │   ├── domain/
        │   │   ├── entities/
        │   │   │   └── onboarding_status.dart
        │   │   ├── repositories/
        │   │   │   └── onboarding_repository.dart
        │   │   └── usecases/
        │   │       ├── check_onboarding_status.dart
        │   │       └── complete_onboarding.dart
        │   └── presentation/
        │       ├── screens/
        │       │   ├── onboarding_welcome_screen.dart
        │       │   ├── onboarding_family_screen.dart
        │       │   └── onboarding_complete_screen.dart
        │       ├── widgets/
        │       │   └── onboarding_step_indicator.dart
        │       └── providers/
        │           └── onboarding_provider.dart
        │
        ├── family/
        │   ├── data/
        │   │   ├── models/
        │   │   │   └── family_model.dart
        │   │   └── repositories/
        │   │       └── family_repository_impl.dart
        │   ├── domain/
        │   │   ├── entities/
        │   │   │   └── family.dart
        │   │   ├── repositories/
        │   │   │   └── family_repository.dart
        │   │   └── usecases/
        │   │       ├── get_family.dart
        │   │       └── save_family.dart
        │   └── presentation/
        │       ├── screens/
        │       │   └── family_setup_screen.dart
        │       ├── widgets/
        │       │   └── family_name_input.dart
        │       └── providers/
        │           └── family_provider.dart
        │
        ├── children/
        │   ├── data/
        │   │   ├── models/
        │   │   │   └── child_model.dart      # Hive @HiveType
        │   │   └── repositories/
        │   │       └── child_repository_impl.dart
        │   ├── domain/
        │   │   ├── entities/
        │   │   │   └── child.dart            # Pure Dart entity
        │   │   ├── repositories/
        │   │   │   └── child_repository.dart
        │   │   └── usecases/
        │   │       ├── get_all_children.dart
        │   │       ├── add_child.dart
        │   │       ├── update_child.dart
        │   │       └── delete_child.dart
        │   └── presentation/
        │       ├── screens/
        │       │   ├── children_list_screen.dart
        │       │   ├── add_child_screen.dart
        │       │   ├── edit_child_screen.dart
        │       │   └── child_detail_screen.dart
        │       ├── widgets/
        │       │   ├── child_card.dart
        │       │   ├── child_color_picker.dart
        │       │   └── child_avatar_picker.dart
        │       └── providers/
        │           └── children_provider.dart
        │
        ├── lessons/
        │   ├── data/
        │   │   ├── models/
        │   │   │   └── lesson_model.dart     # Hive @HiveType
        │   │   └── repositories/
        │   │       └── lesson_repository_impl.dart
        │   ├── domain/
        │   │   ├── entities/
        │   │   │   └── lesson.dart
        │   │   ├── repositories/
        │   │   │   └── lesson_repository.dart
        │   │   └── usecases/
        │   │       ├── get_all_lessons.dart
        │   │       ├── get_lessons_for_child.dart
        │   │       ├── get_lessons_for_day.dart
        │   │       ├── add_lesson.dart
        │   │       ├── update_lesson.dart
        │   │       └── delete_lesson.dart
        │   └── presentation/
        │       ├── screens/
        │       │   ├── lessons_list_screen.dart
        │       │   ├── add_lesson_screen.dart
        │       │   ├── edit_lesson_screen.dart
        │       │   └── lesson_detail_screen.dart
        │       ├── widgets/
        │       │   ├── lesson_card.dart
        │       │   ├── day_selector_widget.dart
        │       │   ├── time_picker_field.dart
        │       │   └── reminder_selector.dart
        │       └── providers/
        │           └── lessons_provider.dart
        │
        ├── schedule/
        │   ├── data/
        │   │   └── repositories/
        │   │       └── schedule_repository_impl.dart
        │   ├── domain/
        │   │   ├── entities/
        │   │   │   └── scheduled_lesson.dart
        │   │   ├── repositories/
        │   │   │   └── schedule_repository.dart
        │   │   └── usecases/
        │   │       ├── get_today_schedule.dart
        │   │       └── get_weekly_schedule.dart
        │   └── presentation/
        │       ├── screens/
        │       │   ├── today_schedule_screen.dart
        │       │   └── weekly_schedule_screen.dart
        │       ├── widgets/
        │       │   ├── schedule_day_column.dart
        │       │   ├── schedule_lesson_tile.dart
        │       │   └── week_day_tab.dart
        │       └── providers/
        │           └── schedule_provider.dart
        │
        ├── dashboard/
        │   ├── domain/
        │   │   └── usecases/
        │   │       ├── get_current_lesson.dart
        │   │       └── get_next_lesson.dart
        │   └── presentation/
        │       ├── screens/
        │       │   └── dashboard_screen.dart
        │       ├── widgets/
        │       │   ├── current_lesson_card.dart
        │       │   ├── next_lesson_card.dart
        │       │   ├── live_clock_widget.dart
        │       │   ├── today_timeline_widget.dart
        │       │   └── quick_actions_row.dart
        │       └── providers/
        │           └── dashboard_provider.dart
        │
        ├── notifications/
        │   ├── data/
        │   │   └── services/
        │   │       └── notification_scheduler.dart
        │   ├── domain/
        │   │   └── usecases/
        │   │       ├── schedule_lesson_notification.dart
        │   │       └── cancel_lesson_notification.dart
        │   └── presentation/
        │       └── providers/
        │           └── notification_provider.dart
        │
        ├── settings/
        │   ├── data/
        │   │   └── repositories/
        │   │       └── settings_repository_impl.dart
        │   ├── domain/
        │   │   ├── entities/
        │   │   │   └── app_settings.dart
        │   │   ├── repositories/
        │   │   │   └── settings_repository.dart
        │   │   └── usecases/
        │   │       ├── get_settings.dart
        │   │       └── update_settings.dart
        │   └── presentation/
        │       ├── screens/
        │       │   ├── settings_screen.dart
        │       │   └── about_screen.dart
        │       ├── widgets/
        │       │   └── settings_tile.dart
        │       └── providers/
        │           └── settings_provider.dart
        │
        └── search/
            ├── domain/
            │   └── usecases/
            │       └── search_lessons.dart
            └── presentation/
                ├── screens/
                │   └── search_screen.dart
                └── providers/
                    └── search_provider.dart
```

---

## Naming Conventions

| Type | Convention | Example |
|---|---|---|
| Files | `snake_case.dart` | `child_model.dart` |
| Classes | `PascalCase` | `ChildModel` |
| Variables | `camelCase` | `childName` |
| Constants | `camelCase` | `hiveBoxName` |
| Providers | `*Provider` suffix | `childrenProvider` |
| Screens | `*Screen` suffix | `AddChildScreen` |
| Widgets | `*Widget` suffix | `ChildAvatarWidget` |
| Use Cases | Verb phrase | `GetAllChildren`, `AddLesson` |
| Entities | Noun | `Child`, `Lesson` |
| Models | `*Model` suffix | `ChildModel`, `LessonModel` |
| Repositories (abstract) | `*Repository` | `ChildRepository` |
| Repository (impl) | `*RepositoryImpl` | `ChildRepositoryImpl` |

---

## Key Files

| File | Purpose |
|---|---|
| `lib/main.dart` | Bootstrap: Hive init, notification init, `runApp` |
| `lib/app.dart` | Root `MaterialApp.router` with theme and router config |
| `lib/routing/app_router.dart` | All route definitions |
| `lib/core/theme/app_theme.dart` | Light & dark `ThemeData` |
| `lib/services/hive_service.dart` | Hive box registration and initialization |
| `lib/services/notification_service.dart` | Notification plugin wrapper |
| `lib/core/constants/hive_constants.dart` | All Hive box names and type IDs |
