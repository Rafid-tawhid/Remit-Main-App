import 'package:flutter/cupertino.dart';
import 'package:remit_app/api_calls/api_calls.dart';
import 'package:remit_app/models/recipents_model.dart';

import '../api_calls/user_recipients_calls.dart';

class UserProfileProvider extends ChangeNotifier{

  List<Recipients> recipientsList=[];

   Future<dynamic> getUserInfoByEmailPassword(email,pass){
    return LoginApiCalls.getUserInfoByEmailPassword(email, pass);
  }

  Future<List<Recipients>> getRecipientsByMailAndPassword(String email,String pass) async{

   await UserRecipientCalls.getRecipientsByEmailPassword('akib@pencilbox.edu.bd','Akib123\$').then((data) {

      if(data['status']==true){
        for(Map i in data['recipients']){
          recipientsList.add(Recipients.fromJson(i));
        }
        return recipientsList;
      }
      else {
        return recipientsList;
      }

    });

    return recipientsList;
  }
}