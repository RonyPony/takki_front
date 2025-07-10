import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:takki/screens/chats/chats.screen.dart';
import 'package:takki/widgets/button.widget.dart';
import 'package:takki/widgets/textFiel.widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = '/registerScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _phoneController = TextEditingController(text: "+1");
  final _codeController = TextEditingController();
  String? _verificationId;
  bool _codeSent = false;
   final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());
      final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  Widget build(BuildContext context) {
      
    return _codeSent ? _buildOTPFields() : _buildRegisterForm();
  }

  Widget _buildOTPInput() {
    return SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _codeController,
              decoration: InputDecoration(labelText: "Código SMS"),
            ),
            ElevatedButton(
              onPressed: _signInWithOTP,
              child: Text("Validar código"),
            ),
          ],
        ),
      
    );
  }

  Widget _buildOTPFields() {
    return Scaffold(
      body: SafeArea(
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
                'Verificar código',
                style: TextStyle(fontSize: 40, color: Color(0xFF818181)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Se ha enviado un código a su número de teléfono',
                style: TextStyle(fontSize: 16, color: Color(0xFF818181)),
              ),
              SizedBox(
                height: 100,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (i) {
                return SizedBox(
                  width: 50,
                  height: 100,
                  child: TextField(
                    controller: _otpControllers[i],
                    focusNode: _focusNodes[i],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: TextStyle(fontSize: 40),
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && i < 5) {
                        _focusNodes[i + 1].requestFocus();
                      } else if (value.isEmpty && i > 0) {
                        _focusNodes[i - 1].requestFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ButtonWidget(
                text: "Validar código",
                onPressed: () {
                  _signInWithOTP();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterForm() {
    final TextEditingController nameController = TextEditingController();    
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController coonfirmPasswordController =
        TextEditingController();
    Size base = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
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
                onPressed: () {
                  _verifyPhone();
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _verifyPhone() async {
    await Firebase.initializeApp();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.message}")),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
          _codeSent = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  Future<void> _signInWithOTP() async {
    try {
      _codeController.text = _otpControllers.map((e) => e.text).join('');
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: _codeController.text,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Inicio de sesión exitoso")),
      );
      Navigator.pushNamed(context, ChatsScreen.routeName);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(getErrorMessage(e))),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ocurrió un error inesperado")),
      );
    }
  }

  String getErrorMessage(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-verification-code':
      return 'El código ingresado no es válido.';
    case 'invalid-phone-number':
      return 'El número de teléfono no es válido.';
    case 'too-many-requests':
      return 'Demasiados intentos. Inténtalo más tarde.';
    case 'network-request-failed':
      return 'Error de red. Verifica tu conexión.';
    case 'session-expired':
      return 'La sesión ha expirado. Solicita un nuevo código.';
    default:
      return 'Ocurrió un error: ${e.message}';
  }
}

}
