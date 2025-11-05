import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 12),
        Text('كتالوج الدورات', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
