class CheckoutPaymentModel {
  CheckoutPaymentModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  CheckoutPaymentModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
CheckoutPaymentModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => CheckoutPaymentModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {

  Data({
      String? payId, 
      String? reference, 
      String? depositReference, 
      String? vaAccountNumber, 
      String? vaRoutingNumber, 
      String? contentPayableAmount, 
      String? contentTransactionMethod,}){
    _payId = payId;
    _reference = reference;
    _depositReference = depositReference;
    _vaAccountNumber = vaAccountNumber;
    _vaRoutingNumber = vaRoutingNumber;
    _contentPayableAmount = contentPayableAmount;
    _contentTransactionMethod = contentTransactionMethod;
}

  Data.fromJson(dynamic json) {
    _payId = json['pay_id'];
    _reference = json['reference'];
    _depositReference = json['deposit_reference'];
    _vaAccountNumber = json['va_account_number'];
    _vaRoutingNumber = json['va_routing_number'];
    _contentPayableAmount = json['content_payable_amount'];
    _contentTransactionMethod = json['content_transaction_method'];
  }
  String? _payId;
  String? _reference;
  String? _depositReference;
  String? _vaAccountNumber;
  String? _vaRoutingNumber;
  String? _contentPayableAmount;
  String? _contentTransactionMethod;
Data copyWith({  String? payId,
  String? reference,
  String? depositReference,
  String? vaAccountNumber,
  String? vaRoutingNumber,
  String? contentPayableAmount,
  String? contentTransactionMethod,
}) => Data(  payId: payId ?? _payId,
  reference: reference ?? _reference,
  depositReference: depositReference ?? _depositReference,
  vaAccountNumber: vaAccountNumber ?? _vaAccountNumber,
  vaRoutingNumber: vaRoutingNumber ?? _vaRoutingNumber,
  contentPayableAmount: contentPayableAmount ?? _contentPayableAmount,
  contentTransactionMethod: contentTransactionMethod ?? _contentTransactionMethod,
);
  String? get payId => _payId;
  String? get reference => _reference;
  String? get depositReference => _depositReference;
  String? get vaAccountNumber => _vaAccountNumber;
  String? get vaRoutingNumber => _vaRoutingNumber;
  String? get contentPayableAmount => _contentPayableAmount;
  String? get contentTransactionMethod => _contentTransactionMethod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pay_id'] = _payId;
    map['reference'] = _reference;
    map['deposit_reference'] = _depositReference;
    map['va_account_number'] = _vaAccountNumber;
    map['va_routing_number'] = _vaRoutingNumber;
    map['content_payable_amount'] = _contentPayableAmount;
    map['content_transaction_method'] = _contentTransactionMethod;
    return map;
  }

  @override
  String toString() {
    return 'Data{_payId: $_payId, _reference: $_reference, _depositReference: $_depositReference, _vaAccountNumber: $_vaAccountNumber, _vaRoutingNumber: $_vaRoutingNumber, _contentPayableAmount: $_contentPayableAmount, _contentTransactionMethod: $_contentTransactionMethod}';
  }
}