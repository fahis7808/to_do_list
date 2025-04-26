import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/view_models/auth_provider.dart';
import 'package:untitled/views/home_page.dart';
import 'package:untitled/views/login_screen.dart';

class ScreenFlow extends StatelessWidget {
  const ScreenFlow({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);

    if (authProvider.user != null) {
      return const HomePage();
    } else {
      return const LoginScreen();
    }
  }
}
