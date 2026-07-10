import 'package:flutter/material.dart';

/// Tema pastel ceria untuk kanak-kanak.
class AppTheme {
  AppTheme._();

  static const Color background = Color(0xFFFFF8F0);
  static const Color textDark = Color(0xFF4A4A6A);

  /// Palet kad pastel yang digilir pada grid.
  static const List<Color> cardColors = [
    Color(0xFFFFD6E0),
    Color(0xFFFFE8C8),
    Color(0xFFFFF3B0),
    Color(0xFFD4F5DD),
    Color(0xFFCDE8FF),
    Color(0xFFE3D8FF),
    Color(0xFFFFDFD3),
    Color(0xFFD0F4F0),
    Color(0xFFF6D6FF),
    Color(0xFFE8F0C8),
  ];

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7FC8A9),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: background,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          foregroundColor: textDark,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: textDark,
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size(64, 56),
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );
}
