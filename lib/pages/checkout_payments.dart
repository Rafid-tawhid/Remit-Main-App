import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/models/checkout_payment_model.dart';
import 'package:remit_app/pages/congratulations_page.dart';
import 'package:remit_app/pages/user_profile_page.dart';

import '../colors.dart';
import '../custom_widgits/drawer.dart';
import '../helper_method/get_calculator_info.dart';
import '../models/calculator_info_model.dart';
import '../models/payment_method.dart';
import '../models/recipents_model.dart';
import '../models/submit_recipient_relation_agent_info_model.dart';
import '../providers/calculator_provider.dart';
import '../providers/user_profile_provider.dart';

class CheckOutPayment extends StatefulWidget {
  static const String routeName='/checkout_payment';
  const CheckOutPayment({Key? key}) : super(key: key);

  @override
  State<CheckOutPayment> createState() => _CheckOutPaymentState();
}

class _CheckOutPaymentState extends State<CheckOutPayment> {

  late UserProfileProvider provider;
  late CalculatorProvider calculatorProvider;
  PaymentMethods? paymentMethods;
  late CalculatorInfoModel? calculatorInfo;
  late Recipients? recipientsInfo;
  SubmitRecipientRelationAgentInfoModel? submit_recipient_model;
  CheckoutPaymentModel? checkout;

  @override
  void initState() {
    calculatorInfo = SetCalculatorAndRecipientInfo.getCalculatorInfo();
    recipientsInfo = SetCalculatorAndRecipientInfo.getRecipientInfo();
    checkout=SetCalculatorAndRecipientInfo.checkoutPaymentModel;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    provider=Provider.of(context,listen: true);
    calculatorProvider=Provider.of(context,listen: true);
    paymentMethods=provider.paymentMethodList.first;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      children: [
                        Text('Fees'),
                        Text('${calculatorInfo!.fees} AUD')
                      ],
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
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                    child: Text('Pay using bank',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                SizedBox(height: 10,),
                Text(checkout!.data!.contentPayableAmount??''),
                SizedBox(height: 10,),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.shade400
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(checkout!.data!.contentTransactionMethod??''),
                    )),
                SizedBox(height: 10,),
                Text('Our Bank Details',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Email :',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text(checkout!.data!.payId??''),
                SizedBox(height: 5,),
                Text('Customer Reference Number (CRN) :',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text(checkout!.data!.reference??''),
                SizedBox(height: 5,),
                Text('Payment Description :',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text(checkout!.data!.depositReference??''),
                SizedBox(height: 5,),
                Text('Account Number :',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text(checkout!.data!.vaAccountNumber??''),
                SizedBox(height: 5,),
                Text('Routing Number :',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text(checkout!.data!.vaRoutingNumber??''),
              ],
            ),
          ),

          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromHeight(50),
                        backgroundColor: Color(0xff02A6EB)
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, CongratulationsPage.routeName);
                    }, child: Text('I Have paid',style: TextStyle(fontSize: 18),)),
                SizedBox(height: 10,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromHeight(50),
                        backgroundColor: Colors.white,
                    ),
                    onPressed: (){


                    }, child: Text('I\'ll transfer my money later',style: TextStyle(fontSize: 18,color: Colors.black),)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
