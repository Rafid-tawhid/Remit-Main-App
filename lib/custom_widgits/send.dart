import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../colors.dart';
import '../pages/user_profile_page.dart';
import 'button1.dart';
import 'button_2.dart';
import 'drawer.dart';

class SendWidget extends StatefulWidget {
  static const String routeName='/congo';
  const SendWidget({Key? key}) : super(key: key);

  @override
  State<SendWidget> createState() => _SendWidgetState();
}

class _SendWidgetState extends State<SendWidget> {
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
                  child: Text('You have send 200 AUD to Michael Jackson at 3:00 pm on Mon, 23 July 2022',style: TextStyle(fontSize: 16),textAlign: TextAlign.center,)
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              child: MainButton(
                title: 'Back to Home',),
            ),
            SecondaryButton(title: 'Download Receipt',)
          ],
        ),
      ),
    );
  }
}
