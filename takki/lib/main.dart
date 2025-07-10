import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:takki/routes/routes.dart';
import 'package:takki/screens/landing/landingScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      behavior: HitTestBehavior.translucent,
      child: MaterialApp(
          theme: ThemeData(
            textTheme: GoogleFonts.imprimaTextTheme(),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
            primarySwatch: Colors.blue,
          ),
          routes: routes,
          home: LandingScreen()),
    );
  }
}
