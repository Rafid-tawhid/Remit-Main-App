import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/models/bank_agent_data_model.dart';
import 'package:remit_app/models/get_branch_data_model.dart';
import 'package:remit_app/models/recipents_model.dart';
import 'package:remit_app/pages/user_profile_page.dart';

import '../colors.dart';
import '../custom_widgits/drawer.dart';
import '../helper_method/get_user_info.dart';
import '../models/calculator_info_model.dart';
import 'recipient_relationship_page.dart';
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
  BranchInfo? branchInfo;
  bool branchFound=true;
  LocalAgentBranch? localAgentbranchInfo;
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
  bool showBankTransferAgentInfo=false;
  bool local_agent_branch_List=false;

  List<dynamic>? reciveTwoObject;
  late CalculatorInfoModel calculatorInfo;
  late UserProfileProvider provider;
  bool showSomeSpecialFeatures=false;

  final agentbankNameCon=TextEditingController();

  @override
  void dispose() {
    agentbankNameCon.dispose();
    super.dispose();
  }


  void initState() {
    EasyLoading.dismiss();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    provider=Provider.of(context,listen: true);
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
        showBankTransferAgentInfo=true;
      }

      //exception for pakistan
      exceptionCountryCalllocalAgent();

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

          //show bank transfer agent or bank list / show cash pickup agent or city list

          showBankTransferAgentInfo?Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Agent/Bank Name Rafid',
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
                        setState(() {
                          localAgent=value;
                          print(localAgent!.agentCity);
                          EasyLoading.show();
                          branchInfo=null;
                        });
                        provider.getBranchDataByCityName(
                            calculatorInfo.countryId,
                            calculatorInfo.serviceId,localAgent!.agentCity).then((value) {
                          EasyLoading.dismiss();
                          provider.localagentBranchList.forEach((element) {

                            if(element.agentCity==""){
                              print('No City Found');
                              setState(() {
                                branchFound=false;
                              });
                            }
                            else {
                              print(element.agentCity);
                              setState(() {
                                branchFound=true;
                                local_agent_branch_List=true;
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
          )
              :ShowCashPickupInfoWidgets(),
          if(!showSomeSpecialFeatures)Column(
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
              local_agent_branch_List?Consumer<UserProfileProvider>(
                builder: (context, provider, _) => branchFound?Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 1),
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<LocalAgentBranch>(
                        //  menuMaxHeight: 300,
                          dropdownMaxHeight: 300,
                          value: localAgentbranchInfo,
                          hint: Text(
                            '  Select One',
                            style: TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis),
                          ),
                          isExpanded: true,
                          onChanged: (value) {
                            setState(() {
                              localAgent=null;
                              localAgentbranchInfo=value;
                              print(localAgent!.agentCity);
                            });
                          },

                          items: provider.localagentBranchList.map((local_branch) =>
                              DropdownMenuItem<LocalAgentBranch>(
                                  value: local_branch,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 14.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Icon(Icons.ac_unit,size: 25,),
                                        Text(local_branch.agentBranch!,style: TextStyle(fontSize: 12,overflow: TextOverflow.ellipsis),),
                                      ],
                                    ),
                                  )))
                              .toList())
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
              ):
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
          if(showSomeSpecialFeatures)Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8),
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
              Text('Drop Down')

            ],
          ),

          SizedBox(height: 10,),
          if(!showSomeSpecialFeatures)Column(
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
          if(showSomeSpecialFeatures) Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8),
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: TextFormField(

                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Select Branch',
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
          if(!showSomeSpecialFeatures)Column(
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
          if(showSomeSpecialFeatures)Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8),
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: TextFormField(
                    controller: agentbankNameCon,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Select Agent',
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
          SizedBox(height: 30,),
          Consumer<UserProfileProvider>(
            builder: (context, provider, _) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: () async {
                    // EasyLoading.show();
                    // await provider.getSenderRelationshipData();
                    Navigator.pushNamed(context, RecipientRelationShipPage.routeName,arguments: reciveTwoObject);
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

          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Column ShowCashPickupInfoWidgets() {
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
                          if(value!.agent=='Local Agent') {
                            ///some special features for pakistan

                            setState(() {
                              showSomeSpecialFeatures=true;
                            });

                          }
                          else{
                            setState(() {
                              showSomeSpecialFeatures=false;
                              bankInfo=value;
                              print(bankInfo!.agent);
                              EasyLoading.show();
                              branchInfo=null;
                            });
                            provider.getBranchDataByBankName(
                                calculatorInfo.countryId,
                                calculatorInfo.
                                serviceId,bankInfo!.agent,recipient!.streetName).then((value) {
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
        );
  }

  void exceptionCountryCalllocalAgent() {
    if(calculatorInfo.countryId=='8'&&serviceName=='Cash Pickup'){
      provider.bankInfoList.insert(0, BankInfo(agent: 'Local Agent',totalBranch: '000'));
      showBankTransferAgentInfo=false;
    }
  }


}
