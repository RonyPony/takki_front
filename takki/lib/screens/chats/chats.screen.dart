import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:takki/screens/chats/newChat.screen.dart';
import 'package:takki/screens/login/login.screen.dart';
import 'package:takki/screens/profile/profileScreens.dart';
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
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ProfileScreen.routeName);
                      },
                      child: SvgPicture.asset(
                        'assets/layout/fingerprint1.svg',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ],
              ),
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
                  ChatElementCard(
                    sender: 'Sofía',
                    time: 'Hace 3 días',
                    message: '¿Me puedes enviar el archivo?',
                    isRead: true,
                  ),
                  ChatElementCard(
                    sender: 'Javier',
                    time: 'Hace 20 min',
                    message: 'Ya llegué al lugar.',
                    isRead: true,
                  ),
                  ChatElementCard(
                    sender: 'Ana',
                    time: 'Hace 8 horas',
                    message: 'Gracias por tu ayuda.',
                    isRead: true,
                  ),
                  ChatElementCard(
                    sender: 'Miguel',
                    time: 'Hace 15 min',
                    message: '¿Dónde estás?',
                    isRead: true,
                  ),
                  ChatElementCard(
                    sender: 'Valeria',
                    time: 'Hace 4 días',
                    message: '¡Nos vemos pronto!',
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
          Navigator.pushNamed(context, NewChatScreen.routeName);
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text('Nuevo chat')),
          // );
        },
        backgroundColor: Color(0xFF43B3AE),
        tooltip: 'Nuevo chat',
        isExtended: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(color: Colors.white, width: 3),
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
    );
  }
}
