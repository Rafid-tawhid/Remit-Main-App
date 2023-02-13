class UserProfileModel {
  UserProfileModel({
      bool? success, 
      String? message, 
      Data? data, 
      CustomerDetails? customerDetails, 
      String? userToken,}){
    _success = success;
    _message = message;
    _data = data;
    _customerDetails = customerDetails;
    _userToken = userToken;
}

  UserProfileModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _customerDetails = json['customer_details'] != null ? CustomerDetails.fromJson(json['customer_details']) : null;
    _userToken = json['user_token'];
  }
  bool? _success;
  String? _message;
  Data? _data;
  CustomerDetails? _customerDetails;
  String? _userToken;
UserProfileModel copyWith({  bool? success,
  String? message,
  Data? data,
  CustomerDetails? customerDetails,
  String? userToken,
}) => UserProfileModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
  customerDetails: customerDetails ?? _customerDetails,
  userToken: userToken ?? _userToken,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;
  CustomerDetails? get customerDetails => _customerDetails;
  String? get userToken => _userToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_customerDetails != null) {
      map['customer_details'] = _customerDetails?.toJson();
    }
    map['user_token'] = _userToken;
    return map;
  }

}

class CustomerDetails {
  CustomerDetails({
      String? id, 
      String? userId, 
      String? salutation, 
      String? firstName, 
      dynamic middleName, 
      String? lastName, 
      String? telephone, 
      String? emailAddress, 
      String? gender, 
      String? residentalAddress, 
      String? unitFlat, 
      String? state, 
      String? city, 
      String? streetName, 
      String? streetNumber, 
      String? postalCode, 
      String? birthDate, 
      String? country, 
      String? countryOfBirth, 
      String? nationality, 
      String? verificationId, 
      String? verificationStatus, 
      String? firstVerificationIdType, 
      dynamic firstVerificationIdNo, 
      dynamic firstVerificationIssuingJurisdiction, 
      String? firstVerificationCountry, 
      String? firstVerificationCardNo, 
      String? firstVerificationIssueDate, 
      String? firstVerificationExpiryDate, 
      String? secondVerificationIdType, 
      dynamic thirdVerificationIdType, 
      dynamic fourthVerificationIdType, 
      String? secondVerificationIdNo, 
      dynamic licenceFrontImage, 
      dynamic licenceBackImage, 
      String? passportImage, 
      dynamic browserDetails, 
      String? overallReverifyStatus, 
      String? verifyDate, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _salutation = salutation;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _telephone = telephone;
    _emailAddress = emailAddress;
    _gender = gender;
    _residentalAddress = residentalAddress;
    _unitFlat = unitFlat;
    _state = state;
    _city = city;
    _streetName = streetName;
    _streetNumber = streetNumber;
    _postalCode = postalCode;
    _birthDate = birthDate;
    _country = country;
    _countryOfBirth = countryOfBirth;
    _nationality = nationality;
    _verificationId = verificationId;
    _verificationStatus = verificationStatus;
    _firstVerificationIdType = firstVerificationIdType;
    _firstVerificationIdNo = firstVerificationIdNo;
    _firstVerificationIssuingJurisdiction = firstVerificationIssuingJurisdiction;
    _firstVerificationCountry = firstVerificationCountry;
    _firstVerificationCardNo = firstVerificationCardNo;
    _firstVerificationIssueDate = firstVerificationIssueDate;
    _firstVerificationExpiryDate = firstVerificationExpiryDate;
    _secondVerificationIdType = secondVerificationIdType;
    _thirdVerificationIdType = thirdVerificationIdType;
    _fourthVerificationIdType = fourthVerificationIdType;
    _secondVerificationIdNo = secondVerificationIdNo;
    _licenceFrontImage = licenceFrontImage;
    _licenceBackImage = licenceBackImage;
    _passportImage = passportImage;
    _browserDetails = browserDetails;
    _overallReverifyStatus = overallReverifyStatus;
    _verifyDate = verifyDate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CustomerDetails.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _salutation = json['salutation'];
    _firstName = json['first_name'];
    _middleName = json['middle_name'];
    _lastName = json['last_name'];
    _telephone = json['telephone'];
    _emailAddress = json['email_address'];
    _gender = json['gender'];
    _residentalAddress = json['residental_address'];
    _unitFlat = json['unit_flat'];
    _state = json['state'];
    _city = json['city'];
    _streetName = json['streetName'];
    _streetNumber = json['streetNumber'];
    _postalCode = json['postal_code'];
    _birthDate = json['birth_date'];
    _country = json['country'];
    _countryOfBirth = json['country_of_birth'];
    _nationality = json['nationality'];
    _verificationId = json['verification_id'];
    _verificationStatus = json['verification_status'];
    _firstVerificationIdType = json['first_verification_id_type'];
    _firstVerificationIdNo = json['first_verification_id_no'];
    _firstVerificationIssuingJurisdiction = json['first_verification_issuing_jurisdiction'];
    _firstVerificationCountry = json['first_verification_country'];
    _firstVerificationCardNo = json['first_verification_card_no'];
    _firstVerificationIssueDate = json['first_verification_issue_date'];
    _firstVerificationExpiryDate = json['first_verification_expiry_date'];
    _secondVerificationIdType = json['second_verification_id_type'];
    _thirdVerificationIdType = json['third_verification_id_type'];
    _fourthVerificationIdType = json['fourth_verification_id_type'];
    _secondVerificationIdNo = json['second_verification_id_no'];
    _licenceFrontImage = json['licence_front_image'];
    _licenceBackImage = json['licence_back_image'];
    _passportImage = json['passport_image'];
    _browserDetails = json['browser_details'];
    _overallReverifyStatus = json['overall_reverify_status'];
    _verifyDate = json['verify_date'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _userId;
  String? _salutation;
  String? _firstName;
  dynamic _middleName;
  String? _lastName;
  String? _telephone;
  String? _emailAddress;
  String? _gender;
  String? _residentalAddress;
  String? _unitFlat;
  String? _state;
  String? _city;
  String? _streetName;
  String? _streetNumber;
  String? _postalCode;
  String? _birthDate;
  String? _country;
  String? _countryOfBirth;
  String? _nationality;
  String? _verificationId;
  String? _verificationStatus;
  String? _firstVerificationIdType;
  dynamic _firstVerificationIdNo;
  dynamic _firstVerificationIssuingJurisdiction;
  String? _firstVerificationCountry;
  String? _firstVerificationCardNo;
  String? _firstVerificationIssueDate;
  String? _firstVerificationExpiryDate;
  String? _secondVerificationIdType;
  dynamic _thirdVerificationIdType;
  dynamic _fourthVerificationIdType;
  String? _secondVerificationIdNo;
  dynamic _licenceFrontImage;
  dynamic _licenceBackImage;
  String? _passportImage;
  dynamic _browserDetails;
  String? _overallReverifyStatus;
  String? _verifyDate;
  String? _createdAt;
  String? _updatedAt;
CustomerDetails copyWith({  String? id,
  String? userId,
  String? salutation,
  String? firstName,
  dynamic middleName,
  String? lastName,
  String? telephone,
  String? emailAddress,
  String? gender,
  String? residentalAddress,
  String? unitFlat,
  String? state,
  String? city,
  String? streetName,
  String? streetNumber,
  String? postalCode,
  String? birthDate,
  String? country,
  String? countryOfBirth,
  String? nationality,
  String? verificationId,
  String? verificationStatus,
  String? firstVerificationIdType,
  dynamic firstVerificationIdNo,
  dynamic firstVerificationIssuingJurisdiction,
  String? firstVerificationCountry,
  String? firstVerificationCardNo,
  String? firstVerificationIssueDate,
  String? firstVerificationExpiryDate,
  String? secondVerificationIdType,
  dynamic thirdVerificationIdType,
  dynamic fourthVerificationIdType,
  String? secondVerificationIdNo,
  dynamic licenceFrontImage,
  dynamic licenceBackImage,
  String? passportImage,
  dynamic browserDetails,
  String? overallReverifyStatus,
  String? verifyDate,
  String? createdAt,
  String? updatedAt,
}) => CustomerDetails(  id: id ?? _id,
  userId: userId ?? _userId,
  salutation: salutation ?? _salutation,
  firstName: firstName ?? _firstName,
  middleName: middleName ?? _middleName,
  lastName: lastName ?? _lastName,
  telephone: telephone ?? _telephone,
  emailAddress: emailAddress ?? _emailAddress,
  gender: gender ?? _gender,
  residentalAddress: residentalAddress ?? _residentalAddress,
  unitFlat: unitFlat ?? _unitFlat,
  state: state ?? _state,
  city: city ?? _city,
  streetName: streetName ?? _streetName,
  streetNumber: streetNumber ?? _streetNumber,
  postalCode: postalCode ?? _postalCode,
  birthDate: birthDate ?? _birthDate,
  country: country ?? _country,
  countryOfBirth: countryOfBirth ?? _countryOfBirth,
  nationality: nationality ?? _nationality,
  verificationId: verificationId ?? _verificationId,
  verificationStatus: verificationStatus ?? _verificationStatus,
  firstVerificationIdType: firstVerificationIdType ?? _firstVerificationIdType,
  firstVerificationIdNo: firstVerificationIdNo ?? _firstVerificationIdNo,
  firstVerificationIssuingJurisdiction: firstVerificationIssuingJurisdiction ?? _firstVerificationIssuingJurisdiction,
  firstVerificationCountry: firstVerificationCountry ?? _firstVerificationCountry,
  firstVerificationCardNo: firstVerificationCardNo ?? _firstVerificationCardNo,
  firstVerificationIssueDate: firstVerificationIssueDate ?? _firstVerificationIssueDate,
  firstVerificationExpiryDate: firstVerificationExpiryDate ?? _firstVerificationExpiryDate,
  secondVerificationIdType: secondVerificationIdType ?? _secondVerificationIdType,
  thirdVerificationIdType: thirdVerificationIdType ?? _thirdVerificationIdType,
  fourthVerificationIdType: fourthVerificationIdType ?? _fourthVerificationIdType,
  secondVerificationIdNo: secondVerificationIdNo ?? _secondVerificationIdNo,
  licenceFrontImage: licenceFrontImage ?? _licenceFrontImage,
  licenceBackImage: licenceBackImage ?? _licenceBackImage,
  passportImage: passportImage ?? _passportImage,
  browserDetails: browserDetails ?? _browserDetails,
  overallReverifyStatus: overallReverifyStatus ?? _overallReverifyStatus,
  verifyDate: verifyDate ?? _verifyDate,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get salutation => _salutation;
  String? get firstName => _firstName;
  dynamic get middleName => _middleName;
  String? get lastName => _lastName;
  String? get telephone => _telephone;
  String? get emailAddress => _emailAddress;
  String? get gender => _gender;
  String? get residentalAddress => _residentalAddress;
  String? get unitFlat => _unitFlat;
  String? get state => _state;
  String? get city => _city;
  String? get streetName => _streetName;
  String? get streetNumber => _streetNumber;
  String? get postalCode => _postalCode;
  String? get birthDate => _birthDate;
  String? get country => _country;
  String? get countryOfBirth => _countryOfBirth;
  String? get nationality => _nationality;
  String? get verificationId => _verificationId;
  String? get verificationStatus => _verificationStatus;
  String? get firstVerificationIdType => _firstVerificationIdType;
  dynamic get firstVerificationIdNo => _firstVerificationIdNo;
  dynamic get firstVerificationIssuingJurisdiction => _firstVerificationIssuingJurisdiction;
  String? get firstVerificationCountry => _firstVerificationCountry;
  String? get firstVerificationCardNo => _firstVerificationCardNo;
  String? get firstVerificationIssueDate => _firstVerificationIssueDate;
  String? get firstVerificationExpiryDate => _firstVerificationExpiryDate;
  String? get secondVerificationIdType => _secondVerificationIdType;
  dynamic get thirdVerificationIdType => _thirdVerificationIdType;
  dynamic get fourthVerificationIdType => _fourthVerificationIdType;
  String? get secondVerificationIdNo => _secondVerificationIdNo;
  dynamic get licenceFrontImage => _licenceFrontImage;
  dynamic get licenceBackImage => _licenceBackImage;
  String? get passportImage => _passportImage;
  dynamic get browserDetails => _browserDetails;
  String? get overallReverifyStatus => _overallReverifyStatus;
  String? get verifyDate => _verifyDate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['salutation'] = _salutation;
    map['first_name'] = _firstName;
    map['middle_name'] = _middleName;
    map['last_name'] = _lastName;
    map['telephone'] = _telephone;
    map['email_address'] = _emailAddress;
    map['gender'] = _gender;
    map['residental_address'] = _residentalAddress;
    map['unit_flat'] = _unitFlat;
    map['state'] = _state;
    map['city'] = _city;
    map['streetName'] = _streetName;
    map['streetNumber'] = _streetNumber;
    map['postal_code'] = _postalCode;
    map['birth_date'] = _birthDate;
    map['country'] = _country;
    map['country_of_birth'] = _countryOfBirth;
    map['nationality'] = _nationality;
    map['verification_id'] = _verificationId;
    map['verification_status'] = _verificationStatus;
    map['first_verification_id_type'] = _firstVerificationIdType;
    map['first_verification_id_no'] = _firstVerificationIdNo;
    map['first_verification_issuing_jurisdiction'] = _firstVerificationIssuingJurisdiction;
    map['first_verification_country'] = _firstVerificationCountry;
    map['first_verification_card_no'] = _firstVerificationCardNo;
    map['first_verification_issue_date'] = _firstVerificationIssueDate;
    map['first_verification_expiry_date'] = _firstVerificationExpiryDate;
    map['second_verification_id_type'] = _secondVerificationIdType;
    map['third_verification_id_type'] = _thirdVerificationIdType;
    map['fourth_verification_id_type'] = _fourthVerificationIdType;
    map['second_verification_id_no'] = _secondVerificationIdNo;
    map['licence_front_image'] = _licenceFrontImage;
    map['licence_back_image'] = _licenceBackImage;
    map['passport_image'] = _passportImage;
    map['browser_details'] = _browserDetails;
    map['overall_reverify_status'] = _overallReverifyStatus;
    map['verify_date'] = _verifyDate;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
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
      String? occupation, 
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
      String? apiToken, 
      String? apiTokenCreatedAt, 
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
    _apiToken = apiToken;
    _apiTokenCreatedAt = apiTokenCreatedAt;
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
    _apiToken = json['api_token'];
    _apiTokenCreatedAt = json['api_token_created_at'];
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
  String? _occupation;
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
  String? _apiToken;
  String? _apiTokenCreatedAt;
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
  String? occupation,
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
  String? apiToken,
  String? apiTokenCreatedAt,
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
  apiToken: apiToken ?? _apiToken,
  apiTokenCreatedAt: apiTokenCreatedAt ?? _apiTokenCreatedAt,
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
  String? get occupation => _occupation;
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
  String? get apiToken => _apiToken;
  String? get apiTokenCreatedAt => _apiTokenCreatedAt;
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
    map['api_token'] = _apiToken;
    map['api_token_created_at'] = _apiTokenCreatedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['fullname'] = _fullname;
    map['mobile'] = _mobile;
    map['profileName'] = _profileName;
    map['photo'] = _photo;
    return map;
  }

}