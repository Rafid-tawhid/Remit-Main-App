import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'button1.dart';
import 'button_2.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Row(
          children: [
            // Icon(Icons.arrow_back,color: Colors.black,),
            // SizedBox(width: 10,),
            Text('Back',style: TextStyle(color: Colors.black),)],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                splashColor: Colors.redAccent,
                splashRadius: 100,
                onPressed: () {},
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
