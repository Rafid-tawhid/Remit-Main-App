import 'package:flutter/material.dart';
import 'package:remit_app/colors.dart';
import 'package:remit_app/pages/home_page.dart';
import 'package:remit_app/pages/user_profile_page.dart';
import '../custom_widgits/button1.dart';
import '../helper_method/get_user_info.dart';



class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);
  static const String routeName='/otp';

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final phnCon=TextEditingController();

  initState(){
    phnCon.text="+88";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final defaultPinTheme = PinTheme(
    //   width: 56,
    //   height: 56,
    //   textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    // );

    // final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    //   border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
    //   borderRadius: BorderRadius.circular(8),
    // );
    //
    // final submittedPinTheme = defaultPinTheme.copyWith(
    //   decoration: BoxDecoration(
    //     color: Color.fromRGBO(234, 239, 243, 1),
    //   )
    // );



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: MyColor.blue,size: 25),
        elevation: 0.0,
        title: Image.asset('images/logo.png',width: 120,),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, UserProfilePage.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0,top: 5,bottom: 5),
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(.5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(GetUserDetails.userProfileModel!.image!,),
                  ),
                ),
              ),
            ),
          ),
        ],
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
            // Pinput(
            //   defaultPinTheme: defaultPinTheme,
            //   focusedPinTheme: focusedPinTheme,
            //   submittedPinTheme: submittedPinTheme,
            //   validator: (s) {
            //     return s == '2222' ? null : 'Pin is incorrect';
            //   },
            //   pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            //   showCursor: true,
            //   onCompleted: (pin) => print(pin),
            // ),
            TextFormField(
              controller: phnCon,
            ),
            SizedBox(height: 80,),
            MainButton(title: 'Continue',)
          ],
        ),
      ),
    );
  }
}
