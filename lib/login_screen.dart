import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/widget/custom_button.dart';
import 'package:untitled/widget/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.w),
            ),
            child: Padding(
              padding: EdgeInsets.all(5.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lock, size: 7.h, color: theme.primaryColor),
                  SizedBox(height: 1.5.h),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    "Login to your account",
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 3.h),
                  CustomTextField(
                    value: "",
                    labelText: "Email",
                    prefixIcon: Icons.email_outlined,
                    onChanged: (val) {},
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    value: "",
                    labelText: "Password",
                    prefixIcon: Icons.lock_outline,
                    onChanged: (val) {},
                    obscureText: true,
                  ),
                  SizedBox(height: 3.h),
                  CustomButton(txt: "Login", onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
