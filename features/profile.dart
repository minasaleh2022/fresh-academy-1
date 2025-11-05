import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 12),
        Text('الملف الشخصي', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
