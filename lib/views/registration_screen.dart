import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/utlities/app_font.dart';
import 'package:untitled/utlities/colors.dart';

import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bdClr,
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
                  // Icon(Icons.lock, size: 7.h, color: Theme.of(context).primaryColor),
                  // SizedBox(height: 1.5.h),
                  Text("Create an account", style: AppFont.head),

                  // SizedBox(height: 1.h),
                  SizedBox(height: 3.h),
                  CustomTextField(
                    value: "",
                    labelText: "Name",
                    prefixIcon: Icons.person_2_outlined,
                    onChanged: (val) {
                      // provider.email = val;
                    },
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    value: "",
                    labelText: "Email",
                    prefixIcon: Icons.email_outlined,
                    keyboard: TextInputType.emailAddress,
                    onChanged: (val) {
                      // provider.email = val;
                    },
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    value: "",
                    labelText: "Password",
                    keyboard: TextInputType.emailAddress,
                    onChanged: (val) {
                      // provider.email = val;
                    },
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    value: "",
                    labelText: "Confirm Password",
                    prefixIcon: Icons.lock_outline,
                    onChanged: (val) {
                      // provider.password = val;
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 3.h),
                  CustomButton(
                    txt: "Continue",
                    onPressed: () async {
                      // provider.login();
                    },
                  ),
                  SizedBox(height: 1.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushReplacementNamed('/login');
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
