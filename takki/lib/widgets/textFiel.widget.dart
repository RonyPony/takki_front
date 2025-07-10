import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfielWidget extends StatelessWidget {
  const TextfielWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.width,
    this.onChanged,
    this.keyboardType,
    this.hintText,
    this.maxLength,
    this.obscureText = false,
    this.suffixIcon,
    this.onsuffixIcon,
    this.isBoldText = false,
    this.fontSize=20,
  });

  final String label;
  final TextEditingController controller;
  final double width;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final String? hintText;
  final int? maxLength;
  final bool obscureText;
  final IconButton? suffixIcon;
  final Function? onsuffixIcon;
  final bool isBoldText;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: fontSize,color: Color(0xFF818181)),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: width,
          child: TextField(
            obscureText: obscureText,
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxLength),
            ],
            keyboardType: keyboardType,
            onChanged: onChanged,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey.withValues(),
                fontSize: 16,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFF43B3AE), width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFF43B3AE), width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
