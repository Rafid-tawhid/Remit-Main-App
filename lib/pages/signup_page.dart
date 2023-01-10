import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remit_app/colors.dart';
import 'package:remit_app/pages/home_page.dart';

import '../custom_widgits/button1.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  static const String routeName = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? country;
  bool showPass = true;

  bool? clickCheck = false;
  List<String> listOfValue = ['Bangladesh', 'India', 'Pakistan', 'Australia', 'Denmark'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Create Account',
          style: TextStyle(color: Colors.black,fontSize: 20),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Form(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8.0, bottom: 8),
                child: DropdownButtonFormField(
                  value: country,
                  hint: Text(
                    'Select Country',
                    style: TextStyle(color: Colors.black),
                  ),
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      country = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      country = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "can't empty";
                    } else {
                      return null;
                    }
                  },
                  items: listOfValue.map((String val) {
                    return DropdownMenuItem(
                      value: val,
                      child: Text(
                        val,
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8.0, bottom: 8),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    errorStyle: TextStyle(height: 0, color: Colors.transparent),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3C3C43),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8.0, bottom: 8),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: showPass,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: showPass
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            icon: Icon(Icons.visibility))
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            icon: Icon(Icons.visibility_off)),
                    errorStyle: TextStyle(height: 0, color: Colors.transparent),
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3C3C43),
                  ),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Your Password should be at least 8 characters, and include 1 upper case letter, 1 lower case letter and number.',
                          style: MyStyle.mytext(const TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.italic)),
                        ), //TEXT HERE
                      ), //TEXT HERE
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8.0, bottom: 8),
                child: Text(
                  'Mobile',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              Wrap(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 8.0, bottom: 8),
                      child: RichText(
                        text: TextSpan(
                          style: MyStyle.mytext(TextStyle(fontStyle: FontStyle.italic),),
                            children: [
                          TextSpan(text: 'By submitting this form, you accept daneshexchange’s ',style: MyStyle.mytext(TextStyle(color: Colors.grey))),
                          TextSpan(text: 'Terms and Conditions ',style: MyStyle.mytext(TextStyle(color: MyColor.blue))),
                          TextSpan(text: ' and ',style: TextStyle(color: Colors.grey)),
                          TextSpan(text: 'Privacy Policy ',style: MyStyle.mytext(TextStyle(color: MyColor.blue))),
                        ]),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      SizedBox(
                      height: 20,
                      width: 20,
                      child: Checkbox(
                          value: clickCheck, //set variable for value
                          onChanged: (bool? value) {
                            print(value);
                            setState(() {
                              clickCheck = value;
                            });
                          },

                      ),
                    ),
                     Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0,right: 6),
                          child: Text(
                            'If you DO NOT wish to receive marketing information about our products and special offers, please check this box.',
                            style: MyStyle.mytext(TextStyle(
                              color: Colors.grey,fontSize: 14)),
                          ),
                        )),
                    SizedBox(
                      height: 45,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 45,
              ),
              MainButton(
                title: 'Sign Up',route: HomePage.routeName,
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          children: [
                            TextSpan(text: 'Already have an account?',style: TextStyle(color: MyColor.greyLight,fontSize: 16)),
                            TextSpan(text: ' Login',style:  TextStyle(color: MyColor.blue,fontSize: 16,fontWeight: FontWeight.w500)),
                          ]
                      )),
                  onTap: (){
                    Navigator.pushNamed(context, LoginPage.routeName);
                  },

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
