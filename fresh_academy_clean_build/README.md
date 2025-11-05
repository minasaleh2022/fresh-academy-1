# Fresh Academy — Clean Starter

- متوافق بالكامل مع Flutter 3.22.0
- go_router 10.2.0 (بدون كسر API)
- ShellRoute + Bottom Navigation
- GitHub Actions يبني APK Debug تلقائيًا

## CI
الملف: `.github/workflows/android-debug.yml`

## تشغيل محلي
```
flutter pub get
flutter create . --project-name fresh_academy
flutter run
flutter build apk --debug
```
