class ErrorsModel {
  ErrorsModel({
      bool? success, 
      Errors? errors,}){
    _success = success;
    _errors = errors;
}

  ErrorsModel.fromJson(dynamic json) {
    _success = json['success'];
    _errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
  bool? _success;
  Errors? _errors;
ErrorsModel copyWith({  bool? success,
  Errors? errors,
}) => ErrorsModel(  success: success ?? _success,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  Errors? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_errors != null) {
      map['errors'] = _errors?.toJson();
    }
    return map;
  }

}

class Errors {
  Errors({
      List<String>? email, 
      List<String>? password,}){
    _email = email;
    _password = password;
}

  Errors.fromJson(dynamic json) {
    _email = json['email'] != null ? json['email'].cast<String>() : [];
    _password = json['password'] != null ? json['password'].cast<String>() : [];
  }
  List<String>? _email;
  List<String>? _password;
Errors copyWith({  List<String>? email,
  List<String>? password,
}) => Errors(  email: email ?? _email,
  password: password ?? _password,
);
  List<String>? get email => _email;
  List<String>? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }

}