class CuponRateModel {
  CuponRateModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  CuponRateModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
CuponRateModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => CuponRateModel(  status: status ?? _status,
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
      String? code, 
      String? reduceFee, 
      String? discountType, 
      String? calculateWith,}){
    _code = code;
    _reduceFee = reduceFee;
    _discountType = discountType;
    _calculateWith = calculateWith;
}

  Data.fromJson(dynamic json) {
    _code = json['code'];
    _reduceFee = json['reduce_fee'];
    _discountType = json['discount_type'];
    _calculateWith = json['calculate_with'];
  }
  String? _code;
  String? _reduceFee;
  String? _discountType;
  String? _calculateWith;
Data copyWith({  String? code,
  String? reduceFee,
  String? discountType,
  String? calculateWith,
}) => Data(  code: code ?? _code,
  reduceFee: reduceFee ?? _reduceFee,
  discountType: discountType ?? _discountType,
  calculateWith: calculateWith ?? _calculateWith,
);
  String? get code => _code;
  String? get reduceFee => _reduceFee;
  String? get discountType => _discountType;
  String? get calculateWith => _calculateWith;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['reduce_fee'] = _reduceFee;
    map['discount_type'] = _discountType;
    map['calculate_with'] = _calculateWith;
    return map;
  }

}