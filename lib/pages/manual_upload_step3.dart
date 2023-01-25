import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:remit_app/colors.dart';

class ManualUploadPage3 extends StatefulWidget {
  static const String routeName='/manual_upload';
  const ManualUploadPage3({Key? key}) : super(key: key);

  @override
  State<ManualUploadPage3> createState() => _ManualUploadPage3State();
}

class _ManualUploadPage3State extends State<ManualUploadPage3> {
  List<String> idTypesList=["Australia Drivers License","Passport",];
  String? drivingLicenceType;
  List<String> passportCountryList=["Bangladesh","India","Pakistan"];
  ImageSource _imageSource = ImageSource.gallery;
  File? file;
  String? _imagePath = 'No File Chosen';


  final _issueeDateCon = TextEditingController();
  final _expiryeDateCon = TextEditingController();
  final imgCon = TextEditingController();
  bool showDrivingInfo=false;
  bool showPassportInfo=false;


  @override
  void dispose() {
    _issueeDateCon.dispose();
    _expiryeDateCon.dispose();
    imgCon.dispose();
    super.dispose();
  }

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
                            'Upload Information Manually',
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
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
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
                                                  'Select Your ID Types :',
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
                                            padding: const EdgeInsets.all(8.0),
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
                                                  child: DropdownButtonHideUnderline(
                                                    child: DropdownButtonFormField(

                                                      decoration: const InputDecoration(
                                                          enabledBorder: InputBorder.none,
                                                          focusedBorder: InputBorder.none
                                                      ),
                                                      hint: Text('  Select'),
                                                      items: idTypesList.map((e) => DropdownMenuItem(
                                                        value: e,
                                                        child:  Padding(
                                                          padding: const EdgeInsets.only(left: 8.0),
                                                          child: Text(e),
                                                        ),
                                                      )).toList(),
                                                      onChanged: (value) {
                                                        if(value=="Australia Drivers License"){
                                                          setState(() {
                                                            showDrivingInfo=true;
                                                            showPassportInfo=false;
                                                          });
                                                        }
                                                        if(value=="Passport"){
                                                          setState(() {
                                                            showPassportInfo=true;
                                                            showDrivingInfo=false;
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          if(showPassportInfo)ShowPassportInfo(),
                                          if(showDrivingInfo)ShowDrivingLicenceInfo(),


                                        ],
                                      ),
                                    ),

                                  ),
                                ),



                              ],
                            ),
                          ),
                          SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )
                                  ),
                                  onPressed: (){
                                    // Navigator.pushNamed(context, RegistrationStep2.routeName);
                                  }, child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('BACK')
                                  ],
                                ),
                              )),
                              SizedBox(width: 20,),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: MyColor.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )
                                  ),
                                  onPressed: (){
                                    // Navigator.pushNamed(context, RegistrationStep2.routeName);
                                  }, child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text('NEXT')
                                  ],
                                ),
                              )),
                            ],
                          ),

                          SizedBox(height: 50,),
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

 Column ShowPassportInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8,top: 8),
          child: Row(
            children: [
              Text(
                'Issuing Jurisdictions :',
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
          padding: const EdgeInsets.all(8.0),
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
                child: DropdownButtonHideUnderline(

                  child: DropdownButtonFormField(
                    value: drivingLicenceType,
                    decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none
                    ),
                    hint: Text('  Select'),
                    items: passportCountryList.map((e) => DropdownMenuItem(
                      value: e,
                      child:  Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(e),
                      ),
                    )).toList(),
                    onChanged: (value) {
                      setState(() {
                        drivingLicenceType=value;
                      });
                      print(value);
                    },
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
                'Passport Number :',
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  hintText: 'ID Number',
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

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'Passport :',
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: MyColor.blue,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: TextFormField(
                controller: imgCon,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(),
                  prefixIcon: Container(
                    margin: EdgeInsets.all(6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: MyColor.blue,
                        minimumSize: Size.zero, // Set this
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: (){
                        _getImage();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(' Chose File '!,style: TextStyle(fontSize: 12),)),
                    ),
                  ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'Issue Date :',
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  controller: _issueeDateCon,
                  decoration: InputDecoration(
                    fillColor: Colors.white,

                    filled: true,
                    hintText: ' dd/mm/yyyy',
                    hintStyle: TextStyle(),
                    suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              _issueeDateCon.text = formattedDate; //set output date to TextField value.
                            });
                          } else {}
                        }, icon: Icon(Icons.calendar_month,color: MyColor.blue,)),
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
                'Expire Date :',
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  controller: _expiryeDateCon,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    suffixIcon: IconButton(onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          _expiryeDateCon.text = formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    }, icon: Icon(Icons.calendar_month,color: MyColor.blue,)),
                    filled: true,
                    hintText: ' dd/mm/yyyy',
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
        SizedBox(height: 20,)
      ],
    );
 }


  Column ShowDrivingLicenceInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8,top: 8),
          child: Row(
            children: [
              Text(
                'Issuing Jurisdictions :',
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
          padding: const EdgeInsets.all(8.0),
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
                child: DropdownButtonHideUnderline(

                  child: DropdownButtonFormField(
                    value: drivingLicenceType,
                    decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none
                    ),
                    hint: Text('  Select'),
                    items: passportCountryList.map((e) => DropdownMenuItem(
                      value: e,
                      child:  Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(e),
                      ),
                    )).toList(),
                    onChanged: (value) {
                      setState(() {
                        drivingLicenceType=value;
                      });
                      print(value);
                    },
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
                'Driving Licence Number :',
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  hintText: 'ID Number',
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

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'Front image :',
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: MyColor.blue,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: TextFormField(
                controller: imgCon,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(),
                  prefixIcon: Container(
                    margin: EdgeInsets.all(6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: MyColor.blue,
                        minimumSize: Size.zero, // Set this
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: (){
                        _getImage();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(' Chose File '!,style: TextStyle(fontSize: 12),)),
                    ),
                  ),
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

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'Back image :',
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: MyColor.blue,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: TextFormField(
                controller: imgCon,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(),
                  prefixIcon: Container(
                    margin: EdgeInsets.all(6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: MyColor.blue,
                        minimumSize: Size.zero, // Set this
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: (){
                        _getImage();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(' Chose File '!,style: TextStyle(fontSize: 12),)),
                    ),
                  ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'Issue Date :',
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  controller: _issueeDateCon,
                  decoration: InputDecoration(
                    fillColor: Colors.white,

                    filled: true,
                    hintText: ' dd/mm/yyyy',
                    hintStyle: TextStyle(),
                    suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              _issueeDateCon.text = formattedDate; //set output date to TextField value.
                            });
                          } else {}
                        }, icon: Icon(Icons.calendar_month,color: MyColor.blue,)),
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
                'Expire Date :',
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  controller: _expiryeDateCon,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    suffixIcon: IconButton(onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          _expiryeDateCon.text = formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    }, icon: Icon(Icons.calendar_month,color: MyColor.blue,)),
                    filled: true,
                    hintText: ' dd/mm/yyyy',
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
        SizedBox(height: 20,)
      ],
    );
  }

  void _getImage() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    file = File(selectedImage!.path);
    if (selectedImage != null) {
      setState(() {
        _imagePath = selectedImage.path;
        imgCon.text=_imagePath??"";
      });
    }

    File imageFile = new File(selectedImage.path);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = Base64Encoder.urlSafe().convert(imageBytes);
  }
}
