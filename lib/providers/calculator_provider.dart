
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:remit_app/models/service_charge_model.dart';
import '../api_calls/calculator_api_calls.dart';
import '../models/country_models.dart';


class CalculatorProvider extends ChangeNotifier{

  List<Info> getAllCountriesInfoList=[];
  List<CurrencyDetails> getAllCurrencyInfoList=[];
  List<CurrencyDetails> getServiceList=[];
  List<CurrencyDetails> getCurrencyList=[];
  List<CurrencyDetails> getCurrencyList2=[];
  List<ServiceChargeModel> getserviceChargeListofAllCountry=[];
  List<ServiceChargeModel> getserviceChargeList=[];
  double? finalRate;
  static String? invoice;



  //
  Future<List<Info?>> getAllCountryInfo(BuildContext context) async{

    getAllCountriesInfoList.clear();
  await CalculatorAPICalls.getAllCountriesInfo().then((value) {
    if(value['status']==true){
      for(Map i in value['info']){
        getAllCountriesInfoList.add(Info.fromJson(i));
      }
    }
  });
      print('getAllCountriesInfo ${getAllCountriesInfoList.length}');

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

  Future<dynamic> getServiceCharges(amount,country_id,service_id)=>
      CalculatorAPICalls.getServiceCharges(amount, country_id, service_id);

  String? getAllServicesIdByCurrencyDts(CurrencyDetails currencyDetails) {

    String? serviceId;

    getAllCountriesInfoList.forEach((element) {
      if(element.id==currencyDetails.countryTableId){
        element.currencyDetails!.forEach((element) {
          if(currencyDetails.currency==element.currency){
            serviceId=currencyDetails.serviceId;
          }
        });
      }
    });
    print('MY SERVICE ID ${serviceId}');
    return serviceId;
  }


  Future<List<ServiceChargeModel>> getserviceChargeofAllCountry() async{

    // getServiceList.clear();
    getserviceChargeListofAllCountry.clear();
    await CalculatorAPICalls.getServiceChargeofAllCountry().then((value) {

       if(value!=null){
         for(Map i in value){
           getserviceChargeListofAllCountry.add(ServiceChargeModel.fromJson(i));
         }
       }else {
         print('VALUE RETURN HTML');
       }
        //get the final service charge
    });
    print('getserviceChargeListofAllCountry ${getserviceChargeListofAllCountry.length}');


    return getserviceChargeListofAllCountry;
    // print(countryNameList.length);
  }




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


//get Service Charge
  String getServiceFeesFromList(String countryId,String serviceId,String amount) {
    var serviceCharge='0.0';
    getserviceChargeList.clear();
    getserviceChargeListofAllCountry.forEach((element) {
      if(element.countryId==countryId&&element.serviceId==serviceId){
        getserviceChargeList.add(element);
        getserviceChargeList.sort((a, b) => double.parse(a.amount!).compareTo(double.parse(b.amount!)));
      }
    });
    for(int i=0;i<getserviceChargeList.length;i++){
      if(double.parse(amount)>double.parse(getserviceChargeList[i].amount!) &&
          double.parse(amount)<=double.parse(getserviceChargeList[i+1].amount!)){
        if(getserviceChargeList[i+1].type=='1'){
          serviceCharge=getserviceChargeList[i+1].charge!;
        }
        if(getserviceChargeList[i+1].type=='2'){
          serviceCharge=((double.parse(getserviceChargeList[i+1].charge!)/100)*double.parse(amount)).toString();
        }

        print('My amount is ${getserviceChargeList[i+1].charge!}');
      }
    }
    // getserviceChargeList.forEach((element) {
    //   print(element.amount);
    // });
    if(double.parse(amount)>=double.parse(getserviceChargeList.last.amount!)){
      if(getserviceChargeList.last.type=='2'){
        serviceCharge=((double.parse(getserviceChargeList.last.charge!)/100)*double.parse(amount)).toString();
      }
      else{
        serviceCharge=getserviceChargeList.last.charge!;
      }
      serviceCharge=getserviceChargeList.last.charge!;
      print('My Last amount is ${getserviceChargeList.last.charge!}');
    }
    if(double.parse(amount)<=double.parse(getserviceChargeList.first.amount!)){
      if(getserviceChargeList.first.type=='2'){
        serviceCharge=((double.parse(getserviceChargeList.first.charge!)/100)*double.parse(amount)).toString();
      }
      else{
        serviceCharge=getserviceChargeList.first.charge!;
      }

      print('My First amount is ${getserviceChargeList.first.charge!}');
    }

    return serviceCharge;
  }


   void setUserInvoice(String invoiceUser){
    invoice=invoiceUser;
  }
   String? getUserInvoice()=>invoice;
}