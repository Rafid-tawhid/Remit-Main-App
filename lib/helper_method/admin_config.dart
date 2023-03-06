import '../pages/launcher_page.dart';

class AdminAccessConfig{

 static dynamic tokenData;

  static const String email='rafid@pencilbox.edu.bd';
  static const String password='Rafid123\$';
  static const String vendor_name='bitBirds';
  static const String name='Rafid';
  static const String secret_key='bitBirds';
  static const String app_id='01682832598';
  static String?  appName;
  static String?  apiMode;
  static  String? base_url;

  // static const String base_url='https://remit.daneshexchange.com/';




 static setTokenInfo(dynamic data){
    tokenData=data;
  }

 static dynamic getTokenInfo(){
  print('this method is called..');
  if(myStartTimer==0||myStartTimer<1000){
   print('Time out......');
   tokenData=null;
   return tokenData;
  }
  else {
   return tokenData;
  }
 }


}