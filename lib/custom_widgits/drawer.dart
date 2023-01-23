import 'package:flutter/material.dart';
import 'package:remit_app/pages/launcher_page.dart';
import 'package:remit_app/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors.dart';
import '../helper_method/get_user_info.dart';
import '../pages/user_profile_page.dart';

class MyDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: MyColor.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, UserProfilePage.routeName);
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), //add border radius
                          child: Image.asset(
                            "images/profile_img.jpeg",
                            height: 70.0,
                            width: 70.0,
                            fit:BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    '${GetUserDetails.userProfileModel!.username}'??'Tawhidur Rahman',
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  ),

                  Text(
                      '${GetUserDetails.userProfileModel!.email}'??'Tawhidur Rahman',
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pushNamed(context, UserProfilePage.routeName).then((value) {
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () async {
                  Navigator.pushNamed(context, LoginPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

