import 'package:flutter/material.dart';

class ThemeCustom {
  static ThemeData getTheme({
    required ColorScheme colorScheme,
    required Brightness brightness,
  }) {
    return ThemeData(
      brightness: brightness,
      useMaterial3: false,
      colorScheme: colorScheme,
      cardColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors
            .purple, // Define a cor padrão para íconesfine o tamanho padrão para ícones
      ),
    );
  }

  static ThemeData getThemeLight() {
    final colorSchemeLigth = ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    );

    return getTheme(
      colorScheme: colorSchemeLigth,
      brightness: Brightness.light,
    );
  }

  static ThemeData getThemeDark() {
    final colorSchemeDark = ColorScheme.fromSeed(
      seedColor: Colors.black,
      brightness: Brightness.dark,
    );

    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: colorSchemeDark,
      scaffoldBackgroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(color: Colors.white, fontSize: 20),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        iconColor: Colors.purple,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
