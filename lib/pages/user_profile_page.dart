import 'package:flutter/material.dart';
import 'package:remit_app/colors.dart';
import 'package:remit_app/helper_method/get_user_info.dart';
import 'package:remit_app/pages/user_password_update_page.dart';

class UserProfilePage extends StatefulWidget {
  static const String routeName='/user_info';
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {

  String selectedItem='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        actions: [
              PopupMenuButton(
                  icon: Icon(Icons.edit_calendar_sharp),
                  initialValue: '/profile',
                  onSelected: (value) {

                print(value);
                Navigator.pushNamed(context, value.toString());
              }, itemBuilder: (BuildContext bc) {
                return  [
                  PopupMenuItem(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person,color: MyColor.blue,),
                        SizedBox(width: 10,),
                        Text("Profile Update"),
                      ],
                    ),
                    value: '/profile',
                  ),
                  PopupMenuItem(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.password,color: MyColor.blue,),
                        SizedBox(width: 10,),
                        Text("Password Setting"),
                      ],
                    ),
                    value: UserUpdatePasswordPage.routeName,
                  ),
                  PopupMenuItem(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.image,color: MyColor.blue,),
                        SizedBox(width: 10,),
                        Text("Image Update"),
                      ],
                    ),
                    value: '/image',
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.verified_user_outlined,color: MyColor.blue,),
                        SizedBox(width: 10,),
                        Text("Identity Verification"),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                    value: '/verificition',
                  )
                ];
              })

        ],
      ),
      body: ListView(

        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColor.blue,

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipOval(
                          child: Image.asset(
                            'images/logo.png',
                            fit: BoxFit.fill,
                            width: 70,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(
                            fontSize: 22,
                            color: MyColor.blue,
                        ),
                      ),
                      Text(
                        '${GetUserDetails.userProfileModel!.username}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),

                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0,top: 8,bottom: 8),
                child: Text(
                  'First Name ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8,right: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: .2
                  ),
                  borderRadius: BorderRadius.circular(6)
                ),
                child: ListTile(
                  title: Text('${GetUserDetails.userProfileModel!.firstname}'),
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0,top: 8,bottom: 8),
                child: Text(
                  'Last Name ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8,right: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey,
                        width: .2
                    ),
                    borderRadius: BorderRadius.circular(6)
                ),
                child: ListTile(
                  title: Text('${GetUserDetails.userProfileModel!.lastname}'),
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0,top: 8,bottom: 8),
                child: Text(
                  'Email Address ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8,right: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey,
                        width: .2
                    ),
                    borderRadius: BorderRadius.circular(6)
                ),
                child: ListTile(
                  title: Text('${GetUserDetails.userProfileModel!.email}'),
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0,top: 8,bottom: 8),
                child: Text(
                  'Phone Number ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8,right: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey,
                        width: .2
                    ),
                    borderRadius: BorderRadius.circular(6)
                ),
                child: ListTile(
                  title: Text('${GetUserDetails.userProfileModel!.phone}'),
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0,top: 8,bottom: 8),
                child: Text(
                 'Occupation ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8,right: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey,
                        width: .2
                    ),
                    borderRadius: BorderRadius.circular(6)
                ),
                child: ListTile(
                  title: Text(''),
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0,top: 8,bottom: 8),
                child: Text(
                  'Country of birth ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8,right: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey,
                        width: .2
                    ),
                    borderRadius: BorderRadius.circular(6)
                ),
                child: ListTile(
                  title: Text('{GetUserDetails.userProfileModel!.countryOfBirth}'),
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0,top: 8,bottom: 8),
                child: Text(
                  'Address ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8,right: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey,
                        width: .2
                    ),
                    borderRadius: BorderRadius.circular(6)
                ),
                child: ListTile(
                  title: Text('{GetUserDetails.userProfileModel!.address}'),
                ),
              )
            ],
          ),
          SizedBox(height: 10,),

          // isLogin
          //     ? ElevatedButton(onPressed: () {}, child: Text('Edit'))
          //     : Text(''),

        ],
      ),
    );
  }


}
