import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/utlities/app_font.dart';
import 'package:untitled/utlities/colors.dart';
import 'package:untitled/view_models/auth_provider.dart';
import 'package:untitled/widget/functions.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text_field.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthenticationProvider(),
      child: Consumer<AuthenticationProvider>(
        builder: (context, provider, _) {
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
                         Text("Create an account", style: AppFont.head),
                        SizedBox(height: 3.h),
                        CustomTextField(
                          value: provider.userModel.name,
                          labelText: "Name",
                          prefixIcon: Icons.person_2_outlined,
                          onChanged: (val) {
                            provider.userModel.name = val;
                          },
                        ),
                        SizedBox(height: 1.h),
                        CustomTextField(
                          value: provider.userModel.mobile,
                          labelText: "Number",
                          prefixIcon: Icons.phone_outlined,
                          keyboard: TextInputType.number,
                          onChanged: (val) {
                            provider.userModel.mobile = val;
                          },
                        ),
                        SizedBox(height: 1.h),
                        CustomTextField(
                          value: provider.userModel.email,
                          labelText: "Email",
                          prefixIcon: Icons.email_outlined,
                          keyboard: TextInputType.emailAddress,
                          onChanged: (val) {
                            provider.userModel.email = val;
                          },
                        ),
                        SizedBox(height: 1.h),
                        CustomTextField(
                          value: provider.password,
                          labelText: "Password",
                          keyboard: TextInputType.emailAddress,
                          prefixIcon: Icons.lock_outline,
                          obscureText: provider.showPassword,
                          onChanged: (val) {
                            provider.password = val;
                          },
                          suffix: GestureDetector(
                            onTap: () {
                              provider.showPassword = !provider.showPassword;
                              provider.onRefresh();
                            },
                            child: Icon(
                              provider.showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        CustomButton(
                          txt: "Continue",
                          isLoading: provider.isLoading,
                          onPressed: () async {
                            provider.setLoading(true);

                             final bool emailCheck = CustomFunction().isValidEmail(
                              provider.userModel.email??"",
                            );

                            if ((provider.userModel.email ?? '').isNotEmpty &&
                                provider.password.isNotEmpty) {
                              if (emailCheck) {
                                await provider.createAccount().then((val) {
                                  if (val == "success") {
                                    CustomToast().successToast(
                                      "Registered Successfully!",
                                    );
                                    Navigator.of(
                                      context,
                                    ).pushReplacementNamed("/home");
                                  } else {
                                    CustomToast().errorToast(val);
                                  }
                                });
                              } else {
                                CustomToast().errorToast(
                                  "Please enter an valid Email ID",
                                );
                              }
                            } else {
                              CustomToast().errorToast(
                                "Email and Password Can't be empty",
                              );
                            }

                            provider.setLoading(false);
                            // provider.onRefresh();
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
        },
      ),
    );
  }
}
