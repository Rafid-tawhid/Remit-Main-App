import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:remit_app/models/service_charge_model.dart';
import 'package:remit_app/models/submit_calculator_model.dart';
import '../models/country_models.dart';
import '../models/cupon_rate_model.dart';
import 'api_calls.dart';

class CalculatorAPICalls{

   // static List<Info> allCountriesInfo=[];
  List<ServiceChargeModel> allServiceCharge=[];

  static Future<dynamic> getAllCountriesInfo()  async {
    var data;
    await UserApiCalls.getAuthToken().then((auth) async {
      print('THIS IS CALCULATOR TOKEN ${auth['token']}');
      try {
        Response response = await get(
            Uri.parse('${baseUrl}api/calculator/get_calculator_data'),
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



  static Future<dynamic> getServiceCharges(amountS,country_idS,service_idS)  async {
    var data;
    print(amountS+country_idS+service_idS);
    await UserApiCalls.getAuthToken().then((auth) async {
      print('THIS IS SERVICE CALCULATION TOKEN ${auth['token']}');
      try {
        Response response = await post(
          Uri.parse('${baseUrl}api/calculator/service_charges'),
          headers: {
            'Authorization': 'Bearer ${auth['token']}',
          },
          body: {
            "amount" : amountS,
            "country_id":country_idS,
            "service_id":service_idS,
          }
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


  static Future<CuponRateModel?> getCuponDetails(String cuponCode) async {
    var data;
    CuponRateModel? cuponRateModel;
    await UserApiCalls.getAuthToken().then((auth) async {
      print('THIS IS SERVICE Cupon TOKEN ${auth['token']}');
      try {
        Response response = await post(
            Uri.parse('${baseUrl}api/get_coupon'),
            headers: {
              'Authorization': 'Bearer ${auth['token']}',
            },
            body: {
              "promo_code" : cuponCode,
            }
        );
        if (response.statusCode == 200) {
          data =await jsonDecode(response.body.toString());
          cuponRateModel=CuponRateModel.fromJson(data);
          return cuponRateModel;
        }
        else {
          print('Failed........');
          return cuponRateModel;
        }
      } catch (e) {
        print(e.toString());
      }
    });

    return cuponRateModel;
  }

  static Future<dynamic> sendCalculatorSubmitInfo(SubmitCalculatorModel model) async {
    print(model.toMap());
    var data;
    await UserApiCalls.getAuthToken().then((auth) async {
      print('THIS IS Submit calculator TOKEN ${auth['token']}');
      try {
        Response response = await post(
            Uri.parse('${baseUrl}api/submit_calculator'),
            headers: {
              'Authorization': 'Bearer ${auth['token']}',
            },
            body: model.toMap());
            data =await jsonDecode(response.body.toString());
            print(data.toString());
            return data;

      } catch (e) {
        print(e.toString());
      }
    });

    return data;
  }


  static Future<dynamic> getSendMoneyDataAfterSubmit(String token,String invoice) async {

    var data;
    await UserApiCalls.getAuthToken().then((auth) async {
      print('THIS IS SendMoney calculator TOKEN ${auth['token']}');
      try {
        Response response = await post(
            Uri.parse('${baseUrl}api/get_sendMoney_data'),
            headers: {
              'Authorization': 'Bearer ${auth['token']}',
            },
            body: {
              "user_token":token,
              "sendMoney_invoice":invoice
            });
        data =await jsonDecode(response.body.toString());
        print(data.toString());
        return data;

      } catch (e) {
        print(e.toString());
      }
    });

    return data;
  }


  static Future<dynamic?> getServiceChargeofAllCountry() async {
    var data;

    await UserApiCalls.getAuthToken().then((auth) async {
      print('THIS IS SERVICE Charge TOKEN ${auth['token']}');
      try {
        Response response = await get(
            Uri.parse('${baseUrl}api/calculator/get_service_charges'),
            headers: {
              'Authorization': 'Bearer ${auth['token']}',
            },
            // body: {
            //   "promo_code" : cuponCode,
            // }
        );
        print(response.body.toString());
        if (response.statusCode == 200) {
          data =await jsonDecode(response.body.toString());

          // cuponRateModel=CuponRateModel.fromJson(data);
          return data;
        }
        else {
          print('Failed........Here');
          return data;
        }
      } catch (e) {
        print(e.toString());
      }
    });

    return data;
  }

}