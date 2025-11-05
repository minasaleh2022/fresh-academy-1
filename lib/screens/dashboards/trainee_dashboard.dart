import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TraineeDashboard extends StatelessWidget {
  const TraineeDashboard({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Trainee Dashboard')),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(title: const Text('Course Catalog'), trailing: const Icon(Icons.play_circle), onTap: ()=>context.push('/courses')),
        ListTile(title: const Text('Reports'), trailing: const Icon(Icons.bar_chart), onTap: ()=>context.push('/reports')),
        ListTile(title: const Text('Support'), trailing: const Icon(Icons.support_agent), onTap: ()=>context.push('/support')),
      ],
    ),
  );
}
