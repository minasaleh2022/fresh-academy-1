import 'package:flutter/material.dart';

class SchedulerScreen extends StatelessWidget {
  const SchedulerScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Schedule Sessions')),
    body: Center(
      child: FilledButton(onPressed: () {}, child: const Text('Create new session')),
    ),
  );
}
