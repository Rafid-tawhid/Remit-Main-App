import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/pages/calculator_page.dart';

import '../colors.dart';
import '../custom_widgits/drawer.dart';
import '../models/country_models.dart';
import '../providers/calculator_provider.dart';
import 'login_page.dart';

class CalculatorPage2 extends StatefulWidget {
  const CalculatorPage2({Key? key}) : super(key: key);
  static const String routeName='/calculator2';

  @override
  State<CalculatorPage2> createState() => _CalculatorPage2State();
}

class _CalculatorPage2State extends State<CalculatorPage2> {
  final sendControler = TextEditingController();
  final receiveControler = TextEditingController();
  late CalculatorProvider provider;
  String? countryName;
  String? img;
  Info? _country;
  String? initialService;
  String? finalRate;
  bool callOnce = true;
  List<CurrencyDetails> serviceList = [];
  List<CurrencyDetails> currencyList = [];
  String? serviceId;
  String? currencyName;
  CurrencyDetails? currency_details;
  bool showError=false;
  String? showErrorMsg;
  String? recerversAmount;
  String fees="0.0";
  bool showRateInfo=false;
  bool showSendMoneyBtn=false;
  final _fromKey=GlobalKey<FormState>();


  @override
  void didChangeDependencies() {
    if (callOnce) {
      provider = Provider.of(context, listen: true);
      _country = provider.getAllCountriesInfoList.first;
      serviceList = provider.getAllCountriesInfoList.first.currencyDetails!; //initial service
      currencyList = provider.getAllCountriesInfoList.first.currencyDetails!;
      finalRate = _country!.currencyDetails!.first.finalRate;
      serviceId = _country!.currencyDetails!.first!.serviceId;
      currencyName = _country!.currencyDetails!.first!.currency;
      sendControler.text='1000';
      receiveControler.text= (1000*double.parse(finalRate!)).toStringAsFixed(2);
      currency_details=_country!.currencyDetails!.first;
      // provider.getServiceCharges("1000",currency_details!.countryTableId,currency_details!.serviceId).then((charge) {
      //   fees=charge['service_fee'];
      // });
    }
    callOnce = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    sendControler.dispose();
    receiveControler.dispose();
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
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(25),
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
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Send to',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(6),
                        // border:
                        //     Border.all(color: Colors.black, width: 2)
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 35,
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10, left: 6, right: 6),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8)),
                                color: Color(0xffD9D9D9)),
                            child: countryName == null
                                ? Image.network(
                              provider.getAllCountriesInfoList.first.image!,
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
                                    await provider.getAllServicesByCurrencyDts(
                                        value!.currencyDetails!);
                                    serviceList = provider.getServiceList;
                                    await provider.getAllCurrencyByCurrencyDts(
                                        value.currencyDetails!.first!);
                                    currencyList = provider.getCurrencyList;
                                    await provider.getFinalRate(
                                        value.id!,
                                        value.currencyDetails!.first.serviceId!,
                                        value.currencyDetails!.first.currency!);
                                    finalRate = provider.finalRate!.toString();
                                    currency_details=value.currencyDetails!.first;

                                    setState(() {
                                      showRateInfo=false;
                                      showError=false;
                                      showSendMoneyBtn=false;
                                      _country = value;
                                      img = _country!.image!;
                                      countryName = value!.name!;
                                      currencyName = value.currencyDetails!.first.currency;
                                      sendControler.text='1000';
                                      receiveControler.text= (1000*double.parse(finalRate!)).toStringAsFixed(2);
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
                                    labelText: countryName ?? _country!.name,
                                    // enabledBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(6),
                                    //     borderSide: BorderSide(color: Colors.grey.shade300,),
                                    // ),
                                    enabledBorder: InputBorder.none,
                                    filled: true,
                                    hintText: countryName ??
                                        provider
                                            .getAllCountriesInfoList.first.name,
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
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Select Service',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 7.0, bottom: 7, left: 6, right: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(6),
                      // border:
                      //     Border.all(color: Colors.black, width: 2)
                    ),
                    child: DropdownButtonFormField<CurrencyDetails>(
                      decoration: const InputDecoration.collapsed(
                        hintText: '',
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
                        currency_details=value;
                        serviceId = value!.serviceId;
                        print('Service Id ${serviceId}');
                        // print('${_country!.id!} + ${value!.serviceId!} + ${currencyName}');
                        await provider.getFinalRate(_country!.id!, serviceId!, currencyName!);
                        finalRate = provider.finalRate.toString();
                        print('finalRate $finalRate');
                        setState(() {
                          showSendMoneyBtn=false;
                          receiveControler.text= (double.parse(sendControler.text)*double.parse(finalRate!)).toStringAsFixed(2);
                          showRateInfo=false;
                          showError=false;
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
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Focus(
                        onFocusChange: (change){
                          setState(() {
                            showRateInfo=false;
                            showError=false;
                            showSendMoneyBtn=false;
                          });
                        },
                        child: TextFormField(
                          controller: sendControler,
                          onChanged: (value){
                            showSendMoneyBtn=false;
                            double receive=double.parse(value)*double.parse(finalRate!);
                            receiveControler.text=receive.toStringAsFixed(2);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Amount',
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
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text('AUD'),
                            ),
                            errorMaxLines: 2,
                          ),
                          validator: (val) {
                            if(val==null||val.isEmpty){
                              return 'Minimum Amount ${currency_details!.minimumLimit} ${currencyName}';
                            }
                          },
                        ),
                      ),
                      if(showError)Text('$showErrorMsg',
                        style: TextStyle(color:Colors.red ),)
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
                        style: TextStyle(fontSize: 12, color: Colors.grey),
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
                          onFocusChange: (change){
                            setState(() {
                              showRateInfo=false;
                              showError=false;
                              showSendMoneyBtn=false;
                            });
                          },
                          child: TextFormField(
                            controller: receiveControler,
                            onChanged: (value){
                              showSendMoneyBtn=false;
                              double receive=double.parse(value)/double.parse(finalRate!);
                              sendControler.text=receive.toStringAsFixed(2);
                              //showErrorMessage(value);

                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: 'Recipient Gets',
                              errorStyle: TextStyle(overflow: TextOverflow.ellipsis),
                              suffixIconConstraints:
                              BoxConstraints(maxHeight: 30, maxWidth: 150),
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
                                  child: DropdownButtonFormField<CurrencyDetails>(
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
                                        child: Text('${catModel.currency!}')))
                                        .toList(),
                                    onChanged: (value) async {
                                      currencyName = value!.currency;
                                      serviceId=value.serviceId;
                                      print(currencyName!+serviceId!);
                                      await provider.getFinalRate(_country!.id!, serviceId!, currencyName!);
                                      finalRate = provider.finalRate.toString();
                                      receiveControler.text= (double.parse(sendControler.text)*double.parse(finalRate!)).toStringAsFixed(2);
                                      setState(() {
                                        // initialCurrency=null;
                                        // selectService = value;
                                        // countryMarginRate = null;
                                        // sendControler.clear();
                                        // receiveControler.clear();
                                        // final_rate == 0.0;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              errorMaxLines: 2,
                            ),
                            validator: (val) {
                              if(val==null||val.isEmpty){
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
                  if(showRateInfo)Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: RichText(
                            text: TextSpan(
                                children: [
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
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Total Payable Amount : ',
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                      text: '${double.parse(sendControler.text)+double.parse(fees)} ',
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
                  SizedBox(height: 20,),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if(showSendMoneyBtn)Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size.fromHeight(50),
                                backgroundColor: Color(0xff02A6EB)
                            ),
                            onPressed: (){
                              setState(() {
                                showSendMoneyBtn=false;
                              });
                            },
                            child: Text('Send',
                              style: MyStyle.mytext(TextStyle(fontSize: 16)),
                            ),
                          ),
                        ),
                      ),
                      if(!showSendMoneyBtn)Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size.fromHeight(50),
                                backgroundColor: Color(0xff02A6EB)
                            ),
                            onPressed: (){
                              if(_fromKey.currentState!.validate()){
                                getTheFeesAndTotalAmount(sendControler.text, receiveControler.text).then((value) {
                                  setState(() {
                                    showSendMoneyBtn=true;
                                    showRateInfo=true;
                                  });
                                });
                              }
                            },
                            child: Text('Calculate',
                              style: MyStyle.mytext(TextStyle(fontSize: 16)),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
            // Consumer<CalculatorProvider>(
            //   builder: (context, provider, _) => FutureBuilder(
            //     future: provider.getAllCountryInfo(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         // countryName=provider.getAllCountriesInfoList.first.name;
            //         // img=provider.getAllCountriesInfoList.first.image;
            //         return Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Send to',
            //               style: TextStyle(
            //                   fontSize: 12, color: Colors.grey.shade600),
            //             ),
            //             const SizedBox(
            //               height: 5,
            //             ),
            //             Container(
            //                 height: 40,
            //                 decoration: BoxDecoration(
            //                   color: Colors.grey.shade300,
            //                   borderRadius: BorderRadius.circular(6),
            //                   // border:
            //                   //     Border.all(color: Colors.black, width: 2)
            //                 ),
            //                 child: Row(
            //                   children: [
            //                     Container(
            //                       width: 35,
            //                       padding: const EdgeInsets.only(
            //                           top: 10.0, bottom: 10, left: 6, right: 6),
            //                       decoration: const BoxDecoration(
            //                           borderRadius: BorderRadius.only(
            //                               topLeft: Radius.circular(8),
            //                               bottomLeft: Radius.circular(8)),
            //                           color: Color(0xffD9D9D9)),
            //                       child: countryName == null
            //                           ? Image.network(
            //                         provider.getAllCountriesInfoList.first.image!,
            //                         fit: BoxFit.fitWidth,
            //                       )
            //                           : Image.network(
            //                         img!,
            //                         fit: BoxFit.fitWidth,
            //                       ),
            //                     ),
            //                     Expanded(
            //                       child: Container(
            //                         child: DropdownSearch<Info>(
            //                           selectedItem: _country,
            //                           onChanged: (value) {
            //
            //                             setState(() {
            //                               _country = value;
            //                               img = _country!.image!;
            //                               countryName = value!.name!;
            //                             });
            //                             _country!.currencyDetails!.forEach((element) {
            //                               print(element.toString());
            //                             });
            //                           },
            //                           items: provider.getAllCountriesInfoList,
            //                           dropdownDecoratorProps:
            //                           DropDownDecoratorProps(
            //                             dropdownSearchDecoration:
            //                             InputDecoration(
            //                               labelText: countryName,
            //                               // enabledBorder: OutlineInputBorder(
            //                               //     borderRadius: BorderRadius.circular(6),
            //                               //     borderSide: BorderSide(color: Colors.grey.shade300,),
            //                               // ),
            //                               enabledBorder: InputBorder.none,
            //                               filled: true,
            //                               hintText: countryName ??
            //                                   provider
            //                                       .getAllCountriesInfoList.first.name,
            //                             ),
            //                           ),
            //                           popupProps: PopupProps.menu(
            //                             showSearchBox: true,
            //                             itemBuilder:
            //                                 (context, item, isSelected) {
            //                               return ListTile(
            //                                 title: Text(item.name!),
            //                                 leading: Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       top: 4.0, bottom: 4),
            //                                   child: Image.network(item.image!),
            //                                 ),
            //                               );
            //                             },
            //                             showSelectedItems: false,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 )),
            //             const SizedBox(
            //               height: 15,
            //             ),
            //             const Text(
            //               'Select Service',
            //               style: TextStyle(fontSize: 12, color: Colors.grey),
            //             ),
            //             const SizedBox(
            //               height: 5,
            //             ),
            //
            //             SizedBox(
            //               height: 15,
            //             ),
            //           ],
            //         );
            //       } else {
            //         return Center(
            //           child: Container(
            //               width: 60,
            //               height: 60,
            //               child: const CircularProgressIndicator()),
            //         );
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  Future<dynamic> getRate(String text, String? id, String? serviceId) async {

    return await provider.getServiceCharges(sendControler.text,currency_details!.countryTableId,
        currency_details!.serviceId!);
  }

  void showErrorMessage(String value) {

    print(value);
    if(double.parse(value)>double.parse(currency_details!.maximumLimit!)){
      setState(() {
        showError=true;
        showErrorMsg='Maximum Amount ${currency_details!.maximumLimit} ${currencyName}';
      });
    }
    else if(double.parse(value)<double.parse(currency_details!.minimumLimit!)){
      setState(() {
        showError=true;
        showErrorMsg='Minimum Amount ${currency_details!.minimumLimit} ${currencyName}';
      });
    }
    else {
      setState(() {
        showError=false;
      });
    }
  }

  Future<void> getTheFeesAndTotalAmount(String send, String receive) async {
    EasyLoading.show();
    print('Final Rate of total are ${send} and ${receive}');
    if(double.parse(send)<=double.parse(currency_details!.minimumLimit!)){
      EasyLoading.dismiss();
      setState(() {
        showError=true;
        showErrorMsg='Minimum Amount ${currency_details!.minimumLimit} ${currencyName}';
      });
    }

    else if(double.parse(receive)>double.parse(currency_details!.maximumLimit!)){
      EasyLoading.dismiss();
      setState(() {
        showError=true;
        showErrorMsg='Maximum Amount ${currency_details!.maximumLimit} ${currencyName}';
      });
    }
    else {
      print('${sendControler.text},${_country!.id},$serviceId');

      await getRate(sendControler.text,_country!.id,serviceId).then((charge) {
        print(charge['service_fee']);
        EasyLoading.dismiss();
        setState(() {
          fees=charge['service_fee'].toString();
          // showSendBtn=true;
        });
      });

    }
  }
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
