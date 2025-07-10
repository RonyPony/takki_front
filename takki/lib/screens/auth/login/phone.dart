import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});
  static const String routeName = '/phone-auth';
  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  String? _verificationId;
  bool _codeSent = false;

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
    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: _codeController.text,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login por Teléfono")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _codeSent ? _buildOTPInput() : _buildPhoneInput(),
      ),
    );
  }

  Widget _buildPhoneInput() {
    return Column(
      children: [
        TextField(
          controller: _phoneController,
          decoration: InputDecoration(labelText: "Número de teléfono (+54...)"),
        ),
        ElevatedButton(
          onPressed: _verifyPhone,
          child: Text("Enviar código"),
        ),
      ],
    );
  }

  Widget _buildOTPInput() {
    return Column(
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
    );
  }
}
