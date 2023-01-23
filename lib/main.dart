
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/pages/enter_otp_page.dart';
import 'package:remit_app/pages/home_page.dart';
import 'package:remit_app/pages/launcher_page.dart';
import 'package:remit_app/pages/login_page.dart';
import 'package:remit_app/pages/manual_upload_step3.dart';
import 'package:remit_app/pages/registration_page.dart';
import 'package:remit_app/pages/registration_step2.dart';
import 'package:remit_app/pages/registration_step3.dart';
import 'package:remit_app/providers/user_profile_provider.dart';

import 'api_calls/show_data.dart';


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>UserProfileProvider())
      ],
      child: MaterialApp(
        title: 'Remit App',
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: LoginPage.routeName,
        routes: {
          LauncherPage.routeName:(context)=>LauncherPage(),
          SignupPage.routeName:(context)=>SignupPage(),
          LoginPage.routeName:(context)=>LoginPage(),
          OtpPage.routeName:(context)=>OtpPage(),
          HomePage.routeName:(context)=>HomePage(),
          RegistrationStep2.routeName:(context)=>RegistrationStep2(),
          RegistrationStep3.routeName:(context)=>RegistrationStep3(),
          ManualUploadPage3.routeName:(context)=>ManualUploadPage3(),
          ShowDataPage.routeName:(context)=>ShowDataPage(),

        },
      ),
    );
  }
}


