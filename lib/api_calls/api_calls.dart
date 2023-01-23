import 'dart:convert';

import 'package:http/http.dart';

class LoginApiCalls {
   static Future<dynamic> getUserInfoByEmailPassword(email,pass)  async {
     var data;
     try {
       Response response = await post(
           Uri.parse('http://192.168.95.101/staging/api/login'),
           body: {
             "email": "$email",
             "password": "$pass",
           });
       if (response.statusCode == 200) {
         var data =jsonDecode(response.body.toString());
         print(data['token']);
         Response responses=await post(
             Uri.parse('http://192.168.95.101/staging/api/user-detail'),
             headers: {
               'Content-Type': 'application/json',
               'Accept': 'application/json',
               'Authorization': 'Bearer ${data['token']}',
             }
         );
         if(responses.statusCode==200){
           data=jsonDecode(responses.body.toString());
           return data;
           print(data.toString());
           // data=data2;
           // print('MY VALUE $data');
           //Navigator.pushNamed(context, ShowDataPage.routeName,arguments: data2);
         }
         else{
           print('Failed........2');
           return jsonDecode(responses.body.toString());
         }
       } else {
         print('Failed........');
         return jsonDecode(response.body.toString());

       }
     } catch (e) {
       print(e.toString());
     }

     return data;
   }
}


