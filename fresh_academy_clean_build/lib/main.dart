import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/bottom_nav.dart';

void main() {
  runApp(const FreshApp());
}

final _router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) => Scaffold(
        body: SafeArea(child: child),
        bottomNavigationBar: const BottomNav(),
      ),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const _Screen(title: 'الرئيسية'),
        ),
        GoRoute(
          path: '/courses/catalog',
          builder: (context, state) => const _Screen(title: 'كتالوج الدورات'),
        ),
        GoRoute(
          path: '/support/main',
          builder: (context, state) => const _Screen(title: 'الدعم الفني'),
        ),
        GoRoute(
          path: '/reports/dashboard',
          builder: (context, state) => const _Screen(title: 'لوحة التقارير'),
        ),
        GoRoute(
          path: '/users/profile',
          builder: (context, state) => const _Screen(title: 'الملف الشخصي'),
        ),
      ],
    ),
  ],
);

class FreshApp extends StatelessWidget {
  const FreshApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fresh Academy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      routerConfig: _router,
    );
  }
}

class _Screen extends StatelessWidget {
  const _Screen({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo/fresh_logo.webp', width: 140),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Starter screen — ready to extend.')
        ],
      ),
    );
  }
}
