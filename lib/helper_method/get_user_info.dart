import 'package:remit_app/models/user_profile_model.dart';

class GetUserDetails {
  static Data? userProfileModel;


  static Future<void> setUserInfo(Data user)async {
    userProfileModel=user;
    print('set user ${userProfileModel!.username}');
  }

 static getUserInfo(){

   print('get user ${userProfileModel!.username}');
    return userProfileModel;
  }
}