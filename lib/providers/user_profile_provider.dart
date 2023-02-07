import 'package:flutter/cupertino.dart';
import 'package:remit_app/api_calls/api_calls.dart';
import 'package:remit_app/models/recipents_model.dart';

import '../api_calls/user_recipients_calls.dart';

class UserProfileProvider extends ChangeNotifier{

  List<Recipients> recipientsList=[];
  List<String> recipientsNameList=[];
  List<Recipients> recipientsList2=[
    Recipients(
      firstname: 'Rafid',
      lastname: 'Tawhid'
    ),
    Recipients(
        firstname: 'Rafid',
        lastname: 'Tawhid'
    ),
    Recipients(
        firstname: 'Rafid',
        lastname: 'Tawhid'
    ),
  ];

   Future<dynamic> getUserInfoByEmailPassword(email,pass){
    return LoginApiCalls.getUserInfoByEmailPassword(email, pass);
  }

  Future<List<Recipients>> getRecipientsByEmailToken(String email,String pass) async{

   await UserRecipientCalls.getRecipientsByEmailToken(email,pass).then((data) {

      if(data['status']==true){
        for(Map i in data['recipients']){
          recipientsList.add(Recipients.fromJson(i));
        }
        recipientsList.forEach((element) {
          recipientsNameList.add(element.firstname!);
        });
        return recipientsList;
      }
      else {
        return recipientsList;
      }

    });

    return recipientsList;
  }
}