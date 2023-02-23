class SenderRelationshipModel {
  SenderRelationshipModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  SenderRelationshipModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
SenderRelationshipModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => SenderRelationshipModel(  status: status ?? _status,
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
      List<SenderOccupation>? senderOccupation, 
      List<BeneficiaryRelationship>? beneficiaryRelationship, 
      List<SourceOfFund>? sourceOfFund, 
      List<SendingPurpose>? sendingPurpose,}){
    _senderOccupation = senderOccupation;
    _beneficiaryRelationship = beneficiaryRelationship;
    _sourceOfFund = sourceOfFund;
    _sendingPurpose = sendingPurpose;
}

  Data.fromJson(dynamic json) {
    if (json['sender_occupation'] != null) {
      _senderOccupation = [];
      json['sender_occupation'].forEach((v) {
        _senderOccupation?.add(SenderOccupation.fromJson(v));
      });
    }
    if (json['beneficiary_relationship'] != null) {
      _beneficiaryRelationship = [];
      json['beneficiary_relationship'].forEach((v) {
        _beneficiaryRelationship?.add(BeneficiaryRelationship.fromJson(v));
      });
    }
    if (json['source_of_fund'] != null) {
      _sourceOfFund = [];
      json['source_of_fund'].forEach((v) {
        _sourceOfFund?.add(SourceOfFund.fromJson(v));
      });
    }
    if (json['sending_purpose'] != null) {
      _sendingPurpose = [];
      json['sending_purpose'].forEach((v) {
        _sendingPurpose?.add(SendingPurpose.fromJson(v));
      });
    }
  }
  List<SenderOccupation>? _senderOccupation;
  List<BeneficiaryRelationship>? _beneficiaryRelationship;
  List<SourceOfFund>? _sourceOfFund;
  List<SendingPurpose>? _sendingPurpose;
Data copyWith({  List<SenderOccupation>? senderOccupation,
  List<BeneficiaryRelationship>? beneficiaryRelationship,
  List<SourceOfFund>? sourceOfFund,
  List<SendingPurpose>? sendingPurpose,
}) => Data(  senderOccupation: senderOccupation ?? _senderOccupation,
  beneficiaryRelationship: beneficiaryRelationship ?? _beneficiaryRelationship,
  sourceOfFund: sourceOfFund ?? _sourceOfFund,
  sendingPurpose: sendingPurpose ?? _sendingPurpose,
);
  List<SenderOccupation>? get senderOccupation => _senderOccupation;
  List<BeneficiaryRelationship>? get beneficiaryRelationship => _beneficiaryRelationship;
  List<SourceOfFund>? get sourceOfFund => _sourceOfFund;
  List<SendingPurpose>? get sendingPurpose => _sendingPurpose;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_senderOccupation != null) {
      map['sender_occupation'] = _senderOccupation?.map((v) => v.toJson()).toList();
    }
    if (_beneficiaryRelationship != null) {
      map['beneficiary_relationship'] = _beneficiaryRelationship?.map((v) => v.toJson()).toList();
    }
    if (_sourceOfFund != null) {
      map['source_of_fund'] = _sourceOfFund?.map((v) => v.toJson()).toList();
    }
    if (_sendingPurpose != null) {
      map['sending_purpose'] = _sendingPurpose?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class SendingPurpose {
  SendingPurpose({
      String? id, 
      String? data, 
      String? value, 
      String? code,}){
    _id = id;
    _data = data;
    _value = value;
    _code = code;
}


  @override
  String toString() {
    return 'SendingPurpose{_id: $_id, _data: $_data, _value: $_value, _code: $_code}';
  }

  SendingPurpose.fromJson(dynamic json) {
    _id = json['id'];
    _data = json['DATA'];
    _value = json['VALUE'];
    _code = json['CODE'];
  }
  String? _id;
  String? _data;
  String? _value;
  String? _code;
SendingPurpose copyWith({  String? id,
  String? data,
  String? value,
  String? code,
}) => SendingPurpose(  id: id ?? _id,
  data: data ?? _data,
  value: value ?? _value,
  code: code ?? _code,
);
  String? get id => _id;
  String? get data => _data;
  String? get value => _value;
  String? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['DATA'] = _data;
    map['VALUE'] = _value;
    map['CODE'] = _code;
    return map;
  }

}

class SourceOfFund {
  SourceOfFund({
      String? id, 
      String? data, 
      String? value, 
      String? code,}){
    _id = id;
    _data = data;
    _value = value;
    _code = code;
}


  @override
  String toString() {
    return 'SourceOfFund{_id: $_id, _data: $_data, _value: $_value, _code: $_code}';
  }

  SourceOfFund.fromJson(dynamic json) {
    _id = json['id'];
    _data = json['DATA'];
    _value = json['VALUE'];
    _code = json['CODE'];
  }
  String? _id;
  String? _data;
  String? _value;
  String? _code;
SourceOfFund copyWith({  String? id,
  String? data,
  String? value,
  String? code,
}) => SourceOfFund(  id: id ?? _id,
  data: data ?? _data,
  value: value ?? _value,
  code: code ?? _code,
);
  String? get id => _id;
  String? get data => _data;
  String? get value => _value;
  String? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['DATA'] = _data;
    map['VALUE'] = _value;
    map['CODE'] = _code;
    return map;
  }

}

class BeneficiaryRelationship {
  BeneficiaryRelationship({
      String? id, 
      String? data, 
      String? value, 
      String? code,}){
    _id = id;
    _data = data;
    _value = value;
    _code = code;
}


  @override
  String toString() {
    return 'BeneficiaryRelationship{_id: $_id, _data: $_data, _value: $_value, _code: $_code}';
  }

  BeneficiaryRelationship.fromJson(dynamic json) {
    _id = json['id'];
    _data = json['DATA'];
    _value = json['VALUE'];
    _code = json['CODE'];
  }
  String? _id;
  String? _data;
  String? _value;
  String? _code;
BeneficiaryRelationship copyWith({  String? id,
  String? data,
  String? value,
  String? code,
}) => BeneficiaryRelationship(  id: id ?? _id,
  data: data ?? _data,
  value: value ?? _value,
  code: code ?? _code,
);
  String? get id => _id;
  String? get data => _data;
  String? get value => _value;
  String? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['DATA'] = _data;
    map['VALUE'] = _value;
    map['CODE'] = _code;
    return map;
  }

}

class SenderOccupation {
  SenderOccupation({
      String? id, 
      String? data, 
      String? value, 
      String? code,}){
    _id = id;
    _data = data;
    _value = value;
    _code = code;
}

  SenderOccupation.fromJson(dynamic json) {
    _id = json['id'];
    _data = json['DATA'];
    _value = json['VALUE'];
    _code = json['CODE'];
  }
  String? _id;
  String? _data;
  String? _value;
  String? _code;
SenderOccupation copyWith({  String? id,
  String? data,
  String? value,
  String? code,
}) => SenderOccupation(  id: id ?? _id,
  data: data ?? _data,
  value: value ?? _value,
  code: code ?? _code,
);
  String? get id => _id;
  String? get data => _data;
  String? get value => _value;
  String? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['DATA'] = _data;
    map['VALUE'] = _value;
    map['CODE'] = _code;
    return map;
  }

  @override
  String toString() {
    return 'SenderOccupation{_id: $_id, _data: $_data, _value: $_value, _code: $_code}';
  }
}