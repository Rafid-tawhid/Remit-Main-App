import 'package:remit_app/models/user_profile_model.dart';

class GetUserDetails {
  static UserProfileModel? userProfileModel;


  static Future<void> setUserInfo(UserProfileModel user)async {
    userProfileModel=user;
    print('set user ${user.profileName}');
  }

 static getUserInfo(){

   print('get user ${userProfileModel!.profileName}');
    return userProfileModel;
  }
}