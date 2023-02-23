import 'package:flutter/cupertino.dart';
import 'package:remit_app/api_calls/user_api_calls.dart';
import 'package:remit_app/models/bank_agent_data_model.dart';
import 'package:remit_app/models/get_branch_data_model.dart';
import 'package:remit_app/models/recipents_model.dart';

import '../api_calls/user_recipients_calls.dart';
import '../models/sender_relationship_model.dart';
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
    await  UserApiCalls.getBranchData(country_id, service_id, bank_name, '').then((data) {

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

      }

      else {
        print('Fake..........');
        print(data.toString());
      }

    });
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
}