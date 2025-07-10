import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:takki/screens/chats/chats.screen.dart';
import 'package:takki/widgets/button.widget.dart';

class ViewQR extends StatelessWidget {
  const ViewQR({super.key});
  static const String routeName = '/viewQRScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [            
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SvgPicture.asset('assets/layout/testQR.svg',width: 300,height: 300,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ButtonWidget(text: 'Regresar',fontSize: 28,onPressed: () {
                Navigator.pop(context);
              },),
            ),
          ],
        ),
      ),
    );
  }
}