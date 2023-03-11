import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/custom_widgits/dialog_widgits.dart';
import 'package:remit_app/helper_method/get_calculator_info.dart';
import 'package:remit_app/models/recipents_model.dart';
import 'package:remit_app/pages/recipient_page.dart';
import 'package:remit_app/pages/user_profile_page.dart';

import '../colors.dart';
import '../custom_widgits/drawer.dart';
import '../helper_method/get_user_info.dart';
import '../models/bank_agent_data_model.dart';
import '../models/calculator_info_model.dart';
import '../models/get_branch_data_model.dart';
import 'recipient_relationship_page.dart';
import '../providers/user_profile_provider.dart';

class BankTransferPage extends StatefulWidget {
  static const String routeName = '/bank_transfer';
  const BankTransferPage({Key? key}) : super(key: key);

  @override
  State<BankTransferPage> createState() => _BankTransferPageState();
}

class _BankTransferPageState extends State<BankTransferPage> {
  late CalculatorInfoModel? calculatorInfo;
  late Recipients? recipientsInfo;
  LocalAgent? localAgent;
  BankInfo? bankInfo;
  String? typeOfAccount;
  BranchInfo? branchInfo;
  bool branchFound = true;
  final bankAccNoCon = TextEditingController();
  final ifscCon = TextEditingController();
  final branchNameCon = TextEditingController();
  BranchInfo? branchName;
  String? exceptionLocationId;
  String? exceptionBankId;
  bool exceptionForIndia = false;

  @override
  void dispose() {
    bankAccNoCon.dispose();
    ifscCon.dispose();
    branchNameCon.dispose();
    super.dispose();
  }

  @override
  void initState() {
    calculatorInfo = SetCalculatorAndRecipientInfo.getCalculatorInfo();
    recipientsInfo = SetCalculatorAndRecipientInfo.getRecipientInfo();
    if (recipientsInfo!.country == 'India') {
      exceptionForIndia = true;
    }

    EasyLoading.dismiss();

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
              Navigator.pushNamed(context, UserProfilePage.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0, top: 5, bottom: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(.5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      GetUserDetails.userProfileModel!.image!,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          //show card without discount
          if (!calculatorInfo!.hasDiscount!)
            AllNormalCalculatorCardInfo(calculatorInfo: calculatorInfo),

          //show card with rate discount
          if (calculatorInfo!.hasDiscount == true &&
              calculatorInfo!.couponData!.calculateWith == 'rate')
            AllCalculatorInfoWithRateCoupon(calculatorInfo: calculatorInfo),

          //show card with fess discount
          if (calculatorInfo!.hasDiscount == true &&
              calculatorInfo!.couponData!.calculateWith == 'fees')

            AllCalculatorInfoWithFeesCoupon(calculatorInfo: calculatorInfo),


          //show card with send amount discount
          if (calculatorInfo!.hasDiscount == true &&
              calculatorInfo!.couponData!.calculateWith == 'send_amount')
            AllCalculatorInfoWithSendCoupon(calculatorInfo: calculatorInfo),

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
          SizedBox(
            height: 10,
          ),
          ShowBankTransferList(),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
                builder: (context, provider, _) => branchFound
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(6)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<BranchInfo>(
                                //  menuMaxHeight: 300,
                                dropdownMaxHeight: 300,
                                value: branchInfo,
                                hint: Text(
                                  '  Select One',
                                  style: TextStyle(
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                isExpanded: true,
                                onChanged: (value) {
                                  setState(() {
                                    branchInfo = value;
                                    print(bankInfo!.agent);
                                  });
                                },
                                items: provider.branchInfoList
                                    .map((bankInfo) =>
                                        DropdownMenuItem<BranchInfo>(
                                            value: bankInfo,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 14.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Icon(Icons.ac_unit,size: 25,),
                                                  Text(
                                                    bankInfo.branch!,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ],
                                              ),
                                            )))
                                    .toList()),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: TextFormField(
                            controller: branchNameCon,
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
          SizedBox(
            height: 5,
          ),
          BankAndIfscFieldShow(),
          SizedBox(
            height: 30,
          ),
          Consumer<UserProfileProvider>(
            builder: (context, provider, _) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {
                  if (bankInfo == null || bankAccNoCon.text.isEmpty) {
                    print('All filed required');
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please select all required field')));
                    return;
                  }
                  if (exceptionForIndia == true &&
                      (ifscCon == null || ifscCon.text.isEmpty)) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please select all required field')));
                    return;
                  }
                  if (exceptionForIndia == true && typeOfAccount == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Please select all required field')));
                    return;
                  } else {
                    if (branchInfo == null) {
                      branchName = BranchInfo(
                          branch: branchNameCon.text,
                          locationid: exceptionLocationId,
                          bankid: exceptionBankId);
                      branchInfo = branchName;
                    }
                    print('Show info Local............');
                    print(bankInfo.toString());
                    print(branchInfo.toString());

                    //SET BANK TRANSFER INFO
                    SetCalculatorAndRecipientInfo.setSubmitInfoBankTransferInfo(
                        bankInfo!, branchInfo!);

                    //SET BANK ACCOUNT
                    SetCalculatorAndRecipientInfo
                        .setSubmitInfoBankTransferBankAccNo(bankAccNoCon.text);

                    //set route Name and type of bank for india
                    SetCalculatorAndRecipientInfo.setSubmitRouteNameBankAccType(
                        ifscCon.text.trim(), typeOfAccount);

                    Navigator.pushNamed(
                        context, RecipientRelationShipPage.routeName);
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
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }



  Column ShowBankTransferList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
                menuMaxHeight: 300,
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
                    bankInfo = value;
                    print(bankInfo!.agent);
                    EasyLoading.show();
                    branchInfo = null;
                  });
                  provider
                      .getBranchDataByBankName(calculatorInfo!.countryId,
                          calculatorInfo!.serviceId, bankInfo!.agent, '')
                      .then((value) {
                    if (value != null) {
                      EasyLoading.dismiss();
                      provider.branchInfoList.forEach((element) {
                        if (element.branch == "") {
                          //IF NO BRANCH FOUND LOCATIONID AND BANK ID SHOULD BE FROM LIST (EXCEPTION)
                          print('No Branch Found');
                          exceptionLocationId = element.locationid;
                          exceptionBankId = element.bankid;

                          setState(() {
                            branchFound = false;
                          });
                        } else {
                          print(element.branch);
                          setState(() {
                            branchFound = true;
                          });
                        }
                      });
                    } else {
                      EasyLoading.dismiss();
                      MyDialog.showServerProblemDialog(context);
                    }
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
                              Flexible(
                                  child: Text(
                                bank!.agent ?? 'Null',
                                overflow: TextOverflow.visible,
                              ))
                            ],
                          ),
                        )))
                    .toList()),
          ),
        ),
      ],
    );
  }

  Column BankAndIfscFieldShow() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
                  controller: bankAccNoCon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Recipient Id Number',
                    suffixIconConstraints:
                        BoxConstraints(maxHeight: 30, maxWidth: 38),
                    hintStyle: TextStyle(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: .5, color: Colors.grey),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'IFSC/BSB/Routing No :${exceptionForIndia ? '' : 'Optional'}',
                    style: TextStyle(color: MyColor.grey, fontSize: 16),
                  ),
                  exceptionForIndia
                      ? Icon(
                          Icons.star,
                          color: Colors.red,
                          size: 12,
                        )
                      : Icon(
                          Icons.add,
                          color: Colors.transparent,
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: TextFormField(
                  controller: ifscCon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter recipient bank account number',
                    suffixIconConstraints:
                        BoxConstraints(maxHeight: 30, maxWidth: 38),
                    hintStyle: TextStyle(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: .5, color: Colors.grey),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        if (exceptionForIndia)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButtonFormField<String>(
                menuMaxHeight: 300,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
                value: typeOfAccount,
                hint: Text(
                  '  Select One',
                  style: TextStyle(color: Colors.black),
                ),
                isExpanded: true,
                onChanged: (value) {
                  typeOfAccount = value;
                  print(value);
                },
                validator: (value) {
                  if (value == null) {
                    return "can't empty";
                  } else {
                    return null;
                  }
                },
                items: ['NRE Account', 'Family support']
                    .map((bank) => DropdownMenuItem<String>(
                        value: bank,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Row(
                            children: [
                              // Icon(Icons.ac_unit,size: 25,),
                              Flexible(
                                  child: Text(
                                bank,
                                overflow: TextOverflow.visible,
                              ))
                            ],
                          ),
                        )))
                    .toList()),
          ),
      ],
    );
  }
}

class AllCalculatorInfoWithSendCoupon extends StatelessWidget {
  const AllCalculatorInfoWithSendCoupon({
    Key? key,
    required this.calculatorInfo,
  }) : super(key: key);

  final CalculatorInfoModel? calculatorInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: MyColor.grey),
        ),
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
                  alignment: Alignment.topRight, child: Text('AUD-${calculatorInfo!.currency}')),
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
                children: [Text('Send Amount'), Text('${calculatorInfo!.sendAmount} AUD')],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Fees'), Text('${double.parse(calculatorInfo!.fees!).toStringAsFixed(2)} AUD')],
              ),
              SizedBox(height: 5,),
              calculatorInfo!.couponData!.discountType == 'P'
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount Send Amount ${calculatorInfo!.couponData!.discount}(%)',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('${calculatorInfo!.couponData!.discountPrice} ${calculatorInfo!.currency}',style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount Send Amount (Fixed)',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(
                    '${calculatorInfo!.couponData!.discountPrice} ${calculatorInfo!.currency}',style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('You pay in total'), Text('${calculatorInfo!.totalPayable} AUD')],
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

                  ),
                  Text(
                    '1 AUD->${calculatorInfo!.couponData!.rate} ${calculatorInfo!.currency}',
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${calculatorInfo!.couponData!.recipientGetAmount} ${calculatorInfo!.currency}',
                        style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),
                      ),
                      Text(
                        '${calculatorInfo!.couponData!.recipientGetAmountDiscount} ${calculatorInfo!.currency}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
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
            ],
          ),
        ),
      ),
    );
  }
}


class AllCalculatorInfoWithRateCoupon extends StatelessWidget {
  const AllCalculatorInfoWithRateCoupon({
    Key? key,
    required this.calculatorInfo,
  }) : super(key: key);

  final CalculatorInfoModel? calculatorInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 1, color: MyColor.grey),
    ),
    child: Container(
      color: Colors.white,
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
              alignment: Alignment.topRight, child: Text('AUD-${calculatorInfo!.currency}')),
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
            children: [Text('Send Amount'), Text('${calculatorInfo!.sendAmount} AUD')],
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
          calculatorInfo!.couponData!.discountType == 'P'
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Discount rate ${calculatorInfo!.couponData!.discount}(%)'),
              Text(
                '${calculatorInfo!.couponData!.rateAfterDiscount} AUD',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Discount Rate (Fixed) '),
              Text(
                '1 AUD -> ${calculatorInfo!.couponData!.rateAfterDiscount} ${calculatorInfo!.currency}',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('You pay in total'), Text('${calculatorInfo!.totalPayable} AUD')],
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
              ),
              Text(
                '1 AUD->${calculatorInfo!.couponData!.rate}',
                style: TextStyle(decoration: TextDecoration.lineThrough),
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
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${calculatorInfo!.couponData!.recipientGetAmount} ${calculatorInfo!.currency}',
                    style:
                    TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${calculatorInfo!.couponData!.recipientGetAmountDiscount} ${calculatorInfo!.currency}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
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
        ],
      ),
    ),
            ),
          );
  }
}

class AllCalculatorInfoWithFeesCoupon extends StatelessWidget {
  const AllCalculatorInfoWithFeesCoupon({
    Key? key,
    required this.calculatorInfo,
  }) : super(key: key);

  final CalculatorInfoModel? calculatorInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: MyColor.grey),
        ),
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
                children: [Text('Fees'), Text('${double.parse(calculatorInfo!.couponData!.discountPrice.toString())+double.parse(calculatorInfo!.couponData!.discountValue!.toString())} AUD',style: TextStyle(decoration: TextDecoration.lineThrough),)],
              ),
              SizedBox(
                height: 5,
              ),
              calculatorInfo!.couponData!.discountType == 'P'
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount fees ${calculatorInfo!.couponData!.discount}(%)',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(
                    '${calculatorInfo!.couponData!.discountPrice} AUD',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Discount Fees  ${calculatorInfo!.couponData!.discount} (Fixed) ',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(
                    ' ${calculatorInfo!.couponData!.discountPrice} AUD',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
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

                  ),
                  Text(
                    '1 AUD->${calculatorInfo!.couponData!.rate} ${calculatorInfo!.currency}',

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
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllNormalCalculatorCardInfo extends StatelessWidget {
  const AllNormalCalculatorCardInfo({
    Key? key,
    required this.calculatorInfo,
  }) : super(key: key);

  final CalculatorInfoModel? calculatorInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: MyColor.grey),
        ),
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
                  Text('${calculatorInfo!.currency} AUD')
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
                    '1 AUD->${calculatorInfo!.previousRate} ${calculatorInfo!.currency}',
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
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
