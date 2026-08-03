# Testing Strategy — LessonTrack

## Overview

LessonTrack follows a **practical testing pyramid** — unit tests form the base, with widget and integration tests at higher levels. The goal is confidence, not 100% coverage for its own sake.

---

## Test Pyramid

```
        /‾‾‾‾‾‾‾‾‾‾‾‾‾\
       /  Integration   \    (few, high value)
      /   Widget Tests   \   (key screens/flows)
     /    Unit Tests      \  (many, fast, isolated)
    /________________________\
```

---

## Test Types

### 1. Unit Tests

**What:** Test individual functions, use cases, and utilities in isolation.

**Location:** `test/features/<feature>/domain/` and `test/features/<feature>/data/`

**Tools:** `flutter_test`, `mocktail`

**What to test:**
- All use cases (with mocked repositories)
- Repository implementations (with in-memory Hive)
- Utility functions (`date_utils.dart`, `schedule_utils.dart`)
- Extension methods
- Data model serialization/deserialization

**Example:**

```dart
// test/features/children/domain/usecases/add_child_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:lessontrack/features/children/domain/repositories/child_repository.dart';
import 'package:lessontrack/features/children/domain/usecases/add_child.dart';
import 'package:lessontrack/features/children/domain/entities/child.dart';

class MockChildRepository extends Mock implements ChildRepository {}

void main() {
  late MockChildRepository mockRepo;
  late AddChild useCase;

  setUp(() {
    mockRepo = MockChildRepository();
    useCase = AddChild(mockRepo);
  });

  test('calls repository.addChild with correct entity', () async {
    final child = Child(
      id: 'test-id',
      name: 'Ahmed',
      avatarColor: const Color(0xFF5B8DEF),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    when(() => mockRepo.addChild(child)).thenAnswer((_) async {});

    await useCase(child);

    verify(() => mockRepo.addChild(child)).called(1);
  });
}
```

---

### 2. Widget Tests

**What:** Test individual widgets and screens in a widget tree without running the full app.

**Location:** `test/features/<feature>/presentation/`

**Tools:** `flutter_test`, `riverpod` `ProviderContainer`

**What to test:**
- Key screens render correctly with test data
- Empty states appear when data is empty
- Error states appear on error
- User interactions trigger correct actions

**Example:**

```dart
// test/features/children/presentation/children_list_screen_test.dart

testWidgets('shows empty state when no children', (tester) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        childrenProvider.overrideWith(
          (ref) => AsyncValue.data([]),
        ),
      ],
      child: const MaterialApp(
        home: ChildrenListScreen(),
      ),
    ),
  );

  expect(find.text('No children yet'), findsOneWidget);
  expect(find.text('Add your first child'), findsOneWidget);
});
```

---

### 3. Integration Tests

**What:** Test full user flows across multiple screens using a real device or emulator.

**Location:** `integration_test/`

**Tools:** `integration_test`, `flutter_test`

**Key flows to test:**

| Flow | Description |
|---|---|
| Happy Path | Onboarding → Add child → Add lesson → View on dashboard |
| Lesson CRUD | Add → Edit → Delete a lesson |
| Child CRUD | Add → Edit → Delete a child (cascades lessons) |
| Notification | Add lesson → Verify notification scheduled |
| Search | Add 3 lessons → Search by subject → Find correct result |

**Example:**

```dart
// integration_test/app_test.dart

testWidgets('user can add a child and see it in the list', (tester) async {
  app.main();
  await tester.pumpAndSettle();

  // Navigate to Add Child
  await tester.tap(find.byIcon(Icons.add));
  await tester.pumpAndSettle();

  // Fill form
  await tester.enterText(find.byKey(const Key('name_field')), 'Sara');
  await tester.tap(find.byKey(const Key('save_button')));
  await tester.pumpAndSettle();

  // Verify child appears in list
  expect(find.text('Sara'), findsOneWidget);
});
```

---

## Test Coverage Targets

| Layer | Target Coverage |
|---|---|
| Domain (Use Cases) | ≥ 90% |
| Data (Repositories) | ≥ 80% |
| Presentation (Providers) | ≥ 70% |
| Widgets | Key screens only |
| Integration | 5 core flows |

---

## Running Tests

```bash
# Run all unit + widget tests
flutter test

# Run with coverage
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html

# Run integration tests (on device or emulator)
flutter test integration_test/app_test.dart

# Run a specific test file
flutter test test/features/children/domain/usecases/add_child_test.dart
```

---

## Mocking Strategy

Use **`mocktail`** for mocking dependencies:

```yaml
dev_dependencies:
  mocktail: ^0.3.0
```

Create mock classes per repository interface:
```dart
class MockChildRepository extends Mock implements ChildRepository {}
class MockLessonRepository extends Mock implements LessonRepository {}
```

**Never mock concrete classes** — only mock interfaces/abstract classes.

---

## Test Naming Convention

```
<ClassName>_<methodName>_<scenario>_test.dart
```

Test names follow: `"<what> <condition> <expected>"`

```dart
test('returns null when no active lesson exists', () { ... });
test('returns current lesson when time overlaps', () { ... });
test('throws when child name is empty', () { ... });
```

---

## CI Testing (Future)

When a CI pipeline is added:
- Run `flutter analyze` on every push
- Run `flutter test` on every push
- Block merge on test failure
- Run integration tests on every PR to `main`
