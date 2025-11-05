import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE50914)),
    useMaterial3: true,
    fontFamily: 'Roboto',
    inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
  );
}
