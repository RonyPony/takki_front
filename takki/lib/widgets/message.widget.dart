import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String mensaje;
  final bool esMio; // true si el mensaje es del usuario actual
  final DateTime? horaEnvio;

  const MessageWidget({
    super.key,
    this.mensaje = "hola",
    this.esMio = true,
    this.horaEnvio,
  });

  String _formatearHora(DateTime? hora) {
    if (hora == null) {
      hora = DateTime.now();
    }
    String horaStr = hora.hour.toString().padLeft(2, '0');
    String minutoStr = hora.minute.toString().padLeft(2, '0');
    String ampm = hora.hour < 12 ? "am" : "pm";
    return "$horaStr:$minutoStr $ampm";
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: esMio ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        decoration: BoxDecoration(
          color: esMio ? Colors.grey[200] : Color(0xFF43B3AE),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(esMio ? 16 : 0),
            bottomRight: Radius.circular(esMio ? 0 : 16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: esMio ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              mensaje,
              style: TextStyle(
                color: esMio ? Colors.black87 : Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              _formatearHora(horaEnvio),
              style: TextStyle(
                color: esMio ? Colors.black45 : Colors.white70,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}