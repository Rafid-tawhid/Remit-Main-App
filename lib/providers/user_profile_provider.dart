import 'package:flutter/cupertino.dart';
import 'package:remit_app/api_calls/api_calls.dart';

class UserProfileProvider extends ChangeNotifier{

   Future<dynamic> getUserInfoByEmailPassword(email,pass){
    return LoginApiCalls.getUserInfoByEmailPassword(email, pass);
  }
}