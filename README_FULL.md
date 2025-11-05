# Fresh Academy — Full Stack Monorepo

هذا الريبو يحتوي **تطبيق الموبايل Flutter** + **لوحة إدارة ويب React** في مشروع واحد.

## المحتويات
- `lib/` + `pubspec.yaml` … تطبيق Flutter كامل (Auth بالرقم القومي + RBAC + Router + Dashboards + Courses + Support + Reports + Attendance)
- `web_admin/` … React + Vite + Tailwind — لوحة إدارة ويب (Login/Users/Courses/Attendance/Reports/Support/Settings)
- `.github/workflows/` … CI لبناء Android (Debug/Release) + نشر Web Admin على GitHub Pages

---

## تشغيل تطبيق Flutter (Android/iOS/Web)
```bash
flutter pub get
flutter run             # أو:
flutter config --enable-web
flutter run -d chrome
```

### حسابات تجريبية
- مدير: 10000000000000 / أي كلمة
- مدرب: 20000000000000 / أي كلمة
- متدرب: 30000000000000 / أي كلمة

---

## تشغيل لوحة الويب Web Admin
```bash
cd web_admin
npm i
npm run dev       # http://localhost:5173
```

### ربط API
- أنشئ ملف `web_admin/.env` من `.env.example`، وضع `VITE_API_BASE`.
- في Flutter، مرر `--dart-define=API_BASE=https://api.example.com` مع build.

---

## CI — Android
- Debug: `.github/workflows/android-debug.yml`
- Release (موقّع): `.github/workflows/android-release.yml`
  - أضف Secrets: `ANDROID_KEYSTORE_BASE64`, `ANDROID_KEYSTORE_PASSWORD`, `ANDROID_KEY_ALIAS`, `ANDROID_KEY_PASSWORD`
  - (اختياري) `API_BASE`

## CI — Web Admin (GitHub Pages)
- الملف: `.github/workflows/web-admin-pages.yml`
- عند Push للتغييرات داخل `web_admin/` على `main` سيتم:
  - Build
  - رفع Artifact
  - نشر على GitHub Pages
- فعّل Pages من إعدادات الريبو → Pages → Source: GitHub Actions

---

## ملاحظات مهمة
- ضع شعاراتك وموادك في `assets/`
- استبدل بيانات الدخول التجريبية بربط فعلي مع REST (Dio/Axios)
- لتوصيل الـAuth الحقيقي: عدّل `lib/services/auth_service.dart` و `web_admin/src/services/auth.tsx`
