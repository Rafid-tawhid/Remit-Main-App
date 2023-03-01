import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/colors.dart';
import 'package:remit_app/providers/calculator_provider.dart';
import 'package:remit_app/providers/user_profile_provider.dart';

import '../custom_widgits/drawer.dart';
import '../helper_method/helper_class.dart';

class TransferLogPage extends StatefulWidget {
  static const String routeName='/transfer_log';
  const TransferLogPage({Key? key}) : super(key: key);

  @override
  State<TransferLogPage> createState() => _TransferLogPageState();
}

class _TransferLogPageState extends State<TransferLogPage> {
  late CalculatorProvider provider;

  @override
  void didChangeDependencies() {

    provider=Provider.of(context,listen: false);
    super.didChangeDependencies();
  }
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
                children: snapshot.data!.map((e)
                  => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Invoice : ${e.invoice!.substring(0,10)}',style: TextStyle(fontWeight: FontWeight.bold),),
                                Text('Date : ${e.createdAt!.substring(0,10)}',style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Item Reference :${e.itemReference}',style: TextStyle(fontWeight: FontWeight.bold),),

                              ],
                            ),
                            SizedBox(height: 4,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Recipient'),
                                Text(e.recipientName??'')
                              ],
                            ),
                            SizedBox(height: 4,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Send Amount'),
                                Text(double.parse(e.sendAmount??'').toStringAsFixed(4))
                              ],
                            ),
                            SizedBox(height: 4,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Receive Amount'),
                                Text(double.parse(e.recipientGetAmount??'').toStringAsFixed(4))
                              ],
                            ),
                            SizedBox(height: 4,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Rate'),
                                Text('1 AUD->${double.parse(e.rate??'').toStringAsFixed(4)}')
                              ],
                            ),
                            SizedBox(height: 4,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Paid'),
                                Text(Transfer.getTransferStatusById(e.status!)??'')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )).toList()

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

  String? getCountryName(String? receiveCountryId) {

    String? countryName;
    provider.getAllCountriesInfoList.forEach((element) {
      print(element.id);
      if(element.id==receiveCountryId){
        countryName==element.name;
      }
    });

    return countryName;
  }
}
