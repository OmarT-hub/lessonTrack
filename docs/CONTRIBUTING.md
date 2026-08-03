# Contributing — LessonTrack

## Welcome

Thank you for your interest in contributing to LessonTrack. This document outlines the process for contributing code, documentation, and bug reports.

---

## Getting Started

### 1. Fork & Clone

```bash
git clone https://github.com/your-org/lessontrack.git
cd lessontrack
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

### 2. Create a Branch

Branch naming convention:
```
<type>/<short-description>
```

Examples:
```
feat/add-child-color-picker
fix/countdown-timer-overflow
docs/update-architecture
refactor/lesson-repository
```

### 3. Make Changes

Follow [CODING_STANDARDS.md](CODING_STANDARDS.md) for all code changes.

### 4. Run Checks

```bash
flutter analyze       # Must pass with zero issues
flutter test          # Must pass
```

### 5. Commit

Follow Conventional Commits (see [CODING_STANDARDS.md](CODING_STANDARDS.md)):
```
feat(children): add avatar color picker to add child form
```

### 6. Open a Pull Request

- Target branch: `develop` (not `main`)
- Fill in the PR template
- Link any related issues

---

## Pull Request Requirements

- [ ] `flutter analyze` passes
- [ ] `flutter test` passes
- [ ] New code has tests
- [ ] UI changes match UI_GUIDELINES.md
- [ ] No unnecessary dependencies added
- [ ] CHANGELOG.md updated (for features/fixes)

---

## Reporting Bugs

Open a GitHub Issue with:
1. **Title:** Short, descriptive summary
2. **Steps to reproduce:** Exact numbered steps
3. **Expected behavior:** What should happen
4. **Actual behavior:** What actually happens
5. **Device info:** OS version, device model
6. **Screenshot/video:** If applicable

---

## Requesting Features

Open a GitHub Issue with the label `enhancement`:
1. Describe the feature and why it's needed
2. Describe the user story ("As a parent, I want to...")
3. Reference the relevant section in FEATURES.md if related

---

## Code Review Process

1. A maintainer will review your PR within 3 business days.
2. Address all review comments in new commits (don't force-push).
3. Once approved, a maintainer will merge using squash merge.

---

## Branching Strategy

```
main          ← Production releases (tagged)
develop       ← Integration branch (all PRs target here)
feat/*        ← Feature branches
fix/*         ← Bug fix branches
docs/*        ← Documentation branches
refactor/*    ← Refactoring branches
```

---

## Commit Message Template

```
<type>(<scope>): <short description under 72 chars>

<optional body: explain WHY, not WHAT>

Closes #<issue number>
```
