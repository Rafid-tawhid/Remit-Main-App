import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/colors.dart';
import 'package:remit_app/providers/user_profile_provider.dart';

import '../custom_widgits/drawer.dart';

class TransferLogPage extends StatefulWidget {
  static const String routeName='/transfer_log';
  const TransferLogPage({Key? key}) : super(key: key);

  @override
  State<TransferLogPage> createState() => _TransferLogPageState();
}

class _TransferLogPageState extends State<TransferLogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer History'),
      ),
      // drawer: MyDrawer(),
      body: Consumer<UserProfileProvider>(
        builder: (context,provider,_)=>FutureBuilder(
          future: provider.getUserTransferLog(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView(
                children: snapshot.data!.map((e) => ListTile(
                  title: Text(e.recipientName!),
                  subtitle: Text(e.localAgentCountry!),
                )).toList(),
              );
            }
            // else if(provider.transferLogList.isEmpty){
            //   return Center(
            //     child: Text('You don\'t have any transaction yet.',style: TextStyle(fontSize: 20),),
            //   );
            // }
            else{
              return Center(child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10,),
                  Text('Loading...',style: TextStyle(color: MyColor.blue),)
                ],
              ));
            }
          },
        ),
      ),
    );
  }
}
