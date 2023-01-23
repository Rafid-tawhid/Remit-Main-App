import 'package:flutter/material.dart';

import '../colors.dart';

class UserUpdatePasswordPage extends StatefulWidget {
  static const String routeName='/password';
  const UserUpdatePasswordPage({Key? key}) : super(key: key);

  @override
  State<UserUpdatePasswordPage> createState() => _UserUpdatePasswordPageState();
}

class _UserUpdatePasswordPageState extends State<UserUpdatePasswordPage> {
  bool showPass = true;
  final passCon = TextEditingController();
  final newpassCon = TextEditingController();
  final confirmpassCon = TextEditingController();

  @override
  void dispose() {
   passCon.dispose();
   newpassCon.dispose();
   confirmpassCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Password'),
      ),
      body: Column(

        children: [
          SizedBox(height: 10,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0,top: 8,bottom: 8),
                child: Text(
                  'Current Password ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passCon,
                  keyboardType:
                  TextInputType.visiblePassword,
                  obscureText: showPass,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Current Password',
                    errorStyle: TextStyle(overflow: TextOverflow.ellipsis),
                    suffixIconConstraints: BoxConstraints(
                        maxHeight: 30,
                        maxWidth: 38),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2,
                          color: MyColor.blue),
                      //<-- SEE HERE
                      borderRadius:
                      BorderRadius.circular(6.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: .2,
                        color: Colors.grey.shade500,
                      ),
                      //<-- SEE HERE
                      borderRadius:
                      BorderRadius.circular(6.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2,
                          color: Colors.red),
                      //<-- SEE HERE
                      borderRadius:
                      BorderRadius.circular(15.0),
                    ),
                    hintStyle: TextStyle(),
                    suffixIcon: Padding(
                      padding:
                      const EdgeInsetsDirectional
                          .only(end: 8.0),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                        icon: showPass
                            ? Icon(
                          Icons
                              .visibility_off,
                          color: Colors.grey,
                          size: 18,
                        )
                            : Icon(
                          Icons.visibility,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                    ),
                    errorMaxLines: 2,
                  ),
                  validator: (s) {
                    if (passCon.text.length < 8) {
                      return 'The password must be at least 8 characters.';
                    }
                    if(!passCon.text.contains(RegExp(r"[a-z]"))||
                        !passCon.text.contains(RegExp(r"[A-Z]"))||
                        !passCon.text.contains(RegExp(r"[0-9]"))||
                        !passCon.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
                      return 'Password must be contain 1 uppercase, '
                          '1 lower case 1 number and 1 special character.';
                    }
                    else
                    {
                      return null;
                    }


                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0,top: 8,bottom: 8),
                child: Text(
                  'New Password ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: newpassCon,
                  keyboardType:
                  TextInputType.visiblePassword,
                  obscureText: showPass,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'New Password',
                    errorStyle: TextStyle(overflow: TextOverflow.ellipsis),
                    suffixIconConstraints: BoxConstraints(
                        maxHeight: 30,
                        maxWidth: 38),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2,
                          color: MyColor.blue),
                      //<-- SEE HERE
                      borderRadius:
                      BorderRadius.circular(6.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: .2,
                        color: Colors.grey.shade500,
                      ),
                      //<-- SEE HERE
                      borderRadius:
                      BorderRadius.circular(6.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2,
                          color: Colors.red),
                      //<-- SEE HERE
                      borderRadius:
                      BorderRadius.circular(15.0),
                    ),
                    hintStyle: TextStyle(),
                    suffixIcon: Padding(
                      padding:
                      const EdgeInsetsDirectional
                          .only(end: 8.0),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                        icon: showPass
                            ? Icon(
                          Icons
                              .visibility_off,
                          color: Colors.grey,
                          size: 18,
                        )
                            : Icon(
                          Icons.visibility,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                    ),
                    errorMaxLines: 2,
                  ),
                  validator: (s) {
                    if (passCon.text.length < 8) {
                      return 'The password must be at least 8 characters.';
                    }
                    if(!passCon.text.contains(RegExp(r"[a-z]"))||
                        !passCon.text.contains(RegExp(r"[A-Z]"))||
                        !passCon.text.contains(RegExp(r"[0-9]"))||
                        !passCon.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
                      return 'Password must be contain 1 uppercase, '
                          '1 lower case 1 number and 1 special character.';
                    }
                    else
                    {
                      return null;
                    }


                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0,top: 8,bottom: 8),
                child: Text(
                  'Confirm Password ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: confirmpassCon,
                  keyboardType:
                  TextInputType.visiblePassword,
                  obscureText: showPass,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Confirm Password',
                    errorStyle: TextStyle(overflow: TextOverflow.ellipsis),
                    suffixIconConstraints: BoxConstraints(
                        maxHeight: 30,
                        maxWidth: 38),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2,
                          color: MyColor.blue),
                      //<-- SEE HERE
                      borderRadius:
                      BorderRadius.circular(6.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: .2,
                        color: Colors.grey.shade500,
                      ),
                      //<-- SEE HERE
                      borderRadius:
                      BorderRadius.circular(6.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2,
                          color: Colors.red),
                      //<-- SEE HERE
                      borderRadius:
                      BorderRadius.circular(15.0),
                    ),
                    hintStyle: TextStyle(),
                    suffixIcon: Padding(
                      padding:
                      const EdgeInsetsDirectional
                          .only(end: 8.0),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                        icon: showPass
                            ? Icon(
                          Icons
                              .visibility_off,
                          color: Colors.grey,
                          size: 18,
                        )
                            : Icon(
                          Icons.visibility,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                    ),
                    errorMaxLines: 2,
                  ),
                  validator: (s) {
                    if (passCon.text.length < 8) {
                      return 'The password must be at least 8 characters.';
                    }
                    if(!passCon.text.contains(RegExp(r"[a-z]"))||
                        !passCon.text.contains(RegExp(r"[A-Z]"))||
                        !passCon.text.contains(RegExp(r"[0-9]"))||
                        !passCon.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
                      return 'Password must be contain 1 uppercase, '
                          '1 lower case 1 number and 1 special character.';
                    }
                    else
                    {
                      return null;
                    }


                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: MyColor.blue
            ),
              onPressed: (){},
              child: Text('Update Password'))
        ],
      ),
    );
  }
}
