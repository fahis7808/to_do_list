import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/view_models/auth_provider.dart';
import 'package:untitled/view_models/home_provider.dart';
import 'package:untitled/views/home/home_page.dart';
import 'package:untitled/views/authentication/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/views/authentication/registration_screen.dart';
import 'package:untitled/views/authentication/screen_flow.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) {
        return MaterialApp(
          title: 'To Do App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          initialRoute: "/screen_flow",
          routes: {
            "/screen_flow" :(context) => ScreenFlow(),
            "/login": (context) => LoginScreen(),
            "/registration": (context) => RegistrationPage(),
            "/home": (context) => HomePage(),
          },
        );
      },
    );
  }
}
