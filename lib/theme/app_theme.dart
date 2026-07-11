import 'package:flutter/material.dart';

/// Tema pastel premium untuk kanak-kanak — lembut, ceria dan elegan.
class AppTheme {
  AppTheme._();

  static const Color background = Color(0xFFFFF8F0);
  static const Color textDark = Color(0xFF4A4A6A);
  static const Color accent = Color(0xFF7FC8A9);

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

  /// Warna gradient lebih pekat sepadan dengan cardColors (untuk ikon badge).
  static const List<Color> cardColorsDeep = [
    Color(0xFFFF9FB6),
    Color(0xFFFFC773),
    Color(0xFFF4D93E),
    Color(0xFF8FE2A6),
    Color(0xFF8FC7F5),
    Color(0xFFBFA3F7),
    Color(0xFFFFAE94),
    Color(0xFF7FE0D6),
    Color(0xFFE7A3F7),
    Color(0xFFC3D97E),
  ];

  /// Gradient hero digunakan pada banner atas skrin utama.
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF9AD8BE), Color(0xFF7FC8A9), Color(0xFF6FB89E)],
  );

  /// Bayang lembut premium untuk kad & elemen terapung.
  static List<BoxShadow> softShadow({double opacity = 0.10}) => [
        BoxShadow(
          color: Colors.black.withOpacity(opacity),
          blurRadius: 16,
          offset: const Offset(0, 6),
        ),
      ];

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: accent,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: background,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          foregroundColor: textDark,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: textDark,
            letterSpacing: 0.2,
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
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
