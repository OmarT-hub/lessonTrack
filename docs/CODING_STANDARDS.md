# Coding Standards — LessonTrack

## Philosophy

> **"Code is read far more often than it is written."**

LessonTrack's code should be:
- **Readable** — A new developer should understand any file in under 2 minutes.
- **Predictable** — Similar problems solved the same way, every time.
- **Minimal** — No unnecessary abstraction, no over-engineering.
- **Well-documented** — Public APIs and complex logic always have comments.

---

## Dart & Flutter Standards

### General Rules

1. **Follow the official Dart style guide:** https://dart.dev/guides/language/effective-dart
2. **Use `final` by default.** Only use `var` or `late` when mutation is required.
3. **Prefer `const` constructors** wherever possible.
4. **Never use `dynamic`** unless absolutely necessary. Use generics instead.
5. **Never suppress analyzer warnings** with `// ignore:` without a written justification.
6. **No `print()` statements** in production code. Use a logger if needed.
7. **No dead code.** Remove unused imports, variables, and methods.

### Naming

| Element | Convention | Example |
|---|---|---|
| Files | `snake_case.dart` | `child_model.dart` |
| Directories | `snake_case/` | `features/children/` |
| Classes | `PascalCase` | `ChildRepositoryImpl` |
| Private fields | `_camelCase` | `_childBox` |
| Public fields | `camelCase` | `childName` |
| Constants | `camelCase` | `hiveBoxName` |
| Enums | `PascalCase` + `camelCase` values | `DayOfWeek.monday` |
| Extension methods | `camelCase` | `dateTime.toFormattedString()` |
| Providers | `camelCaseProvider` | `childrenProvider` |
| Notifiers | `PascalCaseNotifier` | `ChildrenNotifier` |
| Screens | `PascalCaseScreen` | `AddChildScreen` |
| Widgets | `PascalCaseWidget` | `ChildAvatarWidget` |

### File Organization

Each Dart file follows this order:
```dart
// 1. Dart imports
import 'dart:async';

// 2. Flutter imports
import 'package:flutter/material.dart';

// 3. Third-party package imports
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 4. Local package imports (relative)
import '../../../core/theme/app_colors.dart';
import '../../domain/entities/child.dart';

part 'children_provider.g.dart'; // Always last

// 5. Code below
```

### Widget Rules

1. **Every widget file contains exactly one primary widget class.**
2. **Prefer `StatelessWidget` or `ConsumerWidget`.** Use `StatefulWidget` only when local state is unavoidable (e.g., form controllers, animations).
3. **Separate large `build()` methods** into smaller named methods or extracted widgets.
4. **Max 300 lines per file.** If longer, split into sub-widgets.
5. **Use `const` for widgets with no dynamic children.**

```dart
// Good
const PrimaryButton(label: 'Save');

// Bad
PrimaryButton(label: 'Save');
```

### Error Handling

1. **Never swallow exceptions** with empty `catch {}` blocks.
2. **All async calls in providers use `AsyncValue.guard()`.**
3. **User-visible errors show a `SnackBar` or `ErrorView`.**
4. **Log the full stack trace for unexpected errors.**

---

## Documentation Rules

### File-Level Comments

Every Dart file begins with a one-line comment describing its purpose:

```dart
/// Repository implementation for child data using Hive local storage.
```

### Class-Level Comments

All public classes have a doc comment:

```dart
/// Represents a child profile in the LessonTrack system.
///
/// Immutable. Created via [AddChild] use case.
/// Stored as [ChildModel] in Hive; converted by [ChildRepositoryImpl].
class Child {
```

### Method-Level Comments

Complex or non-obvious methods have doc comments:

```dart
/// Returns the [Child] whose lesson is currently active,
/// or `null` if no lesson is in progress.
///
/// A lesson is "active" if [DateTime.now()] falls between
/// [Lesson.startTime] and [Lesson.endTime] on a matching day.
Child? getCurrentLessonChild(List<Lesson> lessons, DateTime now) { ... }
```

Simple, self-explanatory methods do NOT need a comment (don't add noise).

---

## Architecture Rules

1. **Never import a `presentation` file from `domain` or `data`.**
2. **Never import a `data` file from `domain`.**
3. **Never call Hive directly from a screen or widget.** Always go through repository → use case → provider.
4. **Never put business logic in a widget's `build()` method.**
5. **One use case = one public method.** Use cases are not services.

---

## Git Commit Standards

Follow **Conventional Commits** format:

```
<type>(<scope>): <short description>

[optional body]

[optional footer]
```

**Types:**
| Type | Use |
|---|---|
| `feat` | New feature |
| `fix` | Bug fix |
| `chore` | Tooling, dependencies, no code change |
| `docs` | Documentation only |
| `refactor` | Code restructure, no feature change |
| `test` | Tests only |
| `style` | Formatting only (no logic change) |
| `perf` | Performance improvement |

**Examples:**
```
feat(children): add child color picker widget
fix(dashboard): correct countdown timer overflow
chore(deps): update go_router to 14.2.7
docs(database): document Hive type ID registry
test(children): add unit tests for AddChild use case
```

---

## Code Review Checklist

Before marking a PR as ready:

- [ ] `flutter analyze` passes with zero issues
- [ ] `flutter test` passes
- [ ] No `print()` statements
- [ ] No unused imports
- [ ] All new public APIs have doc comments
- [ ] No business logic in widgets
- [ ] New features have corresponding unit tests
- [ ] UI changes match UI_GUIDELINES.md
- [ ] Conventional commit message on all commits

---

## Forbidden Patterns

```dart
// ❌ Never use dynamic
dynamic value = someFunction();

// ❌ Never ignore errors silently
try {
  await doSomething();
} catch (e) {} // Empty catch!

// ❌ Never use print in production
print('debug: $value');

// ❌ Never call Hive from a Widget
final box = Hive.box('children_box'); // In a Widget!

// ❌ Never put logic in build()
@override
Widget build(BuildContext context) {
  final filtered = children.where((c) => c.name.length > 3).toList(); // Logic!
}

// ❌ Never use magic numbers
const SizedBox(height: 24); // What is 24? Use AppSpacing.lg

// ✅ Correct
const SizedBox(height: AppSpacing.lg);
```
