import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import 'button1.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0,top: 5,bottom: 5),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://pbs.twimg.com/media/FhC3LvHXkAEMEUZ.png'),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image.asset('images/logo.png',width: 120,),
        centerTitle: true,
        actions: [
          Container(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon( Icons.settings,color: Colors.black,),
                splashColor: Colors.redAccent,
                splashRadius: 100,
                onPressed: (){},

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
                child: Text('Welcome Tarun !',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
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
