import 'dart:convert';

import 'package:http/http.dart';

import '../models/recipents_model.dart';
import 'api_calls.dart';

class UserRecipientCalls{
  static Future<dynamic> getRecipientsByEmailToken(email,token)  async {
    var data;
    await UserApiCalls.getAuthToken().then((auth) async {
      try {
        Response response = await post(
            Uri.parse('${baseUrl}api/get_recipients'),
            headers: {
              'Authorization': 'Bearer ${auth['token']}',
            },
            body: {
              "email": "$email",
              "user_token": "$token",
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

  static Future<dynamic> getBankAgentData(token,country_id,service_id)  async {
    print('THIS IS Bank agent DATA API $token, $country_id,$service_id');
    var data;
    await UserApiCalls.getAuthToken().then((auth) async {
      try {
        Response response = await post(
            Uri.parse('${baseUrl}api/get_bank_agent_data'),
            headers: {
              'Authorization': 'Bearer ${auth['token']}',
            },
            body: {
              "user_token":token,
              "country_id": country_id,
              "service_id": service_id,
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