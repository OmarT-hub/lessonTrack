# Project Rules — LessonTrack

These rules are non-negotiable. They exist to keep the codebase clean, maintainable, and consistent over time.

---

## Architecture Rules

1. **Dependency direction is INWARD only.**
   - `presentation` may import from `domain`.
   - `data` may import from `domain`.
   - `domain` imports NOTHING from `data` or `presentation`.
   - Violations are never acceptable.

2. **No business logic in widgets.**
   - Widgets display data and capture user input. Nothing more.
   - Any calculation, filtering, or decision belongs in a use case or provider.

3. **No Hive access outside repositories.**
   - Only `*RepositoryImpl` classes may access Hive boxes.
   - Providers do NOT hold Hive box references.

4. **One use case = one responsibility.**
   - A use case has a single `call()` (or `execute()`) method.
   - It does ONE thing.

5. **Repository interfaces live in `domain`.**
   - Never import `*RepositoryImpl` (from `data`) in `domain` or `presentation`.
   - Only import the abstract interface.

---

## Code Quality Rules

6. **Zero analyzer warnings.**
   - `flutter analyze` must return zero issues at all times.
   - No `// ignore:` annotations without written justification.

7. **No `dynamic` types.**
   - Use generics and typed interfaces. `dynamic` is a code smell.

8. **No `print()` in production code.**
   - Remove all debug prints before committing.
   - Use a proper logger if runtime logging is needed.

9. **No magic numbers.**
   - Use `AppSpacing`, `AppRadius`, `AppColors` constants.
   - Never write `SizedBox(height: 24)` — write `SizedBox(height: AppSpacing.lg)`.

10. **`const` everywhere possible.**
    - Widgets, colors, strings, durations — if it's constant, declare it `const`.

---

## Data Rules

11. **Hive type IDs are permanent.**
    - Once assigned, a `typeId` is NEVER reused, even after a type is deleted.
    - The type ID registry in `DATABASE.md` is authoritative.

12. **Never break existing Hive field indices.**
    - Adding a new field increments the index. Never renumber existing fields.
    - Removing a field retires its index (no reuse).

13. **All child deletions cascade.**
    - Deleting a child MUST delete all associated lessons.
    - This is enforced in `DeleteChildUseCase`.

---

## UI Rules

14. **All layouts must use `EdgeInsetsDirectional` (not `EdgeInsets`).**
    - This ensures future RTL (Arabic) support without refactoring.
    - Exception: symmetric padding (e.g., `EdgeInsets.symmetric(horizontal: 16)` is acceptable).

15. **No hardcoded colors in widgets.**
    - Use `Theme.of(context).colorScheme.*` or `AppColors.*` only.

16. **Every list screen must have an empty state.**
    - No empty `ListView` without an `EmptyStateWidget`.

17. **Every async widget must handle all three `AsyncValue` states.**
    - `data`, `loading`, `error` — all three, always.

---

## Testing Rules

18. **New use cases must have unit tests.**
    - No use case merges to `develop` without a corresponding test file.

19. **Never mock concrete classes.**
    - Only mock abstract repository interfaces.

20. **Tests must be deterministic.**
    - No tests that depend on the current time, random values, or network state without mocking.

---

## Documentation Rules

21. **All public APIs must have doc comments.**
    - Classes, public methods, and complex properties need `///` doc comments.

22. **`DATABASE.md` must be updated when the schema changes.**
    - Any new Hive field or type requires a database doc update.

23. **`CHANGELOG.md` must be updated for every feature and fix.**
    - Write for the reader, not the developer.

---

## Process Rules

24. **Plan before coding.**
    - No feature is implemented without reading its spec in `FEATURES.md`.
    - No significant architectural decision is made without updating `ARCHITECTURE.md`.

25. **Never skip a phase.**
    - Phases are sequential. Do not start Phase N+1 without completing Phase N.
    - Completion criteria in `PHASES.md` must all be met.
