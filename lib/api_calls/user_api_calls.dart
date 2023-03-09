import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:remit_app/custom_widgits/dialog_widgits.dart';
import 'package:remit_app/custom_widgits/show_error_dialoge.dart';
import 'package:remit_app/helper_method/get_user_info.dart';
import 'package:remit_app/models/app_settings_model.dart';
import 'package:remit_app/pages/launcher_page.dart';

import '../helper_method/admin_config.dart';
import '../models/payment_method.dart';
import '../models/update_user_profile_model.dart';

String baseUrl = 'https://remit.daneshexchange.com/staging/';
// String baseUrl=AdminAccessConfig.base_url!;

class UserApiCalls {
  static Future<dynamic> getAppSettings() async {
    var data;
    var settings;

    try {
      Response response = await get(Uri.parse(
          'https://remit.daneshexchange.com/api/basic/get_basic_configuration'));
      data = await jsonDecode(response.body.toString());
      return data;
    } catch (e) {
      print(e.toString());
    }

    return data;
  }

  // print('THIS IS Bank agent DATA ${data}');

  static Future<dynamic> getUserInfoByEmailPassword(email, pass) async {
    var data;
    await getAuthToken().then((auth) async {
      print('THIS IS REAL TOKEN ${auth['token']}');
      try {
        Response response =
        await post(Uri.parse('${baseUrl}api/user_login'), headers: {
          'Authorization': 'Bearer ${auth['token']}',
        }, body: {
          "email": "$email",
          "password": "$pass",
        });
        if (response.statusCode == 200) {
          data = await jsonDecode(response.body.toString());
          return data;
        }
        if (response.statusCode == 401) {
          data = await jsonDecode(response.body.toString());
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

  static Future<dynamic> getAuthToken() async {
    print('CALLED TOKEN');
    if (AdminAccessConfig.getTokenInfo() == null) {
      var data;
      try {
        Response response =
        await post(Uri.parse('${baseUrl}api/get_token'), body: {
          "email": AdminAccessConfig.email,
          "password": AdminAccessConfig.password,
          "vendor_name": AdminAccessConfig.vendor_name,
          "name": AdminAccessConfig.name,
          "secret_key": AdminAccessConfig.secret_key,
          "app_id": AdminAccessConfig.app_id
        });
        if (response.statusCode == 200) {
          print('Token called again....');
          data = jsonDecode(response.body.toString());
          //set token for next use fo 40 minutes
          AdminAccessConfig.setTokenInfo(data);
          print(data['message']);
          print(data['token']);
        } else {
          EasyLoading.dismiss();
          data = jsonDecode(response.body.toString());
          return data;
        }
      } catch (e) {
        EasyLoading.dismiss();
        print(e.toString());
      }
      return data;
    } else {
      return AdminAccessConfig.getTokenInfo();
    }
  }

  static Future<dynamic> getSenderRelationshipData() async {
    // print('THIS IS Bank agent DATA API $token, $country_id,$service_id');
    var data;
    var user_token;
    await GetUserDetails.getUserToken().then((value) {
      user_token = value;
    });
    await UserApiCalls.getAuthToken().then((auth) async {
      try {
        Response response = await post(
            Uri.parse('${baseUrl}api/get_sender_relationship_data'),
            headers: {
              'Authorization': 'Bearer ${auth['token']}',
            },
            body: {
              "user_token": user_token,
            });
        data = await jsonDecode(response.body.toString());

        return data;
      } catch (e) {
        print(e.toString());
      }
    });

    // print('THIS IS Bank agent DATA ${data}');
    return data;
  }

  static Future<dynamic> getBranchData(country_id, service_id, bank_name,
      agent_city) async {
    // print('THIS IS Bank agent DATA API $token, $country_id,$service_id');
    var data;
    var user_token;
    await GetUserDetails.getUserToken().then((value) {
      user_token = value;
    });
    await UserApiCalls.getAuthToken().then((auth) async {
      Response response =
      await post(Uri.parse('${baseUrl}api/get_branch_data'), headers: {
        'Authorization': 'Bearer ${auth['token']}',
      }, body: {
        "user_token": user_token,
        "country_id": country_id,
        "service_id": service_id,
        "bank_name": bank_name,
        "agent_city": agent_city,
      });
      if (response.statusCode == 200) {
        data = await jsonDecode(response.body.toString());
      } else {
        print(response.body);
        data = null;
      }
    });

    // print('THIS IS Bank agent DATA ${data}');
    return data;
  }

  static Future<dynamic> update_user_profile(
      UpdateUserProfile userProfile) async {
    var data;
    var user_token;

    await GetUserDetails.getUserToken().then((value) {
      user_token = value;
      print('userProfile.toMap() ${userProfile.toMap()}');
    });

    userProfile.user_token = user_token;
    print(userProfile.toString());
    await UserApiCalls.getAuthToken().then((auth) async {
      try {
        Response response =
        await post(Uri.parse('${baseUrl}api/update_user_profile'),
            headers: {
              'Authorization': 'Bearer ${auth['token']}',
            },
            body: userProfile.toMap());
        data = await jsonDecode(response.body.toString());
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

  static Future<dynamic> getTransferLog() async {
    var data;
    var user_token;
    await GetUserDetails.getUserToken().then((value) {
      user_token = value;
    });
    await UserApiCalls.getAuthToken().then((auth) async {
      try {
        Response response =
        await post(Uri.parse('${baseUrl}api/get_transferLog'), headers: {
          'Authorization': 'Bearer ${auth['token']}',
        }, body: {
          "user_token": user_token,
        });
        data = await jsonDecode(response.body.toString());

        return data;
      } catch (e) {
        print(e.toString());
      }
    });

    // print('THIS IS Bank agent DATA ${data}');
    return data;
  }

  static Future<dynamic> getUserInfo() async {
    var data;
    var user_token;
    await GetUserDetails.getUserToken().then((value) {
      user_token = value;
    });
    await UserApiCalls.getAuthToken().then((auth) async {
      try {
        Response response =
        await post(Uri.parse('${baseUrl}api/get_user_data'), headers: {
          'Authorization': 'Bearer ${auth['token']}',
        }, body: {
          "user_token": user_token,
        });
        data = await jsonDecode(response.body.toString());

        return data;
      } catch (e) {
        print(e.toString());
      }
    });

    // print('THIS IS Bank agent DATA ${data}');
    return data;
  }

  static Future<dynamic> getPaymentMethodData() async {
    var data;
    var user_token;
    await GetUserDetails.getUserToken().then((value) {
      user_token = value;
    });
    await UserApiCalls.getAuthToken().then((auth) async {
      try {
        Response response = await post(
            Uri.parse('${baseUrl}api/get_payment_methods_data'),
            headers: {
              'Authorization': 'Bearer ${auth['token']}',
            },
            body: {
              "user_token": user_token,
            });
        data = await jsonDecode(response.body.toString());
        return data;
      } catch (e) {
        print(e.toString());
      }
    });

    // print('THIS IS Bank agent DATA ${data}');
    return data;
  }

  static Future<dynamic> trackATransfer(String trackId) async {
    var data;
    var user_token;
    await GetUserDetails.getUserToken().then((value) {
      user_token = value;
    });
    await UserApiCalls.getAuthToken().then((auth) async {
      try {
        Response response = await post(
            Uri.parse('${baseUrl}api/track_transfer_find'),
            headers: {
              'Authorization': 'Bearer ${auth['token']}',
            },
            body: {
              "transfer_id": trackId,
            });
        data = await jsonDecode(response.body.toString());
        return data;
      } catch (e) {
        print(e.toString());
      }
    });

    // print('THIS IS Bank agent DATA ${data}');
    return data;
  }

  static Future<dynamic> checkOutPaymentItem(String invoice,
      String transferMethod) async {
    var data;
    var user_token;
    await GetUserDetails.getUserToken().then((value) {
      user_token = value;
    });
    await UserApiCalls.getAuthToken().then((auth) async {
      if (auth['success'] == true) {
        try {
          Response response =
          await post(Uri.parse('${baseUrl}api/checkout_payment'), headers: {
            'Authorization': 'Bearer ${auth['token']}',
          }, body: {
            "user_token": user_token,
            "sendMoney_invoice": invoice,
            "transfer_method": transferMethod,
          });
          data = await jsonDecode(response.body.toString());
          return data;
        } catch (e) {
          print(e.toString());
        }
      } else {
        EasyLoading.dismiss();
      }
    });

    // print('THIS IS Bank agent DATA ${data}');
    return data;
  }

  static Future<dynamic> cancelTransfer(String invoice) async {
    var data;
    var user_token;
    await GetUserDetails.getUserToken().then((value) {
      user_token = value;
    });
    await UserApiCalls.getAuthToken().then((auth) async {
      if (auth['success'] == true) {
        try {
          Response response =
          await post(Uri.parse('${baseUrl}api/cancel_transfer'), headers: {
            'Authorization': 'Bearer ${auth['token']}',
          }, body: {
            "user_token": user_token,
            "sendMoney_invoice": invoice,
          });
          data = await jsonDecode(response.body.toString());
          return data;
        } catch (e) {
          print(e.toString());
        }
      } else {
        EasyLoading.dismiss();
      }
    });

    // print('THIS IS Bank agent DATA ${data}');
    return data;
  }

  static Future<Response?> registration_Step1(String email, String conf_email,
      String pass, int terms) async {
    var data;
    var user_token;
    Response? response;
    await GetUserDetails.getUserToken().then((value) {
      user_token = value;
    });
    await UserApiCalls.getAuthToken().then((auth) async {
      if (auth['success'] == true) {
        response = await post(
            Uri.parse('${baseUrl}api/registration_step_1'), headers: {
          'Authorization': 'Bearer ${auth['token']}',
        }, body: {
          "email": email,
          "email_confirmation": conf_email,
          "password": pass,
          "terms_condition": terms.toString(),
        });
      }
      // data = await jsonDecode(response.body.toString())
    });
    return response;
  }
}
