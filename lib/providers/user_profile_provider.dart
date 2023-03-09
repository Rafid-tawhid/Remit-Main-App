import 'package:flutter/cupertino.dart';
import 'package:remit_app/api_calls/user_api_calls.dart';
import 'package:remit_app/models/bank_agent_data_model.dart';
import 'package:remit_app/models/get_branch_data_model.dart';
import 'package:remit_app/models/payment_method.dart';
import 'package:remit_app/models/recipents_model.dart';

import '../api_calls/user_recipients_calls.dart';
import '../models/app_settings_model.dart';
import '../models/sender_relationship_model.dart';
import '../models/track_transfer_model.dart';
import '../models/user_transfer_log_model.dart';

class UserProfileProvider extends ChangeNotifier{

  List<Recipients> recipientsList=[];
  List<String> recipientsNameList=[];
  List<BankInfo> bankInfoList=[];
  List<LocalAgent> localAgentList=[];

  List<SenderOccupation> senderRelationshipOccupationList=[];
  List<BeneficiaryRelationship> senderRelationshipBeneficiaryList=[];
  List<SourceOfFund> senderRelationshipSourceOfFundList=[];
  List<SendingPurpose> senderRelationshipSendingPurposeList=[];

  List<BranchInfo> branchInfoList=[];
  List<LocalAgentBranch> localagentBranchList=[];
  List<String> localagentNameListByBranchName=[];
  List<String> branchNameListByLocalAgent=[];
  List<String> branchNameListByCityName=[];
  List<String> agentNameListByBranch=[];
  Data? senderRelationshipdata;


  List<TransferList> transferLogList=[];

  List<PaymentMethods> paymentMethodList=[];

  List<TrackTransfer> trackTransferList=[];
  List<BasicSettings> basicSettingsList=[];


  Future<List<BasicSettings>> getAppSettings() async{

    await UserApiCalls.getAppSettings().then((value) {

      print(value['basic_settings']);
         for(Map i in value['basic_settings']){
           basicSettingsList.add(BasicSettings.fromJson(i));
         }


     });

     return basicSettingsList;
  }


   Future<dynamic> getUserInfoByEmailPassword(email,pass){
    return UserApiCalls.getUserInfoByEmailPassword(email, pass);
  }





  Future<List<Recipients>> getRecipientsByEmailToken(String email,String pass) async{

     recipientsList.clear();
      await UserRecipientCalls.getRecipientsByEmailToken(email,pass).then((data) {

      if(data['status']==true){
        for(Map i in data['recipients']){
          recipientsList.add(Recipients.fromJson(i));
          notifyListeners();
        }
        recipientsList.forEach((element) {
          recipientsNameList.add(element.firstname!);
          notifyListeners();
        });
        return recipientsList;
      }
      else {
        return recipientsList;
      }

    });

    return recipientsList;
  }


  Future<dynamic> getBankAgentData(String token,String country_id,String service_id) async{

    var value;

    await UserRecipientCalls.getBankAgentData(token,country_id,service_id).then((data) {


      if(data!=null){
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
        value=data;
      }
      else {
        value=data;
      }

    });

    print('bankInfoList.length ${bankInfoList.length}');
    print('localAgentList.length ${localAgentList.length}');

    return value;
  }

  Future<void> getSenderRelationshipData() async {
    await  UserApiCalls.getSenderRelationshipData().then((data) {

      senderRelationshipOccupationList.clear();
      senderRelationshipBeneficiaryList.clear();
      senderRelationshipSourceOfFundList.clear();
      senderRelationshipSendingPurposeList.clear();
      if(data['status']==true){
       senderRelationshipdata=Data.fromJson(data['data']);

       senderRelationshipOccupationList.addAll(senderRelationshipdata!.senderOccupation!);
       senderRelationshipBeneficiaryList.addAll(senderRelationshipdata!.beneficiaryRelationship!);
       senderRelationshipSourceOfFundList.addAll(senderRelationshipdata!.sourceOfFund!);
       senderRelationshipSendingPurposeList.addAll(senderRelationshipdata!.sendingPurpose!);
       // senderRelationshipdata!.senderOccupation!.forEach((element) {
       //   senderRelationshipOccupationList.add(element);
       // });
      }


      else {

      }

    });
  }

   Future<dynamic> getBranchDataByBankName(country_id,service_id,bank_name,agent_city)async{
     print(country_id+service_id+bank_name+agent_city);
     var value;
    await  UserApiCalls.getBranchData(country_id, service_id, bank_name, '').then((data) {
      if(data!=null){
        if(data['status']==true){
          print(data.toString());
          branchInfoList.clear();
          localagentBranchList.clear();
          for(Map i in data['branch_info']){
            branchInfoList.add(BranchInfo.fromJson(i));
          }
          for(Map i in data['local_agent_branch']){
            localagentBranchList.add(LocalAgentBranch.fromJson(i));
          }
          notifyListeners();

          value=data;

        }
      }
      else {
        print(data.toString());
        value=null;
      }
    });

    return value;
  }



  Future<dynamic> getBranchDataByCityName(country_id,service_id,agent_city)async{
    print(country_id+service_id+agent_city);
    await  UserApiCalls.getBranchData(country_id, service_id, '', agent_city).then((data) {

      if(data['status']==true){
        print(data.toString());
        branchInfoList.clear();
        localagentBranchList.clear();
        for(Map i in data['branch_info']){
          branchInfoList.add(BranchInfo.fromJson(i));
        }
        for(Map i in data['local_agent_branch']){
          localagentBranchList.add(LocalAgentBranch.fromJson(i));
        }

        print('localAgentList.length) ${localagentBranchList.length}');
        notifyListeners();
      }

      else {
        print('Fake..........');
        print(data.toString());
      }

    });
  }


  Future<List<TransferList>> getUserTransferLog() async {
    await  UserApiCalls.getTransferLog().then((data) {

      transferLogList.clear();
      if(data['status']==true){
        for(Map i in data['transfer_list']){
          transferLogList.add(TransferList.fromJson(i));
        }
        print('transferLogList.length ${transferLogList.length}');

        return transferLogList;
      }
      else {
        return transferLogList;
      }

    });

    return transferLogList;
  }


  List<String?> getLocalAgentNameByBranchName(String branchName){
    localagentNameListByBranchName.clear();
     localagentBranchList.forEach((element) {
       if(element.agentBranch==branchName){
         localagentNameListByBranchName.add(element.agentName!);
       }
     });
     notifyListeners();
     return localagentNameListByBranchName;
  }


  List<String?> getBranchNameByLocalAgentName(){
    branchNameListByLocalAgent.clear();
    branchInfoList.forEach((element) {
      branchNameListByLocalAgent.add(element.branch!);
    });
    notifyListeners();
    return branchNameListByLocalAgent;
  }

  List<String?> getBranchNameByCityName(String agentCity){
    branchNameListByCityName.clear();
    localagentBranchList.forEach((element) {
      if(element.agentCity==agentCity)
        {
          branchNameListByCityName.add(element.agentBranch!);
        }
    });
    notifyListeners();
    print('branchNameListByCityName ${branchNameListByCityName.length}');
    return branchNameListByCityName;
  }

  List<String?> getAgentNameByBranchName(String branchName){
    agentNameListByBranch.clear();
    localagentBranchList.forEach((element) {
      if(element.agentBranch==branchName)
      {
        agentNameListByBranch.add(element.agentName!);
      }
    });
    notifyListeners();
    print('agentNameListByBranch ${agentNameListByBranch.length}');
    return agentNameListByBranch;
  }

  Future<List<PaymentMethods>> getPaymentMethodList() async {
    await  UserApiCalls.getPaymentMethodData().then((data) {
      paymentMethodList.clear();
      if(data['status']==true){
        for(Map i in data['payment_methods']){
          paymentMethodList.add(PaymentMethods.fromJson(i));
        }
        print('paymentMethodList.length ${paymentMethodList.length}');

        return paymentMethodList;
      }
      else {
        return paymentMethodList;
      }

    });

    return paymentMethodList;
  }

  Future<List<TrackTransfer>> getTransferInfoByTransferId(String transferId) async {
    await  UserApiCalls.trackATransfer(transferId).then((data) {
      if(data['status']==true){
        print(data['message']);

        for(Map i in data['track_transfer']){
          trackTransferList.add(TrackTransfer.fromJson(i));
        }
        notifyListeners();
      }
      else {
        print('THIS IS CALLING........');
        return trackTransferList;
      }
      notifyListeners();
    });
    print('THIS IS CALLING........ ${trackTransferList.length}');
    return trackTransferList;
  }


}