class CountryModels {
  CountryModels({
      bool? status, 
      List<Info>? info,}){
    _status = status;
    _info = info;
}


  @override
  String toString() {
    return 'CountryModels{_status: $_status, _info: $_info}';
  }

  CountryModels.fromJson(dynamic json) {
    _status = json['status'];
    if (json['info'] != null) {
      _info = [];
      json['info'].forEach((v) {
        _info?.add(Info.fromJson(v));
      });
    }
  }
  bool? _status;
  List<Info>? _info;
CountryModels copyWith({  bool? status,
  List<Info>? info,
}) => CountryModels(  status: status ?? _status,
  info: info ?? _info,
);
  bool? get status => _status;
  List<Info>? get info => _info;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_info != null) {
      map['info'] = _info?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Info {
  Info({
      String? id, 
      String? name, 
      String? code, 
      String? image, 
      List<CurrencyDetails>? currencyDetails,}){
    _id = id;
    _name = name;
    _code = code;
    _image = image;
    _currencyDetails = currencyDetails;
}


  @override
  String toString() {
    return 'Info{_id: $_id, _name: $_name, _code: $_code, _image: $_image, _currencyDetails: $_currencyDetails}';
  }

  Info.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _image = json['image'];
    if (json['currency_details'] != null) {
      _currencyDetails = [];
      json['currency_details'].forEach((v) {
        _currencyDetails?.add(CurrencyDetails.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  String? _code;
  String? _image;
  List<CurrencyDetails>? _currencyDetails;
Info copyWith({  String? id,
  String? name,
  String? code,
  String? image,
  List<CurrencyDetails>? currencyDetails,
}) => Info(  id: id ?? _id,
  name: name ?? _name,
  code: code ?? _code,
  image: image ?? _image,
  currencyDetails: currencyDetails ?? _currencyDetails,
);
  String? get id => _id;
  String? get name => _name;
  String? get code => _code;
  String? get image => _image;
  List<CurrencyDetails>? get currencyDetails => _currencyDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['image'] = _image;
    if (_currencyDetails != null) {
      map['currency_details'] = _currencyDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CurrencyDetails {
  CurrencyDetails({
      String? serviceId, 
      String? serviceName, 
      String? countryTableId, 
      String? finalRate, 
      String? manualRate, 
      String? currency, 
      String? currencyId, 
      String? maximumLimit, 
      String? minimumLimit,}){
    _serviceId = serviceId;
    _serviceName = serviceName;
    _countryTableId = countryTableId;
    _finalRate = finalRate;
    _manualRate = manualRate;
    _currency = currency;
    _currencyId = currencyId;
    _maximumLimit = maximumLimit;
    _minimumLimit = minimumLimit;
}

  CurrencyDetails.fromJson(dynamic json) {
    _serviceId = json['service_id'];
    _serviceName = json['service_name'];
    _countryTableId = json['country_table_id'];
    _finalRate = json['final_rate'];
    _manualRate = json['manual_rate'];
    _currency = json['currency'];
    _currencyId = json['currency_id'];
    _maximumLimit = json['maximum_limit'];
    _minimumLimit = json['minimum_limit'];
  }
  String? _serviceId;
  String? _serviceName;
  String? _countryTableId;
  String? _finalRate;
  String? _manualRate;
  String? _currency;
  String? _currencyId;
  String? _maximumLimit;
  String? _minimumLimit;
CurrencyDetails copyWith({  String? serviceId,
  String? serviceName,
  String? countryTableId,
  String? finalRate,
  String? manualRate,
  String? currency,
  String? currencyId,
  String? maximumLimit,
  String? minimumLimit,
}) => CurrencyDetails(  serviceId: serviceId ?? _serviceId,
  serviceName: serviceName ?? _serviceName,
  countryTableId: countryTableId ?? _countryTableId,
  finalRate: finalRate ?? _finalRate,
  manualRate: manualRate ?? _manualRate,
  currency: currency ?? _currency,
  currencyId: currencyId ?? _currencyId,
  maximumLimit: maximumLimit ?? _maximumLimit,
  minimumLimit: minimumLimit ?? _minimumLimit,
);
  String? get serviceId => _serviceId;
  String? get serviceName => _serviceName;
  String? get countryTableId => _countryTableId;
  String? get finalRate => _finalRate;
  String? get manualRate => _manualRate;
  String? get currency => _currency;
  String? get currencyId => _currencyId;
  String? get maximumLimit => _maximumLimit;
  String? get minimumLimit => _minimumLimit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['service_id'] = _serviceId;
    map['service_name'] = _serviceName;
    map['country_table_id'] = _countryTableId;
    map['final_rate'] = _finalRate;
    map['manual_rate'] = _manualRate;
    map['currency'] = _currency;
    map['currency_id'] = _currencyId;
    map['maximum_limit'] = _maximumLimit;
    map['minimum_limit'] = _minimumLimit;
    return map;
  }

  @override
  String toString() {
    return 'CurrencyDetails{_serviceId: $_serviceId, _serviceName: $_serviceName, _countryTableId: $_countryTableId, _finalRate: $_finalRate, _manualRate: $_manualRate, _currency: $_currency, _currencyId: $_currencyId, _maximumLimit: $_maximumLimit, _minimumLimit: $_minimumLimit}';
  }
}