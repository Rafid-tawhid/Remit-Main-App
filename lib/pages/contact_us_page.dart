import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:remit_app/pages/user_profile_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../colors.dart';
import '../custom_widgits/drawer.dart';
import '../helper_method/get_user_info.dart';
import '../helper_method/helper_class.dart';

class ContactPage extends StatefulWidget {
  static const String routeName = '/contact_page';

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Completer<GoogleMapController> _controler = Completer();
  static final CameraPosition position =
  CameraPosition(target: LatLng(23.7547119, 90.3916721), zoom: 14.4746);


  bool isScrollingDown = false;

  final _fromKey=GlobalKey<FormState>();
  TextEditingController firstNameCon=TextEditingController();
  TextEditingController lastNameCon=TextEditingController();
  TextEditingController phoneCon=TextEditingController();
  TextEditingController emailCon=TextEditingController();
  TextEditingController messageCon=TextEditingController();

  Completer<GoogleMapController> map_controler=Completer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
        body: SingleChildScrollView(

          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    'svg/celebration.svg',
                    height: MediaQuery.of(context).size.height / 5,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        gradient: LinearGradient(colors: [
                          Colors.black54.withOpacity(0.50),
                          Colors.black54.withOpacity(0.50),
                        ], stops: [
                          0.0,
                          1.0
                        ])),
                  ),
                  const Text(
                    'Contact Us',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 20,),
                  ListTile(
                    onTap: () async {
                      // MapUtils.openMap(23.755531,90.3905545);
                      String url = "https://goo.gl/maps/SgSpKoBX8ehagX116";
                      var urllaunchable = await canLaunch(url); //canLaunch is from url_launcher package
                      if(urllaunchable){
                        await launch(url); //launch is from url_launcher package to launch URL
                      }else{
                        print("URL can't be launched.");
                      }

                    },
                    leading: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        icon: Icon(Icons.location_on_outlined),
                        iconSize: 25,
                        onPressed: () async {
                          MapUtils.openMap(23.7547119, 90.3916721);
                        },
                        color: Colors.blue,
                      ),
                    ),
                    title: Text(
                      'Our Location',
                      style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Shop 19, 236 Lonsdale Street, Dandenong, Victoria Australia 3175'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    onTap: ()async {
                      Uri phoneno = Uri.parse('tel:+0434247236');
                      if (await launchUrl(phoneno)) {
                        //dialer opened
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: Text('Can\'t Open'),
                              );
                            });
                      }
                    },
                    leading:  Container(
                      decoration: BoxDecoration(
                          border:
                          Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        icon: Icon(Icons.call),
                        iconSize: 25,
                        onPressed: () async {
                          Uri phoneno = Uri.parse('tel:+0434247236');
                          if (await launchUrl(phoneno)) {
                            //dialer opened
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    child: Text('Can\'t Open'),
                                  );
                                });
                          }
                        },
                        color: Colors.blue,
                      ),
                    ),
                    title: Text(
                      'Phone',
                      style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('+0434247236'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    onTap: ()async {
                      var url = Uri.parse("mailto:daneshexchange@gmail.com");
                      if (await launchUrl(url)) {
                        //dialer opened
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: Text('Can\'t Open'),
                              );
                            });
                      }
                    },
                    leading: Container(

                      decoration: BoxDecoration(
                          border:
                          Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(50)),
                      child:  IconButton(
                        icon: Icon(Icons.mail_lock_outlined),
                        iconSize: 25,
                        onPressed: () async {
                          var url = Uri.parse("daneshexchange@gmail.com");
                          if (await launchUrl(url)) {
                            //dialer opened
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    child: Text('Can\'t Open'),
                                  );
                                });
                          }
                        },
                        color: Colors.blue,
                      ),
                    ),
                    title: Text(
                      'Email',
                      style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
                    ),
                    subtitle: Text('daneshexchange@gmail.com'),
                  ),

                ],
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                'Get In Touch',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, top: 5, bottom: 5),
                child: Form(
                    key: _fromKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ), //
                        TextFormField(
                          controller: firstNameCon,
                          autocorrect: true,
                          validator: (value){
                            if(value!.isEmpty||value==null){
                              return 'we required your name';
                            }
                            else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            label: Text('First Name'),
                            hintText: 'First Name',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.black, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xff000054)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: lastNameCon,
                          validator: (value){
                            if(value!.isEmpty||value==null){
                              return 'we required your name';
                            }
                            else {
                              return null;
                            }
                          },
                          autocorrect: true,
                          decoration: const InputDecoration(
                            label: Text('Last Name'),
                            hintText: 'Last Name',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.black, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xff000054)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: phoneCon,
                          validator: (value){
                            if(value!.isEmpty||value==null){
                              return 'please provide your number';
                            }
                            else {
                              return null;
                            }
                          },
                          autocorrect: true,
                          decoration: const InputDecoration(
                            label: Text('Phone Number'),
                            hintText: 'Email Address',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.black, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xff000054)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailCon,
                          autocorrect: true,
                          validator: (value){
                            if(value!.isEmpty||value==null){
                              return 'we required your email';
                            }
                            else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            label: Text('Email Address'),
                            hintText: 'Email Address',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.black, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xff000054)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: messageCon,
                          validator: (value){
                            if(value!.isEmpty||value==null){
                              return 'give your message';
                            }
                            else {
                              return null;
                            }
                          },

                          autocorrect: true,
                          maxLines: 10,
                          decoration: const InputDecoration(
                            label: Text('Message'),
                            hintText: 'Message',
                            hintMaxLines: 10,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.black, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xff000054)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.blue),
                              onPressed: () {

                                if(_fromKey.currentState!.validate()){
                                  // APICalls.contactRegCompleted(contactReg).then((map){
                                  //   firstNameCon.clear();
                                  //   lastNameCon.clear();
                                  //   phoneCon.clear();
                                  //   emailCon.clear();
                                  //   messageCon.clear();
                                  //
                                  //   ArtSweetAlert.show(
                                  //       context: context,
                                  //       artDialogArgs: ArtDialogArgs(
                                  //         type: ArtSweetAlertType.success,
                                  //         title: 'Congratulations',
                                  //         text: '${contactReg.first_name} ${map['success']} ',
                                  //       )
                                  //   );
                                  // });
                                }

                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                                child: Text(
                                  'Send Message',
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                ),
                              )),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(-37.9865754,145.2123937),
                    zoom: 16,
                  ),
                  onMapCreated: (GoogleMapController controler){
                    map_controler.complete(controler);},
                  mapType: MapType.normal,
                  compassEnabled: true,
                  markers: {
                    Marker(markerId: MarkerId('1'),
                      position: LatLng(-37.9865754,145.2123937),
                    )
                  },
                  myLocationButtonEnabled: true,

                ),

              ),


              SizedBox(
                height: 20,
              ),
              Container(
                  child: ElevatedButton(
                    onPressed: () async {
                      // MapUtils.openMap(23.754668,90.3916524);
                      String url = "https://goo.gl/maps/LhW8DLmG4tcZ3uGS9";
                      var urllaunchable = await canLaunch(url); //canLaunch is from url_launcher package
                      if(urllaunchable){
                        await launch(url); //launch is from url_launcher package to launch URL
                      }else{
                        print("URL can't be launched.");
                      }

                    },
                    child: Text('Find Location'),
                  )),
              SizedBox(
                height: 30,
              ),

            ],
          ),
        ),


    );
  }
}