import 'package:flutter/material.dart';
import 'package:remit_app/custom_widgits/tab_widgits_list.dart';
import 'package:remit_app/helper_method/admin_config.dart';
import 'package:remit_app/pages/home_page.dart';
import 'package:remit_app/pages/launcher_page.dart';
import 'package:remit_app/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors.dart';
import '../helper_method/get_user_info.dart';
import '../helper_method/helper_class.dart';
import '../pages/about_us_page.dart';
import '../pages/calculator_page.dart';
import '../pages/contact_us_page.dart';
import '../pages/user_profile_page.dart';
import '../pages/user_transfer_log_page.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.8,
      child: SafeArea(
        child: Container(
          color: Color(0xff26A6DE),
          child: ListView(
            primary: true,
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 200,
                child: DrawerHeader(
                  margin: EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                    color: Color(0xff26A6DE),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child:Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.white,
                                      width: 1.5
                                  )
                              ),
                              child: Image.asset('images/top_icon.png',height: 50))

                      ),
                      SizedBox(height: 5,),
                      Align(
                        alignment: Alignment.center,
                          child: Text(AdminAccessConfig.appName??'Danesh Exchange',style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,)),
                      SizedBox(height: 15,),
                      Divider(
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),

              TextButton(
                onPressed: () {

                  Navigator.pop(context);
                  selectedIndex=0;
                  Navigator.pushNamed(context, HomePage.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, UserProfilePage.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'My Profile',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  selectedIndex=2;
                  Navigator.pop(context);
                  Navigator.pushNamed(context, HomePage.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.add_card_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Send Money',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  selectedIndex=1;
                  Navigator.pushNamed(context, HomePage.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(MyIcons2.person,color: Colors.white,),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Recipient',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, TransferLogPage.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.history_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Transactions',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  selectedIndex=3;
                  Navigator.pushNamed(context, HomePage.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      MyIcons.location,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Track a Transfer',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // TextButton(
              //   onPressed: () {
              //
              //   },
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       SizedBox(
              //         width: 20,
              //       ),
              //       Icon(
              //         Icons.help_outline,
              //         color: Colors.white,
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       const Text(
              //         'Help Center',
              //         style: TextStyle(
              //           color: Colors.white,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ContactPage.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.headset_mic_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Contact us',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AboutUsPage.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'About us',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName, (r) => false);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Log out',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // TextButton(
              //   onPressed: () {},
              //   child: Container(
              //     padding: EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(4),
              //         border: Border.all(color: Colors.white, width: 1)),
              //     child: Align(
              //       alignment: Alignment.centerLeft,
              //       child: Row(
              //         mainAxisSize: MainAxisSize.min,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Icon(
              //             Icons.person,
              //             color: Colors.white,
              //           ),
              //           SizedBox(
              //             width: 10,
              //           ),
              //           const Text(
              //             'Sign Up',
              //             style: TextStyle(
              //               color: Colors.white,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

