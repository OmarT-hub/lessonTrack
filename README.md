# 📚 LessonTrack

> **Organize your children's private lessons — beautifully.**

LessonTrack is a premium, offline-first Flutter mobile application that helps parents manage all of their children's private tutoring lessons. Know who has a lesson *right now*, what's coming next, and never miss a reminder again.

---

## ✨ Features

- 👨‍👩‍👧‍👦 **Family & Children Management** — Create profiles for each child with avatars and school grades.
- 📅 **Lesson Scheduling** — Add recurring weekly lessons per child with full details.
- 🕐 **Live Dashboard** — See the current lesson, time remaining, and next upcoming lesson in real-time.
- 📆 **Today's & Weekly Schedule** — Beautiful timeline views for daily and weekly planning.
- 🔔 **Smart Reminders** — Customizable local notifications before each lesson.
- 🔍 **Search & Filter** — Find any lesson or filter by child instantly.
- 🌙 **Dark Mode** — Full Material 3 theming with light and dark modes.
- 📴 **Fully Offline** — All data stored locally with Hive. No account needed.
- 🌐 **Arabic-Ready** — Localization-ready architecture for future RTL support.

---

## 🏗️ Tech Stack

| Concern            | Technology                        |
|--------------------|-----------------------------------|
| Framework          | Flutter (Dart)                    |
| Architecture       | Feature-first Clean Architecture  |
| State Management   | Riverpod                          |
| Navigation         | GoRouter                          |
| Local Database     | Hive                              |
| Notifications      | flutter_local_notifications       |
| Theme              | Material 3                        |
| Target Platform    | Android (iOS planned)             |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.22.0`
- Dart SDK `>=3.4.0`
- Android Studio or VS Code with Flutter extension

### Installation

```bash
# Clone the repository
git clone https://github.com/OmarT-hub/lessonTrack.git
cd lessontrack

# Install dependencies
flutter pub get

# Run code generation (Hive adapters, Riverpod)
dart run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
```

### Build for Release

```bash
flutter build apk --release
# or
flutter build appbundle --release
```

---

## 📁 Project Structure

```
lib/
├── core/                    # App-wide utilities, constants, theme, extensions
├── routing/                 # GoRouter configuration
├── l10n/                    # Localization (ARB files)
├── shared/                  # Reusable widgets and shared models
├── services/                # App-level services (notifications, storage init)
└── features/                # Feature modules (Clean Architecture per feature)
    ├── onboarding/
    ├── family/
    ├── children/
    ├── lessons/
    ├── schedule/
    ├── dashboard/
    ├── notifications/
    ├── settings/
    └── search/
```

See [FOLDER_STRUCTURE.md](docs/FOLDER_STRUCTURE.md) for the full breakdown.

---

## 📖 Documentation

| Document | Description |
|---|---|
| [PROJECT_OVERVIEW.md](docs/PROJECT_OVERVIEW.md) | High-level project overview |
| [VISION.md](docs/VISION.md) | Product vision and goals |
| [FEATURES.md](docs/FEATURES.md) | Feature specification |
| [ARCHITECTURE.md](docs/ARCHITECTURE.md) | Architecture decisions |
| [FOLDER_STRUCTURE.md](docs/FOLDER_STRUCTURE.md) | Full folder structure |
| [ROADMAP.md](docs/ROADMAP.md) | Product roadmap |
| [PHASES.md](docs/PHASES.md) | Development phases |
| [MILESTONES.md](docs/MILESTONES.md) | Milestone definitions |
| [TODO.md](docs/TODO.md) | Master task list |
| [DATABASE.md](docs/DATABASE.md) | Database design |
| [STATE_MANAGEMENT.md](docs/STATE_MANAGEMENT.md) | State management guide |
| [ROUTING.md](docs/ROUTING.md) | Navigation & routing |
| [UI_GUIDELINES.md](docs/UI_GUIDELINES.md) | Design system & UI guidelines |
| [CONTRIBUTING.md](docs/CONTRIBUTING.md) | Contribution guide |
| [CODING_STANDARDS.md](docs/CODING_STANDARDS.md) | Code style & standards |
| [RULES.md](docs/RULES.md) | Project rules |
| [PROMPTS.md](docs/PROMPTS.md) | AI assistant prompts |
| [TESTING.md](docs/TESTING.md) | Testing strategy |
| [RELEASE_CHECKLIST.md](docs/RELEASE_CHECKLIST.md) | Release checklist |
| [CHANGELOG.md](docs/CHANGELOG.md) | Version history |
| [LICENSE.md](docs/LICENSE.md) | License |

---

## 📬 Contact

Built with ❤️ for parents who care about their children's education.

---

*LessonTrack — Never miss a lesson again.*
