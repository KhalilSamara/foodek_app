import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/util/colors.dart';
import '../../core/util/responsive.dart';
import '../widgets/bottom_widget.dart';
import '../widgets/otp_widget.dart';
import '../widgets/text_field_widget.dart';
import 'login.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextEditingController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFF25AE4B),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/pattern.png",
            height: responsiveHeight(context, 932),
            width: responsiveWidth(context, 430),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 85),
                Image.asset(
                  'assets/images/logo.png',
                  height: responsiveHeight(context, 85),
                  width: responsiveWidth(context, 307),
                ),
                SizedBox(height: 150),
                Center(
                  child: Container(
                    //margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: responsiveHeight(context, 366),
                    width: responsiveWidth(context, 343),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back_sharp),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Back to",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xFF111827),
                                ),
                                children: [
                                  TextSpan(
                                    mouseCursor: MouseCursor.defer,
                                    text: " Login",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xFF25AE4B),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) => LoginScreen(),
                                              ),
                                            );
                                          },
                                  ),
                                  TextSpan(
                                    text: " page?",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xFF111827),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Reset Password",
                          style: TextStyle(
                            color: Color(0xFF111827),
                            fontFamily: "Inter",
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Enter your E-mail or phone and we'll \n send you a link to get back into \n your account ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Color(0xFF6C7278),
                            fontFamily: "Inter",
                          ),
                        ),
                        SizedBox(height: 24),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(
                              color: AppColors.dark_grey,
                              fontFamily: "Inter",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 3),
                        TextFieldWidget(
                          textEditingController: emailTextEditingController,
                          obscureText: false,
                          label: "Email",
                          hintText: "Enter your email",
                        ),
                        SizedBox(height: 24),
                        ButtonWidget(
                          dataName: "Send",
                          colors: Colors.white,
                          onTap: () {
                            showVerifyDialog(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
