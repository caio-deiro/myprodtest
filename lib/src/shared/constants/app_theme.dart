import 'package:flutter/material.dart';

class AppTheme {
  final defaultTheme = ThemeData(
      textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 15,
    ),
  ));
}
