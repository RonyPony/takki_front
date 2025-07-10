import 'package:flutter/material.dart';
import 'package:takki/routes/routes.dart';
import 'package:takki/widgets/button.widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      home: const Scaffold(
        body: Center(
          child: ButtonWidget(text: 'Iniciar Sesion',onPressed: () {
            print('Hello World!');
          },),
        ),
      ),
    );
  }
}
