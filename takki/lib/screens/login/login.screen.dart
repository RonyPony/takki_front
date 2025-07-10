import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:takki/widgets/textFiel.widget.dart';

import '../../widgets/button.widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = '/loginScreen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Takki',style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Color(0xFF818181)),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: TextfielWidget(label: 'Telefono',controller: TextEditingController(),width: size.width * 0.9,keyboardType: TextInputType.phone,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: TextfielWidget(label: 'Contraseña',controller: TextEditingController(),width: size.width * 0.9,obscureText: true,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text('Olvidaste tu contraseña?',style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal,color: Color(0xFF818181)),),
              ),
              ButtonWidget(text: 'Iniciar sesion',fontSize: 35,onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Text('Registrarse',style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal,color: Color(0xFF818181)),),
              ),
              SvgPicture.asset('assets/layout/fingerprint1.svg'),
              Text('Usar mi informacion biometrica',style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal,color: Color(0xFF818181)),),
            ],
          ),
        ),
      ),
    );
  }
}