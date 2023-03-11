import 'dart:convert';

import 'package:http/http.dart';
import 'package:remit_app/api_calls/user_api_calls.dart';

import '../models/why_choseus_info_model.dart';


class AppInfoApi{

  static Future<dynamic> getAllWebInfo() async {

    var data;
    await UserApiCalls.getAuthToken().then((auth) async {
      print('THIS IS Submit calculator TOKEN ${auth['token']}');
      Response response =
      await get(Uri.parse('${baseUrl}api/about'),
          headers: {
            'Authorization': 'Bearer ${auth['token']}',
          },
          );
      if (response.statusCode == 200) {
        data = await jsonDecode(response.body.toString());

      } else {
        print(response.body);
        data = null;
      }
    });
    return data;
  }
}