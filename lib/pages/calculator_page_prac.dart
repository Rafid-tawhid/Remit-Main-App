import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/api_calls/calculator_api_calls.dart';
import 'package:remit_app/helper_method/get_user_info.dart';
import 'package:remit_app/models/submit_calculator_model.dart';
import 'package:remit_app/pages/calculator_page.dart';
import 'package:remit_app/pages/home_page.dart';

import '../api_calls/user_recipients_calls.dart';
import '../colors.dart';
import '../custom_widgits/drawer.dart';
import '../custom_widgits/receiver.dart';
import '../models/calculator_info_model.dart';
import '../models/country_models.dart';
import '../providers/calculator_provider.dart';
import '../providers/user_profile_provider.dart';
import 'login_page.dart';

class CalculatorPage2 extends StatefulWidget {
  const CalculatorPage2({Key? key}) : super(key: key);
  static const String routeName = '/calculator2';

  @override
  State<CalculatorPage2> createState() => _CalculatorPage2State();
}

class _CalculatorPage2State extends State<CalculatorPage2> {
  final sendControler = TextEditingController();
  final receiveControler = TextEditingController();
  final cuponControler = TextEditingController();

  late CalculatorProvider provider;
  late UserProfileProvider userProfileProvider;
  String? countryName;
  String? img;
  Info? _country;
  String? initialService;
  String? finalRate;
  bool callOnce = true;
  List<CurrencyDetails> serviceList = [];
  List<CurrencyDetails> currencyList = [];
  bool isMultipleCurrency=false;
  String? serviceId;
  String? currencyName;
  String? serviceName;
  CurrencyDetails? currency_details;
  bool showError = false;
  String? showErrorMsg;
  String? recerversAmount;
  String fees = "0.0";
  String? cuponFixedRate;
  bool showRateInfo = false;

  bool showSendMoneyBtn = false;
  final _fromKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final FocusNode sendFocus=FocusNode();
  final FocusNode receiveFocus=FocusNode();

  @override
  void didChangeDependencies() {
    if (callOnce) {
      provider = Provider.of(context, listen: true);
      _country = provider.getAllCountriesInfoList.first;
      serviceList = provider
          .getAllCountriesInfoList.first.currencyDetails!; //initial service
      currencyList = provider.getAllCountriesInfoList.first.currencyDetails!;

      finalRate = _country!.currencyDetails!.first.finalRate;
      cuponFixedRate = _country!.currencyDetails!.first.finalRate;
      serviceId = _country!.currencyDetails!.first!.serviceId;
      currencyName = _country!.currencyDetails!.first!.currency;
      serviceName = _country!.currencyDetails!.first!.serviceName;
      sendControler.text = '1000';
      receiveControler.text = (1000 * double.parse(finalRate!)).toStringAsFixed(2);
      currency_details = _country!.currencyDetails!.first;

      //call user recipient
      userProfileProvider=Provider.of(context,listen: false);


    }
    callOnce = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    sendControler.dispose();
    receiveControler.dispose();
    cuponControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        primary: true,
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.asset(
            "images/top_icon.png",
            height: 45,
          ),
        ),
        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.blue,
        // ),
        elevation: 0.0,
      ),
      drawer: MyDrawer(),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff02A6EB),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'International Money Transfer',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              Form(
                key: _fromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('You\'re Sending to',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey.shade300,
                              width: .4
                          ),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Container(
                          height: 46,
                          child: Row(
                            children: [
                              Container(
                                width: 46,
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10, left: 6, right: 6),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8)),
                                    color: Colors.white),
                                child: countryName == null
                                    ? Image.network(
                                        provider
                                            .getAllCountriesInfoList.first.image!,
                                        fit: BoxFit.fitWidth,
                                      )
                                    : Image.network(
                                        img!,
                                        fit: BoxFit.fitWidth,
                                      ),
                              ),
                              Expanded(
                                child: Container(
                                  child: DropdownSearch<Info>(

                                    selectedItem: _country,
                                    onChanged: (value) async {
                                      if (_country!.name != value!.name) {
                                        await provider.getAllServicesByCurrencyDts(value!.currencyDetails!);
                                        serviceList = provider.getServiceList;
                                        await provider.getAllCurrencyByCurrencyDts(value.currencyDetails!.first!);
                                        currencyList = provider.getCurrencyList;
                                        await provider.getFinalRate(value.id!,
                                            value.currencyDetails!.first.serviceId!,
                                            value.currencyDetails!.first.currency!);
                                        finalRate = provider.finalRate!.toString();
                                        cuponFixedRate = provider.finalRate!.toString();
                                        currency_details =
                                            value.currencyDetails!.first;
                                        serviceName = value
                                            .currencyDetails!.first.serviceName;
                                        serviceId =
                                            value.currencyDetails!.first.serviceId;

                                        setState(() {
                                          showRateInfo = false;
                                          showError = false;
                                          showSendMoneyBtn = false;
                                          _country = value;
                                          img = _country!.image!;
                                          countryName = value!.name!;
                                          currencyName =
                                              value.currencyDetails!.first.currency;
                                          sendControler.text = '1000';
                                          receiveControler.text =
                                              (1000 * double.parse(finalRate!))
                                                  .toStringAsFixed(2);
                                        });
                                      }

                                      // _country!.currencyDetails!.forEach((element) {
                                      //   print(element.toString());
                                      // });
                                      // provider.getAllCurrencyByCurrencyDts(_country.currencyDetails!);
                                    },
                                    items: provider.getAllCountriesInfoList,
                                    dropdownDecoratorProps: DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                        fillColor: Colors.white,
                                        labelText: countryName ?? _country!.name ,
                                        labelStyle: TextStyle(fontSize: 24,color: Colors.black),
                                        hintStyle: TextStyle(fontSize: 24,color: Colors.black),
                                        enabledBorder: InputBorder.none,
                                        filled: true,
                                        hintText: countryName ?? provider.getAllCountriesInfoList.first.name,
                                      ),
                                    ),
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                      itemBuilder: (context, item, isSelected) {
                                        return ListTile(
                                          title: Text(item.name!),
                                          leading: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 4.0, bottom: 4),
                                            child: Image.network(item.image!),
                                          ),
                                        );
                                      },
                                      showSelectedItems: false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),

                    const SizedBox(
                      height: 15,
                    ),


                    Text('Select Service',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      // padding: const EdgeInsets.only(
                      //     top: 7.0, bottom: 7, left: 6, right: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        // border:
                        //     Border.all(color: Colors.black, width: 2)
                      ),
                      child: DropdownButtonFormField<CurrencyDetails>(
                        // decoration: const InputDecoration.collapsed(
                        //   hintText: '',
                        // ),
                        decoration: InputDecoration(
                          focusColor: Colors.grey,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: .1
                            )
                          ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: .1
                                )
                            )
                        ),
                        hint: Text('${serviceList.first.serviceName}'),
                        value: serviceList.first,
                        isExpanded: true,
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a services';
                          }
                          return null;
                        },
                        items: serviceList
                            .map((catModel) => DropdownMenuItem(
                                value: catModel,
                                child: Text(catModel.serviceName!)))
                            .toList(),
                        onChanged: (value) async {
                          currency_details = value;
                          serviceId = value!.serviceId;
                          serviceName = value!.serviceName;
                          print('Service Id ${serviceId}');
                          // print('${_country!.id!} + ${value!.serviceId!} + ${currencyName}');
                          await provider.getFinalRate(
                              _country!.id!, serviceId!, currencyName!);
                          finalRate = provider.finalRate.toString();
                          print('finalRate $finalRate');
                          setState(() {
                            showSendMoneyBtn = false;
                            receiveControler.text =
                                (double.parse(sendControler.text) *
                                        double.parse(finalRate!))
                                    .toStringAsFixed(2);
                            showRateInfo = false;
                            showError = false;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'You Transfer',
                          style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Focus(
                          onFocusChange: (change) {
                            setState(() {
                              showRateInfo = false;
                              showError = false;
                              showSendMoneyBtn = false;
                            });
                          },
                          child: TextFormField(
                            controller: sendControler,
                            focusNode: sendFocus,
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(new FocusNode());
                              print('COMPLETE..........');
                              setState(() {
                                showSendMoneyBtn = false;
                              });
                            },
                            onChanged: (value) {

                              double receive =
                                  double.parse(value) * double.parse(finalRate!);
                              receiveControler.text = receive.toStringAsFixed(2);
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'Amount',
                              errorStyle:
                                  TextStyle(overflow: TextOverflow.ellipsis),
                              suffixIconConstraints:
                                  BoxConstraints(maxHeight: 30, maxWidth: 38),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: MyColor.blue),
                                //<-- SEE HERE
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: .2,
                                  color: Colors.grey.shade500,
                                ),
                                //<-- SEE HERE
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.red),
                                //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintStyle: TextStyle(),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text('AUD'),
                              ),
                              errorMaxLines: 2,
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Minimum Amount ${currency_details!.minimumLimit} ${currencyName}';
                              }
                            },
                          ),
                        ),
                        if (showError)
                          Text(
                            '$showErrorMsg',
                            style: TextStyle(color: Colors.red),
                          )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Recipient Gets',
                          style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Focus(
                            onFocusChange: (change) {
                              setState(() {
                                showRateInfo = false;
                                showError = false;
                                showSendMoneyBtn = false;
                              });
                            },
                            child: TextFormField(
                              focusNode: receiveFocus,
                              onEditingComplete: () {
                                FocusScope.of(context).requestFocus(new FocusNode());
                                setState(() {
                                  showSendMoneyBtn = false;
                                });
                              },
                              controller: receiveControler,
                              onChanged: (value) {

                                double receive = double.parse(value) /
                                    double.parse(finalRate!);
                                sendControler.text = receive.toStringAsFixed(2);
                                //showErrorMessage(value);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Recipient Amount',
                                errorStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                suffixIconConstraints:
                                    BoxConstraints(maxHeight: 30, maxWidth: 150),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: MyColor.blue),
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: .2,
                                    color: Colors.grey.shade500,
                                  ),
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.red),
                                  //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintStyle: TextStyle(),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    height: 30.0,
                                    width: 60.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(4),
                                      // border:
                                      //     Border.all(color: Colors.black, width: 2)
                                    ),
                                    child:
                                        DropdownButtonFormField<CurrencyDetails>(
                                      decoration: const InputDecoration.collapsed(
                                        hintText: '',
                                      ),
                                      hint: Text(currencyList.first.serviceName!),
                                      value: currencyList.first,
                                      isExpanded: true,
                                      validator: (value) {
                                        // if (value == null) {
                                        //   return 'Please select a currency';
                                        // }
                                        return null;
                                      },
                                      items: currencyList
                                          .map((catModel) => DropdownMenuItem(
                                              value: catModel,
                                              child:
                                                  Text('${catModel.currency!}')))
                                          .toList(),
                                      onChanged:currencyList.length!>1? (value) async {
                                        currencyName = value!.currency;
                                        serviceId = value.serviceId;
                                        print(currencyName! + serviceId!);
                                        await provider.getFinalRate(_country!.id!,
                                            serviceId!, currencyName!);
                                        finalRate = provider.finalRate.toString();
                                        cuponFixedRate = provider.finalRate.toString();
                                        receiveControler.text =
                                            (double.parse(sendControler.text) *
                                                    double.parse(finalRate!))
                                                .toStringAsFixed(2);
                                        setState(() {
                                          // initialCurrency=null;
                                          // selectService = value;
                                          // countryMarginRate = null;
                                          // sendControler.clear();
                                          // receiveControler.clear();
                                          // final_rate == 0.0;
                                        });
                                      }:null,
                                    ),
                                  ),
                                ),
                                errorMaxLines: 2,
                              ),
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Minimum Amount ${currency_details!.minimumLimit} ${currencyName}';
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                String showCuponMsg = "";
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      title: Text('Enter your Promo code'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Form(
                                            key: formKey2,
                                            child: TextFormField(
                                              controller: cuponControler,
                                              onChanged: (value) {
                                                  // receiveFocus.unfocus();
                                                  // sendFocus.unfocus();
                                              },
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                labelText: 'Promo Code',
                                                errorStyle: TextStyle(overflow: TextOverflow.ellipsis),
                                                suffixIconConstraints:
                                                BoxConstraints(maxHeight: 30, maxWidth: 38),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(width: 2, color: MyColor.blue),
                                                  //<-- SEE HERE
                                                  borderRadius: BorderRadius.circular(4.0),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    width: .2,
                                                    color: Colors.grey.shade500,
                                                  ),
                                                  //<-- SEE HERE
                                                  borderRadius: BorderRadius.circular(4.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(width: 2, color: Colors.red),
                                                  //<-- SEE HERE
                                                  borderRadius: BorderRadius.circular(10.0),
                                                ),
                                                hintStyle: TextStyle(),
                                                errorMaxLines: 2,
                                              ),
                                              validator: (val) {
                                                if (val == null || val.isEmpty) {
                                                  return 'Promo Code Required';
                                                } else
                                                  return null;
                                              },
                                            ),
                                          ),
                                          Text(
                                            '$showCuponMsg',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                style: ElevatedButton.styleFrom(primary: Colors.grey),
                                              ),
                                              ElevatedButton(
                                                  onPressed: () async {
                                                    if (formKey2.currentState!.validate()) {
                                                      EasyLoading.show();

                                                      await CalculatorAPICalls.getCuponDetails(
                                                          cuponControler.text)
                                                          .then((cupon) {
                                                        EasyLoading.dismiss();
                                                        double reduceFees = 0.0;
                                                        if (cupon != null) {
                                                          if (cupon.data!.discountType == "P") {
                                                            double val = double.parse(cupon.data!.reduceFee!) * double.parse(cuponFixedRate!);
                                                            reduceFees = double.parse((val / 100).toStringAsFixed(4));
                                                          }
                                                          if (cupon.data!.discountType == "F") {
                                                            reduceFees = double.parse(double.parse(cupon.data!.reduceFee!).toStringAsFixed(4));
                                                          }

                                                          Navigator.pop(context);
                                                          showDialog(
                                                              context: context,
                                                              builder: (context) =>
                                                                  showCuponCongratulationsDialog(reduceFees));
                                                        } else {
                                                          setState(() {
                                                            showCuponMsg = 'Invalid Cupon Code';
                                                          });
                                                        }
                                                      });
                                                    }
                                                    // Navigator.pop(context);
                                                    // Navigator.pushNamed(context, HomePage.routeName);
                                                  },
                                                  child: Text('Submit')),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                            // showDialog(
                            //     context: context,
                            //   builder: (dialogContext) {
                            //     return StatefulBuilder(builder: (stfContext, setState) {
                            //       String? showCuponMsg = '';
                            //       return AlertDialog(
                            //         title: Text('Enter your Promo code'),
                            //         content: Column(
                            //           mainAxisSize: MainAxisSize.min,
                            //           children: [
                            //             Form(
                            //               key: formKey2,
                            //               child: TextFormField(
                            //                 controller: cuponControler,
                            //                 onChanged: (value) {},
                            //                 keyboardType: TextInputType.text,
                            //                 decoration: InputDecoration(
                            //                   fillColor: Colors.white,
                            //                   filled: true,
                            //                   labelText: 'Promo Code',
                            //                   errorStyle: TextStyle(overflow: TextOverflow.ellipsis),
                            //                   suffixIconConstraints:
                            //                   BoxConstraints(maxHeight: 30, maxWidth: 38),
                            //                   focusedBorder: OutlineInputBorder(
                            //                     borderSide: BorderSide(width: 2, color: MyColor.blue),
                            //                     //<-- SEE HERE
                            //                     borderRadius: BorderRadius.circular(4.0),
                            //                   ),
                            //                   enabledBorder: OutlineInputBorder(
                            //                     borderSide: BorderSide(
                            //                       width: .2,
                            //                       color: Colors.grey.shade500,
                            //                     ),
                            //                     //<-- SEE HERE
                            //                     borderRadius: BorderRadius.circular(4.0),
                            //                   ),
                            //                   errorBorder: OutlineInputBorder(
                            //                     borderSide: BorderSide(width: 2, color: Colors.red),
                            //                     //<-- SEE HERE
                            //                     borderRadius: BorderRadius.circular(10.0),
                            //                   ),
                            //                   hintStyle: TextStyle(),
                            //                   errorMaxLines: 2,
                            //                 ),
                            //                 validator: (val) {
                            //                   if (val == null || val.isEmpty) {
                            //                     return 'Promo Code Required';
                            //                   } else
                            //                     return null;
                            //                 },
                            //               ),
                            //             ),
                            //             Text(
                            //               '$showCuponMsg',
                            //               style: TextStyle(color: Colors.blue),
                            //             ),
                            //             SizedBox(
                            //               height: 10,
                            //             ),
                            //             Row(
                            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //               children: [
                            //                 ElevatedButton(
                            //                   onPressed: () {
                            //                     Navigator.pop(context);
                            //                   },
                            //                   child: Text(
                            //                     'Cancel',
                            //                     style: TextStyle(color: Colors.white),
                            //                   ),
                            //                   style: ElevatedButton.styleFrom(primary: Colors.grey),
                            //                 ),
                            //                 ElevatedButton(
                            //                     onPressed: () async {
                            //                       if (formKey2.currentState!.validate()) {
                            //                         EasyLoading.show();
                            //                         await CalculatorAPICalls.getCuponDetails(
                            //                             cuponControler.text)
                            //                             .then((cupon) {
                            //                           EasyLoading.dismiss();
                            //                           double reduceFees = 0.0;
                            //                           if (cupon != null) {
                            //                             if (cupon.data!.discountType == "P") {
                            //                               double val = double.parse(cupon.data!.reduceFee!) *
                            //                                   double.parse(finalRate!);
                            //                               reduceFees = val / 100;
                            //                             }
                            //                             if (cupon.data!.discountType == "F") {
                            //                               reduceFees = double.parse(cupon.data!.reduceFee!);
                            //                             }
                            //
                            //                             Navigator.pop(context);
                            //                             showDialog(
                            //                                 context: context,
                            //                                 builder: (context) =>
                            //                                     showCuponCongratulationsDialog(reduceFees));
                            //                           } else {
                            //                             setState(() {
                            //                               showCuponMsg = 'Invalid Cupon Code';
                            //                             });
                            //                           }
                            //                         });
                            //                       }
                            //                       // Navigator.pop(context);
                            //                       // Navigator.pushNamed(context, HomePage.routeName);
                            //                     },
                            //                     child: Text('Submit')),
                            //               ],
                            //             )
                            //           ],
                            //         ),
                            //       );
                            //     });
                            //   },
                            //     // builder: (context) =>
                            //     //     showCuponAlertDialog(context),
                            // );
                          },
                          child: Text(
                            'Promo code',
                            style: TextStyle(color: Colors.blue),
                          ),
                        )),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.grey),
                              text: 'Exchange Rate : ',
                              children: [
                                TextSpan(
                                    text: '1 AUD = ',
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: '${finalRate} ',
                                    style: TextStyle(color: Colors.grey)),
                                TextSpan(
                                    text: ' ${currencyName}',
                                    style: TextStyle(color: Colors.black))
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    if (showRateInfo)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Total Fees: ',
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                      text: '${fees} ',
                                      style: TextStyle(color: Colors.grey)),
                                  TextSpan(
                                      text: ' ${currencyName}',
                                      style: TextStyle(color: Colors.black))
                                ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Total Payable Amount : ',
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                      text:
                                          '${double.parse(sendControler.text) + double.parse(fees)} ',
                                      style: TextStyle(color: Colors.grey)),
                                  TextSpan(
                                      text: ' ${currencyName}',
                                      style: TextStyle(color: Colors.black))
                                ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (showSendMoneyBtn)
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size.fromHeight(50),
                                  backgroundColor: Color(0xff02A6EB)),
                              onPressed: () {
                                final submitModel=SubmitCalculatorModel(
                                    email: GetUserDetails.email,
                                    user_token: GetUserDetails.token,
                                    getCountry: _country!.id,
                                    service_id: serviceId,
                                    receive_currency_code: currencyName,
                                    input_aud_currency: sendControler.text,
                                    currency_rate: finalRate,
                                    service_charge: fees,
                                    input_receiver_currency: receiveControler.text,
                                    );


                                final model = CalculatorInfoModel(
                                    countryName: _country!.name,
                                    countryId: _country!.id,
                                    serviceName: serviceName,
                                    serviceId: serviceId,
                                    currency: currencyName,
                                    sendAmount: sendControler.text,
                                    fees: fees,
                                    totalPayable:
                                        (double.parse(sendControler.text) +
                                                double.parse(fees!))
                                            .toString(),
                                    exchangeRate: finalRate,
                                    recipientGets: receiveControler.text);

                                Navigator.pushNamed(context, ReceipientWidget.routeName,
                                    arguments: model);
                              },
                              child: Text(
                                'Send',
                                style: MyStyle.mytext(TextStyle(fontSize: 16)),
                              ),
                            ),
                          ),
                        if (!showSendMoneyBtn)
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size.fromHeight(50),
                                  backgroundColor: Color(0xff02A6EB)),
                              onPressed: () {
                                FocusScope.of(context).requestFocus(new FocusNode());
                                if (_fromKey.currentState!.validate()) {

                                  //called same method twice for unfocus textfield
                                  getTheFeesAndTotalAmount(sendControler.text,
                                          receiveControler.text).then((value){
                                            Future.delayed(Duration.zero,(){
                                              getTheFeesAndTotalAmount(sendControler.text,
                                                  receiveControler.text);
                                            });
                                  });

                                }
                              },
                              child: Text(
                                'Continue',
                                style: MyStyle.mytext(TextStyle(fontSize: 16)),
                              ),
                            ),
                          )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



  AlertDialog showCuponCongratulationsDialog(double reduceFees) {

    return AlertDialog(
      title: Text('Congratulations'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Exchange Rate : 1 AUD ='),
              Text(' $finalRate',
                  style: TextStyle(decoration: TextDecoration.lineThrough)),
            ],
          ),
          Wrap(
            children: [
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 8),
                  child: Text('Discount rate $reduceFees (%) :'),
                ),
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '1 AUD = ${double.parse(cuponFixedRate!) + reduceFees}',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Remove'),
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      finalRate='${double.parse(cuponFixedRate!) + reduceFees}';
                      receiveControler.text='${(double.parse(sendControler.text)*double.parse(cuponFixedRate!)).toStringAsFixed(2)}';
                      print('receiveControler $receiveControler');
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Get Discount'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> getRate(String text, String? id, String? serviceId) async {
    return await provider.getServiceCharges(sendControler.text,
        currency_details!.countryTableId, currency_details!.serviceId!);
  }

  void showErrorMessage(String value) {
    print(value);
    if (double.parse(value) > double.parse(currency_details!.maximumLimit!)) {
      setState(() {
        showError = true;
        showErrorMsg ='Maximum Amount ${currency_details!.maximumLimit} ${currencyName}';
      });
    } else if (double.parse(value) <
        double.parse(currency_details!.minimumLimit!)) {
      setState(() {
        showError = true;
        showErrorMsg =
            'Minimum Amount ${currency_details!.minimumLimit} ${currencyName}';
      });
    } else {
      setState(() {
        showError = false;
      });
    }
  }

  Future<void> getTheFeesAndTotalAmount(String send, String receive) async {
    EasyLoading.show();
    print('Final Rate of total are ${send} and ${receive}');
    if (double.parse(send) <= double.parse(currency_details!.minimumLimit!)) {
      EasyLoading.dismiss();
      setState(() {
        showError = true;
        showErrorMsg = 'Minimum Amount ${currency_details!.minimumLimit} ${currencyName}';
      });
      return;
    } else if (double.parse(receive) >
        double.parse(currency_details!.maximumLimit!)) {
      EasyLoading.dismiss();
      setState(() {
        showError = true;
        showErrorMsg = 'Maximum Amount ${currency_details!.maximumLimit} ${currencyName}';
      });
      return;
    } else {
      print('${sendControler.text},${_country!.id},$serviceId');
      EasyLoading.dismiss();
      var serviceCharge= provider.getServiceFeesFromList(_country!.id!,serviceId!,sendControler.text);

      if(serviceCharge!=null){
        setState(() {
          fees=serviceCharge;
          showSendMoneyBtn = true;
          showRateInfo = true;
        });

      }

      // await getRate(sendControler.text, _country!.id, serviceId).then((charge) {
      //   print(charge['service_fee']);
      //   EasyLoading.dismiss();
      //   setState(() {
      //     fees = charge['service_fee'].toString();
      //     // showSendBtn=true;
      //   });
      // });
    }
    EasyLoading.dismiss();
    return;
  }

  // void closeSendButton() {
  //   print('SHOW BUTTON CHANGE CALLING');
  //   setState(() {
  //     showSendMoneyBtn = false;
  //   });
  // }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 2,
      child: Container(
        color: Color(0xff26A6DE),
        child: ListView(
          primary: true,
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 150,
              child: DrawerHeader(
                margin: EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  color: Color(0xff26A6DE),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Icon(Icons.person)))
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Calculator',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'About us',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.add_card_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Send Money',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.add_card_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Receiving',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, CalculatorPage.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.transfer_within_a_station_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Track a Transfer',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, CalculatorPage.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.help_outline,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Help Center',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.headset_mic_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Contact us',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.routeName);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.white, width: 1)),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.white, width: 1)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
