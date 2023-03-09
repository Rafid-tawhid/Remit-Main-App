class AppSettingsModel {
  AppSettingsModel({
      bool? success, 
      String? message, 
      List<BasicSettings>? basicSettings,}){
    _success = success;
    _message = message;
    _basicSettings = basicSettings;
}

  AppSettingsModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['basic_settings'] != null) {
      _basicSettings = [];
      json['basic_settings'].forEach((v) {
        _basicSettings?.add(BasicSettings.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<BasicSettings>? _basicSettings;
AppSettingsModel copyWith({  bool? success,
  String? message,
  List<BasicSettings>? basicSettings,
}) => AppSettingsModel(  success: success ?? _success,
  message: message ?? _message,
  basicSettings: basicSettings ?? _basicSettings,
);
  bool? get success => _success;
  String? get message => _message;
  List<BasicSettings>? get basicSettings => _basicSettings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_basicSettings != null) {
      map['basic_settings'] = _basicSettings?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class BasicSettings {
  BasicSettings({
      String? fieldKey, 
      String? fieldValue,}){
    _fieldKey = fieldKey;
    _fieldValue = fieldValue;
}

  BasicSettings.fromJson(dynamic json) {
    _fieldKey = json['field_key'];
    _fieldValue = json['field_value'];
  }
  String? _fieldKey;
  String? _fieldValue;
BasicSettings copyWith({  String? fieldKey,
  String? fieldValue,
}) => BasicSettings(  fieldKey: fieldKey ?? _fieldKey,
  fieldValue: fieldValue ?? _fieldValue,
);
  String? get fieldKey => _fieldKey;
  String? get fieldValue => _fieldValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['field_key'] = _fieldKey;
    map['field_value'] = _fieldValue;
    return map;
  }

}