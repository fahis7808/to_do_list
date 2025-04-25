import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0,p1,p2) {
        return MaterialApp(
          title: 'To Do App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
         initialRoute: "/login",
         routes: {
            "/login":(context) => LoginScreen(),
         },
        );
      }
    );
  }
}