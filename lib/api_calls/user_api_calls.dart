import 'dart:convert';

import 'package:http/http.dart';
import 'package:remit_app/helper_method/get_user_info.dart';
import 'package:remit_app/pages/launcher_page.dart';

import '../helper_method/admin_config.dart';
import '../models/update_user_profile_model.dart';

String baseUrl='https://remit.daneshexchange.com/staging/';

class UserApiCalls {

   static Future<dynamic> getUserInfoByEmailPassword(email,pass)  async {
     var data;
    await getAuthToken().then((auth) async {
       print('THIS IS REAL TOKEN ${auth['token']}');
       try {
         Response response = await post(
             Uri.parse('${baseUrl}api/user_login'),
             headers: {
               'Authorization': 'Bearer ${auth['token']}',
             },
             body: {
               "email": "$email",
               "password": "$pass",
             });
         if (response.statusCode == 200) {
             data =await jsonDecode(response.body.toString());
        return data;
         }
         if (response.statusCode == 401) {
           data =await jsonDecode(response.body.toString());
           return data;
         }
         else {
           print('Failed........');
           return jsonDecode(response.body.toString());
         }
       } catch (e) {
         print(e.toString());
       }
     });

     print('THIS IS RETURN DATA ${data}');
    return data;
   }



   static Future<dynamic> getAuthToken()  async {
     print('CALLED TOKEN');
    if(AdminAccessConfig.getTokenInfo()==null){
      var data;
      try {
        Response response = await post(
            Uri.parse('${baseUrl}api/get_token'),
            body: {
              "email": AdminAccessConfig.email,
              "password": AdminAccessConfig.password,
              "vendor_name": AdminAccessConfig.vendor_name,
              "name": AdminAccessConfig.name,
              "secret_key": AdminAccessConfig.secret_key,
              "app_id": AdminAccessConfig.app_id
            });
        if (response.statusCode == 200) {
          print('Token called again....');
          data =jsonDecode(response.body.toString());
         //set token for next use fo 40 minutes
          AdminAccessConfig.setTokenInfo(data);
          print(data['message']);
          print(data['token']);

        } else {
          data =jsonDecode(response.body.toString());
          return data;
        }
      } catch (e) {
        print(e.toString());
      }
      return data;
    }
    else {
      return AdminAccessConfig.getTokenInfo();
    }
   }

   static Future<dynamic> getSenderRelationshipData()  async {
     // print('THIS IS Bank agent DATA API $token, $country_id,$service_id');
     var data;
     var user_token;
     await GetUserDetails.getUserToken().then((value) {
       user_token=value;
     });
     await UserApiCalls.getAuthToken().then((auth) async {
       try {
         Response response = await post(
             Uri.parse('${baseUrl}api/get_sender_relationship_data'),
             headers: {
               'Authorization': 'Bearer ${auth['token']}',
             },
             body: {
               "user_token":user_token,
             });
         data =await jsonDecode(response.body.toString());

         return data;

       } catch (e) {
         print(e.toString());
       }
     });

     // print('THIS IS Bank agent DATA ${data}');
     return data;
   }


   static Future<dynamic> getBranchData(country_id,service_id,bank_name,agent_city)  async {
     // print('THIS IS Bank agent DATA API $token, $country_id,$service_id');
     var data;
     var user_token;
     await GetUserDetails.getUserToken().then((value) {
       user_token=value;
     });
     await UserApiCalls.getAuthToken().then((auth) async {
       try {
         Response response = await post(
             Uri.parse('${baseUrl}api/get_branch_data'),
             headers: {
               'Authorization': 'Bearer ${auth['token']}',
             },
             body: {
               "user_token":user_token,
               "country_id":country_id,
               "service_id":service_id,
               "bank_name":bank_name,
               "agent_city":agent_city,
             });
         data =await jsonDecode(response.body.toString());

         return data;

       } catch (e) {
         print(e.toString());
       }
     });

     // print('THIS IS Bank agent DATA ${data}');
     return data;
   }


   static Future<dynamic> update_user_profile(UpdateUserProfile userProfile)  async {
     var data;
     var user_token;


     await GetUserDetails.getUserToken().then((value) {
       user_token=value;
       print('userProfile.toMap() ${userProfile.toMap()}');
     });

     userProfile.user_token=user_token;
     print(userProfile.toString());
     await UserApiCalls.getAuthToken().then((auth) async {
       try {
         Response response = await post(
             Uri.parse('${baseUrl}api/update_user_profile'),
             headers: {
               'Authorization': 'Bearer ${auth['token']}',
             },
             body: userProfile.toMap()
         );
         data =await jsonDecode(response.body.toString());
         print(data);
         return data;

       } catch (e) {
         print('Failed.....');
         print(e.toString());
       }
     });

     // print('THIS IS Bank agent DATA ${data}');
     return data;
   }

   static Future<dynamic> getTransferLog()  async {

     var data;
     var user_token;
     await GetUserDetails.getUserToken().then((value) {
       user_token=value;
     });
     await UserApiCalls.getAuthToken().then((auth) async {
       try {
         Response response = await post(
             Uri.parse('${baseUrl}api/get_transferLog'),
             headers: {
               'Authorization': 'Bearer ${auth['token']}',
             },
             body: {
               "user_token":user_token,
             });
         data =await jsonDecode(response.body.toString());

         return data;

       } catch (e) {
         print(e.toString());
       }
     });

     // print('THIS IS Bank agent DATA ${data}');
     return data;
   }


   static Future<dynamic> getUserInfo()  async {

     var data;
     var user_token;
     await GetUserDetails.getUserToken().then((value) {
       user_token=value;
     });
     await UserApiCalls.getAuthToken().then((auth) async {
       try {
         Response response = await post(
             Uri.parse('${baseUrl}api/get_user_data'),
             headers: {
               'Authorization': 'Bearer ${auth['token']}',
             },
             body: {
               "user_token":user_token,
             });
         data =await jsonDecode(response.body.toString());

         return data;

       } catch (e) {
         print(e.toString());
       }
     });

     // print('THIS IS Bank agent DATA ${data}');
     return data;
   }


}


