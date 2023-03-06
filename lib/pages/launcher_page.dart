import 'dart:async';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/helper_method/admin_config.dart';
import 'package:remit_app/pages/calculator_page.dart';
import 'package:remit_app/pages/login_page.dart';
import 'package:remit_app/providers/calculator_provider.dart';
import 'package:remit_app/providers/user_profile_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../custom_widgits/dialog_widgits.dart';
import '../custom_widgits/show_error_dialoge.dart';
import '../helper_method/get_user_info.dart';
import '../helper_method/helper_class.dart';
import '../helper_method/network_check.dart';
import '../models/user_profile_model.dart';
import 'calculator_page.dart';
import 'home_page.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Timer? _timer;
int myStartTimer = 3600;
class LauncherPage extends StatefulWidget {

  static const String routeName='/';
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  late UserProfileProvider userProfileProvider;
  late CalculatorProvider provider;
  late StreamSubscription<ConnectivityResult> subscription;
  bool _isConnected = true;



  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      startTimer();
    });
    super.initState();
  }



  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (myStartTimer == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            myStartTimer--;
          });
        }
      },
    );

  }

  @override
  void didChangeDependencies() {
    userProfileProvider=Provider.of(context,listen: false);
    Network.checkConnectivity();
    Future.delayed(
        Duration(
          milliseconds: 500,
        ), () {
      if (Network.status == 'Not Connected') {
        ShowNoNetworkDialoge();

      } else {
        // showSeipPopUp();
      }
    });



    subscription = Connectivity().onConnectivityChanged.listen((result) {
      print('Listening.................');
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        EasyLoading.show();
        provider=Provider.of(context,listen: false);
        // provider.getAllCountryInfo(context).then((value){
        //   if(value.length>0){
        //   }
        //   else {
        //     EasyLoading.dismiss();
        //     ShowErrorDialoge(context);
        //   }
        // });

        //CALL All country charges info
        provider.getserviceChargeofAllCountry().then((value) {
          EasyLoading.dismiss();
          if(value.length>0){
            print('value.length Called.... ${value.length}');
            Navigator.pushNamed(context, LoginPage.routeName);
          }
          else {
            EasyLoading.dismiss();
            ShowErrorDialoge(context);
          }
        });
      } else {
        setState(() {
          ShowNoNetworkDialoge();

        });
      }
    });




    //dynamic app settings

    // subscription = Connectivity().onConnectivityChanged.listen((result) {
    //   print('Listening.................');
    //   if (result == ConnectivityResult.wifi ||
    //       result == ConnectivityResult.mobile) {
    //       EasyLoading.show();
    //       provider=Provider.of(context,listen: false);
    //
    //     // get app basic settings
    //     userProfileProvider.getAppSettings().then((value) {
    //
    //
    //       // set app settings
    //       userProfileProvider.basicSettingsList.forEach((element) {
    //         if(element.fieldKey=='app_title'){
    //
    //           AdminAccessConfig.appName=element.fieldValue;
    //         }
    //         if(element.fieldKey=='api_url'){
    //           AdminAccessConfig.base_url=element.fieldValue;
    //         }
    //       });
    //       print('AdminAccessConfig.appName ${AdminAccessConfig.appName}');
    //       print('AdminAccessConfig.base_url ${AdminAccessConfig.base_url}');
    //
    //       //CALL All country charges info
    //       provider.getserviceChargeofAllCountry().then((value) {
    //         EasyLoading.dismiss();
    //         if(value.length>0){
    //           print('value.length Called.... ${value.length}');
    //           Navigator.pushNamed(context, LoginPage.routeName);
    //         }
    //         else {
    //           EasyLoading.dismiss();
    //           ShowErrorDialoge(context);
    //         }
    //       });
    //     });
    //
    //   } else {
    //     setState(() {
    //       ShowNoNetworkDialoge();
    //     });
    //   }
    // });

    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff26A6DE),
      body: Center(
        child: Image.asset('images/logo_circle.png')
      ),
    );
  }

  //
  // @override
  // void dispose() {
  //   subscription.cancel();
  //   super.dispose();
  // }



  void ShowNoNetworkDialoge() {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Network problem.'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.wifi_off,size: 60,),
                Text('Please Check your Internet Connection'),
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    SystemNavigator.pop();
                  },
                  child: Text('Cancel'))
            ],
          );
        });
  }
}

