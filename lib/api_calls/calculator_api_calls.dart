import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/country_models.dart';
import 'api_calls.dart';

class CalculatorAPICalls{

   // static List<Info> allCountriesInfo=[];


  static Future<dynamic> getAllCountriesInfo()  async {
    var data;
    await LoginApiCalls.getAuthToken().then((auth) async {
      print('THIS IS CALCULATOR TOKEN ${auth['token']}');
      try {
        Response response = await get(
            Uri.parse('https://remit.daneshexchange.com/staging/api/calculator/get_calculator_data'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer ${auth['token']}',
            },
           );
        if (response.statusCode == 200) {
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







}