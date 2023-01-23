import 'package:flutter/material.dart';

import '../colors.dart';
import '../pages/user_profile_page.dart';
import 'drawer.dart';

class ReceiverWidget extends StatefulWidget {
  const ReceiverWidget({Key? key}) : super(key: key);

  @override
  State<ReceiverWidget> createState() => _ReceiverWidgetState();
}

class _ReceiverWidgetState extends State<ReceiverWidget> {
  String? country;
  bool showPass=true;
  List<String> listOfValue = ['Daily', 'Weekly', 'Monthly', 'Yearly',];
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
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                    child: Text('History',style: TextStyle(fontSize: 18)),),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none
                        ),
                    value: country,
                    hint: Text(
                      'Daily',
                      style: TextStyle(color: Colors.black),
                    ),
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        country = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        country = value;
                      });
                    },
                    validator: (value) {
                      if (value==null) {
                        return "can't empty";
                      } else {
                        return null;
                      }
                    },
                    items: listOfValue
                        .map((String val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          ListTile(

            leading: Image.network(
                'https://newwallpapershd.com/wp-content/uploads/2016/03/bangladesh-Flag.gif',width: 60,height: 45,),
            title: Text('Bangladesh'),
            subtitle: Text('Dhaka , Mirpur'),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add,color: Colors.blue,),
              SizedBox(width: 10,),
              Text('Add Recepint',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
            ],
          )
        ],
      ),
    );
  }
}
