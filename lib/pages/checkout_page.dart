import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/api_calls/calculator_api_calls.dart';
import 'package:remit_app/api_calls/user_api_calls.dart';
import 'package:remit_app/custom_widgits/show_error_dialoge.dart';
import 'package:remit_app/models/submit_recipient_relation_agent_info_model.dart';
import 'package:remit_app/pages/checkout_payments.dart';
import 'package:remit_app/pages/home_page.dart';
import 'package:remit_app/pages/user_profile_page.dart';
import 'package:remit_app/providers/calculator_provider.dart';
import 'package:remit_app/providers/user_profile_provider.dart';

import '../colors.dart';
import '../custom_widgits/dialog_widgits.dart';
import '../custom_widgits/drawer.dart';
import '../helper_method/get_calculator_info.dart';
import '../helper_method/get_user_info.dart';
import '../models/calculator_info_model.dart';
import '../models/checkout_payment_model.dart';
import '../models/payment_method.dart';
import '../models/recipents_model.dart';

class CheckoutPage extends StatefulWidget {
  static String routeName='/checkout_page';

  const CheckoutPage({Key? key}) : super(key: key);


  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}



class _CheckoutPageState extends State<CheckoutPage> {
  late UserProfileProvider provider;
  late CalculatorProvider calculatorProvider;
   PaymentMethods? paymentMethods;
  late CalculatorInfoModel? calculatorInfo;
  late Recipients? recipientsInfo;
  SubmitRecipientRelationAgentInfoModel? submit_recipient_model;

   @override
  void initState() {
     calculatorInfo = SetCalculatorAndRecipientInfo.getCalculatorInfo();
     recipientsInfo = SetCalculatorAndRecipientInfo.getRecipientInfo();
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
          SizedBox(height: 40,),

          //list tile radio
          ...provider.paymentMethodList.map((value) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                child: RadioListTile<PaymentMethods>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  groupValue: paymentMethods,
                  selected: true,
                  title: Text(value.title!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                            subtitle: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total ${value.fees} ${value.currency} ${value.subTitle}'),
                                SizedBox(height: 5,),
                                Text(value.description!),
                              ],
                            ),
                  value: value,
                  onChanged: (val) {
                    setState(() {
                      paymentMethods=value;
                    });
                    print(paymentMethods!.value);

                  },


                ),
              ),
            ),
          )).toList(),

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
                      EasyLoading.show();
                      UserApiCalls.checkOutPaymentItem(CalculatorProvider.invoice!,paymentMethods!.value!).then((value) {
                        EasyLoading.dismiss();
                        if(value!=null){
                          if(value['status']==true){
                            final checkout=CheckoutPaymentModel.fromJson(value);
                            //set checkout data
                             SetCalculatorAndRecipientInfo.setCheckOutData(checkout);
                             Navigator.pushNamed(context, CheckOutPayment.routeName);
                          }
                          else{
                            MyDialog.showErrorMsgDialog(context, value);
                          }
                        }
                        else{
                          ShowErrorDialoge(context);
                        }

                      });
                    }, child: Text('Continue',style: TextStyle(fontSize: 18),)),
                SizedBox(height: 10,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromHeight(50),
                        backgroundColor: Colors.redAccent
                    ),
                    onPressed: (){
                      EasyLoading.show();
                      UserApiCalls.cancelTransfer(CalculatorProvider.invoice!).then((value) {
                        EasyLoading.dismiss();
                        if(value!=null){
                          if(value['status']==true){

                            ShowMessageDialoge(context,'Transfer Canceled','Your transaction has been cancelled','Go to Home',(){Navigator.pushNamed(context, HomePage.routeName);});
                          }
                          else{
                            print(CalculatorProvider.invoice);
                            ShowMessageDialoge(context,'Transfer Canceled','Your transaction has been cancelled','Go to Home',(){Navigator.pushNamed(context, HomePage.routeName);});
                          }
                        }
                        else{
                          ShowErrorDialoge(context);
                        }

                      });

                    }, child: Text('Cancel this transfer',style: TextStyle(fontSize: 18),)),
              ],
            ),
          )
        ],
      ),
    );
  }
}


// body: ListView(
//   children: [
//   Column(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         elevation: 2,
//         child: Container(
//           margin: EdgeInsets.all(10),
//           padding: EdgeInsets.all(10),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 '${calculatorInfo!.serviceName}',
//                 style: TextStyle(fontSize: 22),
//               ),
//               Align(
//                   alignment: Alignment.topRight,
//                   child: Text('AUD-${calculatorInfo!.currency}')),
//               SizedBox(
//                 height: 10,
//               ),
//               Divider(
//                 height: 5,
//                 color: Colors.black,
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Send Amount'),
//                   Text('${calculatorInfo!.sendAmount} AUD')
//                 ],
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Fees'),
//                   Text('${calculatorInfo!.fees} AUD')
//                 ],
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('You pay in total'),
//                   Text('${calculatorInfo!.totalPayable} AUD')
//                 ],
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Divider(
//                 height: 5,
//                 color: Colors.black,
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Exchange Rate',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '1 AUD->${calculatorInfo!.exchangeRate} ${calculatorInfo!.currency}',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Divider(
//                 height: 5,
//                 color: Colors.black,
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Your recipient gets',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '${calculatorInfo!.recipientGets} ${calculatorInfo!.currency}',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Divider(
//                 height: 5,
//                 color: Colors.black,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     SizedBox(
//       height: 20,
//     ),
//     Text(
//       'Your Recipient Info',
//       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//       textAlign: TextAlign.center,
//     ),
//     SizedBox(
//       height: 10,
//     ),
//     Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           'Recipient Name : ${recipientsInfo!.firstname} in ${recipientsInfo!.country}',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     ),
//     SizedBox(height: 40,),
//   ],
// ),
//
//     ...provider.paymentMethodList.map((e) => Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Card(
//         child: ListTile(
//           title: Text(e.title!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//           subtitle: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Total ${e.fees} ${e.currency} ${e.subTitle}'),
//               SizedBox(height: 5,),
//               Text(e.description!),
//             ],
//           ),
//           onTap: (){
//             EasyLoading.show();
//             final recipient= SetCalculatorAndRecipientInfo.recipients;
//             final local= SetCalculatorAndRecipientInfo.localAgent;
//             final branch= SetCalculatorAndRecipientInfo.branchName;
//             final agent= SetCalculatorAndRecipientInfo.agentName;
//             final occupation= SetCalculatorAndRecipientInfo.occupation;
//             final relationship= SetCalculatorAndRecipientInfo.relationship;
//             final purpose= SetCalculatorAndRecipientInfo.purpose;
//             final bankInfo= SetCalculatorAndRecipientInfo.bankInfo;
//             final branchInfo= SetCalculatorAndRecipientInfo.branchInfo;
//             final funds= SetCalculatorAndRecipientInfo.fund;
//             final bankAccNumber= SetCalculatorAndRecipientInfo.bankAccNo;
//
//             submit_recipient_model=SubmitRecipientRelationAgentInfoModel(
//                 userToken:GetUserDetails.token,
//                 invoice:calculatorProvider.getUserInvoice(),
//                 recipientId:recipientsInfo!.userId??'',
//                 firstName:recipientsInfo!.firstname??'',
//                 middleName:recipientsInfo!.middlename??'',
//                 lastName:recipientsInfo!.lastname??'',
//                 phone:recipientsInfo!.phone??'',
//                 email:recipientsInfo!.email??'',
//                 streetName:recipientsInfo!.streetName??'',
//                 streetCity:recipientsInfo!.streetCity??'',
//                 fundSource:funds!.value??'',
//                 purpose:purpose!.value??'',
//                 senderOccupation:occupation!.value??null,
//                 beneficiaryRelationship:relationship!.value??'',
//                 bankInfo:bankInfo==null?'':bankInfo.agent??'',
//                 bankId:branchInfo==null?'': branchInfo.bankid??'',
//                 locationId:branchInfo==null?'':branchInfo.locationid??'',
//                 branchInfo:branch??'',
//                 payoutBankCode:branchInfo==null?'':branchInfo.bankid??'',
//                 typeOfAccount:'',
//                 branchId:branchInfo==null?'':branchInfo.bankid??'',
//                 bankAccNumber:bankAccNumber==null?'':bankAccNumber,
//                 agentName:agent??'',
//                 agentCity:local==null?'':local.agentCity??'',
//                 agentBranch:branch==null?'':branch
//             );
//             print('final submit_recipient_model ${submit_recipient_model!.toMap()}');
//
//             CalculatorAPICalls.submitRecipientRelationAgent(submit_recipient_model!).then((value) {
//               EasyLoading.dismiss();
//               if(value['status']==true){
//
//               }
//               if(value['status']==false){
//                 MyDialog.showErrorMsgDialog(context, value);
//               }
//               else{
//                 ShowErrorDialoge(context);
//               }
//             });
//           },
//           trailing: Radio(
//             value: e,
//             groupValue: paymentMethods,
//             onChanged: (value) {
//               setState(() {
//                 paymentMethods = value!;
//                 print(paymentMethods!.title);
//               });
//             },
//           ),
//         ),
//       ),
//     )).toList(),
//   ]
// ),

