class SubmitRecipientRelationAgentInfoModel{
  String? userToken;
  String? invoice;
  String? recipientId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? phone;
  String? email;
  String? streetName;
  String? streetCity;
  String? fundSource;
  String? purpose;
  String? senderOccupation;
  String? beneficiaryRelationship;
  String? bankInfo;
  String? bankId;
  String? locationId;
  String? branchInfo;
  String? payoutBankCode;
  String? typeOfAccount;
  String? branchId;
  String? bankAccNumber;
  String? agentName;
  String? agentCity;
  String? agentBranch;

  SubmitRecipientRelationAgentInfoModel(
      {this.userToken,
      this.invoice,
      this.recipientId,
      this.firstName,
      this.middleName,
      this.lastName,
      this.phone,
      this.email,
      this.streetName,
      this.streetCity,
      this.fundSource,
      this.purpose,
      this.senderOccupation,
      this.beneficiaryRelationship,
      this.bankInfo,
      this.bankId,
      this.locationId,
      this.branchInfo,
      this.payoutBankCode,
      this.typeOfAccount,
      this.branchId,
      this.bankAccNumber,
      this.agentName,
      this.agentCity,
      this.agentBranch});

  Map<String,dynamic> toMap(){
    final map=<String,dynamic>{};
    map['user_token']=userToken;
    map['sendMoney_invoice']=invoice;
    map['recipient_id']=recipientId;
    map['recipient_firstname']=firstName;
    map['recipient_middlename']=middleName;
    map['recipient_lastname']=lastName;
    map['recipient_phone']=phone;
    map['recipient_email']=email;
    map['recipient_street_name']=streetName;
    map['recipient_street_city']=streetCity;
    map['fund_source']=fundSource;
    map['purpose']=purpose;
    map['sender_occupation']=senderOccupation;
    map['beneficiary_relationship']=beneficiaryRelationship;
    map['bank_info']=bankInfo;
    map['bank_id']=bankId;
    map['location_id']=locationId;
    map['branch_info']=branchInfo;
    map['payout_bankcode']=payoutBankCode;
    map['type_of_account']=typeOfAccount;
    map['branch_id']=branchId;
    map['bank_acc_number']=bankAccNumber;
    map['agent_name']=agentName;
    map['agent_city']=agentCity;
    map['agent_branch']=agentBranch;

    return map;
  }

}