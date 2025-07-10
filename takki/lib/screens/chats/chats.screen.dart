import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:takki/screens/auth/login/login.screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});
  static const String routeName = '/chatsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Chats',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF818181)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset(
                  'assets/layout/fingerprint1.svg',
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
