import 'package:flutter/material.dart';
import 'package:foodek_app/core/util/responsive.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final bool obscureText;
  final String? errorText;
  final String? hintText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Color borderColor;
  final double height;
  final double width;

  const TextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.obscureText,
    required this.label,
    this.errorText,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.suffixIcon,
    this.borderColor = Colors.black,
    this.height = 46,
    this.width = 356,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsiveHeight(context, height),
      width: responsiveWidth(context, width),
      child: TextField(
        obscureText: obscureText,
        controller: textEditingController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: Text(label),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          errorText: errorText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
