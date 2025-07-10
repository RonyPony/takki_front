import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key, required this.text});
  final String text;

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