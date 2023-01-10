import 'package:flutter/material.dart';
import 'package:remit_app/colors.dart';
import 'package:remit_app/pages/home_page.dart';

import '../custom_widgits/button1.dart';


class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);
  static const String routeName='/otp';

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title:  Text('Enter OTP',style: TextStyle(color: Colors.black,fontSize: 20),),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Please enter the code we have sent to your email, Code will be Valid for 5:00 min',
              style: MyStyle.mytext(TextStyle(color: Colors.grey)),),

            ),
            SizedBox(height: 80,),
            MainButton(title: 'Continue',route: HomePage.routeName,)
          ],
        ),
      ),
    );
  }
}
