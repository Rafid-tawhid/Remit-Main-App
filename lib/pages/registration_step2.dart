import 'package:flutter/material.dart';
import 'package:remit_app/pages/registration_step3.dart';
import '../colors.dart';

class RegistrationStep2 extends StatefulWidget {
  static const String routeName = '/step2';
  const RegistrationStep2({Key? key}) : super(key: key);

  @override
  State<RegistrationStep2> createState() => _RegistrationStep2State();
}

class _RegistrationStep2State extends State<RegistrationStep2> {
  bool showAutomatic = true;
  bool checkBox = false;
  bool checkBox2 = false;
  String? gender;
  List<String> genderList=['Male','Female'];
  List<String> monthList=["January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"];
  final phoneCon = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Form(
          child: Column(
            children: [
              Container(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      width: width,
                      color: MyColor.blue,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'REGISTRATION',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Personal Information',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                  ),
                                  Icon(
                                    Icons.check,
                                    color: MyColor.blue,
                                    size: 20,
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.white,
                                height: 5,
                                width: 20,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3, color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: MyColor.blue,
                                        shape: BoxShape.circle),
                                    child: Text(''),
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.white,
                                height: 5,
                                width: 20,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: MyColor.blue,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3, color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Text(''),
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.white,
                                height: 5,
                                width: 20,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: MyColor.blue,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 3, color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Text(''),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'images/top_icon.png',
                      width: width / 1.5,
                      height: 60,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                   
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Form(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      //set border radius more than 50% of height and width to make circle
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Color.fromARGB(125, 218, 247, 253),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade200,
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: Offset(-2, 2))
                                          ]),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8,top: 16),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Title :',
                                                  style: TextStyle(
                                                      color: MyColor.blue, fontSize: 16),
                                                ),
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 12,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: MyColor.blue,
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 4.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(15),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                          child: Radio(
                                                              value: 'Mr.',
                                                              groupValue: gender,
                                                              onChanged: (value){
                                                                print(value);
                                                                setState(() {
                                                                  gender=value!;
                                                                });
                                                              }),
                                                        ),
                                                        Text('Mr.'),
                                                        SizedBox(width: 10,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 15,),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: MyColor.blue,
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 4.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(15),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Radio(
                                                            value: 'Mrs.',
                                                            groupValue: gender,
                                                            onChanged: (value){
                                                              print(value);
                                                              setState(() {
                                                                gender=value!;
                                                              });
                                                            }),
                                                        Text('Mrs.'),
                                                        SizedBox(width: 15,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 15,),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: MyColor.blue,
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 4.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(15),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Radio(
                                                            value: 'Ms.',
                                                            groupValue: gender,
                                                            onChanged: (value){
                                                              print(value);
                                                              setState(() {
                                                                gender=value!;
                                                              });
                                                            }),
                                                        Text('Ms.'),
                                                        SizedBox(width: 15,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'First Name :',
                                                  style: TextStyle(
                                                      color: MyColor.blue, fontSize: 16),
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
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: MyColor.blue,
                                                borderRadius: BorderRadius.circular(15.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 4.0),
                                                child: TextFormField(
                                                  keyboardType: TextInputType.visiblePassword,
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    hintText: 'Enter First Name',
                                                    suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
                                                    hintStyle: TextStyle(),

                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(width: 2, color: MyColor.blue),
                                                      //<-- SEE HERE
                                                      borderRadius: BorderRadius.circular(15.0),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(width: 2, color: Colors.transparent),
                                                      //<-- SEE HERE
                                                      borderRadius: BorderRadius.circular(15.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Middle Name :',
                                                  style: TextStyle(
                                                      color: MyColor.blue, fontSize: 16),
                                                ),
                                                Icon(
                                                  Icons.info,
                                                  color: MyColor.blue,
                                                  size: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: MyColor.blue,
                                                borderRadius: BorderRadius.circular(15.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 4.0),
                                                child: TextFormField(
                                                  keyboardType: TextInputType.visiblePassword,
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    hintText: 'Enter Middle Name',
                                                    suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
                                                    hintStyle: TextStyle(),

                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(width: 2, color: MyColor.blue),
                                                      //<-- SEE HERE
                                                      borderRadius: BorderRadius.circular(15.0),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(width: 2, color: Colors.transparent),
                                                      //<-- SEE HERE
                                                      borderRadius: BorderRadius.circular(15.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Last Name :',
                                                  style: TextStyle(
                                                      color: MyColor.blue, fontSize: 16),
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
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: MyColor.blue,
                                                borderRadius: BorderRadius.circular(15.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 4.0),
                                                child: TextFormField(
                                                  keyboardType: TextInputType.visiblePassword,
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    hintText: 'Enter Last Name',
                                                    suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
                                                    hintStyle: TextStyle(),

                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(width: 2, color: MyColor.blue),
                                                      //<-- SEE HERE
                                                      borderRadius: BorderRadius.circular(15.0),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(width: 2, color: Colors.transparent),
                                                      //<-- SEE HERE
                                                      borderRadius: BorderRadius.circular(15.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      //set border radius more than 50% of height and width to make circle
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Color.fromARGB(125, 218, 247, 253),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade200,
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: Offset(-2, 2))
                                          ]),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Phone Number :',
                                                            style: TextStyle(
                                                                color: MyColor.blue, fontSize: 16),
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
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: MyColor.blue,
                                                          borderRadius: BorderRadius.circular(15.0),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 4.0),
                                                          child: TextFormField(
                                                            keyboardType: TextInputType.number,
                                                            decoration: InputDecoration(
                                                              fillColor: Colors.white,
                                                              filled: true,
                                                              hintText: 'Phone Number',
                                                              suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
                                                              hintStyle: TextStyle(),

                                                              focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(width: 2, color: MyColor.blue),
                                                                //<-- SEE HERE
                                                                borderRadius: BorderRadius.circular(15.0),
                                                              ),
                                                              enabledBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(width: 2, color: Colors.transparent),
                                                                //<-- SEE HERE
                                                                borderRadius: BorderRadius.circular(15.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Gender :',
                                                            style: TextStyle(
                                                                color: MyColor.blue, fontSize: 16),
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
                                                      padding: const EdgeInsets.only(right: 16.0),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: MyColor.blue,
                                                          borderRadius: BorderRadius.circular(15.0),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 4.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.circular(15)
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(4.0),
                                                              child: DropdownButtonFormField(
                                                                decoration: InputDecoration(
                                                                  enabledBorder: InputBorder.none,
                                                                  focusedBorder: InputBorder.none,
                                                                  focusColor: MyColor.blue,

                                                                ),
                                                                hint: Text('Gender'),
                                                                items: genderList.map((e) => DropdownMenuItem(
                                                                  child: Text(e),
                                                                  value: e,
                                                                )).toList(),
                                                                onChanged: (value) {
                                                                  print(value);
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Date of Birth :',
                                                  style: TextStyle(
                                                      color: MyColor.blue, fontSize: 16),
                                                ),
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 12,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: 15,),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: MyColor.blue,
                                                    borderRadius: BorderRadius.circular(15.0),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 4.0),
                                                    child: TextFormField(
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        hintText: 'Day',
                                                        suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
                                                        hintStyle: TextStyle(),

                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(width: 2, color: MyColor.blue),
                                                          //<-- SEE HERE
                                                          borderRadius: BorderRadius.circular(15.0),
                                                        ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(width: 2, color: Colors.transparent),
                                                          //<-- SEE HERE
                                                          borderRadius: BorderRadius.circular(15.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 15,),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: MyColor.blue,
                                                    borderRadius: BorderRadius.circular(15.0),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 4.0),
                                                    child: Container(
                                                      padding: EdgeInsets.only(top: 4,bottom: 4),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(12)
                                                      ),
                                                      child: DropdownButtonFormField(
                                                        decoration: InputDecoration(
                                                          enabledBorder: InputBorder.none,
                                                          focusedBorder: InputBorder.none,
                                                          focusColor: MyColor.blue,

                                                        ),
                                                        hint: Text('  Month'),
                                                        items: monthList.map((e) => DropdownMenuItem(
                                                          child:  Text(e,style: TextStyle(fontSize: 12),),
                                                          value: e,
                                                        )).toList(),
                                                        onChanged: (value) {
                                                          print(value);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 15,),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: MyColor.blue,
                                                    borderRadius: BorderRadius.circular(15.0),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 4.0),
                                                    child: TextFormField(

                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        hintText: 'Year',
                                                        suffixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
                                                        hintStyle: TextStyle(),

                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(width: 2, color: MyColor.blue),
                                                          //<-- SEE HERE
                                                          borderRadius: BorderRadius.circular(15.0),
                                                        ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(width: 2, color: Colors.transparent),
                                                          //<-- SEE HERE
                                                          borderRadius: BorderRadius.circular(15.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 15,),
                                            ],
                                          ),
                                          SizedBox(height: 20,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20,),
                                showAutomatic?Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      //set border radius more than 50% of height and width to make circle
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Color.fromARGB(125, 218, 247, 253),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade200,
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: Offset(-2, 2))
                                          ]),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Address :',
                                                  style: TextStyle(
                                                      color: MyColor.blue, fontSize: 16),
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
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: MyColor.blue,
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 4.0),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,

                                                      filled: true,
                                                      hintText: ' Enter Address',
                                                      prefixIconConstraints: BoxConstraints(maxHeight: 30,maxWidth: 38),
                                                      prefixIcon: Padding(
                                                        padding: const EdgeInsetsDirectional.only(start: 8.0,),
                                                        child: Container(

                                                          decoration: BoxDecoration(
                                                              color: MyColor.blue,
                                                              borderRadius: BorderRadius.circular(8)
                                                          ),
                                                          child: IconButton(
                                                            padding: EdgeInsets.zero,
                                                            onPressed: (){
                                                              // setState(() {
                                                              //   showPass=!showPass;
                                                              // });
                                                            }, icon:Icon(Icons.search_sharp,color: Colors.white,size: 18,
                                                          ),
                                                          ),
                                                        ),
                                                      ),
                                                      hintStyle: TextStyle(),

                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(width: 2, color: MyColor.blue),
                                                        //<-- SEE HERE
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(width: 2, color: Colors.transparent),
                                                        //<-- SEE HERE
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20,),


                                        ],
                                      ),
                                    ),
                                  ),
                                ):
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      //set border radius more than 50% of height and width to make circle
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Color.fromARGB(125, 218, 247, 253),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade200,
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: Offset(-2, 2))
                                          ]),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(height: 20,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Unit/Flat No :',
                                                  style: TextStyle(
                                                      color: MyColor.blue, fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: MyColor.blue,
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 4.0),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,

                                                      filled: true,

                                                      hintStyle: TextStyle(),

                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(width: 2, color: MyColor.blue),
                                                        //<-- SEE HERE
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(width: 2, color: Colors.transparent),
                                                        //<-- SEE HERE
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Street Number :',
                                                  style: TextStyle(
                                                      color: MyColor.blue, fontSize: 16),
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
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: MyColor.blue,
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 4.0),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,

                                                      filled: true,

                                                      hintStyle: TextStyle(),

                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(width: 2, color: MyColor.blue),
                                                        //<-- SEE HERE
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(width: 2, color: Colors.transparent),
                                                        //<-- SEE HERE
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Street Name :',
                                                  style: TextStyle(
                                                      color: MyColor.blue, fontSize: 16),
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
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: MyColor.blue,
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 4.0),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,

                                                      filled: true,

                                                      hintStyle: TextStyle(),

                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(width: 2, color: MyColor.blue),
                                                        //<-- SEE HERE
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(width: 2, color: Colors.transparent),
                                                        //<-- SEE HERE
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Street Subrub :',
                                                  style: TextStyle(
                                                      color: MyColor.blue, fontSize: 16),
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
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: MyColor.blue,
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 4.0),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,

                                                      filled: true,

                                                      hintStyle: TextStyle(),

                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(width: 2, color: MyColor.blue),
                                                        //<-- SEE HERE
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(width: 2, color: Colors.transparent),
                                                        //<-- SEE HERE
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'State :',
                                                  style: TextStyle(
                                                      color: MyColor.blue, fontSize: 16),
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
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: MyColor.blue,
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 4.0),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,

                                                      filled: true,

                                                      hintStyle: TextStyle(),

                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(width: 2, color: MyColor.blue),
                                                        //<-- SEE HERE
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(width: 2, color: Colors.transparent),
                                                        //<-- SEE HERE
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Postcode :',
                                                  style: TextStyle(
                                                      color: MyColor.blue, fontSize: 16),
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
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(

                                                decoration: BoxDecoration(
                                                  color: MyColor.blue,
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 4.0),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.white,

                                                      filled: true,

                                                      hintStyle: TextStyle(),

                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(width: 2, color: MyColor.blue),
                                                        //<-- SEE HERE
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(width: 2, color: Colors.transparent),
                                                        //<-- SEE HERE
                                                        borderRadius: BorderRadius.circular(15.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          showAutomatic?Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  showAutomatic=!showAutomatic;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Enter Address Manually',style: TextStyle(color: MyColor.blue),),
                                    Text('-----------------------------------------',style: TextStyle(color: MyColor.blue),)
                                  ],
                                ),
                              ),
                            ),
                          ):Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  showAutomatic=!showAutomatic;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Enter Address Automatic',style: TextStyle(color: MyColor.blue),),
                                    Text('-----------------------------------------',style: TextStyle(color: MyColor.blue),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: MyColor.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )
                              ),
                              onPressed: (){
                                 Navigator.pushNamed(context, RegistrationStep3.routeName);
                              }, child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('NEXT')
                              ],
                            ),
                          )),
                          SizedBox(height: 20,),
                          SizedBox(height: 30,),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text('Copyright © ${DateTime.now().year} Remit All Right Reserved.'),
                          ),
                          SizedBox(height: 30,),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
