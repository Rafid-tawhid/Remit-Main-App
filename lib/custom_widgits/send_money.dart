import 'package:flutter/material.dart';
import 'package:remit_app/custom_widgits/track_transfer.dart';
import '../colors.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/user_profile_page.dart';
import 'button1.dart';
import 'drawer.dart';

class SendMoneyWidget extends StatefulWidget {

  const SendMoneyWidget({Key? key}) : super(key: key);


  @override
  State<SendMoneyWidget> createState() => _SendMoneyWidgetState();
}

class _SendMoneyWidgetState extends State<SendMoneyWidget> {

  String? country;
  bool showPass=true;
  List<String> listOfValue = ['1', '2', '3', '4', '5'];

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
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Form(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 8.0,bottom: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('You\'re Sending to',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    DropdownButtonFormField(
                      value: country,
                      hint: Text(
                        'Select Country',
                        style: TextStyle(color: Colors.black),
                      ),
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {
                          country = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          country = value;
                        });
                      },
                      validator: (value) {
                        if (value==null) {
                          return "can't empty";
                        } else {
                          return null;
                        }
                      },
                      items: listOfValue
                          .map((String val) {
                        return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20,),
                    Text('Payment Method',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    DropdownButtonFormField(
                      value: country,
                      hint: Text(
                        'Select Country',
                        style: TextStyle(color: Colors.black),
                      ),
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {
                          country = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          country = value;
                        });
                      },
                      validator: (value) {
                        if (value==null) {
                          return "can't empty";
                        } else {
                          return null;
                        }
                      },
                      items: listOfValue
                          .map((String val) {
                        return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20,),
                    Text('Delivery Method',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    DropdownButtonFormField(
                      value: country,
                      hint: Text(
                        'Select Country',
                        style: TextStyle(color: Colors.black),
                      ),
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {
                          country = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          country = value;
                        });
                      },
                      validator: (value) {
                        if (value==null) {
                          return "can't empty";
                        } else {
                          return null;
                        }
                      },
                      items: listOfValue
                          .map((String val) {
                        return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
              Padding(
                padding:  const EdgeInsets.only(left: 16.0,right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('You sent',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('1200'),
                        Text('AUD')
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Recipient Gets',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('1200'),
                        Text('AUD')
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 50,),
              MainButton(title: 'Continue',route: TrackTransferPage.routeName,),


            ],

          ),
        ),
      ),
    );
  }
}
