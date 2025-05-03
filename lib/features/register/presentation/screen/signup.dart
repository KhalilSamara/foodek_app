import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodek_app/view/screens/home.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/responsive.dart';
import '../../../../view/navigation_bar.dart';
import '../../../../view/widgets/bottom_widget.dart';
import '../../../../view/widgets/custom_text.dart';
import '../../../../view/widgets/text_field_widget.dart';
import '../../../login/presentation/screen/login.dart';

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
            "assets/images/pattern.png",
            height: responsiveHeight(context, 932),
            width: responsiveWidth(context, 430),
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: responsiveHeight(context, 85)),
                Image.asset(
                  'assets/images/logo.png',
                  height: responsiveHeight(context, 85),
                  width: responsiveWidth(context, 307),
                ),
                SizedBox(height: responsiveHeight(context, 42)),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(context, 20),
                    ),
                    padding: EdgeInsets.all(responsiveWidth(context, 20)),
                    height: responsiveHeight(context, 672),
                    width: responsiveWidth(context, 343),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: responsiveWidth(context, 24),
                          height: responsiveHeight(context, 24),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_sharp),
                          ),
                        ),
                        SizedBox(height: responsiveHeight(context, 24)),

                        Text(
                          tr("sign_up"),
                          style: TextStyle(
                            color: Color(0xFF111827),
                            fontFamily: "Inter",
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              tr("already_have_an_account"),
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
                                tr("login"),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xFF25AE4B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextFieldWidget(
                          textEditingController: fullNameTextEditingController,
                          obscureText: false,
                          label: tr("full_name"),
                          hintText: tr("full_name"),
                          keyboardType: TextInputType.name,
                        ),
                        TextFieldWidget(
                          textEditingController: emailTextEditingController,
                          obscureText: false,
                          label: tr("email"),
                          hintText: tr("email"),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFieldWidget(
                          textEditingController: birthDateTextEditingController,
                          obscureText: false,
                          label: tr("date_of_birth"),
                          hintText: tr("date_of_birth"),
                          suffixIcon: Icon(Icons.date_range_outlined),
                          keyboardType: TextInputType.datetime,
                        ),
                        SizedBox(
                          height: responsiveHeight(context, 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: tr("phone_number"),
                                weight: FontWeight.w500,
                                size: 12,
                                color: AppColors.grey,
                              ),
                              SizedBox(height: responsiveHeight(context, 2)),
                              IntlPhoneField(
                                disableLengthCheck: true,
                                controller: phoneTextEditingController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: responsiveHeight(context, 10),
                                    horizontal: responsiveWidth(context, 12),
                                  ),
                                  labelText: tr("phone_number"),
                                  hintText: tr("phone_number"),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextFieldWidget(
                          textEditingController: setPassTextEditingController,
                          obscureText: true,
                          label: tr("set_password"),
                          hintText: tr("set_password"),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: responsiveHeight(context, 24)),
                        ButtonWidget(
                          colors: Colors.white,
                          dataName: tr("register"),
                          onTap: () async {
                            try {
                              String name =
                                  fullNameTextEditingController.text.trim();
                              String email =
                                  emailTextEditingController.text.trim();
                              String dob =
                                  birthDateTextEditingController.text.trim();
                              String number =
                                  phoneTextEditingController.text.trim();
                              String password =
                                  setPassTextEditingController.text.trim();

                              print(
                                "Request:\n$name\n$email\n$dob\n$number\n$password",
                              );

                              Map<String, dynamic>?
                              response = await ApiClient().signup(
                                name: fullNameTextEditingController.text.trim(),
                                email: emailTextEditingController.text.trim(),
                                dob: birthDateTextEditingController.text.trim(),
                                number: phoneTextEditingController.text.trim(),
                                password:
                                    setPassTextEditingController.text.trim(),
                              );

                              if (response != null) {
                                print(
                                  'Registration successful. Response: $response',
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavigationBarScreen(),
                                  ),
                                );
                              } else {
                                print('Registration failed');
                              }
                            } catch (e) {
                              print('Registration error: $e');
                            }
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
