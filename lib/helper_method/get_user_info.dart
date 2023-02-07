import 'package:remit_app/models/user_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUserDetails {
  static Data? userProfileModel;
  static String? token;
  static String? email;


  static Future<void> setUserInfo(Data user)async {
    userProfileModel=user;
    print('set user ${userProfileModel!.username}');
  }
  static getUserInfo(){
    print('get user ${userProfileModel!.username}');
    return userProfileModel;
  }

  static Future<void> setUserMailAndToken(String email,String token)async {
    final pref=await SharedPreferences.getInstance();
    print('TOKEN : $token');
    pref.setString("mail", email);
    pref.setString("token", token);
    email=pref.getString("mail")!;
    token=pref.getString("token")!;
  }
  static Future<String?> getUserMail()async{
    final pref=await SharedPreferences.getInstance();
    return pref.getString("mail");
  }
  static Future<String?> getUserToken()async{
    final pref=await SharedPreferences.getInstance();
    return pref.getString("token");
  }

}