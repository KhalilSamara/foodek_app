import 'package:flutter/material.dart';
import 'package:foodek_app/view/screens/confirm_password.dart';
import 'package:pinput/pinput.dart';

import 'bottom_widget.dart';

void showVerifyDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Image.asset("assets/images/sent_message.png", height: 153),
              SizedBox(height: 16),
              Text(
                "A 4-digit code has been sent to your email.\nPlease enter it to verify.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Color(0xFF6C7278)),
              ),
              SizedBox(height: 30),
              Pinput(
                length: 4,
                showCursor: true,
                onChanged: (value) {},
                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 55,
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                separatorBuilder: (index) => SizedBox(width: 16),
              ),
              SizedBox(height: 26),

              ButtonWidget(
                dataName: "Verify",
                colors: Colors.white,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmPassScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      );
    },
  );
}
