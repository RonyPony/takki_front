import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:takki/screens/login/login.screen.dart';
import 'package:takki/widgets/chatElement.widget.dart';

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
            // Lista de nombres y mensajes aleatorios
            Expanded(
              child: ListView(
                children: [
                  ChatElementCard(
                    sender: 'Alberto',
                    time: 'Hace 10 min',
                    message: 'Hey, veo que estas online... ¿cómo estás bro?',
                    isRead: false,
                  ),
                  ChatElementCard(
                    sender: 'María',
                    time: 'Hace 2 min',
                    message: '¿Vas a venir a la reunión?',
                    isRead: false,
                  ),
                  ChatElementCard(
                    sender: 'Carlos',
                    time: 'Hace 1 hora',
                    message: 'No olvides traer los documentos.',
                    isRead: true,
                  ),
                  ChatElementCard(
                    sender: 'Lucía',
                    time: 'Ayer',
                    message: '¡Feliz cumpleaños!',
                    isRead: true,
                  ),
                  ChatElementCard(
                    sender: 'Pedro',
                    time: 'Hace 5 min',
                    message: '¿Jugamos esta noche?',
                    isRead: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aquí puedes agregar la acción que desees, por ejemplo, crear un nuevo chat
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Nuevo chat')),
          );
        },
        backgroundColor: Color(0xFF43B3AE),
        child: const Icon(Icons.add, color: Colors.white, size: 32),
        tooltip: 'Nuevo chat',
        isExtended: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),

          side: BorderSide(color: Colors.white,width: 3),
        ),
      ),
    );
  }
}