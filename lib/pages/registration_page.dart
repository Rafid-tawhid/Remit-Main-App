import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remit_app/colors.dart';
import 'package:remit_app/pages/home_page.dart';
import 'package:remit_app/pages/registration_step2.dart';

import '../custom_widgits/button1.dart';
import '../models/country_api_list.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  static const String routeName = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool showPass=true;
  bool checkBox=false;
  bool checkBox2=false;
  final phoneCon=TextEditingController();



  @override
  void dispose() {

    phoneCon.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(

      body: Container(
        color: Colors.white,
        child: Form(
          child: ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                     padding: EdgeInsets.symmetric(vertical: 25),
                      width: width,
                      color: MyColor.blue,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('REGISTRATION',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text('Authentication',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle
                                    ),
                                    child: Text(''),
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.white,
                                height: 5,
                                width: 20,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: MyColor.blue,
                                        shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 3,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                    child: Text(''),
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.white,
                                height: 5,
                                width: 20,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: MyColor.blue,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                    child: Text(''),
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.white,
                                height: 5,
                                width: 20,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: MyColor.blue,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                    child: Text(''),
                                  ),
                                ],
                              ),
                            ],
                          )

                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Image.asset('images/top_icon.png',width: width/1.5,height: 60,),
                    SizedBox(height: 30,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColor.blue,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Icon(Icons.mail_outline,color: MyColor.blue,),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Icon(Icons.star,color: Colors.red,size: 8,),
                                      ),
                                    ],
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: 'Email Address',
                                  hintStyle: TextStyle(),

                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2, color: MyColor.blue),
                                    //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2, color: Colors.transparent),
                                    //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColor.blue,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Icon(Icons.mail_outline,color: MyColor.blue,),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Icon(Icons.star,color: Colors.red,size: 8,),
                                      ),
                                    ],
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: 'Confirm Email Address',
                                  hintStyle: TextStyle(),

                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2, color: MyColor.blue),
                                    //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2, color: Colors.transparent),
                                    //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColor.blue,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: showPass,
                                decoration: InputDecoration(
                                  prefixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Icon(Icons.key,color: MyColor.blue,),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10.0),
                                        child: Icon(Icons.star,color: Colors.red,size: 8,),
                                      ),
                                    ],
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: 'Password',
                                  hintStyle: TextStyle(),
                                  suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(end: 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: MyColor.blue,
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: (){
                                          setState(() {
                                            showPass=!showPass;
                                          });
                                        }, icon: showPass?Icon(Icons.visibility_off,color: Colors.white,size: 18,
                                      ):Icon(Icons.visibility,color: Colors.white,size: 18,
                                      ),
                                      ),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2, color: MyColor.blue),
                                    //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2, color: Colors.transparent),
                                    //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0,right: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                  value: checkBox,
                                  side: BorderSide(
                                      color: MyColor.blue,
                                      width: 2
                                  ),//set variable for value
                                  onChanged: (bool? value) {
                                    print(value);
                                    setState(() {
                                      checkBox = value!;
                                    });
                                  }),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16,top: 12),
                                    child:  RichText(
                                      text: TextSpan(
                                        text: 'I agree to Danesh Exchange ',
                                        style: TextStyle(color: Colors.grey.shade600),
                                        children:  <TextSpan>[
                                          TextSpan(text: 'Terms & Condition , Privacy policy', style: TextStyle(fontWeight: FontWeight.normal,color: MyColor.blue)),
                                          TextSpan(text: ' and '),
                                          TextSpan(text: 'Terms of use', style: TextStyle(fontWeight: FontWeight.normal,color: MyColor.blue)),
                                        ],
                                      ),
                                    )
                                  )),

                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0,right: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                  value: checkBox2,
                                  side: BorderSide(
                                      color: MyColor.blue,
                                      width: 2
                                  ),//set variable for value
                                  onChanged: (bool? value) {
                                    print(value);
                                    setState(() {
                                      checkBox2 = value!;
                                    });
                                  }),
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(right: 16,top: 12),
                                      child:  RichText(
                                        text: TextSpan(
                                          text: 'I agree to receive promotional marketing communication from Danesh Exchange via email and sms. ',
                                          style: TextStyle(color: Colors.grey.shade600),
                                          children:  <TextSpan>[
                                          ],
                                        ),
                                      )
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: MyColor.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                            onPressed: (){
                              Navigator.pushNamed(context, RegistrationStep2.routeName);
                            }, child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('NEXT')
                            ],
                          ),
                        )),
                        SizedBox(height: 30,),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text('Copyright © ${DateTime.now().year} Remit All Right Reserved.'),
                        ),
                        SizedBox(height: 30,),

                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
