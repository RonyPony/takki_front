import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:takki/widgets/message.widget.dart';
import 'package:takki/widgets/textFiel.widget.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';
  

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // Hacer scroll al fondo después de que se construya el widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 10),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String chattingTo = ModalRoute.of(context)!.settings.arguments as String;
    if (chattingTo == null) {
     chattingTo = "Regresar";
    }
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(chattingTo,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Color(0xFF818181)),),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Color(0xFF43B3AE),)),
      ),
      extendBody: false,
      
      body: Column(
        children: [
          Expanded(
            child: _messagesBox(context),
          ),
          _inputBox(context),
        ],
      ),
    );
  }

  
  _messagesBox(BuildContext context) {
    return Container(      
      width: double.infinity,
      color: Colors.transparent,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 100,
        itemBuilder: (context, index) {
          return MessageWidget(mensaje: "Hola que tal, esto es un mensaje de prueba para ver como se ve el mensaje en el chat", esMio: index % 2 == 0);
        },
      ),
    );
  }
  
  _inputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        
      ),
      child: Row(
        children: [
          IconButton(onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Opciones adicionales",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF43B3AE),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF43B3AE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Acción para adjuntar imagen
                        },
                        icon: Icon(Icons.image, color: Colors.white),
                        label: Text("Adjuntar imagen", style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF43B3AE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Acción para adjuntar archivo
                        },
                        icon: Icon(Icons.attach_file, color: Colors.white),
                        label: Text("Adjuntar archivo", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                );
              },
            );
          }, icon: Icon(Icons.add,size: 40,color: Color(0xFF43B3AE),)),
          Expanded(
            child: TextfielWidget(
            label: "Mensaje",
            showLabel: false,
            hintText: "Escribe un mensaje",
            
            controller: TextEditingController(),
            width: double.infinity,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              print(value);
            },
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset("assets/layout/send.svg",width: 35,height: 35,color: Color(0xFF43B3AE),),
          ),
        ],
      ),
    );
  }
}
