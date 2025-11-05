import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        children: [
          _Card('Courses', Icons.menu_book, () => context.push('/courses')),
          _Card('Reports', Icons.bar_chart, () => context.push('/reports')),
          _Card('Attendance', Icons.fact_check, () => context.push('/attendance')),
          _Card('Support', Icons.support_agent, () => context.push('/support')),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String title; final IconData icon; final VoidCallback onTap;
  const _Card(this.title, this.icon, this.onTap, {super.key});
  @override
  Widget build(BuildContext context) => Card(
    child: InkWell(onTap: onTap, child: Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 40), const SizedBox(height: 8), Text(title),
      ]),
    )),
  );
}
