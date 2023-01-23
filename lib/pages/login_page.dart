import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remit_app/pages/home_page.dart';
import 'package:remit_app/pages/registration_page.dart';

import '../colors.dart';
import '../custom_widgits/button1.dart';
import '../custom_widgits/button_2.dart';
import 'enter_otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName='/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool showPass=true;
  bool checkBox=true;
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Form(
          child: ListView(
            children: [
              Container(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 30,),
                      Image.asset('images/top_icon.png',width: width/1.5,height: 60,),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(

                          child: Form(
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                //set border radius more than 50% of height and width to make circle
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(125,218, 247, 253),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(-2, 2)
                                      )
                                    ]
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 40,),
                                    Text('SIGN IN',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: MyColor.blue),),
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
                                              prefixIcon: Icon(Icons.mail_outline,color: MyColor.blue,),
                                              fillColor: Colors.white,
                                              filled: true,
                                              labelText: 'Email or Username',
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
                                              prefixIcon: Icon(Icons.key,color: MyColor.blue,),
                                              fillColor: Colors.white,
                                              filled: true,
                                              labelText: 'Password',
                                              suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
                                              hintStyle: TextStyle(),
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Checkbox(
                                                value: checkBox, onChanged: (value){
                                                setState(() {
                                                  checkBox=value!;

                                                });
                                              },
                                                side: BorderSide(
                                                    color: MyColor.blue,
                                                    width: 2
                                                ),
                                              ),
                                              Text('Remember Me',style: TextStyle(color: Colors.grey.shade600),),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('Forgot password?',style: TextStyle(color: Colors.grey.shade600),),
                                                SizedBox(height: 5,),
                                                Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),
                                                    SizedBox(width: 2,),
                                                    Container(
                                                      height: 2,
                                                      width: 2,
                                                      color: MyColor.blue,
                                                    ),


                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
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
                                        onPressed: (){}, child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.login),
                                          SizedBox(width: 10,),
                                          Text('SIGN IN')
                                        ],
                                      ),
                                    )),
                                    SizedBox(height: 20,),
                                    Text('Or',style: TextStyle(fontSize: 20),),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Don\'t have an account?',style: TextStyle(color: Colors.grey.shade600),),
                                        SizedBox(width: 5,),
                                        InkWell(
                                          onTap: (){
                                            Navigator.pushNamed(context, SignupPage.routeName);
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('SIGN UP',style: TextStyle(color: MyColor.blue),),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(width: 2,),

                                                ],
                                              )
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                    SizedBox(height: 40,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text('Copyright © ${DateTime.now().year} Remit All Right Reserved.'),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
