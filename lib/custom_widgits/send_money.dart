import 'package:flutter/material.dart';
import 'package:remit_app/custom_widgits/send.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import 'button1.dart';

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
      appBar: AppBar(
         automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        title: Text('Back',style: TextStyle(color: Colors.black),),
        // title: Row(
        //   children: [
        //     Icon(Icons.arrow_back,color: Colors.black,),
        //     SizedBox(width: 10,),
        //     Text('Back',style: TextStyle(color: Colors.black),)],
        // ),
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
              MainButton(title: 'Continue',route: SendWidget.routeName,),


            ],

          ),
        ),
      ),
    );
  }
}
