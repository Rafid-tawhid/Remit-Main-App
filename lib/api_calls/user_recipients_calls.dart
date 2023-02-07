import 'dart:convert';

import 'package:http/http.dart';

import '../models/recipents_model.dart';
import 'api_calls.dart';

class UserRecipientCalls{
  static Future<dynamic> getRecipientsByEmailPassword(email,pass)  async {
    var data;
    await LoginApiCalls.getAuthToken().then((auth) async {
      try {
        Response response = await post(
            Uri.parse('https://remit.daneshexchange.com/staging/api/get_recipients'),
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
          data =await jsonDecode(response.body.toString());
          return data;
        }
      } catch (e) {
        print(e.toString());
      }
    });

    print('THIS IS RETURN DATA ${data}');
    return data;
  }
}