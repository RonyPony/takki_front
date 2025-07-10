import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:takki/screens/auth/login/login.screen.dart';
import 'package:takki/utils/utils.dart';
import 'package:takki/widgets/button.widget.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  static const String routeName = '/landingScreen';

  @override
  Widget build(BuildContext context) {
    Size base = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: base.height * 0.1,
                ),
                SvgPicture.asset(
                  'assets/layout/lock.svg',
                  width: base.height * 0.3,
                ),
                Text(
                  "Tu privacidad es nuestra prioridad",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 45, color: Color(0xFF818181)),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: ButtonWidget(
                    text: 'Comenzar',
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
