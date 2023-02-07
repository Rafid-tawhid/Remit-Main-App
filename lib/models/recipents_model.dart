class RecipentsModel {
  RecipentsModel({
      bool? status, 
      String? message, 
      List<Recipients>? recipients,}){
    _status = status;
    _message = message;
    _recipients = recipients;
}

  RecipentsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['recipients'] != null) {
      _recipients = [];
      json['recipients'].forEach((v) {
        _recipients?.add(Recipients.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Recipients>? _recipients;
RecipentsModel copyWith({  bool? status,
  String? message,
  List<Recipients>? recipients,
}) => RecipentsModel(  status: status ?? _status,
  message: message ?? _message,
  recipients: recipients ?? _recipients,
);
  bool? get status => _status;
  String? get message => _message;
  List<Recipients>? get recipients => _recipients;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_recipients != null) {
      map['recipients'] = _recipients?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Recipients {
  Recipients({
      num? id, 
      String? userId, 
      String? firstname, 
      String? middlename, 
      String? lastname, 
      String? phone, 
      String? email, 
      String? streetName, 
      String? streetCity, 
      String? country,}){
    _id = id;
    _userId = userId;
    _firstname = firstname;
    _middlename = middlename;
    _lastname = lastname;
    _phone = phone;
    _email = email;
    _streetName = streetName;
    _streetCity = streetCity;
    _country = country;
}

  Recipients.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _firstname = json['firstname'];
    _middlename = json['middlename'];
    _lastname = json['lastname'];
    _phone = json['phone'];
    _email = json['email'];
    _streetName = json['street_name'];
    _streetCity = json['street_city'];
    _country = json['country'];
  }
  num? _id;
  String? _userId;
  String? _firstname;
  String? _middlename;
  String? _lastname;
  String? _phone;
  String? _email;
  String? _streetName;
  String? _streetCity;
  String? _country;
Recipients copyWith({  num? id,
  String? userId,
  String? firstname,
  String? middlename,
  String? lastname,
  String? phone,
  String? email,
  String? streetName,
  String? streetCity,
  String? country,
}) => Recipients(  id: id ?? _id,
  userId: userId ?? _userId,
  firstname: firstname ?? _firstname,
  middlename: middlename ?? _middlename,
  lastname: lastname ?? _lastname,
  phone: phone ?? _phone,
  email: email ?? _email,
  streetName: streetName ?? _streetName,
  streetCity: streetCity ?? _streetCity,
  country: country ?? _country,
);
  num? get id => _id;
  String? get userId => _userId;
  String? get firstname => _firstname;
  String? get middlename => _middlename;
  String? get lastname => _lastname;
  String? get phone => _phone;
  String? get email => _email;
  String? get streetName => _streetName;
  String? get streetCity => _streetCity;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['firstname'] = _firstname;
    map['middlename'] = _middlename;
    map['lastname'] = _lastname;
    map['phone'] = _phone;
    map['email'] = _email;
    map['street_name'] = _streetName;
    map['street_city'] = _streetCity;
    map['country'] = _country;
    return map;
  }

  @override
  String toString() {
    return 'Recipients{_id: $_id, _userId: $_userId, _firstname: $_firstname, _middlename: $_middlename, _lastname: $_lastname, _phone: $_phone, _email: $_email, _streetName: $_streetName, _streetCity: $_streetCity, _country: $_country}';
  }
}