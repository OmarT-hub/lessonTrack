# Architecture — LessonTrack

## Architectural Overview

LessonTrack follows **Feature-first Clean Architecture** — a disciplined approach that organizes code by business domain (features) rather than technical layers, while enforcing the Clean Architecture principles within each feature.

---

## Core Principles

### 1. Clean Architecture Layers

Each feature is divided into three layers:

```
Feature
├── data/          → External world: Hive models, repository implementations, local data sources
├── domain/        → Business logic: entities, repository interfaces, use cases
└── presentation/  → UI: screens, widgets, Riverpod providers
```

**Dependency Rule:** Dependencies only flow inward.
- `presentation` depends on `domain`.
- `data` depends on `domain`.
- `domain` depends on NOTHING (pure Dart).

### 2. Feature-first Organization

Each feature is a self-contained module. This makes the codebase:
- Easy to navigate (find everything for "lessons" in `features/lessons/`)
- Easy to delete or swap (remove a feature by removing its folder)
- Easy to test (unit test each feature independently)

### 3. Repository Pattern

All data access goes through a repository interface defined in `domain/repositories/`. The concrete implementation lives in `data/repositories/`. This allows:
- Swapping Hive for another DB without touching business logic.
- Mocking repositories in tests.

### 4. Use Cases

Every business operation is a Use Case class in `domain/usecases/`. Each use case has a single `call()` method (or `execute()`). This ensures:
- Logic is testable in isolation.
- Presentation layer does not contain business logic.

---

## Layer Responsibilities

### Data Layer

| Component | Responsibility |
|---|---|
| `*Model` | Hive-annotated data class. Serialization/deserialization. |
| `*LocalDataSource` | Direct Hive box read/write operations. |
| `*RepositoryImpl` | Implements domain repository interface. Calls data source. |

### Domain Layer

| Component | Responsibility |
|---|---|
| `*Entity` | Pure Dart class. Business object. No Hive annotations. |
| `*Repository` (abstract) | Interface contract for data operations. |
| `*UseCase` | Single business operation. Returns `Either<Failure, T>` or plain `T`. |

### Presentation Layer

| Component | Responsibility |
|---|---|
| `*Screen` | Full-page UI widget. |
| `*Widget` | Reusable sub-component. |
| `*Provider` | Riverpod provider exposing state to UI. |
| `*State` | Immutable state class (if using `StateNotifier` or `Notifier`). |

---

## State Management — Riverpod

LessonTrack uses **Riverpod** (with code generation via `riverpod_annotation`).

### Provider Types Used

| Provider | Use |
|---|---|
| `@riverpod` (AsyncNotifier) | For async data (DB reads) |
| `@riverpod` (Notifier) | For synchronous stateful UI logic |
| `Provider` | For services and repositories (DI) |
| `StreamProvider` | For real-time countdown timers |

### Dependency Injection

All repositories and services are provided via Riverpod providers, defined alongside each feature. The provider graph handles initialization order automatically.

---

## Navigation — GoRouter

GoRouter handles all navigation with:
- Declarative route definitions in `lib/routing/app_router.dart`.
- Named routes for type-safe navigation.
- Redirect guards for onboarding state (redirect to onboarding if first launch).
- Shell routes for bottom navigation bar persistence.

---

## Data Flow Diagram

```
User Action
    │
    ▼
Widget / Screen
    │ calls provider method
    ▼
Riverpod Provider (Notifier / AsyncNotifier)
    │ calls use case
    ▼
Use Case (domain/usecases/)
    │ calls repository interface
    ▼
Repository Interface (domain/repositories/)
    │ implemented by
    ▼
Repository Implementation (data/repositories/)
    │ calls data source
    ▼
Local Data Source (data/datasources/)
    │ reads/writes
    ▼
Hive Box (on-device storage)
```

---

## Architecture Decision Records (ADR)

### ADR-001: Hive over Isar

**Decision:** Use Hive as the local database.

**Rationale:**
- Hive has proven stability and simpler setup.
- Sufficient for the data model (no complex relational queries needed).
- Lightweight and fast for small-to-medium data sets.
- Good Flutter/Dart ecosystem support.

**Trade-offs:** Isar offers better query performance and type safety; consider for v2.0 if data grows complex.

---

### ADR-002: Riverpod over BLoC

**Decision:** Use Riverpod for state management.

**Rationale:**
- Simpler boilerplate than BLoC for a project of this scope.
- Native Dart/Flutter integration without streams boilerplate.
- Code generation with `riverpod_annotation` ensures type safety.
- Better composability than Provider.

---

### ADR-003: GoRouter over Navigator 2.0 raw

**Decision:** Use GoRouter for navigation.

**Rationale:**
- Declarative routing is clearer than imperative Navigator 2.0.
- Deep linking and named routes out of the box.
- Active maintenance and community support.
- Integrates cleanly with Riverpod for redirect logic.

---

### ADR-004: Feature-first over Layer-first

**Decision:** Organize by feature, not by layer.

**Rationale:**
- A layer-first structure (all models in one folder, all screens in another) does not scale past 3-4 features without becoming unwieldy.
- Feature-first allows developers to work on one feature without touching unrelated code.
- Easier to onboard new developers: "everything for children is in `features/children/`".

---

## Error Handling Strategy

- Use Cases return plain objects or throw domain exceptions (`LessonTrackException`).
- Presentation layer catches exceptions via `AsyncValue.error` in Riverpod.
- UI shows error snackbars / error states using a shared `ErrorView` widget.
- No `Either<Failure, T>` used (added complexity without need at this scale; revisit if needed).

---

## Testability

| Layer | Test Type | Approach |
|---|---|---|
| Domain (Use Cases) | Unit Tests | Mock repository interfaces |
| Data (Repositories) | Integration Tests | In-memory Hive box |
| Presentation (Providers) | Unit Tests | `ProviderContainer` with mocks |
| Screens/Widgets | Widget Tests | `pumpWidget` with real providers |
| E2E Flows | Integration Tests | `flutter_test` / `patrol` |
