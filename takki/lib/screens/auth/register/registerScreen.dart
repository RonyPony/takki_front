import 'package:flutter/material.dart';
import 'package:takki/widgets/button.widget.dart';
import 'package:takki/widgets/textFiel.widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String routeName = '/registerScreen';
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController coonfirmPasswordController =
        TextEditingController();
    Size base = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0xFF43B3AE),
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Regresar",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF43B3AE)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                'Registro',
                style: TextStyle(fontSize: 50, color: Color(0xFF818181)),
              ),
              SizedBox(
                height: 25,
              ),
              TextfielWidget(
                  label: "Nombre",
                  controller: nameController,
                  width: base.width * 0.9),
              TextfielWidget(
                  label: "Telefono",
                  controller: phoneController,
                  width: base.width * 0.9),
              TextfielWidget(
                  label: "Contraseña",
                  controller: passwordController,
                  width: base.width * 0.9),
              TextfielWidget(
                  label: "Confirmar Contraseña",
                  controller: coonfirmPasswordController,
                  width: base.width * 0.9),
              Spacer(),
              ButtonWidget(
                text: "Registrarse",
                onPressed: () {},
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
