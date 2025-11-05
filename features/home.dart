import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 12),
        Text('الرئيسية', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
