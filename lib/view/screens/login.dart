import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodek_app/view/screens/reset_password.dart';
import 'package:foodek_app/view/screens/signup.dart';
import '../navigation_bar.dart';
import '../widgets/bottom_widget.dart';
import '../widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  bool _isChecked = false; // Checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF25AE4B),
      body: Stack(
        children: [
          // Background Pattern
          Positioned.fill(
            child: Image.asset(
              "assets/images/pattern.png",
              fit: BoxFit.cover, // Adjust for responsiveness
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 85.h),

                // Logo
                Image.asset(
                  'assets/images/logo.png',
                  height: 85.h,
                  width: 307.w,
                ),
                SizedBox(height: 42.h),

                // Login Container
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    padding: EdgeInsets.all(20.w),
                    height: 661.h,
                    width: 343.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 8.h),
                        Text(
                          "Login",
                          style: TextStyle(
                            color: const Color(0xFF111827),
                            fontFamily: "Inter",
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        // Sign Up Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF25AE4B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),

                        // Email Field
                        TextFieldWidget(
                          textEditingController: emailTextEditingController,
                          hintText: "demo@example.com",
                          obscureText: false,
                          label: "Email",
                        ),
                        SizedBox(height: 25.h),

                        // Password Field
                        TextFieldWidget(
                          textEditingController: passwordTextEditingController,
                          hintText: "Enter Your Password",
                          obscureText: true,
                          label: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility_off),
                          ),
                        ),
                        SizedBox(height: 17.h),

                        // Remember Me & Forgot Password
                        Row(
                          children: [
                            Checkbox(
                              value: _isChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                            Text(
                              "Remember me",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const ResetPassScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF25AE4B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        // Login Button
                        ButtonWidget(
                          dataName: "Login",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationBarScreen(),
                              ),
                            );
                          },
                          colors: Colors.white,
                        ),

                        SizedBox(height: 15.h),

                        // Divider with "Or"
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: Color(0xFFEDF1F3),
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                "Or",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF6C7278),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: Color(0xFFEDF1F3),
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),

                        // Social Login Buttons
                        _buildContinueWithButton(
                          title: "Continue with Google",
                          path: "assets/images/google_icon.png",
                        ),
                        SizedBox(height: 10.h),
                        _buildContinueWithButton(
                          title: "Continue with Facebook",
                          path: "assets/images/facebook_icon.png",
                        ),
                        SizedBox(height: 10.h),
                        _buildContinueWithButton(
                          title: "Continue with Apple",
                          path: "assets/images/apple_icon.png",
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

  // Social Login Buttons
  Widget _buildContinueWithButton({
    required String title,
    required String path,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEFF0F6)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          splashColor: const Color(0xFFC0C0C0),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(path, width: 20.w, height: 20.h),
                SizedBox(width: 10.w),
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF1A1C1E),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
