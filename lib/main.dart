import 'package:flutter/material.dart';
import 'package:remit_app/pages/enter_otp_page.dart';
import 'package:remit_app/pages/home_page.dart';
import 'package:remit_app/pages/launcher_page.dart';
import 'package:remit_app/pages/login_page.dart';
import 'package:remit_app/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remit App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName:(context)=>LauncherPage(),
        SignupPage.routeName:(context)=>SignupPage(),
        LoginPage.routeName:(context)=>LoginPage(),
        OtpPage.routeName:(context)=>OtpPage(),
        HomePage.routeName:(context)=>HomePage(),

      },
    );
  }
}


