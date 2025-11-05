import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 12),
        Text('الدعم الفني', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
