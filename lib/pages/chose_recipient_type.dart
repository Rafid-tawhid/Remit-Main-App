import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/models/bank_agent_data_model.dart';
import 'package:remit_app/models/recipents_model.dart';
import 'package:remit_app/pages/user_profile_page.dart';

import '../colors.dart';
import '../custom_widgits/drawer.dart';
import '../helper_method/get_user_info.dart';
import '../models/calculator_info_model.dart';
import '../providers/user_profile_provider.dart';

class ChooseRecipientType extends StatefulWidget {
  static const String routeName='/recipient_type';
  const ChooseRecipientType({Key? key}) : super(key: key);

  @override
  State<ChooseRecipientType> createState() => _ChooseRecipientTypeState();
}

class _ChooseRecipientTypeState extends State<ChooseRecipientType> {

  Recipients? recipient;
  LocalAgent? localAgent;
  BankInfo? bankInfo;
  String? serviceName;
  String? currency;
  String? sendAmount;
  String? fees;
  String? totalPayable;
  String? rate;
  String? recipientGets;
  String? mail;
  String? token;
  String? countryName;
  bool showAgentInfo=false;
  List<dynamic>? reciveTwoObject;
  late CalculatorInfoModel calculatorInfo;

  final agentbankNameCon=TextEditingController();

  @override
  void dispose() {
    agentbankNameCon.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    GetUserDetails.getUserToken().then((value) {
      token = value;
    });
    reciveTwoObject =ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    if (reciveTwoObject == null) {
      print('NOTHING PHONE');
    } else {
      calculatorInfo = reciveTwoObject![0];
      recipient = reciveTwoObject![1];
      serviceName = calculatorInfo.serviceName;
      print('serviceName $serviceName');
      if(serviceName=='Cash Pickup'){
        showAgentInfo=true;
      }
      currency = calculatorInfo.currency;
      sendAmount = calculatorInfo.sendAmount;
      fees = calculatorInfo.fees;
      totalPayable = calculatorInfo.totalPayable;
      rate = calculatorInfo.exchangeRate;
      recipientGets = calculatorInfo.recipientGets;
      countryName = calculatorInfo.countryName;
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: MyColor.blue, size: 25),
        elevation: 0.0,
        title: Image.asset(
          'images/logo.png',
          width: 120,
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, UserProfilePage.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0, top: 5, bottom: 5),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/media/FhC3LvHXkAEMEUZ.png',
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [

          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2,
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$serviceName',
                        style: TextStyle(fontSize: 22),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: Text('AUD-$currency')),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Send Amount'),
                          Text('$sendAmount AUD')
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Fees'), Text('$fees AUD')],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('You pay in total'),
                          Text('$totalPayable AUD')
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Exchange Rate',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '1 AUD->$rate $currency',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your recipient gets',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$recipientGets $currency',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Your Recipient Info',
            style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Recipient Name : ${recipient!.firstname} in ${recipient!.country}',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Choose Agent:',
            style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          showAgentInfo?Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Bank Info / Agent',
                      style: TextStyle(color: MyColor.grey, fontSize: 16),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 12,
                    ),
                  ],
                ),
              ),
              Consumer<UserProfileProvider>(
                builder: (context, provider, _) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField<LocalAgent>(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                      value: localAgent,
                      hint: Text(
                        '  Select One',
                        style: TextStyle(color: Colors.black),
                      ),
                      isExpanded: true,
                      onChanged: (value) {

                      },

                      validator: (value) {
                        if (value == null) {
                          return "can't empty";
                        } else {
                          return null;
                        }
                      },
                      items: provider.localAgentList
                          .map((localAgent) => DropdownMenuItem<LocalAgent>(
                          value: localAgent,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              children: [
                                // Icon(Icons.ac_unit,size: 25,),
                                Text(localAgent.agentCity!)
                              ],
                            ),
                          )))
                          .toList()),
                ),
              ),
            ],
          ):Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Bank Info / Agent',
                      style: TextStyle(color: MyColor.grey, fontSize: 16),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 12,
                    ),
                  ],
                ),
              ),
              Consumer<UserProfileProvider>(
                builder: (context, provider, _) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 1),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<BankInfo>(
                        //  menuMaxHeight: 300,
                          dropdownMaxHeight: 300,
                          value: bankInfo,
                          hint: Text(
                            '  Select One',
                            style: TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis),
                          ),
                          isExpanded: true,
                          onChanged: (value) {
                            setState(() {
                              bankInfo=value;
                            });
                          },

                          items: provider.bankInfoList
                              .map((bankInfo) => DropdownMenuItem<BankInfo>(

                              value: bankInfo,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Icon(Icons.ac_unit,size: 25,),
                                    Text(bankInfo.agent!,style: TextStyle(fontSize: 12,overflow: TextOverflow.ellipsis),),
                                  ],
                                ),
                              )))
                              .toList()),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Branch Name ',
                      style: TextStyle(color: MyColor.grey, fontSize: 16),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 12,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: TextFormField(
                    controller: agentbankNameCon,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Select Name',
                      suffixIconConstraints:
                      BoxConstraints(maxHeight: 30, maxWidth: 38),
                      hintStyle: TextStyle(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color: Colors.blue),
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: .5, color: Colors.grey),
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Bank Account Number ',
                      style: TextStyle(color: MyColor.grey, fontSize: 16),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 12,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: TextFormField(
                    controller: agentbankNameCon,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Select Name',
                      suffixIconConstraints:
                      BoxConstraints(maxHeight: 30, maxWidth: 38),
                      hintStyle: TextStyle(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color: Colors.blue),
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: .5, color: Colors.grey),
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'IFSC/BSB/Routing No(Optional)',
                      style: TextStyle(color: MyColor.grey, fontSize: 16),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 12,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: TextFormField(
                    controller: agentbankNameCon,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Select Name',
                      suffixIconConstraints:
                      BoxConstraints(maxHeight: 30, maxWidth: 38),
                      hintStyle: TextStyle(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color: Colors.blue),
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: .5, color: Colors.grey),
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Consumer<UserProfileProvider>(
            builder: (context, provider, _) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: () {
                    // provider.getBankAgentData(token!,calculatorInfo.countryId!,calculatorInfo.serviceId!);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
            ),
          ),

          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
