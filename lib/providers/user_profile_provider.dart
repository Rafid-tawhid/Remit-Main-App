import 'package:flutter/cupertino.dart';
import 'package:remit_app/api_calls/api_calls.dart';
import 'package:remit_app/models/bank_agent_data_model.dart';
import 'package:remit_app/models/recipents_model.dart';

import '../api_calls/user_recipients_calls.dart';

class UserProfileProvider extends ChangeNotifier{

  List<Recipients> recipientsList=[];
  List<String> recipientsNameList=[];
  List<BankInfo> bankInfoList=[];
  List<LocalAgent> localAgentList=[];

   Future<dynamic> getUserInfoByEmailPassword(email,pass){
    return LoginApiCalls.getUserInfoByEmailPassword(email, pass);
  }

  Future<List<Recipients>> getRecipientsByEmailToken(String email,String pass) async{

     recipientsList.clear();
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


  Future<void> getBankAgentData(String token,String country_id,String service_id) async{

    await  UserRecipientCalls.getBankAgentData(token,country_id,service_id).then((data) {

      bankInfoList.clear();
      localAgentList.clear();
      if(data['status']==true){
        for(Map i in data['bank_info']){
          bankInfoList.add(BankInfo.fromJson(i));
        }
        for(Map i in data['local_agent']){
          localAgentList.add(LocalAgent.fromJson(i));
        }
      }
      else {

      }

    });

    print('bankInfoList.length ${bankInfoList.length}');
    print('localAgentList.length ${localAgentList.length}');
  }
}