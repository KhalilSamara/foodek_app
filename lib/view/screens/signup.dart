import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../core/util/responsive.dart';
import '../widgets/bottom_widget.dart';
import '../widgets/text_field_widget.dart';
import 'login.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameTextEditingController =
        TextEditingController();
    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController birthDateTextEditingController =
        TextEditingController();
    TextEditingController phoneTextEditingController = TextEditingController();
    TextEditingController setPassTextEditingController =
        TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFF25AE4B),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/Pattern.png",
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
                SizedBox(height: 42),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(20),
                    height: responsiveHeight(context, 661),
                    width: responsiveWidth(context, 343),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_back_sharp),
                          ),
                        ),
                        Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color(0xFF111827),
                            fontFamily: "Inter",
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xFF25AE4B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        TextFieldWidget(
                          textEditingController: fullNameTextEditingController,
                          obscureText: false,
                          label: "Full Name",
                          hintText: "Enter Your Name",
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: 20),

                        TextFieldWidget(
                          textEditingController: emailTextEditingController,
                          obscureText: false,
                          label: "Email",
                          hintText: "Enter Your Email",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),
                        TextFieldWidget(
                          textEditingController: birthDateTextEditingController,
                          obscureText: false,
                          label: "Birth of date",
                          hintText: "Enter Your BirthDate",
                          suffixIcon: Icon(Icons.date_range_outlined),
                          keyboardType: TextInputType.datetime,
                        ),
                        SizedBox(height: 20),

                        IntlPhoneField(
                          disableLengthCheck: true,
                          controller: phoneTextEditingController,
                          keyboardType: TextInputType.phone,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            hintText: "Enter Your Phone Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        TextFieldWidget(
                          textEditingController: setPassTextEditingController,
                          obscureText: true,
                          label: "Set Password",
                          hintText: "Set Your Password",
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: 30),
                        ButtonWidget(
                          colors: Colors.white,
                          dataName: "Register",
                          onTap: () {},
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
