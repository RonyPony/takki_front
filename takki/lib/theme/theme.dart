import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF43B3AE),
    foregroundColor: Colors.white,
    elevation: 6,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    // cursorColor: primaryColor,
    // selectionHandleColor: primaryColor,
  ),
  textTheme: GoogleFonts.imprimaTextTheme().copyWith(
    //TODO: Need to change the colors
    // displayLarge: const TextStyle(color: Colors.black),
    // displayMedium: const TextStyle(color: Colors.black),
    // displaySmall: const TextStyle(color: Colors.black),
    // headlineLarge: const TextStyle(color: Colors.black),
    // headlineMedium: const TextStyle(color: Colors.black),
    // headlineSmall: const TextStyle(color: Colors.black),
    // titleLarge: const TextStyle(color: Colors.black),
    // titleMedium: const TextStyle(color: Colors.black),
    // titleSmall: const TextStyle(color: Colors.black),
    // bodyLarge: const TextStyle(color: Colors.black),
    // bodyMedium: const TextStyle(color: Colors.black),
    // bodySmall: const TextStyle(color: Colors.black),
    // labelLarge: const TextStyle(color: Colors.black),
    // labelMedium: const TextStyle(color: Colors.black),
    // labelSmall: const TextStyle(color: Colors.black),
  ),

  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.grey.shade300,
    onPrimary: Colors.white,
    secondary: Colors.grey.shade200,
    onSecondary: Colors.black,
    surface: Colors.grey.shade400,
    onSurface: Colors.black,
    error: errorColor,
    onError: Colors.white,
  ),
);

final ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF121212),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF43B3AE),
    foregroundColor: Colors.white,
    elevation: 6,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    // cursorColor: primaryColor,
    // selectionHandleColor: primaryColor,
  ),
  textTheme: GoogleFonts.imprimaTextTheme().copyWith(
    //TODO: Need to change the colors
    // displayLarge: const TextStyle(color: Colors.black),
    // displayMedium: const TextStyle(color: Colors.black),
    // displaySmall: const TextStyle(color: Colors.black),
    // headlineLarge: const TextStyle(color: Colors.black),
    // headlineMedium: const TextStyle(color: Colors.black),
    // headlineSmall: const TextStyle(color: Colors.black),
    // titleLarge: const TextStyle(color: Colors.black),
    // titleMedium: const TextStyle(color: Colors.black),
    // titleSmall: const TextStyle(color: Colors.black),
    // bodyLarge: const TextStyle(color: Colors.black),
    // bodyMedium: const TextStyle(color: Colors.black),
    // bodySmall: const TextStyle(color: Colors.black),
    // labelLarge: const TextStyle(color: Colors.black),
    // labelMedium: const TextStyle(color: Colors.black),
    // labelSmall: const TextStyle(color: Colors.black),
  ),

  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.grey.shade800,
    onPrimary: Colors.black,
    secondary: Colors.grey.shade700,
    onSecondary: Colors.black,
    surface: Colors.grey.shade900,
    onSurface: Colors.white,
    error: errorColor,
    onError: Colors.black,
  ),
);

// const primaryColor = Color(0xFF43B3AE);
// const secondaryColor = Colors.grey;
const errorColor = Color.fromARGB(255, 167, 31, 56);
