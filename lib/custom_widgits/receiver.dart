import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/models/recipents_model.dart';
import 'package:remit_app/providers/user_profile_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors.dart';
import '../models/calculator_info_model.dart';
import '../models/recipient_model.dart';
import '../pages/user_profile_page.dart';
import 'drawer.dart';

class ReceipientWidget extends StatefulWidget {
  const ReceipientWidget({Key? key}) : super(key: key);

  @override
  State<ReceipientWidget> createState() => _ReceipientWidgetState();
}


class _ReceipientWidgetState extends State<ReceipientWidget> {
  Recipients? recipient;
  String? serviceName;
  String? currency;
  String? sendAmount;
  String? fees;
  String? totalPayable;
  String? rate;
  String? recipientGets;
  String? mail;
  String? token;


  bool showPass=true;

  late CalculatorInfoModel calculatorInfo;


  @override
  void didChangeDependencies() {
    calculatorInfo=ModalRoute.of(context)!.settings.arguments as CalculatorInfoModel;
    if(calculatorInfo!=null){
      print(calculatorInfo.toMap());
      serviceName=calculatorInfo.serviceName;
      currency=calculatorInfo.currency;
      sendAmount=calculatorInfo.sendAmount;
      fees=calculatorInfo.fees;
      totalPayable=calculatorInfo.totalPayable;
      rate=calculatorInfo.exchangeRate;
      recipientGets=calculatorInfo.recipientGets;


    }
    else{
      print('NOTHIN PHONE');
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
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://pbs.twimg.com/media/FhC3LvHXkAEMEUZ.png',),
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
              elevation: 5,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('$serviceName',style: TextStyle(fontSize: 22),),
                    Align(
                      alignment: Alignment.topRight,
                        child: Text('AUD-$currency')),
                    SizedBox(height: 10,),
                    Divider(height: 5,color: Colors.black,),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Send Amount'),
                        Text('$sendAmount AUD')
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Fees'),
                        Text('$fees AUD')
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('You pay in total'),
                        Text('$totalPayable AUD')
                      ],
                    ),
                    SizedBox(height: 5,),
                    Divider(height: 5,color: Colors.black,),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Exchange Rate',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('1 AUD->$rate $currency',style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Divider(height: 5,color: Colors.black,),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Your recipient gets',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('$recipientGets $currency',style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Divider(height: 5,color: Colors.black,),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text('Choose your Recipient',style: TextStyle(fontSize: 22),textAlign: TextAlign.center,),
          Consumer<UserProfileProvider>(
            builder: (context,provider,_)=>Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<Recipients>(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder()
                  ),
                  value: recipient,
                  hint: Text(
                    '  Existing Receipient',
                    style: TextStyle(color: Colors.black),
                  ),
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      recipient = value;
                      print(recipient.toString());
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      recipient = value;
                    });
                  },
                  validator: (value) {
                    if (value==null) {
                      return "can't empty";
                    } else {
                      return null;
                    }
                  },
                  items: provider.recipientsList.map((reciver) => DropdownMenuItem<Recipients>(
                      value: reciver,
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbn0HXI_7p1y9Tp__5xyLaS4HudK-IauKLB8JQSv9h&s',height: 25,width: 40,),
                          SizedBox(width: 15,),
                          Text(reciver.firstname!),
                        ],
                      )
                  )).toList()

              ),
            ),
          ),

          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add,color: Colors.blue,),
              SizedBox(width: 10,),
              Text('Add Recepint',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'First Name ',
                      style: TextStyle(
                          color: MyColor.grey, fontSize: 16),
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
                      hintText: 'First Name',
                      suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
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
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Middle Name ',
                      style: TextStyle(
                          color: MyColor.grey, fontSize: 16),
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
                      hintText: 'Middle Name',
                      suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
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
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Last Name ',
                      style: TextStyle(
                          color: MyColor.grey, fontSize: 16),
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
                      hintText: 'Last Name',
                      suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
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
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Address ',
                      style: TextStyle(
                          color: MyColor.grey, fontSize: 16),
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
                      hintText: 'Enter Your Address',
                      suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
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
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Suburb/town/city ',
                      style: TextStyle(
                          color: MyColor.grey, fontSize: 16),
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
                      hintText: 'Suburb/town/city',
                      suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
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
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Phone ',
                      style: TextStyle(
                          color: MyColor.grey, fontSize: 16),
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
                      hintText: 'Phone',
                      suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
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
                  ),
                ),
              ),
            ],
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Email ',
                      style: TextStyle(
                          color: MyColor.grey, fontSize: 16),
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
                      hintText: 'Email',
                      suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
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
                  ),
                ),
              ),
            ],
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Country ',
                      style: TextStyle(
                          color: MyColor.grey, fontSize: 16),
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
                      hintText: 'Country',
                      suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
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
                  ),
                ),
              ),
            ],
          ),


          SizedBox(height: 20,),
          Container(
            width: 200,
            child: ElevatedButton(
                onPressed: (){}, child: Text('Next')),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
