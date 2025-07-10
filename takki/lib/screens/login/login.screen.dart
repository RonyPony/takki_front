import 'package:flutter/material.dart';

import '../../widgets/button.widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = '/loginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Login'),
          ButtonWidget(text: 'Iniciar Sesion',onPressed: () {
            Navigator.pushNamed(context, LoginScreen.routeName);
          },),
        ],
      ),
    );
  }
}