import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
    required this.dataName,
    this.onTap,
    this.colors,
  });

  final String dataName;
  final void Function()? onTap;
  final Color? colors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF25AE4B),
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
