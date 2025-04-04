import 'package:flutter/material.dart';
import 'package:foodek_app/core/util/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String dataName;
  final void Function()? onTap;
  final Color? colors;
  final Color? backgroundColor;
  const ButtonWidget({
    super.key,
    required this.dataName,
    this.onTap,
    this.colors,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTap,
        child: Text(dataName, style: TextStyle(fontSize: 16, color: colors)),
      ),
    );
  }
}
