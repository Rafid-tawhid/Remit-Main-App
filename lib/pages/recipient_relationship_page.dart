import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/helper_method/helper_class.dart';
import 'package:remit_app/models/payment_method.dart';
import 'package:remit_app/models/recipents_model.dart';
import 'package:remit_app/models/sender_relationship_model.dart';
import 'package:remit_app/models/submit_recipient_relation_agent_info_model.dart';
import 'package:remit_app/providers/user_profile_provider.dart';

import '../api_calls/calculator_api_calls.dart';
import '../colors.dart';
import '../custom_widgits/dialog_widgits.dart';
import '../custom_widgits/drawer.dart';
import '../helper_method/get_calculator_info.dart';
import '../helper_method/get_user_info.dart';
import 'checkout_page.dart';
import 'user_profile_page.dart';
import '../providers/calculator_provider.dart';
import '../models/bank_agent_data_model.dart';
import '../models/calculator_info_model.dart';
import '../models/get_branch_data_model.dart';

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

  late CalculatorProvider calculatorProvider;
  PaymentMethods? paymentMethods;
  SubmitRecipientRelationAgentInfoModel? submit_recipient_model;

  final _formKey=GlobalKey<FormState>();
  //
  @override
  @override
  void initState() {
    calculatorInfo = SetCalculatorAndRecipientInfo.getCalculatorInfo();
    recipientsInfo = SetCalculatorAndRecipientInfo.getRecipientInfo();
    EasyLoading.dismiss();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    provider=Provider.of(context,listen: true);
    calculatorProvider=Provider.of(context,listen: true);
    paymentMethods=provider.paymentMethodList.first;
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
        iconTheme: IconThemeData(color: MyColor.blue,size: 25),
        elevation: 0.0,
        title: Image.asset('images/logo.png',width: 120,),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, UserProfilePage.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0,top: 5,bottom: 5),
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(.5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(GetUserDetails.userProfileModel!.image!,),
                  ),
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

                //set relationship data
                SetCalculatorAndRecipientInfo.setRecipientRelationShip(
                    beneficiaryRelationship!,
                    senderOccupation!,sourceOfFund!,
                    sendingPurpose!);

                //main huge api Final api
                callSubmitRecipientRelationApi();


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

  void callSubmitRecipientRelationApi() {
    EasyLoading.show();
    final recipient= SetCalculatorAndRecipientInfo.recipients;
    final local= SetCalculatorAndRecipientInfo.localAgent;
    final branch= SetCalculatorAndRecipientInfo.branchName;
    final agent= SetCalculatorAndRecipientInfo.agentName;
    final occupation= SetCalculatorAndRecipientInfo.occupation;
    final relationship= SetCalculatorAndRecipientInfo.relationship;
    final purpose= SetCalculatorAndRecipientInfo.purpose;
    final bankInfo= SetCalculatorAndRecipientInfo.bankInfo;
    final branchInfo= SetCalculatorAndRecipientInfo.branchInfo;
    final funds= SetCalculatorAndRecipientInfo.fund;
    final bankAccNumber= SetCalculatorAndRecipientInfo.bankAccNo;
    final ifseAccNo= SetCalculatorAndRecipientInfo.ifseRouteNo;
    final typeOfAccount= SetCalculatorAndRecipientInfo.typeOfAcc;

    //create model
    submit_recipient_model=SubmitRecipientRelationAgentInfoModel(
        userToken:GetUserDetails.token,
        invoice:calculatorProvider.getUserInvoice(),
        recipientId:recipientsInfo!.id.toString()??'',
        firstName:recipientsInfo!.firstname??'',
        middleName:recipientsInfo!.middlename??'',
        lastName:recipientsInfo!.lastname??'',
        phone:recipientsInfo!.phone??'',
        email:recipientsInfo!.email??'',
        streetName:recipientsInfo!.streetName??'',
        streetCity:recipientsInfo!.streetCity??'',
        fundSource:funds!.value??'',
        purpose:purpose!.value??'',
        senderOccupation:occupation!.value??null,
        beneficiaryRelationship:relationship!.value??'',
        bankInfo:bankInfo==null?'':bankInfo.agent??'',
        bankId:branchInfo==null?'': branchInfo.bankid??'',
        locationId:branchInfo==null?'':branchInfo.locationid??'',
        branchInfo:branch??'',
        payoutBankCode:ifseAccNo??'',
        typeOfAccount:typeOfAccount??'',
        branchId:branchInfo==null?'':branchInfo.bankid??'',
        bankAccNumber:bankAccNumber==null?'':bankAccNumber,
        agentName:agent??'',
        agentCity:local==null?'':local.agentCity??'',
        agentBranch:branch==null?'':branch
    );

    print('final submit_recipient_model ${submit_recipient_model!.toMap()}');

    CalculatorAPICalls.submitRecipientRelationAgent(submit_recipient_model!).then((value) {
      EasyLoading.dismiss();
      if(value['status']==true){
        print(value.toString());
        print('THIS IS CALLING........');
        Navigator.pushNamed(context, CheckoutPage.routeName);
      }
      if(value['status']==false){
        print('error IS CALLING........');
        MyDialog.showErrorMsgDialog(context, value);
      }

    });
  }
}
