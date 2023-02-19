import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/models/recipents_model.dart';
import 'package:remit_app/providers/user_profile_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors.dart';
import '../models/calculator_info_model.dart';
import '../models/country_models.dart';
import '../pages/user_profile_page.dart';
import '../providers/calculator_provider.dart';
import 'drawer.dart';

class ReceipientWidget extends StatefulWidget {
  // static const String routeName='/recipient';
  const ReceipientWidget({Key? key}) : super(key: key);

  @override
  State<ReceipientWidget> createState() => _ReceipientWidgetState();
}


class _ReceipientWidgetState extends State<ReceipientWidget> {
  Recipients? recipient;
  Info? countryInfo;
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
  bool showRecipientInfo=true;
  final _formKey=GlobalKey<FormState>();
  //
  // late CalculatorInfoModel calculatorInfo;
  final firstNameCon=TextEditingController();
  final middleNameCon=TextEditingController();
  final lastNameCon=TextEditingController();
  final addressCon=TextEditingController();
  final cityCon=TextEditingController();
  final phoneCon=TextEditingController();
  final emailCon=TextEditingController();
  final countryCon=TextEditingController();


  @override
  void dispose() {
    firstNameCon.dispose();
    middleNameCon.dispose();
    lastNameCon.dispose();
    addressCon.dispose();
    cityCon.dispose();
    phoneCon.dispose();
    emailCon.dispose();
    countryCon.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    //calculatorInfo=ModalRoute.of(context)!.settings.arguments as CalculatorInfoModel;
    // if(calculatorInfo==null){
    //   hideBilling=true;
    //   print('NOTHING PHONE');
    //
    // }
    // else{
    //   print(calculatorInfo.toMap());
    //   serviceName=calculatorInfo.serviceName;
    //   currency=calculatorInfo.currency;
    //   sendAmount=calculatorInfo.sendAmount;
    //   fees=calculatorInfo.fees;
    //   totalPayable=calculatorInfo.totalPayable;
    //   rate=calculatorInfo.exchangeRate;
    //   recipientGets=calculatorInfo.recipientGets;
    // }
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

          // if(hideBilling)Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Card(
          //     elevation: 5,
          //     child: Container(
          //       margin: EdgeInsets.all(10),
          //       padding: EdgeInsets.all(10),
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Text('$serviceName',style: TextStyle(fontSize: 22),),
          //           Align(
          //             alignment: Alignment.topRight,
          //               child: Text('AUD-$currency')),
          //           SizedBox(height: 10,),
          //           Divider(height: 5,color: Colors.black,),
          //           SizedBox(height: 5,),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text('Send Amount'),
          //               Text('$sendAmount AUD')
          //             ],
          //           ),
          //           SizedBox(height: 5,),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text('Fees'),
          //               Text('$fees AUD')
          //             ],
          //           ),
          //           SizedBox(height: 5,),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text('You pay in total'),
          //               Text('$totalPayable AUD')
          //             ],
          //           ),
          //           SizedBox(height: 5,),
          //           Divider(height: 5,color: Colors.black,),
          //           SizedBox(height: 5,),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text('Exchange Rate',style: TextStyle(fontWeight: FontWeight.bold),),
          //               Text('1 AUD->$rate $currency',style: TextStyle(fontWeight: FontWeight.bold),)
          //             ],
          //           ),
          //           SizedBox(height: 5,),
          //           Divider(height: 5,color: Colors.black,),
          //           SizedBox(height: 5,),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text('Your recipient gets',style: TextStyle(fontWeight: FontWeight.bold),),
          //               Text('$recipientGets $currency',style: TextStyle(fontWeight: FontWeight.bold),)
          //             ],
          //           ),
          //           SizedBox(height: 5,),
          //           Divider(height: 5,color: Colors.black,),
          //
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 20,),
          Text('Recipient Info',style: TextStyle(fontSize: 22),textAlign: TextAlign.center,),
          Consumer<UserProfileProvider>(
            builder: (context,provider,_)=>Padding(
              padding: const EdgeInsets.all(16.0),
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
                    // setState(() {
                    //   recipient = value;
                    //   firstNameCon.text=recipient!.firstname??'';
                    //   middleNameCon.text=recipient!.middlename??'';
                    //   lastNameCon.text=recipient!.lastname??'';
                    //   addressCon.text=recipient!.streetName??'';
                    //   cityCon.text=recipient!.streetCity??'';
                    //   phoneCon.text=recipient!.phone??'';
                    //   emailCon.text=recipient!.email??'';
                    //   countryCon.text=recipient!.country??'';
                    // });
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Row(
                          children: [
                            // Icon(Icons.ac_unit,size: 25,),
                            Text('${reciver.firstname}, ${reciver.country}'),
                          ],
                        ),
                      )
                  )).toList()

              ),
            ),
          ),


          SizedBox(height: 20,),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){
                setState(() {
                  showRecipientInfo=!showRecipientInfo;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.add,color: Colors.blue,),
                  SizedBox(width: 10,),
                  Text('Add Recepint',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
          if(showRecipientInfo)Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                          controller: firstNameCon,
                          keyboardType: TextInputType.text,
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
                          validator: (val){
                            if(val==null||val.isEmpty){
                              return 'First name is required';
                            }
                            if(val.length>10){
                              return 'First name must be in 10 charecter';
                            }
                            else {
                              return null;
                            }
                          },
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
                          controller: middleNameCon,
                          keyboardType: TextInputType.text,
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
                          controller: lastNameCon,
                          keyboardType: TextInputType.text,
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
                          validator: (val){
                            if(val==null||val.isEmpty){
                              return 'Last name is required';
                            }
                            if(val.length>10){
                              return 'First name must be in 10 charecter';
                            }
                            else {
                              return null;
                            }
                          },
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
                          controller: addressCon,
                          keyboardType: TextInputType.text,
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
                          validator: (val){
                            if(val==null||val.isEmpty){
                              return 'Address is required';
                            }
                            else {
                              return null;
                            }
                          },
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
                          controller: cityCon,
                          keyboardType: TextInputType.text,
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
                          validator: (val){
                            if(val==null||val.isEmpty){
                              return 'Town/City is required';
                            }
                            else {
                              return null;
                            }
                          },
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
                          controller: phoneCon,
                          keyboardType: TextInputType.phone,
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
                          validator: (val){
                            if(val==null||val.isEmpty){
                              return 'Number is required';
                            }
                            if(val.length!=10){
                              return 'Number must be 10 charecter';
                            }
                            if(!val.startsWith('04')){
                              return 'Number must be valid';
                            }
                            else {
                              return null;
                            }
                          },
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
                          controller: emailCon,
                          keyboardType: TextInputType.text,
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
                          validator: (val){
                            if(val==null||val.isEmpty){
                              return 'Email is required';
                            }
                            if(!EmailValidator.validate(val)){
                              return 'Please give a valid email';
                            }
                            else {
                              return null;
                            }
                          },

                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                  child: Row(
                    children: [
                      Text(
                        'Country ',
                        style: TextStyle(
                            color: MyColor.grey, fontSize: 16),
                      ),

                    ],
                  ),
                ),
                Consumer<CalculatorProvider>(
                  builder: (context,provider,_)=>Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: DropdownButtonFormField2<Info>(
                          dropdownMaxHeight: 300,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 18,horizontal: 5),
                              enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10,),
                              borderSide: BorderSide(
                              width: .5,
                              color: Colors.grey
                          )
                      ),
                              focusedBorder: OutlineInputBorder()
                          ),
                          value: countryInfo,
                          hint: Text(
                            '  Select your country',
                            style: TextStyle(color: Colors.black),
                          ),
                          isExpanded: true,
                          onChanged: (value) {
                            // setState(() {
                            //   recipient = value;
                            //   firstNameCon.text=recipient!.firstname??'';
                            //   middleNameCon.text=recipient!.middlename??'';
                            //   lastNameCon.text=recipient!.lastname??'';
                            //   addressCon.text=recipient!.streetName??'';
                            //   cityCon.text=recipient!.streetCity??'';
                            //   phoneCon.text=recipient!.phone??'';
                            //   emailCon.text=recipient!.email??'';
                            //   countryCon.text=recipient!.country??'';
                            // });
                          },
                          onSaved: (value) {
                            setState(() {
                              countryInfo = value;
                            });
                          },
                          validator: (value) {
                            if (value==null) {
                              return "can't empty";
                            } else {
                              return null;
                            }
                          },
                          items: provider.getAllCountriesInfoList.map((country) => DropdownMenuItem<Info>(
                              value: country,

                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Row(
                                  children: [
                                    FadeInImage(
                                      height: 25,
                                      width: 30,
                                      image:NetworkImage(country.image!),
                                      placeholder: const AssetImage('images/placeholder.jpeg'),
                                      imageErrorBuilder:(context, error, stackTrace) {
                                        return Image.asset('images/placeholder.jpeg',
                                            fit: BoxFit.fill,height: 25,width: 30,
                                        );
                                      },
                                      fit: BoxFit.fitWidth,
                                    ),
                                    SizedBox(width: 10,),
                                    Text(country.name!),
                                  ],
                                ),
                              )
                          )).toList()

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromHeight(50),
                            backgroundColor: Color(0xff02A6EB)
                        ),
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            print('ALLL OKKKKKKKK');
                          }
                        }, child: Text('Next')),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          )
        ],
      ),
    );
  }
}


