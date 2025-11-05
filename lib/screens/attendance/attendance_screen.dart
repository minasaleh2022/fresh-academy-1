import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Attendance')),
    body: ListView.builder(
      itemCount: 8,
      itemBuilder: (_, i) => CheckboxListTile(
        value: i.isEven, onChanged: (_) {},
        title: Text('Trainee #$i'),
        subtitle: const Text('Today 10:00 AM'),
      ),
    ),
  );
}
