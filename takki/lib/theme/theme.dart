import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: primaryColor,
    selectionHandleColor: primaryColor,
  ),
  textTheme: GoogleFonts.imprimaTextTheme(),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: Colors.white,
    secondary: secondaryColor,
    onSecondary: Colors.black,
    surface: Colors.grey.shade100,
    onSurface: Colors.black,
    error: errorColor,
    onError: Colors.white,
  ),
);

final ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF121212),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: primaryColor,
    selectionHandleColor: primaryColor,
  ),
  textTheme: GoogleFonts.imprimaTextTheme(ThemeData.dark().textTheme),
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    onPrimary: Colors.black,
    secondary: secondaryColor,
    onSecondary: Colors.black,
    surface: const Color(0xFF1E1E1E),
    onSurface: Colors.white,
    error: errorColor,
    onError: Colors.black,
  ),
);

const primaryColor = Color(0xFF43B3AE);
const secondaryColor = Colors.grey;
const errorColor = Color.fromARGB(255, 167, 31, 56);
