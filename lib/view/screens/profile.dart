import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodek_app/core/util/responsive.dart';
import 'package:foodek_app/view/widgets/bottom_widget.dart';
import 'package:foodek_app/view/widgets/custom_text.dart';

import '../../core/util/colors.dart';
import '../widgets/text_field_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;
  bool edit = false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Profile", size: 20, weight: FontWeight.w600),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: responsiveHeight(context, 88),
                width: responsiveWidth(context, 88),
                child: CircleAvatar(
                  radius: responsiveWidth(context, 40),
                  backgroundColor: AppColors.grey,
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/profile.png",
                      height: responsiveHeight(context, 80),
                      width: responsiveWidth(context, 80),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(context, 8)),
            CustomText(
              text: "Khalil Samara",
              size: 16,
              weight: FontWeight.w500,
            ),
            CustomText(
              text: "khalilsamara13@gamil.com",
              size: 14,
              weight: FontWeight.w400,
              color: AppColors.grey,
            ),
            SizedBox(height: responsiveHeight(context, 24)),
            buildPageContent(),
          ],
        ),
      ),
    );
  }

  Widget buildPageContent() {
    if (edit) {
      return buildEdit();
    } else {
      return buildOptions();
    }
  }

  Widget buildOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: responsiveHeight(context, 191),
          width: responsiveWidth(context, 380),
          child: Material(
            borderRadius: BorderRadius.circular(12),
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "My Account",
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                  SizedBox(height: responsiveHeight(context, 18)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        edit = true;
                      });
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/personalInfo.svg',
                          width: responsiveWidth(context, 20),
                          height: responsiveHeight(context, 20),
                        ),
                        SizedBox(width: responsiveWidth(context, 12)),
                        CustomText(
                          text: "Personal Information",
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: responsiveHeight(context, 12)),
                  Row(
                    children: [
                      Icon(Icons.language, size: 20),
                      SizedBox(width: responsiveWidth(context, 12)),
                      CustomText(
                        text: "Language",
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                      Spacer(),
                      CustomText(
                        text: "عربية",
                        size: 14,
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: responsiveHeight(context, 12)),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/privacy.svg',
                        width: responsiveWidth(context, 20),
                        height: responsiveHeight(context, 20),
                      ),
                      SizedBox(width: responsiveWidth(context, 12)),
                      CustomText(
                        text: "Privacy Policy",
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(height: responsiveHeight(context, 12)),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/settings.svg',
                        width: responsiveWidth(context, 20),
                        height: responsiveHeight(context, 20),
                      ),
                      SizedBox(width: responsiveWidth(context, 12)),
                      CustomText(
                        text: "Settings",
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: responsiveHeight(context, 16)),
        SizedBox(
          height: responsiveHeight(context, 135),
          width: responsiveWidth(context, 380),
          child: Material(
            borderRadius: BorderRadius.circular(12),
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Notifications",
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                  SizedBox(height: responsiveHeight(context, 18)),
                  Row(
                    children: [
                      Icon(Icons.notifications_none_rounded, size: 20),
                      SizedBox(width: responsiveWidth(context, 12)),
                      CustomText(
                        text: "Push Notifications",
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                      Spacer(),
                      SizedBox(
                        width: 30,
                        height: 18,
                        child: Transform.scale(
                          scale: 0.6,
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                            activeColor: AppColors.green,
                            inactiveTrackColor: AppColors.grey,
                            thumbColor: WidgetStateProperty.all(Colors.white),
                            trackOutlineColor: WidgetStateProperty.all(
                              Colors.transparent,
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: responsiveHeight(context, 12)),
                  Row(
                    children: [
                      Icon(Icons.notifications_none_rounded, size: 20),
                      SizedBox(width: responsiveWidth(context, 12)),
                      CustomText(
                        text: "Promotional Notifications",
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                      Spacer(),
                      SizedBox(
                        width: 30,
                        height: 18,
                        child: Transform.scale(
                          scale: 0.6,
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                            activeColor: AppColors.green,
                            inactiveTrackColor: AppColors.grey,
                            thumbColor: WidgetStateProperty.all(Colors.white),
                            trackOutlineColor: WidgetStateProperty.all(
                              Colors.transparent,
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: responsiveHeight(context, 16)),
        SizedBox(
          height: responsiveHeight(context, 135),
          width: responsiveWidth(context, 380),
          child: Material(
            borderRadius: BorderRadius.circular(12),
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "More", size: 16, weight: FontWeight.w500),
                  SizedBox(height: responsiveHeight(context, 18)),
                  Row(
                    children: [
                      Icon(Icons.info_outline, size: 20),
                      SizedBox(width: responsiveWidth(context, 12)),
                      CustomText(
                        text: "Help Center",
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(height: responsiveHeight(context, 12)),
                  Row(
                    children: [
                      Icon(Icons.logout, size: 20, color: Colors.red),
                      SizedBox(width: responsiveWidth(context, 12)),
                      CustomText(
                        text: "Log Out",
                        size: 14,
                        weight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  buildEdit() {
    return Column(
      children: [
        SizedBox(
          height: responsiveHeight(context, 416),
          width: responsiveWidth(context, 380),
          child: Material(
            borderRadius: BorderRadius.circular(12),
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Username',
                    color: AppColors.dark_grey,
                    weight: FontWeight.w500,
                    size: 12,
                  ),
                  SizedBox(height: 2),
                  TextFieldWidget(
                    textEditingController: usernameController,
                    obscureText: false,
                    label: '',
                    borderColor: AppColors.grey,
                  ),
                  SizedBox(height: 9),
                  CustomText(
                    text: 'Email',
                    color: AppColors.dark_grey,
                    weight: FontWeight.w500,
                    size: 12,
                  ),
                  SizedBox(height: 2),
                  TextFieldWidget(
                    textEditingController: emailController,
                    obscureText: false,
                    label: '',
                    borderColor: AppColors.grey,
                  ),
                  SizedBox(height: 9),
                  CustomText(
                    text: 'Phone Number',
                    color: AppColors.dark_grey,
                    weight: FontWeight.w500,
                    size: 12,
                  ),
                  SizedBox(height: 2),
                  TextFieldWidget(
                    textEditingController: phoneController,
                    obscureText: false,
                    label: '',
                    borderColor: AppColors.grey,
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                  SizedBox(height: 9),
                  CustomText(
                    text: 'Password',
                    color: AppColors.dark_grey,
                    weight: FontWeight.w500,
                    size: 12,
                  ),
                  SizedBox(height: 2),
                  TextFieldWidget(
                    textEditingController: usernameController,
                    obscureText: false,
                    label: '',
                    borderColor: AppColors.grey,
                  ),
                  SizedBox(height: 9),
                  CustomText(
                    text: 'Address',
                    color: AppColors.dark_grey,
                    weight: FontWeight.w500,
                    size: 12,
                  ),
                  SizedBox(height: 2),
                  TextFieldWidget(
                    textEditingController: addressController,
                    obscureText: false,
                    label: '',
                    borderColor: AppColors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: responsiveHeight(context, 42)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 69),
          ),
          child: ButtonWidget(
            dataName: "Update",
            colors: Colors.white,
            onTap: () {
              setState(() {
                edit = false;
              });
            },
          ),
        ),
      ],
    );
  }
}
