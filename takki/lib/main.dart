import 'package:flutter/material.dart';
import 'package:takki/routes/routes.dart';
import 'package:takki/screens/landing/landingScreen.dart';
import 'package:takki/theme/theme.dart';

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
        theme: lightMode,
        darkTheme: darkMode,
        routes: routes,
        home: LandingScreen(),
      ),
    );
  }
}
