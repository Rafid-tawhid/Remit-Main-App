import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/pages/calculator_page.dart';
import 'package:remit_app/pages/login_page.dart';
import 'package:remit_app/providers/calculator_provider.dart';
import 'package:remit_app/providers/user_profile_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper_method/get_user_info.dart';
import '../helper_method/helper_class.dart';
import '../models/user_profile_model.dart';
import 'home_page.dart';

class LauncherPage extends StatefulWidget {

  static const String routeName='/';
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  late UserProfileProvider userProfileProvider;
  late CalculatorProvider provider;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {

     // Navigator.pushNamed(context, LoginPage.routeName);
    //  getValueFromSharedPref();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    userProfileProvider=Provider.of(context,listen: false);
    provider=Provider.of(context,listen: false);
    provider.getAllCountryInfo().then((value){
      Navigator.pushNamed(context, CalculatorPage.routeName);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff26A6DE),
      body: Center(
        child: Image.asset('images/logo_circle.png'),
      ),
    );
  }

  getValueFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    //
    //
    // LoginApiCalls.getAuthToken().then((auth) {
    //   print(auth.toString());
    // });

    if (prefs.getString("email") != null && prefs.getString("pass") != null&&prefs.getString("token")!=null) {
      EasyLoading.show();
      userProfileProvider
          .getUserInfoByEmailPassword(
          prefs.getString("email"), prefs.getString("pass"))
          .then((data) async {
        EasyLoading.dismiss();

        if (data == null) {
          showServerProblemDialog(context);
        } else {
          if (data['success'] == true) {
            final user = Data.fromJson(data['data']);
            GetUserDetails.setUserInfo(user).then((value) {
              Navigator.pushNamed(
                context, HomePage.routeName,
              );
            });
          } else {
            showErrorMsgDialog(context, data);
          }
        }
      });
    }
    else {
      Navigator.pushNamed(context, LoginPage.routeName);
    }
  }
}