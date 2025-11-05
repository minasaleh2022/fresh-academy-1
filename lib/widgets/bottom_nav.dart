import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  static const routes = [
    '/home',
    '/courses/catalog',
    '/support/main',
    '/reports/dashboard',
    '/profile'
  ];

  int _indexFromLocation(String loc) {
    for (int i = 0; i < routes.length; i++) {
      if (loc.startsWith(routes[i])) return i;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final loc = GoRouterState.of(context).uri.toString();
    final index = _indexFromLocation(loc);

    return NavigationBar(
      selectedIndex: index,
      onDestinationSelected: (i) => context.go(routes[i]),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'الرئيسية'),
        NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'الدورات'),
        NavigationDestination(icon: Icon(Icons.build_outlined), label: 'الدعم'),
        NavigationDestination(icon: Icon(Icons.bar_chart_outlined), label: 'التقارير'),
        NavigationDestination(icon: Icon(Icons.person_outline), label: 'الملف'),
      ],
    );
  }
}
