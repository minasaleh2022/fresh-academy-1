import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/rbac.dart';
import 'core/app_theme.dart';
import 'services/storage.dart';
import 'widgets/bottom_nav.dart';
import 'features/home.dart';
import 'features/courses.dart';
import 'features/support.dart';
import 'features/reports.dart';
import 'features/profile.dart';
import 'features/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(const FreshApp());
}

class FreshApp extends StatefulWidget {
  const FreshApp({super.key});
  @override
  State<FreshApp> createState() => _FreshAppState();
}

class _FreshAppState extends State<FreshApp> {
  late GoRouter _router;
  UserRole role = UserRole.admin; // افتراضيًا مدير (تقدر تغيّره من شاشة تسجيل الدخول)

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      initialLocation: '/home',
      redirect: (context, state) {
        final isAuthed = true; // للتبسيط — اعتبره دائمًا مسجل دخول
        if (!isAuthed && state.matchedLocation != '/login') {
          return '/login';
        }
        return null;
      },
      routes: [
        GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
        ShellRoute(
          builder: (context, state, child) => Scaffold(
            body: SafeArea(child: child),
            bottomNavigationBar: const BottomNav(),
          ),
          routes: [
            GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
            GoRoute(path: '/courses/catalog', builder: (_, __) => const CoursesScreen()),
            GoRoute(path: '/support/main', builder: (_, __) => const SupportScreen()),
            GoRoute(path: '/reports/dashboard', builder: (_, __) => const ReportsScreen()),
            GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fresh Academy',
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: _router,
    );
  }
}
