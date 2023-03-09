import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/helper_method/get_user_info.dart';
import 'package:remit_app/pages/user_profile_page.dart';

import '../colors.dart';
import '../custom_widgits/drawer.dart';
import '../helper_method/get_calculator_info.dart';
import '../models/bank_agent_data_model.dart';
import '../models/calculator_info_model.dart';
import '../models/get_branch_data_model.dart';
import '../models/recipents_model.dart';
import 'recipient_relationship_page.dart';
import '../providers/user_profile_provider.dart';

class CashPickupPage extends StatefulWidget {
  static const String routeName = '/cash_pickup';
  const CashPickupPage({Key? key}) : super(key: key);

  @override
  State<CashPickupPage> createState() => _CashPickupPageState();
}

class _CashPickupPageState extends State<CashPickupPage> {
  late CalculatorInfoModel? calculatorInfo;
  late Recipients? recipientsInfo;
  LocalAgent? localAgent;
  BankInfo? bankInfo;
  BranchInfo? branchInfo;
  LocalAgentBranch? localAgentBranchInfo;
  String? localAgentName;
  String? branchNameBylocalAgent;
  bool branchFound = true;
  late UserProfileProvider provider;
  bool showExceptionCountryWidgets = false;
  bool callOnce = true;
  bool showSomeSpecialFeatures = false;
  final ifscCon = TextEditingController();

  @override
  void initState() {
    calculatorInfo = SetCalculatorAndRecipientInfo.getCalculatorInfo();
    recipientsInfo = SetCalculatorAndRecipientInfo.getRecipientInfo();
    EasyLoading.dismiss();
    super.initState();
  }

  @override
  void dispose() {
    ifscCon.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    provider = Provider.of(context, listen: true);
    if (callOnce) {
      //  exceptionCountryCalllocalAgent();
      if (provider.localAgentList.length > 0) {
        provider.bankInfoList
            .insert(0, BankInfo(agent: 'Local Agent', totalBranch: '000'));
      }
    }
    callOnce = false;

    //exception for india


    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ShowRecipientTransactionInfo(),
          SizedBox(
            height: 10,
          ),
          // if(showExceptionCountryWidgets)ShowBankInfoListException(),
          // if(!showExceptionCountryWidgets)ShowCashPickupBankAgentName(),
          // if(!showExceptionCountryWidgets)ShowBranchNameForCashPickupInfo(),
          ShowBankInfoListException(),
        ],
      ),
    );
  }

  Column ShowRecipientTransactionInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
      ],
    );
  }

  Column ShowBankInfoListException() {
    return Column(
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
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(6)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<BankInfo>(
                  //  menuMaxHeight: 300,
                    dropdownMaxHeight: 300,
                    value: bankInfo,
                    hint: Text(
                      '  Select One',
                      style: TextStyle(
                          color: Colors.black, overflow: TextOverflow.ellipsis),
                    ),
                    isExpanded: true,
                    onChanged: (value) {
                      branchNameBylocalAgent = null;
                      localAgentName = null;
                      if (value!.agent == 'Local Agent') {
                        ///some special features for pakistan
                        setState(() {
                          branchNameBylocalAgent = null;
                          localAgent = null;
                          bankInfo = value;
                          showSomeSpecialFeatures = true;
                          //Set bank name as local agent
                          SetCalculatorAndRecipientInfo.setSubmitBankInfoFromCashPicupLocalAgent(BankInfo(agent: 'local_agent'));
                        });
                      } else {
                        setState(() {
                          branchNameBylocalAgent = null;
                          localAgent = null;
                          bankInfo = value;
                          showSomeSpecialFeatures = false;
                          print(bankInfo!.agent);
                          EasyLoading.show();
                          branchInfo = null;
                        });

                        //GET Branch data by bank name
                        provider
                            .getBranchDataByBankName(
                            calculatorInfo!.countryId,
                            calculatorInfo!.serviceId,
                            bankInfo!.agent,
                            recipientsInfo!.streetName)
                            .then((value) {
                          provider.getBranchNameByLocalAgentName();
                          EasyLoading.dismiss();
                          // provider.branchInfoList.forEach((element) {
                          //   if(element.branch==""){
                          //     print('No Branch Found');
                          //     setState(() {
                          //       branchFound=false;
                          //     });
                          //   }
                          //   else {
                          //     print('BRANCH ${element.branch}');
                          //     setState(() {
                          //       branchFound=true;
                          //     });
                          //   }
                          // });
                        });
                      }
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
                              Text(
                                bankInfo.agent!,
                                style: TextStyle(
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        )))
                        .toList()),
              ),
            ),
          ),
        ),
        if (!showSomeSpecialFeatures)Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            children: [
              Text(
                'Branch Name',
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
        // for location id and bank id
        if (!showSomeSpecialFeatures)Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<BranchInfo>(
                    value: branchInfo,
                    dropdownMaxHeight: 300,
                    hint: Text(
                      '  Select One',
                      style: TextStyle(
                          color: Colors.black, overflow: TextOverflow.ellipsis),
                    ),
                    isExpanded: true,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: provider.branchInfoList.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items.branch!),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (newValue) {
                      setState(() {
                        branchInfo = newValue!;
                        //for location id and bank id
                      });
                    },
                  ),
                ),
              ),
            ),
            //ifsce optional
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Row(
                    children: [
                      Text(
                        'IFSC/BSB/Routing No(Optional)',
                        style: TextStyle(color: MyColor.grey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
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
                      controller: ifscCon,
                    ),
                  ),
                ),
              ],
            ),
            //BUTTON AND VALIDATION
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: ()  {

                    if(bankInfo==null||branchInfo==null){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select all required field')));
                    }
                    else {

                      Navigator.pushNamed(context, RecipientRelationShipPage.routeName);
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
          ],
        ),
        if (showSomeSpecialFeatures)Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            /* City*/
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'City ',
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
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<LocalAgent>(
                    //  menuMaxHeight: 300,
                      dropdownMaxHeight: 300,
                      value: localAgent,
                      hint: Text(
                        '  Select One',
                        style: TextStyle(
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis),
                      ),
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {
                          branchNameBylocalAgent = null;
                          localAgent = value;
                        });
                        EasyLoading.show();
                        provider
                            .getBranchDataByCityName(
                            calculatorInfo!.countryId,
                            calculatorInfo!.serviceId,
                            value!.agentCity)
                            .then((_) {
                          EasyLoading.dismiss();
                          provider.getBranchNameByCityName(value.agentCity!);
                        });

                        // provider.localagentBranchList.forEach((element) {
                        //   print(element.toString());
                        // });
                        provider.getLocalAgentNameByBranchName(value.agentCity!);
                      },
                      items: provider.localAgentList
                          .map((localAgent) => DropdownMenuItem<LocalAgent>(
                          value: localAgent,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                // Icon(Icons.ac_unit,size: 25,),
                                Text(
                                  localAgent.agentCity!,
                                  style: TextStyle(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                          )))
                          .toList()),
                ),
              ),
            ),

            //Branch
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'Branch ',
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
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    value: branchNameBylocalAgent,
                    dropdownMaxHeight: 300,
                    hint: Text(
                      '  Select One',
                      style: TextStyle(
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis),
                    ),
                    isExpanded: true,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items:
                    provider.branchNameListByCityName.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        localAgentName = null;
                        branchNameBylocalAgent = newValue!;
                      });
                      print(newValue);
                      provider.getAgentNameByBranchName(newValue!);
                    },
                  ),
                ),
              ),
            ),

            //agent
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'Agent',
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
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    value: localAgentName,
                    dropdownMaxHeight: 300,
                    hint: Text(
                      '  Select One',
                      style: TextStyle(
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis),
                    ),
                    isExpanded: true,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: provider.agentNameListByBranch.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        localAgentName = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ),


            //ifsce optional
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Row(
                    children: [
                      Text(
                        'IFSC/BSB/Routing No(Optional)',
                        style: TextStyle(color: MyColor.grey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
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
                      controller: ifscCon,
                    ),
                  ),
                ),
              ],
            ),

            //BUTTON AND VALIDATION
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {

                  if(localAgent==null||branchNameBylocalAgent==null||localAgentName==null){
                    print('All filed required');
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select all required field')));
                  }
                  else {
                    print('Show info Local............');
                    print(ifscCon.text);
                    print(localAgent!.agentCity);
                    print(branchNameBylocalAgent);
                    print(localAgentName);
                    //set cash pickup info
                    SetCalculatorAndRecipientInfo.setSubmitInfoCashPickUp(localAgent!, branchNameBylocalAgent!, localAgentName!);
                    Navigator.pushNamed(context, RecipientRelationShipPage.routeName);
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
          ],
        ),


      ],
    );
  }









  //
  // Column ShowBranchNameForCashPickupInfo() {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
  //         child: Row(
  //           children: [
  //             Text(
  //               'Branch Name ',
  //               style: TextStyle(color: MyColor.grey, fontSize: 16),
  //             ),
  //             const Icon(
  //               Icons.star,
  //               color: Colors.red,
  //               size: 12,
  //             ),
  //           ],
  //         ),
  //       ),
  //
  //       Consumer<UserProfileProvider>(
  //           builder: (context, provider, _) => Padding(
  //                 padding: const EdgeInsets.all(16.0),
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                       border: Border.all(color: Colors.black, width: 1),
  //                       borderRadius: BorderRadius.circular(6)),
  //                   child: DropdownButtonHideUnderline(
  //                     child: DropdownButton2<LocalAgentBranch>(
  //                         //  menuMaxHeight: 300,
  //                         dropdownMaxHeight: 300,
  //                         value: localAgentBranchInfo,
  //                         hint: Text(
  //                           '  Select One',
  //                           style: TextStyle(
  //                               color: Colors.black,
  //                               overflow: TextOverflow.ellipsis),
  //                         ),
  //                         isExpanded: true,
  //                         onChanged: (value) {
  //                           setState(() {
  //                             localAgentName = null;
  //                             localAgentBranchInfo = value;
  //                             provider.localagentNameListByBranchName.clear();
  //                             provider.getLocalAgentNameByBranchName(
  //                                 value!.agentBranch!);
  //                             print(localAgentBranchInfo!.agentBranch);
  //                           });
  //                         },
  //                         items: provider.localagentBranchList
  //                             .map((bankInfo) =>
  //                                 DropdownMenuItem<LocalAgentBranch>(
  //                                     value: bankInfo,
  //                                     child: Padding(
  //                                       padding:
  //                                           const EdgeInsets.only(left: 14.0),
  //                                       child: Column(
  //                                         mainAxisSize: MainAxisSize.min,
  //                                         crossAxisAlignment:
  //                                             CrossAxisAlignment.start,
  //                                         children: [
  //                                           // Icon(Icons.ac_unit,size: 25,),
  //                                           Text(
  //                                             bankInfo.agentBranch!,
  //                                             style: TextStyle(
  //                                                 fontSize: 12,
  //                                                 overflow:
  //                                                     TextOverflow.ellipsis),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     )))
  //                             .toList()),
  //                   ),
  //                 ),
  //               )),
  //
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
  //         child: Row(
  //           children: [
  //             Text(
  //               'Agent ',
  //               style: TextStyle(color: MyColor.grey, fontSize: 16),
  //             ),
  //             const Icon(
  //               Icons.star,
  //               color: Colors.red,
  //               size: 12,
  //             ),
  //           ],
  //         ),
  //       ),
  //
  //       Consumer<UserProfileProvider>(builder: (context, provider, _) => Padding(
  //                 padding: const EdgeInsets.all(16.0),
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                       border: Border.all(color: Colors.black, width: 1),
  //                       borderRadius: BorderRadius.circular(6)),
  //                   child: DropdownButtonHideUnderline(
  //                     child: DropdownButton2<String>(
  //                         //  menuMaxHeight: 300,
  //                         dropdownMaxHeight: 300,
  //                         value: localAgentName,
  //                         hint: Text(
  //                           '  Select One',
  //                           style: TextStyle(
  //                               color: Colors.black,
  //                               overflow: TextOverflow.ellipsis),
  //                         ),
  //                         isExpanded: true,
  //                         onChanged: (value) {
  //                           setState(() {
  //                             localAgentName = value;
  //                           });
  //                         },
  //                         items: provider.localagentNameListByBranchName
  //                             .map((agent) => DropdownMenuItem<String>(
  //                                 value: localAgentName,
  //                                 child: Padding(
  //                                   padding: const EdgeInsets.only(left: 14.0),
  //                                   child: Column(
  //                                     mainAxisSize: MainAxisSize.min,
  //                                     crossAxisAlignment:
  //                                         CrossAxisAlignment.start,
  //                                     children: [
  //                                       // Icon(Icons.ac_unit,size: 25,),
  //                                       Text(
  //                                         agent,
  //                                         style: TextStyle(
  //                                             fontSize: 12,
  //                                             overflow: TextOverflow.ellipsis),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 )))
  //                             .toList()),
  //                   ),
  //                 ),
  //               )),
  //
  //       //BUTTON AND VALIDATION
  //       Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Container(
  //           width: MediaQuery.of(context).size.width,
  //           child: ElevatedButton(
  //             onPressed: () async {
  //               SetCalculatorAndRecipientInfo.setSubmitInfoCashPickUp(localAgent!, branchNameBylocalAgent!, localAgentName!);
  //               Navigator.pushNamed(context, RecipientRelationShipPage.routeName);
  //             },
  //             child: Text(
  //               'Next',
  //               style: MyStyle.mytext(TextStyle(fontSize: 16)),
  //             ),
  //             style: ElevatedButton.styleFrom(
  //                 fixedSize: Size.fromHeight(50),
  //                 backgroundColor: Color(0xff02A6EB)),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //
  // Column ShowCashPickupBankAgentName() {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
  //         child: Row(
  //           children: [
  //             Text(
  //               'Agent/Bank Name',
  //               style: TextStyle(color: MyColor.grey, fontSize: 16),
  //             ),
  //             const Icon(
  //               Icons.star,
  //               color: Colors.red,
  //               size: 12,
  //             ),
  //           ],
  //         ),
  //       ),
  //       Consumer<UserProfileProvider>(
  //         builder: (context, provider, _) => Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Container(
  //             decoration: BoxDecoration(
  //                 border: Border.all(color: Colors.black, width: 1),
  //                 borderRadius: BorderRadius.circular(6)),
  //             child: DropdownButtonHideUnderline(
  //               child: DropdownButton2<LocalAgent>(
  //                   //  menuMaxHeight: 300,
  //                   dropdownMaxHeight: 300,
  //                   value: localAgent,
  //                   hint: Text(
  //                     '  Select One',
  //                     style: TextStyle(
  //                         color: Colors.black, overflow: TextOverflow.ellipsis),
  //                   ),
  //                   isExpanded: true,
  //                   onChanged: (value) {
  //                     if (value!.agentCity == 'Local Agent') {
  //                       ///some special features for pakistan
  //                     } else {
  //                       setState(() {
  //                         localAgentBranchInfo = null;
  //                         localAgentName = null;
  //                         provider.localagentNameListByBranchName.clear();
  //                         localAgent = value;
  //                         print(localAgent!.agentCity);
  //                         EasyLoading.show();
  //                         branchInfo = null;
  //                       });
  //                       provider
  //                           .getBranchDataByCityName(
  //                               calculatorInfo!.countryId,
  //                               calculatorInfo!.serviceId,
  //                               localAgent!.agentCity)
  //                           .then((value) {
  //                         EasyLoading.dismiss();
  //                         provider.localagentBranchList.forEach((element) {
  //                           // if(element.branch==""){
  //                           //   print('No Branch Found');
  //                           //   setState(() {
  //                           //     branchFound=false;
  //                           //   });
  //                           // }
  //                           // else {
  //                           //   print(element.branch);
  //                           //   setState(() {
  //                           //     branchFound=true;
  //                           //   });
  //                           // }
  //                         });
  //                       });
  //                     }
  //                   },
  //                   items: provider.localAgentList
  //                       .map((localAgent) => DropdownMenuItem<LocalAgent>(
  //                           value: localAgent,
  //                           child: Padding(
  //                             padding: const EdgeInsets.only(left: 14.0),
  //                             child: Column(
  //                               mainAxisSize: MainAxisSize.min,
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 // Icon(Icons.ac_unit,size: 25,),
  //                                 Text(
  //                                   localAgent!.agentCity!,
  //                                   style: TextStyle(
  //                                       fontSize: 12,
  //                                       overflow: TextOverflow.ellipsis),
  //                                 ),
  //                               ],
  //                             ),
  //                           )))
  //                       .toList()),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //
  // void exceptionCountryCalllocalAgent() {
  //   if (calculatorInfo!.countryId == '8' &&
  //       calculatorInfo!.serviceName == 'Cash Pickup') {
  //     showExceptionCountryWidgets = true;
  //     setState(() {
  //       showExceptionCountryWidgets = true;
  //     });
  //     provider.bankInfoList
  //         .insert(0, BankInfo(agent: 'Local Agent', totalBranch: '000'));
  //   }
  //
  //   print('provider.localAgentList.length ${provider.localAgentList.length}');
  //   // if(provider.localAgentList.length>0){
  //   //   provider.bankInfoList.insert(0, BankInfo(agent: 'Local Agent',totalBranch: '000'));
  //   // }
  // }
}

