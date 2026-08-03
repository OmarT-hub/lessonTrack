# Release Checklist — LessonTrack v1.0

## Pre-Release Verification

### ✅ Code Quality
- [ ] `flutter analyze` — zero issues
- [ ] `flutter test` — all tests pass
- [ ] No `print()` statements in production code
- [ ] No hardcoded test data or placeholder content
- [ ] No TODO comments that affect release functionality
- [ ] All `debugPrint` calls removed or wrapped in `kDebugMode`

### ✅ Features
- [ ] Onboarding flow completes successfully
- [ ] First launch detected correctly
- [ ] Add child — all validations work
- [ ] Edit child — changes persist
- [ ] Delete child — cascades to lessons, requires confirmation
- [ ] Add lesson — all fields work, validations pass
- [ ] Edit lesson — changes persist, notifications updated
- [ ] Delete lesson — notifications cancelled
- [ ] Dashboard — current lesson displays correctly
- [ ] Dashboard — countdown timer accurate
- [ ] Dashboard — "No lesson" state works
- [ ] Today's schedule — correct for current day
- [ ] Weekly schedule — all 7 days show
- [ ] Notifications — fire at correct time
- [ ] Notifications — work with app backgrounded
- [ ] Notifications — work with app terminated
- [ ] Notification tap — navigates to lesson
- [ ] Search — returns correct results
- [ ] Filter by child — works on schedule screens
- [ ] Dark mode — looks correct, no clipping/overflow
- [ ] Settings — all preferences persist
- [ ] Clear all data — works with confirmation

### ✅ UI/UX
- [ ] No text overflow on small screens (360dp width)
- [ ] No overflow on large screens (420dp+ width)
- [ ] All empty states display correctly
- [ ] All error states display correctly
- [ ] All loading states display correctly
- [ ] Keyboard dismisses on outside tap
- [ ] Back button works on all screens
- [ ] No broken layouts in landscape mode (or locked to portrait)
- [ ] Font scaling at 1.3× does not break layouts
- [ ] All icons correct (active/inactive states)

### ✅ Performance
- [ ] Cold start time < 1.5 seconds (on mid-range device)
- [ ] No jank during scrolling (60fps+)
- [ ] Dashboard countdown updates smoothly
- [ ] No memory leaks (verify with DevTools Memory tab)
- [ ] App size < 20 MB (APK)

### ✅ Data & Storage
- [ ] Data persists across app restarts
- [ ] Data persists across phone restarts
- [ ] Hive corruption handled gracefully (try deleting box manually)
- [ ] Export JSON works and produces valid JSON
- [ ] Clear all data resets app to onboarding state

### ✅ Notifications
- [ ] Android notification permission requested on first launch (Android 13+)
- [ ] Notification channel "lesson_reminders" created
- [ ] Notification appears in system tray
- [ ] Notification sound/vibration works
- [ ] Multiple lesson notifications don't conflict

### ✅ Android Configuration
- [ ] `applicationId` = `com.lessontrack.app`
- [ ] `versionName` = `1.0.0`
- [ ] `versionCode` = `1`
- [ ] `minSdkVersion` = `21` (Android 5.0)
- [ ] `targetSdkVersion` = `34`
- [ ] `compileSdkVersion` = `34`
- [ ] App icon set (all densities: mdpi, hdpi, xhdpi, xxhdpi, xxxhdpi)
- [ ] Adaptive icon set (foreground + background)
- [ ] Splash screen configured
- [ ] ProGuard/R8 rules don't break Hive or notifications
- [ ] Release keystore configured and secured
- [ ] `flutter build apk --release` succeeds
- [ ] `flutter build appbundle --release` succeeds

### ✅ Device Testing
- [ ] Tested on Android 5.0 (API 21) — minimum supported
- [ ] Tested on Android 10 (API 29)
- [ ] Tested on Android 13 (API 33) — notification permission flow
- [ ] Tested on Android 14 (API 34)
- [ ] Tested on at least 2 different physical devices
- [ ] Tested on emulator (Pixel 6 profile)

### ✅ Accessibility
- [ ] All interactive elements ≥ 48×48dp touch targets
- [ ] Color is not the only indicator of state
- [ ] TalkBack navigation works on key flows
- [ ] Content descriptions on images/icons

### ✅ Play Store
- [ ] App title: "LessonTrack" (50 chars max)
- [ ] Short description (80 chars max)
- [ ] Full description (4000 chars max)
- [ ] At least 2 phone screenshots (1080×1920 or 1080×2340)
- [ ] Feature graphic (1024×500)
- [ ] Content rating questionnaire completed
- [ ] Privacy policy URL set (required)
- [ ] Category: Education
- [ ] Target age group: General / Parents
- [ ] App signed with production keystore

### ✅ Final Sign-off
- [ ] Tested on internal testing track and no crashes reported
- [ ] App description reviewed for typos
- [ ] All checklist items above checked ✅

---

## Release Commands

```bash
# Verify
flutter analyze
flutter test

# Build APK
flutter build apk --release

# Build App Bundle (recommended for Play Store)
flutter build appbundle --release

# Check APK size
ls -lh build/app/outputs/flutter-apk/app-release.apk
```

---

## Post-Release

- [ ] Monitor Play Store crash reports (Vitals)
- [ ] Tag release in git: `git tag v1.0.0`
- [ ] Update `CHANGELOG.md` with v1.0.0 entry
- [ ] Update `MILESTONES.md` M7 as complete
- [ ] Create GitHub release with release notes
