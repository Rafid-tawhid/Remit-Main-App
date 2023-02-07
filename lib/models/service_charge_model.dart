class ServiceChargeModel {
  ServiceChargeModel({
      String? id, 
      String? countryId, 
      String? serviceId, 
      String? amount, 
      String? type, 
      String? charge, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _countryId = countryId;
    _serviceId = serviceId;
    _amount = amount;
    _type = type;
    _charge = charge;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ServiceChargeModel.fromJson(dynamic json) {
    _id = json['id'];
    _countryId = json['country_id'];
    _serviceId = json['service_id'];
    _amount = json['amount'];
    _type = json['type'];
    _charge = json['charge'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _countryId;
  String? _serviceId;
  String? _amount;
  String? _type;
  String? _charge;
  String? _createdAt;
  String? _updatedAt;
ServiceChargeModel copyWith({  String? id,
  String? countryId,
  String? serviceId,
  String? amount,
  String? type,
  String? charge,
  String? createdAt,
  String? updatedAt,
}) => ServiceChargeModel(  id: id ?? _id,
  countryId: countryId ?? _countryId,
  serviceId: serviceId ?? _serviceId,
  amount: amount ?? _amount,
  type: type ?? _type,
  charge: charge ?? _charge,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get countryId => _countryId;
  String? get serviceId => _serviceId;
  String? get amount => _amount;
  String? get type => _type;
  String? get charge => _charge;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['country_id'] = _countryId;
    map['service_id'] = _serviceId;
    map['amount'] = _amount;
    map['type'] = _type;
    map['charge'] = _charge;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

  @override
  String toString() {
    return 'ServiceChargeModel{_id: $_id, _countryId: $_countryId, _serviceId: $_serviceId, _amount: $_amount, _type: $_type, _charge: $_charge, _createdAt: $_createdAt, _updatedAt: $_updatedAt}';
  }
}