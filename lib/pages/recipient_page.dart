import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/helper_method/get_user_info.dart';
import 'package:remit_app/models/recipents_model.dart';
import 'package:remit_app/providers/user_profile_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_calls/user_recipients_calls.dart';
import '../colors.dart';
import '../custom_widgits/button1.dart';
import '../custom_widgits/drawer.dart';
import '../models/calculator_info_model.dart';
import '../pages/user_profile_page.dart';
import 'chose_recipient_type.dart';

class ReceipientPage extends StatefulWidget {
  static const String routeName = '/recipient';
  const ReceipientPage({Key? key}) : super(key: key);

  @override
  State<ReceipientPage> createState() => _ReceipientPageState();
}

class _ReceipientPageState extends State<ReceipientPage> {
  Recipients? recipient;
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
  String? errorMsg;
  bool showRecipientInfo = false;
  bool showErrorMsg = false;
  bool hideBilling = true;
  //
  late CalculatorInfoModel calculatorInfo;
  final firstNameCon = TextEditingController();
  final middleNameCon = TextEditingController();
  final lastNameCon = TextEditingController();
  final addressCon = TextEditingController();
  final cityCon = TextEditingController();
  final phoneCon = TextEditingController();
  final emailCon = TextEditingController();
  final countryCon = TextEditingController();

  @override
  void dispose() {
    firstNameCon.dispose();
    middleNameCon.dispose();
    lastNameCon.dispose();
    addressCon.dispose();
    cityCon.dispose();
    phoneCon.dispose();
    emailCon.dispose();
    countryCon.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    GetUserDetails.getUserToken().then((value) {
      token = value;
    });
    calculatorInfo = ModalRoute.of(context)!.settings.arguments as CalculatorInfoModel;
    if (calculatorInfo == null) {
      hideBilling = true;
      print('NOTHING PHONE');
    } else {
      print(calculatorInfo.toMap());
      serviceName = calculatorInfo.serviceName;
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
          if (hideBilling)
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
            'Choose your Recipient',
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
          Consumer<UserProfileProvider>(
            builder: (context, provider, _) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField2<Recipients>(
                  dropdownMaxHeight: 300,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 5),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10,),
                          borderSide: BorderSide(
                              width: .5,
                              color: Colors.grey
                          )
                      ),
                      focusedBorder: OutlineInputBorder()
                  ),
                  value: recipient,
                  hint: Text(
                    '  Existing Receipient',
                    style: TextStyle(color: Colors.black),
                  ),
                  isExpanded: true,
                  onChanged: (value) {
                    recipient = value;

                    if (countryName!.toLowerCase() == recipient!.country!.toLowerCase()) {
                      setState(() {
                        showErrorMsg = false;
                        showRecipientInfo = true;
                        firstNameCon.text = recipient!.firstname ?? '';
                        middleNameCon.text = recipient!.middlename ?? '';
                        lastNameCon.text = recipient!.lastname ?? '';
                        addressCon.text = recipient!.streetName ?? '';
                        cityCon.text = recipient!.streetCity ?? '';
                        phoneCon.text = recipient!.phone ?? '';
                        emailCon.text = recipient!.email ?? '';
                        countryCon.text = recipient!.country ?? '';
                      });
                    } else {
                      setState(() {
                        showErrorMsg = true;
                        showRecipientInfo = false;
                        errorMsg = 'This recipient is not eligible to get recieve money from $countryName';
                      });
                    }
                  },
                  // onSaved: (value) {
                  //   setState(() {
                  //     recipient = value;
                  //   });
                  // },
                  validator: (value) {
                    if (value == null) {
                      return "can't empty";
                    } else {
                      return null;
                    }
                  },
                  items: provider.recipientsList
                      .map((reciver) => DropdownMenuItem<Recipients>(
                          value: reciver,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              children: [
                                // Icon(Icons.ac_unit,size: 25,),
                                Text(
                                    '${reciver.firstname} - ${reciver.country}'),
                              ],
                            ),
                          )))
                      .toList()),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          if (showErrorMsg)
            Container(
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  '$errorMsg',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),

          // Consumer<UserProfileProvider>(builder: (context,provider,_)=> DropDown<String>(
          //   items: provider.recipientsNameList,
          //   icon: Icon(
          //     Icons.expand_more,
          //     color: Colors.blue,
          //   ),
          //   customWidgets: provider.recipientsList.map((e) => Row(
          //     children: <Widget>[
          //       CircleAvatar(
          //         backgroundImage: NetworkImage(
          //             "https://raw.githubusercontent.com/rrousselGit/provider/master/resources/expanded_devtools.jpg"),
          //       ),
          //       Text(e.firstname!),
          //
          //     ],
          //   ),).toList(),
          //   hint: Text("Select Gender"),
          //   onChanged: print,
          // ),),

          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Add Recepint',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              )
            ],
          ),
          if (showRecipientInfo)
            Column(
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
                            'First Name ',
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
                          controller: firstNameCon,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'First Name',
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
                            'Middle Name ',
                            style: TextStyle(color: MyColor.grey, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: TextFormField(
                          controller: middleNameCon,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Middle Name',
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
                            'Last Name ',
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
                          controller: lastNameCon,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Last Name',
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
                            'Address ',
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
                          controller: addressCon,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Enter Your Address',
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
                            'Suburb/town/city ',
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
                          controller: countryCon,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Suburb/town/city',
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
                            'Phone ',
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
                          controller: phoneCon,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Phone',
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
                            'Email ',
                            style: TextStyle(color: MyColor.grey, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: TextFormField(
                          controller: emailCon,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Email',
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
                            'Country ',
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
                          controller: countryCon,
                          enabled: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Country',
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
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          if(showRecipientInfo)Consumer<UserProfileProvider>(
            builder: (context, provider, _) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: () async {
                    EasyLoading.show();
                     await provider.getBankAgentData(token!,calculatorInfo.countryId!,calculatorInfo.serviceId!).then((value) {
                       EasyLoading.dismiss();
                   });

                   Navigator.pushNamed(context, ChooseRecipientType.routeName,arguments: [calculatorInfo, recipient]);
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
            height: 20,
          ),
        ],
      ),
    );
  }
}


