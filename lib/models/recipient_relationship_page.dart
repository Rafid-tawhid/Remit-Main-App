import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/helper_method/helper_class.dart';
import 'package:remit_app/models/recipents_model.dart';
import 'package:remit_app/models/sender_relationship_model.dart';
import 'package:remit_app/providers/user_profile_provider.dart';

import '../colors.dart';
import '../custom_widgits/drawer.dart';
import '../helper_method/get_calculator_info.dart';
import '../helper_method/get_user_info.dart';
import '../pages/checkout_page.dart';
import '../pages/user_profile_page.dart';
import 'bank_agent_data_model.dart';
import 'calculator_info_model.dart';
import 'get_branch_data_model.dart';

class RecipientRelationShipPage extends StatefulWidget {
  static const String routeName='/recipient_relationship';
  const RecipientRelationShipPage({Key? key}) : super(key: key);

  @override
  State<RecipientRelationShipPage> createState() => _RecipientRelationShipPageState();
}

class _RecipientRelationShipPageState extends State<RecipientRelationShipPage> {

  Recipients? recipient;
  SenderOccupation? senderOccupation;
  BeneficiaryRelationship? beneficiaryRelationship;
  SourceOfFund? sourceOfFund;
  SendingPurpose? sendingPurpose;
  BranchInfo? branchInfo;
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
  bool branchFound=true;
  List<dynamic>? reciveTwoObject;
  late CalculatorInfoModel? calculatorInfo;
  late Recipients? recipientsInfo;
  late UserProfileProvider provider;
  final _formKey=GlobalKey<FormState>();
  //
  @override
  void initState() {
    calculatorInfo=SetCalculatorAndRecipientInfo.getCalculatorInfo();
    recipientsInfo=SetCalculatorAndRecipientInfo.getRecipientInfo();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    provider=Provider.of(context,listen: true);
    super.didChangeDependencies();
  }
  // @override


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
                      '${calculatorInfo!.serviceName}',
                      style: TextStyle(fontSize: 22),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Text('AUD-${calculatorInfo!.currency}')),
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
                        Text('${calculatorInfo!.sendAmount} AUD')
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Fees'), Text('${calculatorInfo!.fees} AUD')],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('You pay in total'),
                        Text('${calculatorInfo!.totalPayable} AUD')
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
                          '1 AUD->${calculatorInfo!.exchangeRate} ${calculatorInfo!.currency}',
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
                          '${calculatorInfo!.recipientGets} ${calculatorInfo!.currency}',
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
                'Recipient Name : ${recipientsInfo!.firstname} in ${recipientsInfo!.country}',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,),
                  child: Row(
                    children: [
                      Text(
                        'Sender Occupation',
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
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField2<SenderOccupation>(
                      dropdownMaxHeight: 300,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                      value: senderOccupation,
                      hint: Text(
                        '  Select One',
                        style: TextStyle(color: Colors.black),
                      ),
                      isExpanded: true,
                      onChanged: (value) {
                        senderOccupation=value;
                      },

                      validator: (value) {
                        if (value == null) {
                          return "can't empty";
                        } else {
                          return null;
                        }
                      },
                      items: provider.senderRelationshipOccupationList
                          .map((element) => DropdownMenuItem<SenderOccupation>(
                          value: element,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              children: [
                                // Icon(Icons.ac_unit,size: 25,),
                                Text(element.data??'')
                              ],
                            ),
                          )))
                          .toList()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, ),
                  child: Row(
                    children: [
                      Text(
                        'Beneficiary Relationship',
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
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField2<BeneficiaryRelationship>(
                      dropdownMaxHeight: 300,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                      value: beneficiaryRelationship,
                      hint: Text(
                        '  Select One',
                        style: TextStyle(color: Colors.black),
                      ),
                      isExpanded: true,
                      onChanged: (value) {
                        beneficiaryRelationship=value;
                      },

                      validator: (value) {
                        if (value == null) {
                          return "can't empty";
                        } else {
                          return null;
                        }
                      },
                      items: provider.senderRelationshipBeneficiaryList
                          .map((element) => DropdownMenuItem<BeneficiaryRelationship>(
                          value: element,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              children: [
                                // Icon(Icons.ac_unit,size: 25,),
                                Text(element.data??'')
                              ],
                            ),
                          )))
                          .toList()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,),
                  child: Row(
                    children: [
                      Text(
                        'Source Of Fund',
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
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField2<SourceOfFund>(
                      dropdownMaxHeight: 300,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                      value: sourceOfFund,
                      hint: Text(
                        '  Select One',
                        style: TextStyle(color: Colors.black),
                      ),
                      isExpanded: true,
                      onChanged: (value) {
                        sourceOfFund=value;
                      },

                      validator: (value) {
                        if (value == null) {
                          return "can't empty";
                        } else {
                          return null;
                        }
                      },
                      items: provider.senderRelationshipSourceOfFundList
                          .map((element) => DropdownMenuItem<SourceOfFund>(
                          value: element,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              children: [
                                // Icon(Icons.ac_unit,size: 25,),
                                Text(element.data??'')
                              ],
                            ),
                          )))
                          .toList()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, ),
                  child: Row(
                    children: [
                      Text(
                        'Sending Purpose',
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
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField2<SendingPurpose>(
                      dropdownMaxHeight: 300,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                      value: sendingPurpose,
                      hint: Text(
                        '  Select One',
                        style: TextStyle(color: Colors.black),
                      ),
                      isExpanded: true,
                      onChanged: (value) {
                        sendingPurpose=value;
                      },

                      validator: (value) {
                        if (value == null) {
                          return "can't empty";
                        } else {
                          return null;
                        }
                      },
                      items: provider.senderRelationshipSendingPurposeList
                          .map((element) => DropdownMenuItem<SendingPurpose>(
                          value: element,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              children: [
                                // Icon(Icons.ac_unit,size: 25,),
                                Text(element.data??'')
                              ],
                            ),
                          )))
                          .toList()),
                ),
              ],
            ),
          ),

          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                print(beneficiaryRelationship);
                print(senderOccupation);
                print(sourceOfFund);
                print(sendingPurpose);
                SetCalculatorAndRecipientInfo.setRecipientRelationShip(
                    beneficiaryRelationship!,
                    senderOccupation!,sourceOfFund!,
                    sendingPurpose!);
                Navigator.pushNamed(context, CheckoutPage.routeName);
              }

            },
              child: Text(
                'Next',
                style: MyStyle.mytext(TextStyle(fontSize: 16)),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromHeight(50),
                  backgroundColor: Color(0xff02A6EB)),
            ),
          ),
          SizedBox(height: 30,),

        ],
      ),
    );
  }
}
