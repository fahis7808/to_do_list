import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/utlities/app_font.dart';
import 'package:untitled/utlities/colors.dart';
import 'package:untitled/view_models/auth_provider.dart';
import 'package:untitled/widget/custom_button.dart';
import 'package:untitled/widget/custom_text_field.dart';
import '../../widget/functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<AuthenticationProvider>(
      builder: (context,provider,_) {
        return Scaffold(
          backgroundColor: AppColor.bgClr,
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
                      Text("Welcome Back", style: AppFont.head),
                      SizedBox(height: 1.h),
                      Text(
                        "Login to your account",
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 3.h),
                      CustomTextField(
                        value: provider.email,
                        labelText: "Email",
                        prefixIcon: Icons.email_outlined,
                        keyboard: TextInputType.emailAddress,
                        onChanged: (val) {
                          provider.email = val;
                        },
                      ),
                      SizedBox(height: 2.h),
                      CustomTextField(
                        value: provider.password,
                        labelText: "Password",
                        prefixIcon: Icons.lock_outline,
                        onChanged: (val) {
                          provider.password = val;
                        },
                        obscureText: provider.showPassword,
                        suffix: GestureDetector(
                          onTap: () {
                              provider.showPassword = !provider.showPassword;
                              provider.onRefresh();
                          },
                          child: Icon(provider.showPassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        ),
                      SizedBox(height: 3.h),
                      CustomButton(
                        txt: "Login",
                        isLoading: provider.isLoading,
                        onPressed: () async {
                          provider.setLoading(true);
                          await provider.login().then((val) {
                            if (val == "success") {
                              CustomToast().successToast("Logged in Successfully!");
                              Navigator.of(context).pushReplacementNamed("/home");
                            } else {
                              CustomToast().errorToast(val);
                            }
                          });
                          provider.setLoading(false);
                        },
                      ),
                      SizedBox(height: 1.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have account? '),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed('/registration');
                            },
                            child: const Text(
                              'Register',
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
    );
  }
}
