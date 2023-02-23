import 'package:remit_app/models/get_branch_data_model.dart';
import 'package:remit_app/models/recipents_model.dart';
import 'package:remit_app/models/sender_relationship_model.dart';

import '../models/bank_agent_data_model.dart';
import '../models/calculator_info_model.dart';

class SetCalculatorAndRecipientInfo{
  static CalculatorInfoModel? calculatorInfoModel;

  static String? branchName;
  static String? agentName;
  static String? bankAccNo;

  static Recipients? recipients;
  static LocalAgent? localAgent;
  static BankInfo? bankInfo;
  static BranchInfo? branchInfo;

  static BeneficiaryRelationship? relationship;
  static SenderOccupation? occupation;
  static SourceOfFund? fund;
  static SendingPurpose? purpose;

  static void setCalculatorInfo(CalculatorInfoModel model) {

    calculatorInfoModel=model;
  }

  static CalculatorInfoModel? getCalculatorInfo()=>calculatorInfoModel;


  static void setRecipeintInfo(Recipients recipient) {

    recipients=recipient;
  }

  static Recipients? getRecipientInfo()=>recipients;



  static setSubmitInfoCashPickUp(LocalAgent local_agent,String branch_name,String agent_name){
    localAgent=local_agent;
    branchName=branch_name;
    agentName=agent_name;

  }

  static setSubmitInfoBankTransferInfo(BankInfo bank_info,BranchInfo branch_info){
    bankInfo=bank_info;
    branchInfo=branch_info;
  }

  static setSubmitBankInfoFromCashPicupLocalAgent(BankInfo bank_info){
    bankInfo=bank_info;

  }

  static setSubmitInfoBankTransferBankAccNo(String BankaccNo){
    bankAccNo=BankaccNo;
  }



  static setRecipientRelationShip(BeneficiaryRelationship relationshipA,
      SenderOccupation occupationA,SourceOfFund fundA,SendingPurpose purposeA){
    relationship=relationshipA;
    occupation=occupationA;
    fund=fundA;
    purpose=purposeA;
  }

}