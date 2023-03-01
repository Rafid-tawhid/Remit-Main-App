import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:remit_app/models/recipents_model.dart';
import 'package:remit_app/pages/home_page.dart';
import 'package:remit_app/pages/user_profile_page.dart';

import '../colors.dart';
import '../custom_widgits/button1.dart';
import '../custom_widgits/button_2.dart';
import '../custom_widgits/drawer.dart';
import '../helper_method/get_calculator_info.dart';
import '../helper_method/get_user_info.dart';
import '../models/calculator_info_model.dart';

class CongratulationsPage extends StatefulWidget {
  static const String routeName='/congo';
  const CongratulationsPage({Key? key}) : super(key: key);

  @override
  State<CongratulationsPage> createState() => _CongratulationsPageState();
}

class _CongratulationsPageState extends State<CongratulationsPage> {

  late CalculatorInfoModel? calculatorInfo;
  late Recipients? recipientsInfo;

  @override
  void didChangeDependencies() {
    calculatorInfo = SetCalculatorAndRecipientInfo.getCalculatorInfo();
    recipientsInfo = SetCalculatorAndRecipientInfo.getRecipientInfo();
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
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [

            SizedBox(height: 20,),
            SvgPicture.asset('svg/celebration.svg',width: 300,height: 220,),
            SizedBox(height: 20,),
            Align(
                alignment: Alignment.center,
                child: Text('Congratulation !',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.all(16.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Text('You have send ${calculatorInfo!.sendAmount} AUD to ${recipientsInfo!.firstname} at ${DateFormat("hh:mm:ss a").format(DateTime.now())} ${DateFormat("MMMM, dd, yyyy").format(DateTime.now())}',style: TextStyle(fontSize: 16),textAlign: TextAlign.center,)
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              child: MainButton(
                title: 'Back to Home',route: HomePage.routeName,),
            ),
            SecondaryButton(title: 'Download Receipt',)
          ],
        ),
      ),
    );
  }
}
