import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: const Color(0xFF2563EB),
        secondary: const Color(0xFFEA580C),
        background: const Color(0xFFF8FAFC),
        surface: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onBackground: const Color(0xFF1E293B),
        onSurface: const Color(0xFF1E293B),
        error: Colors.red,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF2563EB),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF2563EB),
        unselectedItemColor: Color(0xFF94A3B8),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: const Color(0xFF3B82F6),
        secondary: const Color(0xFFF97316),
        background: const Color(0xFF0F172A),
        surface: const Color(0xFF1E293B),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onBackground: Colors.white,
        onSurface: Colors.white,
        error: Colors.redAccent,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E293B),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF1E293B),
        selectedItemColor: Color(0xFF3B82F6),
        unselectedItemColor: Color(0xFF64748B),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF1E293B),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      scaffoldBackgroundColor: const Color(0xFF0F172A),
      dialogBackgroundColor: const Color(0xFF1E293B),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFFE2E8F0)),
        bodyMedium: TextStyle(color: Color(0xFFCBD5E1)),
        bodySmall: TextStyle(color: Color(0xFF94A3B8)),
      ),
    );
  }
}
