import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final bool obscureText;
  final String? errorText;
  final String? hintText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  const TextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.obscureText,
    this.prefixIcon,
    required this.label,
    this.suffixIcon,
    this.keyboardType,
    this.hintText,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: textEditingController,
      decoration: InputDecoration(
        label: Text(label),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        errorText: errorText,
      ),
    );
  }
}
