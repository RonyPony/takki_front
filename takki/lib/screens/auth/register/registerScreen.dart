import 'package:flutter/material.dart';
import 'package:takki/widgets/textFiel.widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String routeName = '/registerScreen';
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    Size base = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registro',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TextfielWidget(
                label: "Nombre",
                controller: nameController,
                width: base.width * 0.9),
            TextfielWidget(
                label: "Correo",
                controller: nameController,
                width: base.width * 0.9),
            TextfielWidget(
                label: "Contraseña",
                controller: nameController,
                width: base.width * 0.9),
            TextfielWidget(
                label: "Confirmar Contraseña",
                controller: nameController,
                width: base.width * 0.9),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
