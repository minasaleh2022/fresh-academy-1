import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 12),
        Text('تسجيل الدخول', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
