class PaymentMethod {
  PaymentMethod({
      bool? status, 
      String? message, 
      List<PaymentMethods>? paymentMethods,}){
    _status = status;
    _message = message;
    _paymentMethods = paymentMethods;
}

  PaymentMethod.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['payment_methods'] != null) {
      _paymentMethods = [];
      json['payment_methods'].forEach((v) {
        _paymentMethods?.add(PaymentMethods.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<PaymentMethods>? _paymentMethods;
PaymentMethod copyWith({  bool? status,
  String? message,
  List<PaymentMethods>? paymentMethods,
}) => PaymentMethod(  status: status ?? _status,
  message: message ?? _message,
  paymentMethods: paymentMethods ?? _paymentMethods,
);
  bool? get status => _status;
  String? get message => _message;
  List<PaymentMethods>? get paymentMethods => _paymentMethods;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_paymentMethods != null) {
      map['payment_methods'] = _paymentMethods?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class PaymentMethods {
  PaymentMethods({
      String? title, 
      String? value, 
      String? subTitle, 
      String? currency, 
      String? fees, 
      String? description,}){
    _title = title;
    _value = value;
    _subTitle = subTitle;
    _currency = currency;
    _fees = fees;
    _description = description;
}

  PaymentMethods.fromJson(dynamic json) {
    _title = json['title'];
    _value = json['value'];
    _subTitle = json['sub_title'];
    _currency = json['currency'];
    _fees = json['fees'];
    _description = json['description'];
  }
  String? _title;
  String? _value;
  String? _subTitle;
  String? _currency;
  String? _fees;
  String? _description;
PaymentMethods copyWith({  String? title,
  String? value,
  String? subTitle,
  String? currency,
  String? fees,
  String? description,
}) => PaymentMethods(  title: title ?? _title,
  value: value ?? _value,
  subTitle: subTitle ?? _subTitle,
  currency: currency ?? _currency,
  fees: fees ?? _fees,
  description: description ?? _description,
);
  String? get title => _title;
  String? get value => _value;
  String? get subTitle => _subTitle;
  String? get currency => _currency;
  String? get fees => _fees;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['value'] = _value;
    map['sub_title'] = _subTitle;
    map['currency'] = _currency;
    map['fees'] = _fees;
    map['description'] = _description;
    return map;
  }

}