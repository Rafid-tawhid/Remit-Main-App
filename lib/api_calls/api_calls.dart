import 'dart:convert';

import 'package:http/http.dart';

import '../helper_method/admin_config.dart';

class LoginApiCalls {

   static Future<dynamic> getUserInfoByEmailPassword(email,pass)  async {
     var data;
    await getAuthToken().then((auth) async {
       print('THIS IS REAL TOKEN ${auth['token']}');
       try {
         Response response = await post(
             Uri.parse('https://remit.daneshexchange.com/staging/api/user_login'),
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
         } else {
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
     var data;
     try {
       Response response = await post(
           Uri.parse('https://remit.daneshexchange.com/staging/api/get_token'),
           body: {
             "email": AdminAccessConfig.email,
             "password": AdminAccessConfig.password,
             "vendor_name": AdminAccessConfig.vendor_name,
             "name": AdminAccessConfig.name,
             "secret_key": AdminAccessConfig.secret_key,
             "app_id": AdminAccessConfig.app_id
           });
       if (response.statusCode == 200) {
         data =jsonDecode(response.body.toString());
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
}

// Response responses=await post(
//     Uri.parse('http://192.168.95.29/staging/api/user-detail'),
//     headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer ${data['token']}',
//     }
// );
// if(responses.statusCode==200){
//   data=jsonDecode(responses.body.toString());
//   return data;
//   print(data.toString());
// data=data2;
// print('MY VALUE $data');
//Navigator.pushNamed(context, ShowDataPage.routeName,arguments: data2);
// }
// else{
//   print('Failed........2');
//   return jsonDecode(responses.body.toString());
// }
