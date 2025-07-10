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
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      home: Scaffold(
        body: Center(
          child: ButtonWidget(
            text: 'Iniciar sesion',
            onPressed: () {
              print('Hello World!');
            },
          ),
        ),
      ),
    );
  }
}
