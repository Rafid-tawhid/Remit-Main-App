class CuponResponseModel {
  CuponResponseModel({
      bool? status, 
      String? message, 
      CouponData? couponData,}){
    _status = status;
    _message = message;
    _couponData = couponData;
}

  CuponResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _couponData = json['coupon_data'] != null ? CouponData.fromJson(json['coupon_data']) : null;
  }
  bool? _status;
  String? _message;
  CouponData? _couponData;
CuponResponseModel copyWith({  bool? status,
  String? message,
  CouponData? couponData,
}) => CuponResponseModel(  status: status ?? _status,
  message: message ?? _message,
  couponData: couponData ?? _couponData,
);
  bool? get status => _status;
  String? get message => _message;
  CouponData? get couponData => _couponData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_couponData != null) {
      map['coupon_data'] = _couponData?.toJson();
    }
    return map;
  }

}

class CouponData {
  CouponData({
      String? promoCode, 
      String? discount, 
      String? discountType, 
      dynamic? discountFee, 
      String? calculateWith, 
      dynamic? discountValue, 
      dynamic? discountPrice, 
      dynamic? feesAfterDiscount, 
      String? rate, 
      dynamic? rateAfterDiscount, 
      dynamic? payableAmountAfterDiscount, 
      dynamic? recipientGetAmount, 
      dynamic? recipientGetAmountDiscount,}){
    _promoCode = promoCode;
    _discount = discount;
    _discountType = discountType;
    _discountFee = discountFee;
    _calculateWith = calculateWith;
    _discountValue = discountValue;
    _discountPrice = discountPrice;
    _feesAfterDiscount = feesAfterDiscount;
    _rate = rate;
    _rateAfterDiscount = rateAfterDiscount;
    _payableAmountAfterDiscount = payableAmountAfterDiscount;
    _recipientGetAmount = recipientGetAmount;
    _recipientGetAmountDiscount = recipientGetAmountDiscount;
}

  CouponData.fromJson(dynamic json) {
    _promoCode = json['promo_code'];
    _discount = json['discount'];
    _discountType = json['discount_type'];
    _discountFee = json['discount_fee'];
    _calculateWith = json['calculate_with'];
    _discountValue = json['discount_value'];
    _discountPrice = json['discount_price'];
    _feesAfterDiscount = json['fees_after_discount'];
    _rate = json['rate'];
    _rateAfterDiscount = json['rate_after_discount'];
    _payableAmountAfterDiscount = json['payable_amount_after_discount'];
    _recipientGetAmount = json['recipient_get_amount'];
    _recipientGetAmountDiscount = json['recipient_get_amount_discount'];
  }
  String? _promoCode;
  String? _discount;
  String? _discountType;
  dynamic? _discountFee;
  String? _calculateWith;
  dynamic? _discountValue;
  dynamic? _discountPrice;
  dynamic? _feesAfterDiscount;
  String? _rate;
  dynamic? _rateAfterDiscount;
  dynamic? _payableAmountAfterDiscount;
  dynamic? _recipientGetAmount;
  dynamic? _recipientGetAmountDiscount;
CouponData copyWith({  String? promoCode,
  String? discount,
  String? discountType,
  dynamic? discountFee,
  String? calculateWith,
  dynamic? discountValue,
  dynamic? discountPrice,
  dynamic? feesAfterDiscount,
  String? rate,
  dynamic? rateAfterDiscount,
  dynamic? payableAmountAfterDiscount,
  dynamic? recipientGetAmount,
  dynamic? recipientGetAmountDiscount,
}) => CouponData(  promoCode: promoCode ?? _promoCode,
  discount: discount ?? _discount,
  discountType: discountType ?? _discountType,
  discountFee: discountFee ?? _discountFee,
  calculateWith: calculateWith ?? _calculateWith,
  discountValue: discountValue ?? _discountValue,
  discountPrice: discountPrice ?? _discountPrice,
  feesAfterDiscount: feesAfterDiscount ?? _feesAfterDiscount,
  rate: rate ?? _rate,
  rateAfterDiscount: rateAfterDiscount ?? _rateAfterDiscount,
  payableAmountAfterDiscount: payableAmountAfterDiscount ?? _payableAmountAfterDiscount,
  recipientGetAmount: recipientGetAmount ?? _recipientGetAmount,
  recipientGetAmountDiscount: recipientGetAmountDiscount ?? _recipientGetAmountDiscount,
);
  String? get promoCode => _promoCode;
  String? get discount => _discount;
  String? get discountType => _discountType;
  dynamic? get discountFee => _discountFee;
  String? get calculateWith => _calculateWith;
  dynamic? get discountValue => _discountValue;
  dynamic? get discountPrice => _discountPrice;
  dynamic? get feesAfterDiscount => _feesAfterDiscount;
  String? get rate => _rate;
  dynamic? get rateAfterDiscount => _rateAfterDiscount;
  dynamic? get payableAmountAfterDiscount => _payableAmountAfterDiscount;
  dynamic? get recipientGetAmount => _recipientGetAmount;
  dynamic? get recipientGetAmountDiscount => _recipientGetAmountDiscount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['promo_code'] = _promoCode;
    map['discount'] = _discount;
    map['discount_type'] = _discountType;
    map['discount_fee'] = _discountFee;
    map['calculate_with'] = _calculateWith;
    map['discount_value'] = _discountValue;
    map['discount_price'] = _discountPrice;
    map['fees_after_discount'] = _feesAfterDiscount;
    map['rate'] = _rate;
    map['rate_after_discount'] = _rateAfterDiscount;
    map['payable_amount_after_discount'] = _payableAmountAfterDiscount;
    map['recipient_get_amount'] = _recipientGetAmount;
    map['recipient_get_amount_discount'] = _recipientGetAmountDiscount;
    return map;
  }

  @override
  String toString() {
    return 'CouponData{_promoCode: $_promoCode, _discount: $_discount, _discountType: $_discountType, _discountFee: $_discountFee, _calculateWith: $_calculateWith, _discountValue: $_discountValue, _discountPrice: $_discountPrice, _feesAfterDiscount: $_feesAfterDiscount, _rate: $_rate, _rateAfterDiscount: $_rateAfterDiscount, _payableAmountAfterDiscount: $_payableAmountAfterDiscount, _recipientGetAmount: $_recipientGetAmount, _recipientGetAmountDiscount: $_recipientGetAmountDiscount}';
  }
}