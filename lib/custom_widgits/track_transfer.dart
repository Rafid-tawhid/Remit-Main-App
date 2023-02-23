import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/models/track_transfer_model.dart';
import 'package:remit_app/providers/user_profile_provider.dart';
import '../colors.dart';
import '../pages/user_profile_page.dart';
import 'button1.dart';
import 'button_2.dart';
import 'drawer.dart';

class TrackTransferPage extends StatefulWidget {
  static const String routeName = '/track';
  const TrackTransferPage({Key? key}) : super(key: key);

  @override
  State<TrackTransferPage> createState() => _TrackTransferPageState();
}

class _TrackTransferPageState extends State<TrackTransferPage> {
  final trackIdCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late UserProfileProvider provider;
  TrackTransfer? transferInfo;
  bool showError=false;

  @override
  void dispose() {
    trackIdCon.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    provider = Provider.of<UserProfileProvider>(context, listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: MyColor.blue, size: 25),
        elevation: 0.0,
        title: Image.asset(
          'images/logo.png',
          width: 120,
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, UserProfilePage.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0, top: 5, bottom: 5),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/media/FhC3LvHXkAEMEUZ.png',
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            showError?
                Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                transferInfo == null
                                    ? Text('Invoice :')
                                    : Text(
                                        'Invoice : ${transferInfo!.invoice ?? '000'}',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                transferInfo == null
                                    ? Text('Item Ref:')
                                    : Text(
                                        'Item Ref : ${transferInfo!.itemReference ?? '000'}',
                                        style: TextStyle(fontSize: 14),
                                      ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            transferInfo == null
                                ? Text(
                                    'Recipient Name : Demo',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    'Recipient Name : : ${transferInfo!.recipientName ?? 'Demo'}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                            Divider(
                              height: 5,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                transferInfo == null
                                    ? Text('Send Amount : 000')
                                    : Text(
                                        'Send Amount : ${transferInfo!.sendAmount ?? '000'}'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                transferInfo == null
                                    ? Text('Fees : 0000')
                                    : Text(
                                        'Fees : ${transferInfo!.fees ?? '000'}')
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                transferInfo == null
                                    ? Text('You pay in total : 0000')
                                    : Text(
                                        'You pay in total : ${transferInfo!.payableAmount ?? '000'}')
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              height: 5,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                transferInfo == null
                                    ? Text(
                                        'Exchange Rate : 1 AUD-> 0000',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        'Exchange Rate : 1 AUD-> ${transferInfo!.rate ?? '0000'} ${transferInfo!.receiveCurr ?? 'Null'}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              height: 5,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                transferInfo == null
                                    ? Text(
                                        'Your recipient gets',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        'Your recipient gets ${transferInfo!.recipientGetAmount ?? '000'}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              height: 5,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [Text('Transaction Method :')],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [Text('Fund Of Source :')],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [Text('Purpose :')],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [Text('Beneficiary Relationship :')],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [Text('Local Agent Name :')],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [Text('Local Agent City :')],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [Text('Local Agent Branch :')],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [Text('Status:')],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ):ListTile(title: Text('No record found according to your Item Reference'),),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: TextFormField(
                    controller: trackIdCon,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.track_changes_sharp,
                        color: MyColor.blue,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Transfer Id',
                      hintStyle: TextStyle(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: MyColor.blue),
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: .2,
                          color: Colors.grey.shade500,
                        ),
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.red),
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'TransferId is required to track';
                      } else
                        return null;
                    },
                  ),
                ),
              ),
            ),
                Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromHeight(50),
                      backgroundColor: Color(0xff02A6EB)),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      EasyLoading.show();
                    await  provider.getTransferInfoByTransferId(trackIdCon.text)
                          .then((value) {
                        EasyLoading.dismiss();
                        print('Returning value $value');
                        if (value != null) {
                          setState(() {
                            showError=true;
                            transferInfo = value;
                          });
                        }
                        if(value==null) {
                          print('ERROR IS FOUND');
                          setState(() {
                            showError=false;
                          });
                        }
                      });
                    }
                  },
                  child: Text('Track')),
            )
          ],
        ),
      ),
    );
  }
}
