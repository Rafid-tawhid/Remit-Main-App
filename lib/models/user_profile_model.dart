class UserProfileModel {
  UserProfileModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  UserProfileModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
UserProfileModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => UserProfileModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      num? id, 
      String? firstname, 
      dynamic middlename, 
      String? lastname, 
      String? username, 
      dynamic adminId, 
      String? merchantId, 
      dynamic referralId, 
      dynamic languageId, 
      String? email, 
      String? phone, 
      String? gender, 
      String? balance, 
      String? image, 
      String? address, 
      dynamic occupation, 
      String? countryOfBirth, 
      dynamic provider, 
      dynamic providerId, 
      String? status, 
      String? blocked, 
      String? identityVerify, 
      String? addressVerify, 
      String? twoFa, 
      String? twoFaVerify, 
      dynamic twoFaCode, 
      String? emailVerification, 
      String? smsVerification, 
      String? documentVerify, 
      dynamic verifyCode, 
      dynamic sentAt, 
      String? lastLogin, 
      dynamic lastLoginIp, 
      String? emailVerifiedAt, 
      String? createdAt, 
      String? updatedAt, 
      String? fullname, 
      String? mobile, 
      String? profileName, 
      String? photo,}){
    _id = id;
    _firstname = firstname;
    _middlename = middlename;
    _lastname = lastname;
    _username = username;
    _adminId = adminId;
    _merchantId = merchantId;
    _referralId = referralId;
    _languageId = languageId;
    _email = email;
    _phone = phone;
    _gender = gender;
    _balance = balance;
    _image = image;
    _address = address;
    _occupation = occupation;
    _countryOfBirth = countryOfBirth;
    _provider = provider;
    _providerId = providerId;
    _status = status;
    _blocked = blocked;
    _identityVerify = identityVerify;
    _addressVerify = addressVerify;
    _twoFa = twoFa;
    _twoFaVerify = twoFaVerify;
    _twoFaCode = twoFaCode;
    _emailVerification = emailVerification;
    _smsVerification = smsVerification;
    _documentVerify = documentVerify;
    _verifyCode = verifyCode;
    _sentAt = sentAt;
    _lastLogin = lastLogin;
    _lastLoginIp = lastLoginIp;
    _emailVerifiedAt = emailVerifiedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _fullname = fullname;
    _mobile = mobile;
    _profileName = profileName;
    _photo = photo;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _firstname = json['firstname'];
    _middlename = json['middlename'];
    _lastname = json['lastname'];
    _username = json['username'];
    _adminId = json['admin_id'];
    _merchantId = json['merchant_id'];
    _referralId = json['referral_id'];
    _languageId = json['language_id'];
    _email = json['email'];
    _phone = json['phone'];
    _gender = json['gender'];
    _balance = json['balance'];
    _image = json['image'];
    _address = json['address'];
    _occupation = json['occupation'];
    _countryOfBirth = json['country_of_birth'];
    _provider = json['provider'];
    _providerId = json['provider_id'];
    _status = json['status'];
    _blocked = json['blocked'];
    _identityVerify = json['identity_verify'];
    _addressVerify = json['address_verify'];
    _twoFa = json['two_fa'];
    _twoFaVerify = json['two_fa_verify'];
    _twoFaCode = json['two_fa_code'];
    _emailVerification = json['email_verification'];
    _smsVerification = json['sms_verification'];
    _documentVerify = json['document_verify'];
    _verifyCode = json['verify_code'];
    _sentAt = json['sent_at'];
    _lastLogin = json['last_login'];
    _lastLoginIp = json['last_login_ip'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _fullname = json['fullname'];
    _mobile = json['mobile'];
    _profileName = json['profileName'];
    _photo = json['photo'];
  }
  num? _id;
  String? _firstname;
  dynamic _middlename;
  String? _lastname;
  String? _username;
  dynamic _adminId;
  String? _merchantId;
  dynamic _referralId;
  dynamic _languageId;
  String? _email;
  String? _phone;
  String? _gender;
  String? _balance;
  String? _image;
  String? _address;
  dynamic _occupation;
  String? _countryOfBirth;
  dynamic _provider;
  dynamic _providerId;
  String? _status;
  String? _blocked;
  String? _identityVerify;
  String? _addressVerify;
  String? _twoFa;
  String? _twoFaVerify;
  dynamic _twoFaCode;
  String? _emailVerification;
  String? _smsVerification;
  String? _documentVerify;
  dynamic _verifyCode;
  dynamic _sentAt;
  String? _lastLogin;
  dynamic _lastLoginIp;
  String? _emailVerifiedAt;
  String? _createdAt;
  String? _updatedAt;
  String? _fullname;
  String? _mobile;
  String? _profileName;
  String? _photo;
Data copyWith({  num? id,
  String? firstname,
  dynamic middlename,
  String? lastname,
  String? username,
  dynamic adminId,
  String? merchantId,
  dynamic referralId,
  dynamic languageId,
  String? email,
  String? phone,
  String? gender,
  String? balance,
  String? image,
  String? address,
  dynamic occupation,
  String? countryOfBirth,
  dynamic provider,
  dynamic providerId,
  String? status,
  String? blocked,
  String? identityVerify,
  String? addressVerify,
  String? twoFa,
  String? twoFaVerify,
  dynamic twoFaCode,
  String? emailVerification,
  String? smsVerification,
  String? documentVerify,
  dynamic verifyCode,
  dynamic sentAt,
  String? lastLogin,
  dynamic lastLoginIp,
  String? emailVerifiedAt,
  String? createdAt,
  String? updatedAt,
  String? fullname,
  String? mobile,
  String? profileName,
  String? photo,
}) => Data(  id: id ?? _id,
  firstname: firstname ?? _firstname,
  middlename: middlename ?? _middlename,
  lastname: lastname ?? _lastname,
  username: username ?? _username,
  adminId: adminId ?? _adminId,
  merchantId: merchantId ?? _merchantId,
  referralId: referralId ?? _referralId,
  languageId: languageId ?? _languageId,
  email: email ?? _email,
  phone: phone ?? _phone,
  gender: gender ?? _gender,
  balance: balance ?? _balance,
  image: image ?? _image,
  address: address ?? _address,
  occupation: occupation ?? _occupation,
  countryOfBirth: countryOfBirth ?? _countryOfBirth,
  provider: provider ?? _provider,
  providerId: providerId ?? _providerId,
  status: status ?? _status,
  blocked: blocked ?? _blocked,
  identityVerify: identityVerify ?? _identityVerify,
  addressVerify: addressVerify ?? _addressVerify,
  twoFa: twoFa ?? _twoFa,
  twoFaVerify: twoFaVerify ?? _twoFaVerify,
  twoFaCode: twoFaCode ?? _twoFaCode,
  emailVerification: emailVerification ?? _emailVerification,
  smsVerification: smsVerification ?? _smsVerification,
  documentVerify: documentVerify ?? _documentVerify,
  verifyCode: verifyCode ?? _verifyCode,
  sentAt: sentAt ?? _sentAt,
  lastLogin: lastLogin ?? _lastLogin,
  lastLoginIp: lastLoginIp ?? _lastLoginIp,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  fullname: fullname ?? _fullname,
  mobile: mobile ?? _mobile,
  profileName: profileName ?? _profileName,
  photo: photo ?? _photo,
);
  num? get id => _id;
  String? get firstname => _firstname;
  dynamic get middlename => _middlename;
  String? get lastname => _lastname;
  String? get username => _username;
  dynamic get adminId => _adminId;
  String? get merchantId => _merchantId;
  dynamic get referralId => _referralId;
  dynamic get languageId => _languageId;
  String? get email => _email;
  String? get phone => _phone;
  String? get gender => _gender;
  String? get balance => _balance;
  String? get image => _image;
  String? get address => _address;
  dynamic get occupation => _occupation;
  String? get countryOfBirth => _countryOfBirth;
  dynamic get provider => _provider;
  dynamic get providerId => _providerId;
  String? get status => _status;
  String? get blocked => _blocked;
  String? get identityVerify => _identityVerify;
  String? get addressVerify => _addressVerify;
  String? get twoFa => _twoFa;
  String? get twoFaVerify => _twoFaVerify;
  dynamic get twoFaCode => _twoFaCode;
  String? get emailVerification => _emailVerification;
  String? get smsVerification => _smsVerification;
  String? get documentVerify => _documentVerify;
  dynamic get verifyCode => _verifyCode;
  dynamic get sentAt => _sentAt;
  String? get lastLogin => _lastLogin;
  dynamic get lastLoginIp => _lastLoginIp;
  String? get emailVerifiedAt => _emailVerifiedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get fullname => _fullname;
  String? get mobile => _mobile;
  String? get profileName => _profileName;
  String? get photo => _photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstname'] = _firstname;
    map['middlename'] = _middlename;
    map['lastname'] = _lastname;
    map['username'] = _username;
    map['admin_id'] = _adminId;
    map['merchant_id'] = _merchantId;
    map['referral_id'] = _referralId;
    map['language_id'] = _languageId;
    map['email'] = _email;
    map['phone'] = _phone;
    map['gender'] = _gender;
    map['balance'] = _balance;
    map['image'] = _image;
    map['address'] = _address;
    map['occupation'] = _occupation;
    map['country_of_birth'] = _countryOfBirth;
    map['provider'] = _provider;
    map['provider_id'] = _providerId;
    map['status'] = _status;
    map['blocked'] = _blocked;
    map['identity_verify'] = _identityVerify;
    map['address_verify'] = _addressVerify;
    map['two_fa'] = _twoFa;
    map['two_fa_verify'] = _twoFaVerify;
    map['two_fa_code'] = _twoFaCode;
    map['email_verification'] = _emailVerification;
    map['sms_verification'] = _smsVerification;
    map['document_verify'] = _documentVerify;
    map['verify_code'] = _verifyCode;
    map['sent_at'] = _sentAt;
    map['last_login'] = _lastLogin;
    map['last_login_ip'] = _lastLoginIp;
    map['email_verified_at'] = _emailVerifiedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['fullname'] = _fullname;
    map['mobile'] = _mobile;
    map['profileName'] = _profileName;
    map['photo'] = _photo;
    return map;
  }

  @override
  String toString() {
    return 'Data{_id: $_id, _firstname: $_firstname, _middlename: $_middlename, _lastname: $_lastname, _username: $_username, _adminId: $_adminId, _merchantId: $_merchantId, _referralId: $_referralId, _languageId: $_languageId, _email: $_email, _phone: $_phone, _gender: $_gender, _balance: $_balance, _image: $_image, _address: $_address, _occupation: $_occupation, _countryOfBirth: $_countryOfBirth, _provider: $_provider, _providerId: $_providerId, _status: $_status, _blocked: $_blocked, _identityVerify: $_identityVerify, _addressVerify: $_addressVerify, _twoFa: $_twoFa, _twoFaVerify: $_twoFaVerify, _twoFaCode: $_twoFaCode, _emailVerification: $_emailVerification, _smsVerification: $_smsVerification, _documentVerify: $_documentVerify, _verifyCode: $_verifyCode, _sentAt: $_sentAt, _lastLogin: $_lastLogin, _lastLoginIp: $_lastLoginIp, _emailVerifiedAt: $_emailVerifiedAt, _createdAt: $_createdAt, _updatedAt: $_updatedAt, _fullname: $_fullname, _mobile: $_mobile, _profileName: $_profileName, _photo: $_photo}';
  }
}
