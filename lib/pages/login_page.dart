import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/models/user_profile_model.dart';
import 'package:remit_app/pages/home_page.dart';
import 'package:remit_app/pages/registration_page.dart';
import 'package:remit_app/providers/user_profile_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_calls/api_calls.dart';
import '../colors.dart';
import '../custom_widgits/button1.dart';
import '../custom_widgits/button_2.dart';
import '../helper_method/get_user_info.dart';
import '../helper_method/helper_class.dart';
import 'enter_otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPass = true;
  bool checkBox = true;
  final emailCon = TextEditingController();
  final passCon = TextEditingController();
  late UserProfileProvider userProfileProvider;
  final _globalKey = GlobalKey<FormState>();
  List<String> dotedSize=[];


  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    userProfileProvider =
        Provider.of<UserProfileProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                      SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        'images/top_icon.png',
                        width: width / 1.5,
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          child: Form(
                            key: _globalKey,
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                //set border radius more than 50% of height and width to make circle
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(125, 218, 247, 253),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Text(
                                      'SIGN IN',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: MyColor.blue),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: TextFormField(
                                          controller: emailCon,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.mail_outline,
                                              color: MyColor.blue,
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                            labelText: 'Email or Username',
                                            hintStyle: TextStyle(),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: MyColor.blue),
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: .2,
                                                color: Colors.grey.shade500,
                                              ),
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2, color: Colors.red),
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                          ),
                                          validator: (s) {
                                            if (EmailValidator.validate(
                                                emailCon.text)) {
                                              return null;
                                            } else
                                              return 'Please give a valid email';
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: TextFormField(
                                          controller: passCon,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: showPass,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.key,
                                              color: MyColor.blue,
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                            labelText: 'Password',
                                            errorStyle: TextStyle(
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            suffixIconConstraints:
                                                BoxConstraints(
                                                    maxHeight: 30,
                                                    maxWidth: 38),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: MyColor.blue),
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: .2,
                                                color: Colors.grey.shade500,
                                              ),
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2, color: Colors.red),
                                              //<-- SEE HERE
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            hintStyle: TextStyle(),
                                            suffixIcon: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .only(end: 8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: MyColor.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: IconButton(
                                                  padding: EdgeInsets.zero,
                                                  onPressed: () {
                                                    setState(() {
                                                      showPass = !showPass;
                                                    });
                                                  },
                                                  icon: showPass
                                                      ? Icon(
                                                          Icons.visibility_off,
                                                          color: Colors.white,
                                                          size: 18,
                                                        )
                                                      : Icon(
                                                          Icons.visibility,
                                                          color: Colors.white,
                                                          size: 18,
                                                        ),
                                                ),
                                              ),
                                            ),
                                            errorMaxLines: 2,
                                          ),
                                          validator: (s) {
                                            if (passCon.text.length < 8) {
                                              return 'The password must be at least 8 characters.';
                                            }
                                            if (!passCon.text.contains(
                                                    RegExp(r"[a-z]")) ||
                                                !passCon.text.contains(
                                                    RegExp(r"[A-Z]")) ||
                                                !passCon.text.contains(
                                                    RegExp(r"[0-9]")) ||
                                                !passCon.text.contains(RegExp(
                                                    r'[!@#$%^&*(),.?":{}|<>]'))) {
                                              return 'Password must be contain 1 uppercase, '
                                                  '1 lower case 1 number and 1 special character.';
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Checkbox(
                                                value: checkBox,
                                                onChanged: (value) {
                                                  setState(() {
                                                    checkBox = value!;
                                                  });
                                                },
                                                side: BorderSide(
                                                    color: MyColor.blue,
                                                    width: 2),
                                              ),
                                              Text(
                                                'Remember Me',
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Forgot password?',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),

                                                Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: List.generate(26, (index) => Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        height: 2,
                                                        width: 2,
                                                        color: MyColor.blue,
                                                      ),
                                                      SizedBox(
                                                        width: 2,
                                                      ),
                                                    ],
                                                  )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: MyColor.blue,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                        onPressed: () async {
                                          if (_globalKey.currentState!
                                              .validate()) {
                                            EasyLoading.show();
                                            await userProfileProvider
                                                .getUserInfoByEmailPassword(
                                                    emailCon.text, passCon.text)
                                                .then((data) async {
                                              print('RECEIVE DATA $data');
                                              EasyLoading.dismiss();
                                              if (data == null) {
                                                showServerProblemDialog(
                                                    context);
                                              } else {
                                                if (data['success'] == true) {
                                                  final user = await Data.fromJson(data['data']);
                                                  final token = data['user_token'];
                                                  final user_mail = emailCon.text;

                                                  final pref=await SharedPreferences.getInstance();
                                                  pref.setString("mail", user_mail);
                                                  pref.setString("token", token);


                                                  GetUserDetails.setUserInfo(user)
                                                      .then((value) {

                                                  });
                                                } else {
                                                  showErrorMsgDialog(
                                                      context, data);
                                                }
                                              }
                                            });
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.login),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text('SIGN IN')
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Or',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Don\'t have an account?',
                                          style: TextStyle(
                                              color: Colors.grey.shade600),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, SignupPage.routeName);
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'SIGN UP',
                                                style: TextStyle(
                                                    color: MyColor.blue),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    width: 2,
                                                    color: MyColor.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                            'Copyright © ${DateTime.now().year} Remit All Right Reserved.'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
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
