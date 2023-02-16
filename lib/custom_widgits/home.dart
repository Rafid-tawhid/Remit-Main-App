import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remit_app/api_calls/api_calls.dart';
import 'package:remit_app/colors.dart';
import 'package:remit_app/custom_widgits/receiver.dart';
import 'package:remit_app/custom_widgits/send.dart';
import 'package:remit_app/custom_widgits/tab_widgits_list.dart';
import 'package:remit_app/models/user_profile_model.dart';
import 'package:remit_app/pages/home_page.dart';


import '../helper_method/get_user_info.dart';
import '../pages/calculator_page_prac.dart';
import '../pages/user_profile_page.dart';
import 'button1.dart';
import 'drawer.dart';

class HomeWidget extends StatefulWidget {

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: MyDrawer(),
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
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://pbs.twimg.com/media/FhC3LvHXkAEMEUZ.png',),
              ),
            ),
        ),
        ],
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Align(
                alignment: Alignment.center,
                child: Text('Welcome ${GetUserDetails.userProfileModel!.username}!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            SizedBox(height: 20,),
            SvgPicture.asset('svg/home.svg',width: 300,height: 220,),
            const Padding(
              padding:  EdgeInsets.all(16.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Text('''If you're looking for a faster and cheaper way to send money to your loved ones, we've got you covered. Our service is the best way to send money quickly and securely. Plus, our low fees make it more affordable than ever''',style: TextStyle(fontSize: 16,color: Colors.grey),textAlign: TextAlign.center,)
              ),
            ),
            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromHeight(50),
                      backgroundColor: Color(0xff02A6EB)
                  ),
                  onPressed: (){
                    selectedIndex=2;
                    Navigator.pushNamed(context, HomePage.routeName);
                  }, child: Text('Send Money Now',style: TextStyle(fontSize: 16),)),
            )

          ],
        ),
      ),
    );
  }
}
