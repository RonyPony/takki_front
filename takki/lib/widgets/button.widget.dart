import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key, required this.text, this.color = Colors.red, this.textColor = Colors.white, required this.width, required this.height});
  final String text;
  final Color color;
  final Color textColor;
  final double width;
  final double height;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    Size base = MediaQuery.of(context).size;
    return Container(
      width: base.width * 0.8,
      height: base.height * 0.1,
      color: Colors.red,
      child: Text(widget.text),
    );
  }
}