import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.width = 300,
    this.height = 60,
    this.fontSize = 30,
    this.onPressed,
  });
  final String text;

  final Color textColor;
  final double width;
  final double height;
  final double fontSize;
  final Function()? onPressed;
  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF43B3AE),
          borderRadius: BorderRadius.circular(15),
        ),
        width: widget.width,
        height: widget.height,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(widget.text, style: TextStyle(color: widget.textColor, fontSize: widget.fontSize, fontWeight: FontWeight.normal)),
            Text(
              widget.text,
              style: GoogleFonts.imprima(
                textStyle: TextStyle(
                  fontSize: widget.fontSize,
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
