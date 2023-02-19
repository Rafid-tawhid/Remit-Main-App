class UserTransferLogModel {
  UserTransferLogModel({
      bool? status, 
      String? message, 
      List<TransferList>? transferList,}){
    _status = status;
    _message = message;
    _transferList = transferList;
}

  UserTransferLogModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['transfer_list'] != null) {
      _transferList = [];
      json['transfer_list'].forEach((v) {
        _transferList?.add(TransferList.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<TransferList>? _transferList;
UserTransferLogModel copyWith({  bool? status,
  String? message,
  List<TransferList>? transferList,
}) => UserTransferLogModel(  status: status ?? _status,
  message: message ?? _message,
  transferList: transferList ?? _transferList,
);
  bool? get status => _status;
  String? get message => _message;
  List<TransferList>? get transferList => _transferList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_transferList != null) {
      map['transfer_list'] = _transferList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class TransferList {
  TransferList({
      num? id, 
      String? itemId, 
      String? itemReference, 
      String? userId, 
      dynamic merchantId, 
      dynamic recieverMerchantId, 
      dynamic transactionId, 
      String? sendCurrencyId, 
      String? receiveCurrencyId, 
      String? receiveCountryId, 
      String? serviceId, 
      dynamic countryServiceId, 
      String? sendCurrRate, 
      String? sendCurr, 
      String? receiveCurr, 
      String? sendAmount, 
      String? fees, 
      String? transactionMethod, 
      String? transactionFees, 
      String? payableAmount, 
      dynamic regularAmount, 
      String? recipientGetAmount, 
      String? rate, 
      dynamic adminId, 
      dynamic adminReply, 
      String? invoice, 
      String? status, 
      String? transferStatus, 
      dynamic localAgentTrStatus, 
      String? paymentStatus, 
      String? merchantStatus, 
      dynamic paidAt, 
      dynamic promoCode, 
      dynamic discount, 
      dynamic discountType, 
      dynamic calculateWith, 
      dynamic discountValue, 
      dynamic discountPrice, 
      String? fundSource, 
      String? purpose, 
      String? senderOccupation, 
      String? beneficiaryRelationship, 
      dynamic userInformation, 
      String? recipientId, 
      String? recipientName, 
      String? recipientEmail, 
      String? recipientContactNo, 
      dynamic bankCode, 
      dynamic bankName, 
      dynamic branchCode, 
      dynamic branchName, 
      dynamic bankAccountNo, 
      dynamic locationId, 
      dynamic payoutBankcode, 
      dynamic typeOfAccount, 
      dynamic localAgentId, 
      String? localAgentName, 
      dynamic localAgentCountry, 
      String? localAgentCity, 
      String? localAgentBranch, 
      String? isFutureTrx, 
      dynamic receivedAt, 
      dynamic remarks, 
      dynamic transactionPaymentType, 
      dynamic deletedAt, 
      String? createdAt, 
      String? updatedAt, 
      num? totalPay, 
      num? totalBaseAmountPay,}){
    _id = id;
    _itemId = itemId;
    _itemReference = itemReference;
    _userId = userId;
    _merchantId = merchantId;
    _recieverMerchantId = recieverMerchantId;
    _transactionId = transactionId;
    _sendCurrencyId = sendCurrencyId;
    _receiveCurrencyId = receiveCurrencyId;
    _receiveCountryId = receiveCountryId;
    _serviceId = serviceId;
    _countryServiceId = countryServiceId;
    _sendCurrRate = sendCurrRate;
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
    _adminId = adminId;
    _adminReply = adminReply;
    _invoice = invoice;
    _status = status;
    _transferStatus = transferStatus;
    _localAgentTrStatus = localAgentTrStatus;
    _paymentStatus = paymentStatus;
    _merchantStatus = merchantStatus;
    _paidAt = paidAt;
    _promoCode = promoCode;
    _discount = discount;
    _discountType = discountType;
    _calculateWith = calculateWith;
    _discountValue = discountValue;
    _discountPrice = discountPrice;
    _fundSource = fundSource;
    _purpose = purpose;
    _senderOccupation = senderOccupation;
    _beneficiaryRelationship = beneficiaryRelationship;
    _userInformation = userInformation;
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
    _localAgentId = localAgentId;
    _localAgentName = localAgentName;
    _localAgentCountry = localAgentCountry;
    _localAgentCity = localAgentCity;
    _localAgentBranch = localAgentBranch;
    _isFutureTrx = isFutureTrx;
    _receivedAt = receivedAt;
    _remarks = remarks;
    _transactionPaymentType = transactionPaymentType;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _totalPay = totalPay;
    _totalBaseAmountPay = totalBaseAmountPay;
}

  TransferList.fromJson(dynamic json) {
    _id = json['id'];
    _itemId = json['item_id'];
    _itemReference = json['item_reference'];
    _userId = json['user_id'];
    _merchantId = json['merchant_id'];
    _recieverMerchantId = json['reciever_merchant_id'];
    _transactionId = json['transaction_id'];
    _sendCurrencyId = json['send_currency_id'];
    _receiveCurrencyId = json['receive_currency_id'];
    _receiveCountryId = json['receive_country_id'];
    _serviceId = json['service_id'];
    _countryServiceId = json['country_service_id'];
    _sendCurrRate = json['send_curr_rate'];
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
    _adminId = json['admin_id'];
    _adminReply = json['admin_reply'];
    _invoice = json['invoice'];
    _status = json['status'];
    _transferStatus = json['transfer_status'];
    _localAgentTrStatus = json['local_agent_tr_status'];
    _paymentStatus = json['payment_status'];
    _merchantStatus = json['merchant_status'];
    _paidAt = json['paid_at'];
    _promoCode = json['promo_code'];
    _discount = json['discount'];
    _discountType = json['discount_type'];
    _calculateWith = json['calculate_with'];
    _discountValue = json['discount_value'];
    _discountPrice = json['discount_price'];
    _fundSource = json['fund_source'];
    _purpose = json['purpose'];
    _senderOccupation = json['sender_occupation'];
    _beneficiaryRelationship = json['beneficiary_relationship'];
    _userInformation = json['user_information'];
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
    _localAgentId = json['local_agent_id'];
    _localAgentName = json['local_agent_name'];
    _localAgentCountry = json['local_agent_country'];
    _localAgentCity = json['local_agent_city'];
    _localAgentBranch = json['local_agent_branch'];
    _isFutureTrx = json['is_future_trx'];
    _receivedAt = json['received_at'];
    _remarks = json['remarks'];
    _transactionPaymentType = json['transaction_payment_type'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _totalPay = json['totalPay'];
    _totalBaseAmountPay = json['totalBaseAmountPay'];
  }
  num? _id;
  String? _itemId;
  String? _itemReference;
  String? _userId;
  dynamic _merchantId;
  dynamic _recieverMerchantId;
  dynamic _transactionId;
  String? _sendCurrencyId;
  String? _receiveCurrencyId;
  String? _receiveCountryId;
  String? _serviceId;
  dynamic _countryServiceId;
  String? _sendCurrRate;
  String? _sendCurr;
  String? _receiveCurr;
  String? _sendAmount;
  String? _fees;
  String? _transactionMethod;
  String? _transactionFees;
  String? _payableAmount;
  dynamic _regularAmount;
  String? _recipientGetAmount;
  String? _rate;
  dynamic _adminId;
  dynamic _adminReply;
  String? _invoice;
  String? _status;
  String? _transferStatus;
  dynamic _localAgentTrStatus;
  String? _paymentStatus;
  String? _merchantStatus;
  dynamic _paidAt;
  dynamic _promoCode;
  dynamic _discount;
  dynamic _discountType;
  dynamic _calculateWith;
  dynamic _discountValue;
  dynamic _discountPrice;
  String? _fundSource;
  String? _purpose;
  String? _senderOccupation;
  String? _beneficiaryRelationship;
  dynamic _userInformation;
  String? _recipientId;
  String? _recipientName;
  String? _recipientEmail;
  String? _recipientContactNo;
  dynamic _bankCode;
  dynamic _bankName;
  dynamic _branchCode;
  dynamic _branchName;
  dynamic _bankAccountNo;
  dynamic _locationId;
  dynamic _payoutBankcode;
  dynamic _typeOfAccount;
  dynamic _localAgentId;
  String? _localAgentName;
  dynamic _localAgentCountry;
  String? _localAgentCity;
  String? _localAgentBranch;
  String? _isFutureTrx;
  dynamic _receivedAt;
  dynamic _remarks;
  dynamic _transactionPaymentType;
  dynamic _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  num? _totalPay;
  num? _totalBaseAmountPay;
TransferList copyWith({  num? id,
  String? itemId,
  String? itemReference,
  String? userId,
  dynamic merchantId,
  dynamic recieverMerchantId,
  dynamic transactionId,
  String? sendCurrencyId,
  String? receiveCurrencyId,
  String? receiveCountryId,
  String? serviceId,
  dynamic countryServiceId,
  String? sendCurrRate,
  String? sendCurr,
  String? receiveCurr,
  String? sendAmount,
  String? fees,
  String? transactionMethod,
  String? transactionFees,
  String? payableAmount,
  dynamic regularAmount,
  String? recipientGetAmount,
  String? rate,
  dynamic adminId,
  dynamic adminReply,
  String? invoice,
  String? status,
  String? transferStatus,
  dynamic localAgentTrStatus,
  String? paymentStatus,
  String? merchantStatus,
  dynamic paidAt,
  dynamic promoCode,
  dynamic discount,
  dynamic discountType,
  dynamic calculateWith,
  dynamic discountValue,
  dynamic discountPrice,
  String? fundSource,
  String? purpose,
  String? senderOccupation,
  String? beneficiaryRelationship,
  dynamic userInformation,
  String? recipientId,
  String? recipientName,
  String? recipientEmail,
  String? recipientContactNo,
  dynamic bankCode,
  dynamic bankName,
  dynamic branchCode,
  dynamic branchName,
  dynamic bankAccountNo,
  dynamic locationId,
  dynamic payoutBankcode,
  dynamic typeOfAccount,
  dynamic localAgentId,
  String? localAgentName,
  dynamic localAgentCountry,
  String? localAgentCity,
  String? localAgentBranch,
  String? isFutureTrx,
  dynamic receivedAt,
  dynamic remarks,
  dynamic transactionPaymentType,
  dynamic deletedAt,
  String? createdAt,
  String? updatedAt,
  num? totalPay,
  num? totalBaseAmountPay,
}) => TransferList(  id: id ?? _id,
  itemId: itemId ?? _itemId,
  itemReference: itemReference ?? _itemReference,
  userId: userId ?? _userId,
  merchantId: merchantId ?? _merchantId,
  recieverMerchantId: recieverMerchantId ?? _recieverMerchantId,
  transactionId: transactionId ?? _transactionId,
  sendCurrencyId: sendCurrencyId ?? _sendCurrencyId,
  receiveCurrencyId: receiveCurrencyId ?? _receiveCurrencyId,
  receiveCountryId: receiveCountryId ?? _receiveCountryId,
  serviceId: serviceId ?? _serviceId,
  countryServiceId: countryServiceId ?? _countryServiceId,
  sendCurrRate: sendCurrRate ?? _sendCurrRate,
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
  adminId: adminId ?? _adminId,
  adminReply: adminReply ?? _adminReply,
  invoice: invoice ?? _invoice,
  status: status ?? _status,
  transferStatus: transferStatus ?? _transferStatus,
  localAgentTrStatus: localAgentTrStatus ?? _localAgentTrStatus,
  paymentStatus: paymentStatus ?? _paymentStatus,
  merchantStatus: merchantStatus ?? _merchantStatus,
  paidAt: paidAt ?? _paidAt,
  promoCode: promoCode ?? _promoCode,
  discount: discount ?? _discount,
  discountType: discountType ?? _discountType,
  calculateWith: calculateWith ?? _calculateWith,
  discountValue: discountValue ?? _discountValue,
  discountPrice: discountPrice ?? _discountPrice,
  fundSource: fundSource ?? _fundSource,
  purpose: purpose ?? _purpose,
  senderOccupation: senderOccupation ?? _senderOccupation,
  beneficiaryRelationship: beneficiaryRelationship ?? _beneficiaryRelationship,
  userInformation: userInformation ?? _userInformation,
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
  localAgentId: localAgentId ?? _localAgentId,
  localAgentName: localAgentName ?? _localAgentName,
  localAgentCountry: localAgentCountry ?? _localAgentCountry,
  localAgentCity: localAgentCity ?? _localAgentCity,
  localAgentBranch: localAgentBranch ?? _localAgentBranch,
  isFutureTrx: isFutureTrx ?? _isFutureTrx,
  receivedAt: receivedAt ?? _receivedAt,
  remarks: remarks ?? _remarks,
  transactionPaymentType: transactionPaymentType ?? _transactionPaymentType,
  deletedAt: deletedAt ?? _deletedAt,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  totalPay: totalPay ?? _totalPay,
  totalBaseAmountPay: totalBaseAmountPay ?? _totalBaseAmountPay,
);
  num? get id => _id;
  String? get itemId => _itemId;
  String? get itemReference => _itemReference;
  String? get userId => _userId;
  dynamic get merchantId => _merchantId;
  dynamic get recieverMerchantId => _recieverMerchantId;
  dynamic get transactionId => _transactionId;
  String? get sendCurrencyId => _sendCurrencyId;
  String? get receiveCurrencyId => _receiveCurrencyId;
  String? get receiveCountryId => _receiveCountryId;
  String? get serviceId => _serviceId;
  dynamic get countryServiceId => _countryServiceId;
  String? get sendCurrRate => _sendCurrRate;
  String? get sendCurr => _sendCurr;
  String? get receiveCurr => _receiveCurr;
  String? get sendAmount => _sendAmount;
  String? get fees => _fees;
  String? get transactionMethod => _transactionMethod;
  String? get transactionFees => _transactionFees;
  String? get payableAmount => _payableAmount;
  dynamic get regularAmount => _regularAmount;
  String? get recipientGetAmount => _recipientGetAmount;
  String? get rate => _rate;
  dynamic get adminId => _adminId;
  dynamic get adminReply => _adminReply;
  String? get invoice => _invoice;
  String? get status => _status;
  String? get transferStatus => _transferStatus;
  dynamic get localAgentTrStatus => _localAgentTrStatus;
  String? get paymentStatus => _paymentStatus;
  String? get merchantStatus => _merchantStatus;
  dynamic get paidAt => _paidAt;
  dynamic get promoCode => _promoCode;
  dynamic get discount => _discount;
  dynamic get discountType => _discountType;
  dynamic get calculateWith => _calculateWith;
  dynamic get discountValue => _discountValue;
  dynamic get discountPrice => _discountPrice;
  String? get fundSource => _fundSource;
  String? get purpose => _purpose;
  String? get senderOccupation => _senderOccupation;
  String? get beneficiaryRelationship => _beneficiaryRelationship;
  dynamic get userInformation => _userInformation;
  String? get recipientId => _recipientId;
  String? get recipientName => _recipientName;
  String? get recipientEmail => _recipientEmail;
  String? get recipientContactNo => _recipientContactNo;
  dynamic get bankCode => _bankCode;
  dynamic get bankName => _bankName;
  dynamic get branchCode => _branchCode;
  dynamic get branchName => _branchName;
  dynamic get bankAccountNo => _bankAccountNo;
  dynamic get locationId => _locationId;
  dynamic get payoutBankcode => _payoutBankcode;
  dynamic get typeOfAccount => _typeOfAccount;
  dynamic get localAgentId => _localAgentId;
  String? get localAgentName => _localAgentName;
  dynamic get localAgentCountry => _localAgentCountry;
  String? get localAgentCity => _localAgentCity;
  String? get localAgentBranch => _localAgentBranch;
  String? get isFutureTrx => _isFutureTrx;
  dynamic get receivedAt => _receivedAt;
  dynamic get remarks => _remarks;
  dynamic get transactionPaymentType => _transactionPaymentType;
  dynamic get deletedAt => _deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get totalPay => _totalPay;
  num? get totalBaseAmountPay => _totalBaseAmountPay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['item_id'] = _itemId;
    map['item_reference'] = _itemReference;
    map['user_id'] = _userId;
    map['merchant_id'] = _merchantId;
    map['reciever_merchant_id'] = _recieverMerchantId;
    map['transaction_id'] = _transactionId;
    map['send_currency_id'] = _sendCurrencyId;
    map['receive_currency_id'] = _receiveCurrencyId;
    map['receive_country_id'] = _receiveCountryId;
    map['service_id'] = _serviceId;
    map['country_service_id'] = _countryServiceId;
    map['send_curr_rate'] = _sendCurrRate;
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
    map['admin_id'] = _adminId;
    map['admin_reply'] = _adminReply;
    map['invoice'] = _invoice;
    map['status'] = _status;
    map['transfer_status'] = _transferStatus;
    map['local_agent_tr_status'] = _localAgentTrStatus;
    map['payment_status'] = _paymentStatus;
    map['merchant_status'] = _merchantStatus;
    map['paid_at'] = _paidAt;
    map['promo_code'] = _promoCode;
    map['discount'] = _discount;
    map['discount_type'] = _discountType;
    map['calculate_with'] = _calculateWith;
    map['discount_value'] = _discountValue;
    map['discount_price'] = _discountPrice;
    map['fund_source'] = _fundSource;
    map['purpose'] = _purpose;
    map['sender_occupation'] = _senderOccupation;
    map['beneficiary_relationship'] = _beneficiaryRelationship;
    map['user_information'] = _userInformation;
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
    map['local_agent_id'] = _localAgentId;
    map['local_agent_name'] = _localAgentName;
    map['local_agent_country'] = _localAgentCountry;
    map['local_agent_city'] = _localAgentCity;
    map['local_agent_branch'] = _localAgentBranch;
    map['is_future_trx'] = _isFutureTrx;
    map['received_at'] = _receivedAt;
    map['remarks'] = _remarks;
    map['transaction_payment_type'] = _transactionPaymentType;
    map['deleted_at'] = _deletedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['totalPay'] = _totalPay;
    map['totalBaseAmountPay'] = _totalBaseAmountPay;
    return map;
  }

}