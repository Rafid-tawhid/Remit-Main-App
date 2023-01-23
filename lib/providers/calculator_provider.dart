
import 'package:flutter/material.dart';
import '../api_calls/calculator_api_calls.dart';
import '../models/country_models.dart';


class CalculatorProvider extends ChangeNotifier{

  List<Info> getAllCountriesInfoList=[];
  List<CurrencyDetails> getAllCurrencyInfoList=[];
  List<CurrencyDetails> getServiceList=[];
  List<CurrencyDetails> getCurrencyList=[];
  List<CurrencyDetails> getCurrencyList2=[];
  double? finalRate;
  //
  Future<List<Info>> getAllCountryInfo() async{

    print('CALLED PROVIDER');
    getAllCountriesInfoList.clear();
  await CalculatorAPICalls.getAllCountriesInfo().then((value) {
    if(value['status']==true){
      for(Map i in value['info']){
        getAllCountriesInfoList.add(Info.fromJson(i));
      }
    }
  });
      print('getAllCountriesInfo ${getAllCountriesInfoList.length}');
      // countryInfoList.forEach((element) {
      //   if(element.status=='1'){
      //     countryNameList.add(element.name!);
      //     countryInfoList2.add(element);
      //   }
      // });


    return getAllCountriesInfoList;
    // print(countryNameList.length);
  }
  //
  List<CurrencyDetails> getAllServicesByCurrencyDts(List<CurrencyDetails> currencyDetails) {

    getServiceList.clear();
        currencyDetails.forEach((details) {
          if(!doesServiceExists(details.serviceName!)==true){
            getServiceList.add(details);
          }
        });
    print('SERVICE LIST SIZE ${getServiceList.length}');
    notifyListeners();
    return getServiceList;
  }


  List<CurrencyDetails> getAllCurrencyByCurrencyDts(CurrencyDetails currencyDetails) {

    getCurrencyList.clear();
    getCurrencyList2.clear();
    getAllCountriesInfoList.forEach((country) {
        if(country.id==currencyDetails.countryTableId){
          getCurrencyList2.addAll(country.currencyDetails!);
          getCurrencyList2.forEach((element) {
            if(!doesCurrencyExists(element.currency!)==true){
              getCurrencyList.add(element);
            }
          });
        }

    });
    print('Currency LIST SIZE ${getCurrencyList.length}');
    notifyListeners();
    return getCurrencyList;
  }


  double? getFinalRate(String countryTableId, String serviceId,String currency) {
    print('TableId $countryTableId');
    print('ServiceId $serviceId');
    print('CurrencyId $currency');

    getAllCountriesInfoList.forEach((country) {
      if(country.id==countryTableId){
        country.currencyDetails!.forEach((currency_details) {
          if(currency_details.currency==currency&&currency_details.serviceId==serviceId){
            finalRate=double.parse(currency_details.finalRate!);
            print('finalRate $finalRate');
          }
        });

      }
    });
    return finalRate;
  }




  //
  // Future<List<CountryMarginRate>> getCurrencyByCountryName(String name) async{
  //
  //   countryCurrencyList.clear();
  //   countryCurrencyList2.clear();
  //   countryCurrencyList=await CalculatorAPICalls.getAllCountriesCurrency();
  //   countryCurrencyList.forEach((element) {
  //     if(element.country==name&&!doesCurrencyExists(element.currency!)){
  //       countryCurrencyList2.add(element);
  //     }
  //   });
  //   notifyListeners();
  //   print('countryCurrencyList ${countryCurrencyList.length}');
  //   return countryCurrencyList;
  // }
  //
  // Future<List<CountryMarginRate>> getFirstCallInfo(String name) async{
  //
  //   firstCountryList.clear();
  //   firstCountryList2.clear();
  //   firstCountryList=await CalculatorAPICalls.getAllCountriesCurrency();
  //   firstCountryList.forEach((element) {
  //     if(element.country==name){
  //       firstCountryList2.add(element);
  //     }
  //   });
  //   notifyListeners();
  //
  //   return firstCountryList2;
  // }
  //
  //
  //
  // Future<CountryMarginRate?> getMinAndMaxRateByCountryTblId(String country_id,String service) async{
  //
  //   var allCountryRate=await CalculatorAPICalls.getAllCountriesCurrency();
  //   allCountryRate.forEach((element) {
  //     if(element.countryTableId==country_id&&element.serviceName==service){
  //       minMaxofCountry=element;
  //     }
  //   });
  //   notifyListeners();
  //
  //   return minMaxofCountry;
  // }
  //
  // double getCurrencyRateByCountryNameServiceCurrency(String name,String serviceName,String currency) {
  //   double currencyRate=0.0;
  //   countryCurrencyList.forEach((element){
  //     if(element.country==name&&element.serviceName==serviceName&&element.currency==currency){
  //       currencyRate=  double.parse(element.finalRate!);
  //       notifyListeners();
  //     }
  //   });
  //   notifyListeners();
  //   return currencyRate;
  // }
  //
  // String getCurrencyNameCountryName(String name) {
  //
  //   String currencyName='MYR';
  //   countryCurrencyList.forEach((element){
  //     if(element.country==name){
  //       currencyName=element.currency!;
  //     }
  //   });
  //   notifyListeners();
  //   return currencyName;
  // }
  //
  //
  //
  // Future<Map<String, dynamic>> getRateByCountryId(amount,country_id,service_id)=>
  //     CalculatorAPICalls.getRateByCountryId(amount, country_id, service_id);






  bool doesServiceExists(String name) {
    bool tag = false;
    for (var n in getServiceList) {
      if(name == n.serviceName) {
        tag = true;
        break;
      }
    }
    return tag;
  }


  bool doesCurrencyExists(String name) {
    bool tag = false;
    for (var n in getCurrencyList) {
      if(name == n.currency) {
        tag = true;
        break;
      }
    }
    return tag;
  }
}