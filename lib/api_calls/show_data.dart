import 'package:flutter/material.dart';
import 'package:remit_app/models/user_profile_model.dart';

class ShowDataPage extends StatefulWidget {
  const ShowDataPage({Key? key}) : super(key: key);
  static const String routeName='/show';

  @override
  State<ShowDataPage> createState() => _ShowDataPageState();
}

class _ShowDataPageState extends State<ShowDataPage> {
  var data;
  UserProfileModel? user;
  @override
  void didChangeDependencies() {
   data=ModalRoute.of(context)!.settings.arguments as UserProfileModel;
   if(data!=null){
     user=data;
   }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Show Json Data'),),
      body: Center(
        child: Wrap(
          children: [
            Text(user.toString())
          ],
        ),
      ),
    );
  }
}
