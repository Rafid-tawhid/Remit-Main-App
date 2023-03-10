import 'package:flutter/foundation.dart';
import 'package:remit_app/models/bank_agent_data_model.dart';
import 'package:remit_app/models/user_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserDetails{
  static Data? userProfileModel;
  static CustomerDetails? customerDetailsModel;
  static String? token;
  static String? email;



  static Future<void> setUserInfo(Data user)async {
    userProfileModel=user;
    print('set user ${userProfileModel!.username}');

  }
  static getUserInfo(){
    print('get user ${userProfileModel!.username}');
    return userProfileModel;
  }

  static Future<void> setCustomerInfo(CustomerDetails customer)async {
    customerDetailsModel=customer;
    print('set customer ${customerDetailsModel!.residentalAddress}');
  }

  static getCustomerInfo(){
    print('get customer${customerDetailsModel!.streetName}');
    return customerDetailsModel;
  }

  static Future<void> setUserMailAndToken(String mail,String token)async {

    final pref=await SharedPreferences.getInstance();
    print('TOKEN : $token');
    pref.setString("mail", mail);
    pref.setString("token", token);
    email=pref.getString("mail")!;
    token=pref.getString("token")!;
  }

  static Future<String?> getUserMail()async{
    final pref=await SharedPreferences.getInstance();
    return pref.getString("mail");
  }
  static Future<String?> getUserToken()async{
    final pref=await SharedPreferences.getInstance();
    token=pref.getString("token");
    return pref.getString("token");
  }





}