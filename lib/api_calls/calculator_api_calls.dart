import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/country_margin_rate.dart';
import '../models/country_models.dart';

class CalculatorAPICalls{

  static List<CountryModels> countryInfoList=[];
  static List<CountryMarginRate> countryCourencyRateList=[];

  static Future<List<CountryModels>> getAllCountriesInfo() async{
    final response=await http.get(Uri.parse('http://remit.daneshexchange.com/staging/api/country'));
    final data=jsonDecode(response.body.toString());
    for(Map i in data){
      countryInfoList.add(CountryModels.fromJson(i));
    }

    return countryInfoList;

  }

  static Future<List<CountryMarginRate>> getAllCountriesCurrency() async{
    final response=await http.get(Uri.parse('http://remit.daneshexchange.com/staging/api/margin_rate'));
    final data=jsonDecode(response.body.toString());
    for(Map i in data){
      countryCourencyRateList.add(CountryMarginRate.fromJson(i));
    }
    return countryCourencyRateList;
  }

  static Future<Map<String,dynamic>> getRateByCountryId(amount,country_id,service_id) async{

    print(amount);
    print(country_id);
    print(service_id);
    var data;
    try{
      Response response=await post(
        Uri.parse('https://remit.daneshexchange.com/staging/api/service_charges'),
        body: {
          // 'access_token':'rafid@pencilbox.edu.bd',
          'amount':amount,
          'country_id':country_id,
          'service_id':service_id
        }
      );
      if(response.statusCode==200){
        data=jsonDecode(response.body.toString());
        print(data.toString());
      }
      else {
        print('Failed.....');
      }
    }
    catch (e){
      print(e.toString());
    }

    return data;
  }




}