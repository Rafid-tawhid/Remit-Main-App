import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remit_app/colors.dart';
import 'package:remit_app/models/user_profile_model.dart';


import '../helper_method/get_user_info.dart';
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
                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, Nunc',style: TextStyle(fontSize: 16,color: Colors.grey),textAlign: TextAlign.center,)
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              child: MainButton(
                title: 'Send Money Now',),
            )
          ],
        ),
      ),
    );
  }
}
