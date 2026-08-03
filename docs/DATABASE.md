# Database Design — LessonTrack

## Overview

LessonTrack uses **Hive** as its local NoSQL database. Hive stores data in lightweight binary boxes on the device. There is no server, no cloud sync, and no SQL.

---

## Hive Box Inventory

| Box Name | Type | Key | Description |
|---|---|---|---|
| `settings_box` | `Box<dynamic>` | String keys | App preferences (theme, reminder default) |
| `onboarding_box` | `Box<bool>` | `'completed'` | Onboarding completion flag |
| `family_box` | `Box<FamilyModel>` | `'family'` | Single family record |
| `children_box` | `Box<ChildModel>` | child UUID | All child profiles |
| `lessons_box` | `Box<LessonModel>` | lesson UUID | All lesson definitions |

All box names are defined as constants in `lib/core/constants/hive_constants.dart`.

---

## Type ID Registry

Hive requires each registered type adapter to have a unique `typeId` integer.

| TypeId | Class | File |
|---|---|---|
| 0 | `FamilyModel` | `family/data/models/family_model.dart` |
| 1 | `ChildModel` | `children/data/models/child_model.dart` |
| 2 | `LessonModel` | `lessons/data/models/lesson_model.dart` |
| 3 | `DayOfWeek` (enum adapter) | `shared/models/day_of_week.dart` |
| 4 | `ReminderOption` (enum adapter) | `lessons/data/models/lesson_model.dart` |

> ⚠️ **Never reuse a typeId.** If a type is deleted, its typeId is retired permanently.

---

## Data Models

### FamilyModel

```dart
@HiveType(typeId: 0)
class FamilyModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  DateTime createdAt;
}
```

**Domain Entity:** `Family`

---

### ChildModel

```dart
@HiveType(typeId: 1)
class ChildModel extends HiveObject {
  @HiveField(0)
  String id;               // UUID v4

  @HiveField(1)
  String name;             // Required, 2–40 chars

  @HiveField(2)
  String? schoolGrade;     // Optional

  @HiveField(3)
  int avatarColorValue;    // Color.value (int) for serialization

  @HiveField(4)
  String? profileImagePath; // Local file path

  @HiveField(5)
  DateTime createdAt;

  @HiveField(6)
  DateTime updatedAt;
}
```

**Domain Entity:** `Child`

```dart
class Child {
  final String id;
  final String name;
  final String? schoolGrade;
  final Color avatarColor;        // Color object (converted from int)
  final String? profileImagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
}
```

---

### LessonModel

```dart
@HiveType(typeId: 2)
class LessonModel extends HiveObject {
  @HiveField(0)
  String id;               // UUID v4

  @HiveField(1)
  String childId;          // FK → ChildModel.id

  @HiveField(2)
  String subject;          // Required, e.g. "Math"

  @HiveField(3)
  String? teacherName;     // Optional

  @HiveField(4)
  String? location;        // Optional

  @HiveField(5)
  int startTimeMinutes;    // Minutes from midnight (e.g. 540 = 09:00)

  @HiveField(6)
  int endTimeMinutes;      // Minutes from midnight (e.g. 660 = 11:00)

  @HiveField(7)
  List<int> daysOfWeek;    // List of weekday integers (1=Mon...7=Sun, ISO 8601)

  @HiveField(8)
  int reminderMinutes;     // Minutes before lesson to notify

  @HiveField(9)
  String? notes;           // Optional

  @HiveField(10)
  int? colorValue;         // Optional override color (inherits child color if null)

  @HiveField(11)
  bool isActive;           // Soft-delete / suspend

  @HiveField(12)
  DateTime createdAt;

  @HiveField(13)
  DateTime updatedAt;
}
```

**Domain Entity:** `Lesson`

```dart
class Lesson {
  final String id;
  final String childId;
  final String subject;
  final String? teacherName;
  final String? location;
  final TimeOfDay startTime;         // Converted from startTimeMinutes
  final TimeOfDay endTime;           // Converted from endTimeMinutes
  final List<DayOfWeek> daysOfWeek;  // Enum list
  final int reminderMinutes;
  final String? notes;
  final Color? color;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
}
```

---

### Settings (Box<dynamic>)

Settings are stored as key-value pairs in `settings_box`:

| Key | Type | Default | Description |
|---|---|---|---|
| `theme_mode` | `String` | `'system'` | `'light'`, `'dark'`, `'system'` |
| `default_reminder_minutes` | `int` | `15` | Default reminder offset |
| `notifications_enabled` | `bool` | `true` | Master notification toggle |
| `first_day_of_week` | `int` | `6` | Weekday number (6=Sat for Arabic/MENA) |

---

## Time Representation

Lesson times are stored as **integer minutes from midnight** (0–1439):

```
00:00 → 0
09:00 → 540
17:30 → 1050
23:59 → 1439
```

**Why not `DateTime`?** Lessons are recurring weekly events — they do not have a specific date, only a time-of-day and days-of-week. Storing as `TimeOfDay` is natural for UI but `TimeOfDay` is not serializable. Minutes-from-midnight is a clean, database-friendly representation.

**Conversion helpers** are in `lib/core/utils/date_utils.dart`:
```dart
TimeOfDay minutesToTimeOfDay(int minutes) {
  return TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60);
}

int timeOfDayToMinutes(TimeOfDay time) {
  return time.hour * 60 + time.minute;
}
```

---

## Days of Week Representation

Days are stored as a `List<int>` using **ISO 8601 weekday numbering**:

| Int | Day |
|---|---|
| 1 | Monday |
| 2 | Tuesday |
| 3 | Wednesday |
| 4 | Thursday |
| 5 | Friday |
| 6 | Saturday |
| 7 | Sunday |

Dart's `DateTime.weekday` also follows ISO 8601, making lookups straightforward:
```dart
final todayLessons = lessons.where(
  (l) => l.daysOfWeek.contains(DateTime.now().weekday)
);
```

---

## Data Relationships

```
Family (1)
  └── Children (1..10)
        └── Lessons (0..N per child)
```

Relationships are **not enforced by Hive** (no foreign keys). They are maintained by the application layer:
- A `Lesson.childId` references a `ChildModel.id`.
- When a child is deleted, the `DeleteChildUseCase` also deletes all lessons with `childId == child.id`.

---

## Hive Initialization Order

```dart
// In HiveService.init()
await Hive.initFlutter();

// Register adapters (order does not matter, typeIds must be unique)
Hive.registerAdapter(FamilyModelAdapter());
Hive.registerAdapter(ChildModelAdapter());
Hive.registerAdapter(LessonModelAdapter());
Hive.registerAdapter(DayOfWeekAdapter());

// Open boxes
await Hive.openBox<dynamic>('settings_box');
await Hive.openBox<bool>('onboarding_box');
await Hive.openBox<FamilyModel>('family_box');
await Hive.openBox<ChildModel>('children_box');
await Hive.openBox<LessonModel>('lessons_box');
```

---

## Data Migration Strategy

Since Hive does not support automatic migrations, version changes are handled manually:

1. Each `LessonModel` / `ChildModel` stores a `schemaVersion` field (HiveField index reserved).
2. On app startup, `HiveService` checks the stored schema version.
3. If the version is outdated, a migration function is run before the app starts.
4. Migration functions are in `lib/services/hive_migration_service.dart`.

> For v1.0, the schema version is `1`. No migration needed on first release.

---

## Backup & Export

- v1.0: Manual JSON export via Settings screen.
- v2.0: Optional cloud backup (design TBD).

Export format:
```json
{
  "version": 1,
  "exportedAt": "2026-08-03T21:00:00Z",
  "family": { ... },
  "children": [ ... ],
  "lessons": [ ... ]
}
```
