import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:takki/screens/chats/chats.screen.dart';
import 'package:takki/widgets/button.widget.dart';

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({super.key});
  static const String routeName = '/newChatScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Color(0xFF43B3AE),)),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text("Regresar",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Color(0xFF43B3AE)),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40,bottom: 40),
              child: SvgPicture.asset('assets/layout/fingerprint1.svg',width: 250,height: 250,),
            ),
            Column(
              children: [
                Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ButtonWidget(text: 'Ver mi codigo QR',fontSize: 28,onPressed: () {
                Navigator.pushNamed(context, ChatsScreen.routeName);
              },),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ButtonWidget(text: 'Enviar codigo QR',fontSize: 28,onPressed: () {
                Navigator.pushNamed(context, ChatsScreen.routeName);
              },),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: ButtonWidget(text: 'Escanear codigo QR',fontSize: 28,onPressed: () {
                Navigator.pushNamed(context, ChatsScreen.routeName);
              },),
            ),
              ],
            )

            
          ],
        ),
      ),
    );
  }
}