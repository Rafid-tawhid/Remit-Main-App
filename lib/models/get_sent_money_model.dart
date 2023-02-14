class GetSentMoneyModel {
  GetSentMoneyModel({
      bool? status, 
      String? message, 
      SendMoney? sendMoney,}){
    _status = status;
    _message = message;
    _sendMoney = sendMoney;
}

  GetSentMoneyModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _sendMoney = json['sendMoney'] != null ? SendMoney.fromJson(json['sendMoney']) : null;
  }
  bool? _status;
  String? _message;
  SendMoney? _sendMoney;
GetSentMoneyModel copyWith({  bool? status,
  String? message,
  SendMoney? sendMoney,
}) => GetSentMoneyModel(  status: status ?? _status,
  message: message ?? _message,
  sendMoney: sendMoney ?? _sendMoney,
);
  bool? get status => _status;
  String? get message => _message;
  SendMoney? get sendMoney => _sendMoney;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_sendMoney != null) {
      map['sendMoney'] = _sendMoney?.toJson();
    }
    return map;
  }

}

class SendMoney {
  SendMoney({
      String? id, 
      String? itemId, 
      String? itemReference, 
      String? userId, 
      String? sendCurrencyId, 
      String? receiveCurrencyId, 
      String? receiveCountryId, 
      String? serviceId, 
      String? sendCurr, 
      String? receiveCurr, 
      String? sendAmount, 
      String? fees, 
      dynamic transactionMethod, 
      dynamic transactionFees, 
      String? payableAmount, 
      dynamic regularAmount, 
      String? recipientGetAmount, 
      String? rate, 
      String? invoice, 
      String? transferStatus, 
      dynamic localAgentTrStatus, 
      dynamic promoCode, 
      dynamic discount, 
      dynamic discountType, 
      dynamic calculateWith, 
      dynamic discountValue, 
      dynamic discountPrice, 
      dynamic fundSource, 
      dynamic purpose, 
      dynamic beneficiaryRelationship, 
      String? recipientId, 
      dynamic recipientName, 
      dynamic recipientEmail, 
      dynamic recipientContactNo, 
      dynamic bankCode, 
      dynamic bankName, 
      dynamic branchCode, 
      dynamic branchName, 
      dynamic bankAccountNo, 
      dynamic locationId, 
      dynamic payoutBankcode, 
      dynamic typeOfAccount, 
      dynamic localAgentName, 
      dynamic localAgentCountry, 
      dynamic localAgentId, 
      dynamic localAgentCity, 
      dynamic localAgentBranch, 
      dynamic transactionPaymentType,}){
    _id = id;
    _itemId = itemId;
    _itemReference = itemReference;
    _userId = userId;
    _sendCurrencyId = sendCurrencyId;
    _receiveCurrencyId = receiveCurrencyId;
    _receiveCountryId = receiveCountryId;
    _serviceId = serviceId;
    _sendCurr = sendCurr;
    _receiveCurr = receiveCurr;
    _sendAmount = sendAmount;
    _fees = fees;
    _transactionMethod = transactionMethod;
    _transactionFees = transactionFees;
    _payableAmount = payableAmount;
    _regularAmount = regularAmount;
    _recipientGetAmount = recipientGetAmount;
    _rate = rate;
    _invoice = invoice;
    _transferStatus = transferStatus;
    _localAgentTrStatus = localAgentTrStatus;
    _promoCode = promoCode;
    _discount = discount;
    _discountType = discountType;
    _calculateWith = calculateWith;
    _discountValue = discountValue;
    _discountPrice = discountPrice;
    _fundSource = fundSource;
    _purpose = purpose;
    _beneficiaryRelationship = beneficiaryRelationship;
    _recipientId = recipientId;
    _recipientName = recipientName;
    _recipientEmail = recipientEmail;
    _recipientContactNo = recipientContactNo;
    _bankCode = bankCode;
    _bankName = bankName;
    _branchCode = branchCode;
    _branchName = branchName;
    _bankAccountNo = bankAccountNo;
    _locationId = locationId;
    _payoutBankcode = payoutBankcode;
    _typeOfAccount = typeOfAccount;
    _localAgentName = localAgentName;
    _localAgentCountry = localAgentCountry;
    _localAgentId = localAgentId;
    _localAgentCity = localAgentCity;
    _localAgentBranch = localAgentBranch;
    _transactionPaymentType = transactionPaymentType;
}

  SendMoney.fromJson(dynamic json) {
    _id = json['id'];
    _itemId = json['item_id'];
    _itemReference = json['item_reference'];
    _userId = json['user_id'];
    _sendCurrencyId = json['send_currency_id'];
    _receiveCurrencyId = json['receive_currency_id'];
    _receiveCountryId = json['receive_country_id'];
    _serviceId = json['service_id'];
    _sendCurr = json['send_curr'];
    _receiveCurr = json['receive_curr'];
    _sendAmount = json['send_amount'];
    _fees = json['fees'];
    _transactionMethod = json['transaction_method'];
    _transactionFees = json['transaction_fees'];
    _payableAmount = json['payable_amount'];
    _regularAmount = json['regular_amount'];
    _recipientGetAmount = json['recipient_get_amount'];
    _rate = json['rate'];
    _invoice = json['invoice'];
    _transferStatus = json['transfer_status'];
    _localAgentTrStatus = json['local_agent_tr_status'];
    _promoCode = json['promo_code'];
    _discount = json['discount'];
    _discountType = json['discount_type'];
    _calculateWith = json['calculate_with'];
    _discountValue = json['discount_value'];
    _discountPrice = json['discount_price'];
    _fundSource = json['fund_source'];
    _purpose = json['purpose'];
    _beneficiaryRelationship = json['beneficiary_relationship'];
    _recipientId = json['recipient_id'];
    _recipientName = json['recipient_name'];
    _recipientEmail = json['recipient_email'];
    _recipientContactNo = json['recipient_contact_no'];
    _bankCode = json['BankCode'];
    _bankName = json['BankName'];
    _branchCode = json['BranchCode'];
    _branchName = json['BranchName'];
    _bankAccountNo = json['BankAccountNo'];
    _locationId = json['location_id'];
    _payoutBankcode = json['payout_bankcode'];
    _typeOfAccount = json['type_of_account'];
    _localAgentName = json['local_agent_name'];
    _localAgentCountry = json['local_agent_country'];
    _localAgentId = json['local_agent_id'];
    _localAgentCity = json['local_agent_city'];
    _localAgentBranch = json['local_agent_branch'];
    _transactionPaymentType = json['transaction_payment_type'];
  }
  String? _id;
  String? _itemId;
  String? _itemReference;
  String? _userId;
  String? _sendCurrencyId;
  String? _receiveCurrencyId;
  String? _receiveCountryId;
  String? _serviceId;
  String? _sendCurr;
  String? _receiveCurr;
  String? _sendAmount;
  String? _fees;
  dynamic _transactionMethod;
  dynamic _transactionFees;
  String? _payableAmount;
  dynamic _regularAmount;
  String? _recipientGetAmount;
  String? _rate;
  String? _invoice;
  String? _transferStatus;
  dynamic _localAgentTrStatus;
  dynamic _promoCode;
  dynamic _discount;
  dynamic _discountType;
  dynamic _calculateWith;
  dynamic _discountValue;
  dynamic _discountPrice;
  dynamic _fundSource;
  dynamic _purpose;
  dynamic _beneficiaryRelationship;
  String? _recipientId;
  dynamic _recipientName;
  dynamic _recipientEmail;
  dynamic _recipientContactNo;
  dynamic _bankCode;
  dynamic _bankName;
  dynamic _branchCode;
  dynamic _branchName;
  dynamic _bankAccountNo;
  dynamic _locationId;
  dynamic _payoutBankcode;
  dynamic _typeOfAccount;
  dynamic _localAgentName;
  dynamic _localAgentCountry;
  dynamic _localAgentId;
  dynamic _localAgentCity;
  dynamic _localAgentBranch;
  dynamic _transactionPaymentType;
SendMoney copyWith({  String? id,
  String? itemId,
  String? itemReference,
  String? userId,
  String? sendCurrencyId,
  String? receiveCurrencyId,
  String? receiveCountryId,
  String? serviceId,
  String? sendCurr,
  String? receiveCurr,
  String? sendAmount,
  String? fees,
  dynamic transactionMethod,
  dynamic transactionFees,
  String? payableAmount,
  dynamic regularAmount,
  String? recipientGetAmount,
  String? rate,
  String? invoice,
  String? transferStatus,
  dynamic localAgentTrStatus,
  dynamic promoCode,
  dynamic discount,
  dynamic discountType,
  dynamic calculateWith,
  dynamic discountValue,
  dynamic discountPrice,
  dynamic fundSource,
  dynamic purpose,
  dynamic beneficiaryRelationship,
  String? recipientId,
  dynamic recipientName,
  dynamic recipientEmail,
  dynamic recipientContactNo,
  dynamic bankCode,
  dynamic bankName,
  dynamic branchCode,
  dynamic branchName,
  dynamic bankAccountNo,
  dynamic locationId,
  dynamic payoutBankcode,
  dynamic typeOfAccount,
  dynamic localAgentName,
  dynamic localAgentCountry,
  dynamic localAgentId,
  dynamic localAgentCity,
  dynamic localAgentBranch,
  dynamic transactionPaymentType,
}) => SendMoney(  id: id ?? _id,
  itemId: itemId ?? _itemId,
  itemReference: itemReference ?? _itemReference,
  userId: userId ?? _userId,
  sendCurrencyId: sendCurrencyId ?? _sendCurrencyId,
  receiveCurrencyId: receiveCurrencyId ?? _receiveCurrencyId,
  receiveCountryId: receiveCountryId ?? _receiveCountryId,
  serviceId: serviceId ?? _serviceId,
  sendCurr: sendCurr ?? _sendCurr,
  receiveCurr: receiveCurr ?? _receiveCurr,
  sendAmount: sendAmount ?? _sendAmount,
  fees: fees ?? _fees,
  transactionMethod: transactionMethod ?? _transactionMethod,
  transactionFees: transactionFees ?? _transactionFees,
  payableAmount: payableAmount ?? _payableAmount,
  regularAmount: regularAmount ?? _regularAmount,
  recipientGetAmount: recipientGetAmount ?? _recipientGetAmount,
  rate: rate ?? _rate,
  invoice: invoice ?? _invoice,
  transferStatus: transferStatus ?? _transferStatus,
  localAgentTrStatus: localAgentTrStatus ?? _localAgentTrStatus,
  promoCode: promoCode ?? _promoCode,
  discount: discount ?? _discount,
  discountType: discountType ?? _discountType,
  calculateWith: calculateWith ?? _calculateWith,
  discountValue: discountValue ?? _discountValue,
  discountPrice: discountPrice ?? _discountPrice,
  fundSource: fundSource ?? _fundSource,
  purpose: purpose ?? _purpose,
  beneficiaryRelationship: beneficiaryRelationship ?? _beneficiaryRelationship,
  recipientId: recipientId ?? _recipientId,
  recipientName: recipientName ?? _recipientName,
  recipientEmail: recipientEmail ?? _recipientEmail,
  recipientContactNo: recipientContactNo ?? _recipientContactNo,
  bankCode: bankCode ?? _bankCode,
  bankName: bankName ?? _bankName,
  branchCode: branchCode ?? _branchCode,
  branchName: branchName ?? _branchName,
  bankAccountNo: bankAccountNo ?? _bankAccountNo,
  locationId: locationId ?? _locationId,
  payoutBankcode: payoutBankcode ?? _payoutBankcode,
  typeOfAccount: typeOfAccount ?? _typeOfAccount,
  localAgentName: localAgentName ?? _localAgentName,
  localAgentCountry: localAgentCountry ?? _localAgentCountry,
  localAgentId: localAgentId ?? _localAgentId,
  localAgentCity: localAgentCity ?? _localAgentCity,
  localAgentBranch: localAgentBranch ?? _localAgentBranch,
  transactionPaymentType: transactionPaymentType ?? _transactionPaymentType,
);
  String? get id => _id;
  String? get itemId => _itemId;
  String? get itemReference => _itemReference;
  String? get userId => _userId;
  String? get sendCurrencyId => _sendCurrencyId;
  String? get receiveCurrencyId => _receiveCurrencyId;
  String? get receiveCountryId => _receiveCountryId;
  String? get serviceId => _serviceId;
  String? get sendCurr => _sendCurr;
  String? get receiveCurr => _receiveCurr;
  String? get sendAmount => _sendAmount;
  String? get fees => _fees;
  dynamic get transactionMethod => _transactionMethod;
  dynamic get transactionFees => _transactionFees;
  String? get payableAmount => _payableAmount;
  dynamic get regularAmount => _regularAmount;
  String? get recipientGetAmount => _recipientGetAmount;
  String? get rate => _rate;
  String? get invoice => _invoice;
  String? get transferStatus => _transferStatus;
  dynamic get localAgentTrStatus => _localAgentTrStatus;
  dynamic get promoCode => _promoCode;
  dynamic get discount => _discount;
  dynamic get discountType => _discountType;
  dynamic get calculateWith => _calculateWith;
  dynamic get discountValue => _discountValue;
  dynamic get discountPrice => _discountPrice;
  dynamic get fundSource => _fundSource;
  dynamic get purpose => _purpose;
  dynamic get beneficiaryRelationship => _beneficiaryRelationship;
  String? get recipientId => _recipientId;
  dynamic get recipientName => _recipientName;
  dynamic get recipientEmail => _recipientEmail;
  dynamic get recipientContactNo => _recipientContactNo;
  dynamic get bankCode => _bankCode;
  dynamic get bankName => _bankName;
  dynamic get branchCode => _branchCode;
  dynamic get branchName => _branchName;
  dynamic get bankAccountNo => _bankAccountNo;
  dynamic get locationId => _locationId;
  dynamic get payoutBankcode => _payoutBankcode;
  dynamic get typeOfAccount => _typeOfAccount;
  dynamic get localAgentName => _localAgentName;
  dynamic get localAgentCountry => _localAgentCountry;
  dynamic get localAgentId => _localAgentId;
  dynamic get localAgentCity => _localAgentCity;
  dynamic get localAgentBranch => _localAgentBranch;
  dynamic get transactionPaymentType => _transactionPaymentType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['item_id'] = _itemId;
    map['item_reference'] = _itemReference;
    map['user_id'] = _userId;
    map['send_currency_id'] = _sendCurrencyId;
    map['receive_currency_id'] = _receiveCurrencyId;
    map['receive_country_id'] = _receiveCountryId;
    map['service_id'] = _serviceId;
    map['send_curr'] = _sendCurr;
    map['receive_curr'] = _receiveCurr;
    map['send_amount'] = _sendAmount;
    map['fees'] = _fees;
    map['transaction_method'] = _transactionMethod;
    map['transaction_fees'] = _transactionFees;
    map['payable_amount'] = _payableAmount;
    map['regular_amount'] = _regularAmount;
    map['recipient_get_amount'] = _recipientGetAmount;
    map['rate'] = _rate;
    map['invoice'] = _invoice;
    map['transfer_status'] = _transferStatus;
    map['local_agent_tr_status'] = _localAgentTrStatus;
    map['promo_code'] = _promoCode;
    map['discount'] = _discount;
    map['discount_type'] = _discountType;
    map['calculate_with'] = _calculateWith;
    map['discount_value'] = _discountValue;
    map['discount_price'] = _discountPrice;
    map['fund_source'] = _fundSource;
    map['purpose'] = _purpose;
    map['beneficiary_relationship'] = _beneficiaryRelationship;
    map['recipient_id'] = _recipientId;
    map['recipient_name'] = _recipientName;
    map['recipient_email'] = _recipientEmail;
    map['recipient_contact_no'] = _recipientContactNo;
    map['BankCode'] = _bankCode;
    map['BankName'] = _bankName;
    map['BranchCode'] = _branchCode;
    map['BranchName'] = _branchName;
    map['BankAccountNo'] = _bankAccountNo;
    map['location_id'] = _locationId;
    map['payout_bankcode'] = _payoutBankcode;
    map['type_of_account'] = _typeOfAccount;
    map['local_agent_name'] = _localAgentName;
    map['local_agent_country'] = _localAgentCountry;
    map['local_agent_id'] = _localAgentId;
    map['local_agent_city'] = _localAgentCity;
    map['local_agent_branch'] = _localAgentBranch;
    map['transaction_payment_type'] = _transactionPaymentType;
    return map;
  }

}