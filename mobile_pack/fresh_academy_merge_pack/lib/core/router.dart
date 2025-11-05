import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../services/auth_service.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/splash_screen.dart';
import '../screens/dashboards/admin_dashboard.dart';
import '../screens/dashboards/trainer_dashboard.dart';
import '../screens/dashboards/trainee_dashboard.dart';
import '../screens/courses/catalog_screen.dart';
import '../screens/courses/course_details_screen.dart';
import '../screens/support/support_home_screen.dart';
import '../screens/reports/reports_dashboard.dart';
import '../screens/attendance/attendance_screen.dart';
import '../screens/attendance/scheduler_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authServiceProvider);
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),

      GoRoute(
        path: '/admin',
        builder: (_, __) => const AdminDashboard(),
        redirect: (_, __) => auth.hasRole(UserRole.admin) ? null : '/login',
      ),
      GoRoute(
        path: '/trainer',
        builder: (_, __) => const TrainerDashboard(),
        redirect: (_, __) => auth.hasRole(UserRole.trainer) ? null : '/login',
      ),
      GoRoute(
        path: '/trainee',
        builder: (_, __) => const TraineeDashboard(),
        redirect: (_, __) => auth.hasRole(UserRole.trainee) ? null : '/login',
      ),

      GoRoute(path: '/courses', builder: (_, __) => const CoursesCatalogScreen()),
      GoRoute(path: '/course/:id', builder: (_, s) {
        final id = s.pathParameters['id']!;
        return CourseDetailsScreen(courseId: id);
      }),
      GoRoute(path: '/support', builder: (_, __) => const SupportHomeScreen()),
      GoRoute(path: '/reports', builder: (_, __) => const ReportsDashboard()),
      GoRoute(path: '/attendance', builder: (_, __) => const AttendanceScreen()),
      GoRoute(path: '/schedule', builder: (_, __) => const SchedulerScreen()),
    ],
    redirect: (ctx, state) {
      if (state.matchedLocation == '/login' && auth.isLoggedIn) {
        switch (auth.currentUser!.role) {
          case UserRole.admin: return '/admin';
          case UserRole.trainer: return '/trainer';
          case UserRole.trainee: return '/trainee';
        }
      }
      return null;
    },
  );
});
