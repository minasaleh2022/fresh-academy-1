# Fresh Academy — Web Admin
لوحة إدارة ويب مستقلة داخل نفس الريبو (`web_admin/`) مبنية بـ React + Vite + Tailwind.

## تشغيل محلي
```
cd web_admin
npm i
npm run dev
```
افتح: http://localhost:5173

### تسجيل الدخول (تجريبي)
- مدير: 10000000000000 / أي كلمة
- مدرّب: 20000000000000 / أي كلمة
- متدرّب: 30000000000000 / أي كلمة

## ربط API
- أنشئ ملف `.env` من `.env.example` وحدد `VITE_API_BASE`.
- عدّل الدوال داخل `src/services/api.ts` و `src/services/auth.tsx` للاتصال الحقيقي.

## بناء نسخة إنتاج
```
npm run build
npm run preview
```

تم الإنشاء: 2025-11-05T08:47:55.188854Z
