import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrainerDashboard extends StatelessWidget {
  const TrainerDashboard({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Trainer Dashboard')),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(title: const Text('My Courses'), trailing: const Icon(Icons.chevron_right), onTap: ()=>context.push('/courses')),
        ListTile(title: const Text('Schedule Sessions'), trailing: const Icon(Icons.chevron_right), onTap: ()=>context.push('/schedule')),
        ListTile(title: const Text('Support'), trailing: const Icon(Icons.chevron_right), onTap: ()=>context.push('/support')),
      ],
    ),
  );
}
