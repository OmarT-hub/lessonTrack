# State Management — LessonTrack

## Overview

LessonTrack uses **Riverpod** (with code generation via `riverpod_annotation` and `riverpod_generator`) as its sole state management solution. Riverpod provides reactive, compile-time-safe providers that integrate cleanly with the Clean Architecture use case pattern.

---

## Package Versions

```yaml
dependencies:
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5

dev_dependencies:
  riverpod_generator: ^2.4.3
  build_runner: ^2.4.9
```

---

## Provider Types Used

### 1. `@riverpod` — AsyncNotifier (async data)

Used for providers that load data from Hive asynchronously.

```dart
// children/presentation/providers/children_provider.dart

@riverpod
class ChildrenNotifier extends _$ChildrenNotifier {
  @override
  Future<List<Child>> build() async {
    final repo = ref.watch(childRepositoryProvider);
    return ref.watch(getAllChildrenProvider.future);
  }

  Future<void> addChild(Child child) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(addChildUseCaseProvider);
      await useCase(child);
      return ref.read(childRepositoryProvider).getAllChildren();
    });
  }

  Future<void> deleteChild(String childId) async { ... }
  Future<void> updateChild(Child child) async { ... }
}
```

### 2. `@riverpod` — Notifier (synchronous state)

Used for UI state that doesn't require async initialization.

```dart
// features/schedule/presentation/providers/schedule_provider.dart

@riverpod
class SelectedDayNotifier extends _$SelectedDayNotifier {
  @override
  DateTime build() => DateTime.now();

  void selectDay(DateTime day) => state = day;
}
```

### 3. `Provider` — Services & Repositories (DI)

Repositories and services are provided as simple `Provider` values.

```dart
// children/presentation/providers/children_provider.dart

@riverpod
ChildRepository childRepository(Ref ref) {
  final box = ref.watch(childrenBoxProvider);
  return ChildRepositoryImpl(box);
}

@riverpod
GetAllChildren getAllChildren(Ref ref) {
  return GetAllChildren(ref.watch(childRepositoryProvider));
}
```

### 4. `StreamProvider` — Live Timers

Used for the countdown timer on the dashboard.

```dart
// dashboard/presentation/providers/dashboard_provider.dart

@riverpod
Stream<DateTime> liveClock(Ref ref) {
  return Stream.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now(),
  );
}
```

---

## Dependency Injection Graph

```
HiveService (initialized in main.dart)
    │
    ├── childrenBoxProvider     → Box<ChildModel>
    ├── lessonsBoxProvider      → Box<LessonModel>
    ├── settingsBoxProvider     → Box<dynamic>
    └── familyBoxProvider       → Box<FamilyModel>
          │
          ├── childRepositoryProvider     → ChildRepository
          ├── lessonRepositoryProvider    → LessonRepository
          ├── settingsRepositoryProvider  → SettingsRepository
          └── familyRepositoryProvider    → FamilyRepository
                │
                ├── getAllChildrenProvider     → GetAllChildren UseCase
                ├── addChildProvider          → AddChild UseCase
                ├── getAllLessonsProvider      → GetAllLessons UseCase
                └── getLessonsForDayProvider  → GetLessonsForDay UseCase
                      │
                      ├── childrenProvider (AsyncNotifier)
                      ├── lessonsProvider (AsyncNotifier)
                      ├── dashboardProvider (Notifier)
                      └── scheduleProvider (AsyncNotifier)
```

---

## State Classes

All mutable state is represented as immutable data classes. Use `freezed` for complex state, or plain Dart classes with `copyWith` for simple cases.

### Example: LessonFormState

```dart
// lessons/presentation/providers/lesson_form_state.dart

class LessonFormState {
  final String subject;
  final String? teacherName;
  final String? location;
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final List<DayOfWeek> selectedDays;
  final int reminderMinutes;
  final String? notes;
  final bool isSubmitting;
  final String? errorMessage;

  const LessonFormState({...});

  LessonFormState copyWith({...}) { ... }
}
```

---

## Provider File Convention

Each feature's providers are in a single file:
```
features/<feature>/presentation/providers/<feature>_provider.dart
```

Exception: if the file grows beyond ~200 lines, split into:
```
providers/
  <feature>_notifier.dart   # The notifier class
  <feature>_state.dart      # The state class
  <feature>_providers.dart  # Repository / usecase providers
```

---

## Code Generation

Run after creating or modifying providers:

```bash
dart run build_runner build --delete-conflicting-outputs
```

During development (watch mode):
```bash
dart run build_runner watch --delete-conflicting-outputs
```

Generated files (`*.g.dart`) are committed to the repository.

---

## Riverpod Best Practices

1. **Never put business logic in the UI layer.** All logic goes in use cases; providers orchestrate.
2. **Use `ref.watch` in `build()`; use `ref.read` in methods.**
3. **Always invalidate or refresh after mutations.** After writing to Hive, call `ref.invalidateSelf()` or rebuild state.
4. **Use `AsyncValue.guard` for safe async error handling** instead of try/catch blocks.
5. **Avoid `context.read`/`context.watch` from `BuildContext`**; prefer `ref` in widgets that `extends ConsumerWidget` or `ConsumerStatefulWidget`.
6. **Keep providers small and focused.** One notifier per feature concern (not one massive global state object).

---

## Error Handling in Providers

```dart
// Example: error handling pattern

state = const AsyncValue.loading();
state = await AsyncValue.guard(() async {
  return await useCase();
});

// In the widget:
ref.watch(childrenProvider).when(
  data: (children) => ChildrenList(children),
  loading: () => const LoadingIndicator(),
  error: (e, st) => ErrorView(message: e.toString()),
);
```

---

## Testing Providers

```dart
// test/features/children/providers/children_provider_test.dart

void main() {
  test('addChild adds child to state', () async {
    final container = ProviderContainer(
      overrides: [
        childRepositoryProvider.overrideWithValue(MockChildRepository()),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(childrenProvider.notifier);
    await notifier.addChild(testChild);
    
    final state = container.read(childrenProvider);
    expect(state.value, contains(testChild));
  });
}
```
