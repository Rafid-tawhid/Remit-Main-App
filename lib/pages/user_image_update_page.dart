import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:remit_app/api_calls/user_api_calls.dart';
import 'package:remit_app/colors.dart';
import 'package:remit_app/helper_method/get_user_info.dart';
import 'package:remit_app/models/update_user_profile_model.dart';
import 'package:remit_app/models/user_profile_model.dart';
import 'package:remit_app/pages/user_profile_page.dart';

class UserImageUpdatePage extends StatefulWidget {
  static const String routeName='/image';
  const UserImageUpdatePage({Key? key}) : super(key: key);

  @override
  State<UserImageUpdatePage> createState() => _UserImageUpdatePageState();
}

class _UserImageUpdatePageState extends State<UserImageUpdatePage> {
  ImageSource _imageSource = ImageSource.gallery;
  File? file;
  String? _imagePath = 'No File Chosen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Update'),
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MyColor.blue,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(2)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: file!=null?Image.file(file!,height: 100,width: 100,fit: BoxFit.contain,):
                    Image.asset('images/placeholder.jpeg',height: 100,width: 100,fit: BoxFit.contain,),
                  ),
                ),
                InkWell(
                  onTap: () async {
                      _getImage();
                  },
                    child: Icon(Icons.add,color: Colors.white,size: 80,))
              ],
            ),
          ),
          SizedBox(height: 10,),
          Text('Joined ${DateTime.now()}'),
          SizedBox(height: 20,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: MyColor.blue
              ),
              onPressed: ()async{

                String imagepath = _imagePath!;

                File imagefile = File(imagepath);
                //convert Path to File
                Uint8List imagebytes = await imagefile.readAsBytes();

                String base64string = base64.encode(imagebytes); //convert bytes to base64 string


                updatePhoneNumber(base64string);

                UserApiCalls.update_user_profile(UpdateUserProfile(
                  profile_image: base64string
                )).then((value) {

                });

                if(_imagePath!=null){
                  print(imagefile);
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please select an image'),
                  ));
                }

              },
              child: Text('Update Image'))
        ],
      ),
    );
  }

  void _getImage() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    print('selectedImage $selectedImage');
    if (selectedImage != null) {
      setState(() {
        file = File(selectedImage!.path);
        _imagePath = selectedImage.path;
      });
    }

  }

  checkpermission_opengallery() async {
    var gallaryStatus=await Permission.photos.status;
    print(gallaryStatus);

  }

  void updatePhoneNumber(String base64Url) {
    EasyLoading.show();
    UserApiCalls.update_user_profile(UpdateUserProfile(
      profile_image: base64Url
    )).then((value) {
      UserApiCalls.getUserInfo().then((data) async {
        final user = await Data.fromJson(data['data']);
        await GetUserDetails.setUserInfo(user);
        EasyLoading.dismiss();
        Navigator.pushNamed(context, UserProfilePage.routeName);
        setState(() {
        });
        if(value['status']==true){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value['message']),
          ));
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value['message']),
          ));
        }
      });
    });
  }

}
