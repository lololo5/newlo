import 'package:flutter/material.dart';

class ThemeProject {
  static ThemeData themeLight() {
    return ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Colors.orange),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: const Color.fromARGB(255, 13, 11, 7),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
