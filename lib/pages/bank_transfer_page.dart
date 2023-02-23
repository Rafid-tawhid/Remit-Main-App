import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/helper_method/get_calculator_info.dart';
import 'package:remit_app/models/recipents_model.dart';
import 'package:remit_app/pages/user_profile_page.dart';

import '../colors.dart';
import '../custom_widgits/drawer.dart';
import '../models/bank_agent_data_model.dart';
import '../models/calculator_info_model.dart';
import '../models/get_branch_data_model.dart';
import '../providers/user_profile_provider.dart';

class BankTransferPage extends StatefulWidget {
  static const String routeName='/bank_transfer';
  const BankTransferPage({Key? key}) : super(key: key);

  @override
  State<BankTransferPage> createState() => _BankTransferPageState();
}

class _BankTransferPageState extends State<BankTransferPage> {

  late CalculatorInfoModel? calculatorInfo;
  late Recipients? recipientsInfo;
  LocalAgent? localAgent;
  BankInfo? bankInfo;
  BranchInfo? branchInfo;
  bool branchFound=true;

  @override
  void initState() {
    calculatorInfo=SetCalculatorAndRecipientInfo.getCalculatorInfo();
    recipientsInfo=SetCalculatorAndRecipientInfo.getRecipientInfo();
    super.initState();
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
              Navigator.pushNamed(context,UserProfilePage.routeName);
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
          ShowBankTransferList(),

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

              Consumer<UserProfileProvider>(
                builder: (context, provider, _) => branchFound?Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 1),
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<BranchInfo>(
                        //  menuMaxHeight: 300,
                          dropdownMaxHeight: 300,
                          value: branchInfo,
                          hint: Text(
                            '  Select One',
                            style: TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis),
                          ),
                          isExpanded: true,
                          onChanged: (value) {
                            setState(() {
                              branchInfo=value;
                              print(bankInfo!.agent);
                            });
                          },

                          items: provider.branchInfoList.map((bankInfo) => DropdownMenuItem<BranchInfo>(

                              value: bankInfo,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Icon(Icons.ac_unit,size: 25,),
                                    Text(bankInfo.branch!,style: TextStyle(fontSize: 12,overflow: TextOverflow.ellipsis),),
                                  ],
                                ),
                              )))
                              .toList()),
                    ),
                  ),
                ):Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: TextFormField(
                      // controller: agentbankNameCon,

                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Branch Name',
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
              )
            ],
          ),
          SizedBox(height: 5,),
          BankAndIfscFieldShow(),
          SizedBox(height: 30,),
          Consumer<UserProfileProvider>(
            builder: (context, provider, _) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () async {
                  // EasyLoading.show();
                  // await provider.getSenderRelationshipData();
                //  Navigator.pushNamed(context, RecipientRelationShipPage.routeName,arguments: reciveTwoObject);
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
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
  Column ShowBankTransferList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 8),
          child: Row(
            children: [
              Text(
                'Agent/Bank Name',
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
            child: DropdownButtonFormField<BankInfo>(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
                value: bankInfo,
                hint: Text(
                  '  Select One',
                  style: TextStyle(color: Colors.black),
                ),
                isExpanded: true,
                onChanged: (value) {

                  //calling the branch by bank name if doesnt show input field
                  setState(() {
                    bankInfo=value;
                    print(bankInfo!.agent);
                    EasyLoading.show();
                    branchInfo=null;
                  });
                  provider.getBranchDataByBankName(
                      calculatorInfo!.countryId,
                      calculatorInfo!.serviceId,bankInfo!.agent,'').then((value) {
                    EasyLoading.dismiss();
                    provider.branchInfoList.forEach((element) {
                      if(element.branch==""){
                        print('No Branch Found');
                        setState(() {
                          branchFound=false;
                        });
                      }
                      else {
                        print(element.branch);
                        setState(() {
                          branchFound=true;
                        });
                      }
                    });
                  });

                },

                validator: (value) {
                  if (value == null) {
                    return "can't empty";
                  } else {
                    return null;
                  }
                },
                items: provider.bankInfoList
                    .map((bank) => DropdownMenuItem<BankInfo>(
                    value: bank,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Row(
                        children: [
                          // Icon(Icons.ac_unit,size: 25,),
                          Text(bank!.agent??'Null')
                        ],
                      ),
                    )))
                    .toList()),
          ),
        ),
      ],
    );
  }

  Column BankAndIfscFieldShow(){

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'Bank Account Number',
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Recipient Id Number',
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
        SizedBox(height: 10,),
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
                  // const Icon(
                  //   Icons.star,
                  //   color: Colors.red,
                  //   size: 12,
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter recipient bank account number',
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
      ],
    );
  }


}
