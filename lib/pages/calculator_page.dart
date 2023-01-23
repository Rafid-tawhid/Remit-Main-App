import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/pages/login_page.dart';
import '../api_calls/calculator_api_calls.dart';
import '../models/country_models.dart';
import '../providers/calculator_provider.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);
  static const String routeName = 'calculator';

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  final sendControler = TextEditingController();
  final receiveControler = TextEditingController();
  late CalculatorProvider provider;
  String? countryName;
  String? img;
  Info? _country;
  String? initialService;

  @override
  void didChangeDependencies() {
    provider=Provider.of(context,listen: true);
    _country=provider.getAllCountriesInfoList.first;
   // provider.getAllCountryInfo();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    sendControler.dispose();
    receiveControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        primary: true,
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.asset(
            "images/top_icon.png",
            height: 45,
          ),
        ),
        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.blue,
        // ),
        elevation: 0.0,
      ),
      drawer: MyDrawer(),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(25),
        child: ListView(
          children: [
            InkWell(
              onTap: (){

              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'International Money Transfer',
                        style: TextStyle(color: Colors.white,fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send to',
            style: TextStyle(
                fontSize: 12, color: Colors.grey.shade600),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(6),
                // border:
                //     Border.all(color: Colors.black, width: 2)
              ),
              child: Row(
                children: [
                  Container(
                    width: 35,
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10, left: 6, right: 6),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8)),
                        color: Color(0xffD9D9D9)),
                    child: countryName == null
                        ? Image.network(
                      provider.getAllCountriesInfoList.first.image!,
                      fit: BoxFit.fitWidth,
                    )
                        : Image.network(
                      img!,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: DropdownSearch<Info>(
                        selectedItem: _country,
                        onChanged: (value) {

                          setState(() {
                            _country = value;
                            img = _country!.image!;
                            countryName = value!.name!;
                          });
                          _country!.currencyDetails!.forEach((element) {
                            print(element.toString());
                          });
                        },
                        items: provider.getAllCountriesInfoList,
                        dropdownDecoratorProps:
                        DropDownDecoratorProps(
                          dropdownSearchDecoration:
                          InputDecoration(
                            labelText: countryName??_country!.name,
                            // enabledBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(6),
                            //     borderSide: BorderSide(color: Colors.grey.shade300,),
                            // ),
                            enabledBorder: InputBorder.none,
                            filled: true,
                            hintText: countryName ??
                                provider
                                    .getAllCountriesInfoList.first.name,
                          ),
                        ),
                        popupProps: PopupProps.menu(
                          showSearchBox: true,
                          itemBuilder:
                              (context, item, isSelected) {
                            return ListTile(
                              title: Text(item.name!),
                              leading: Padding(
                                padding: const EdgeInsets.only(
                                    top: 4.0, bottom: 4),
                                child: Image.network(item.image!),
                              ),
                            );
                          },
                          showSelectedItems: false,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Select Service',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 7.0, bottom: 7, left: 6, right: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(6),
              // border:
              //     Border.all(color: Colors.black, width: 2)
            ),
            child: DropdownButtonFormField<CurrencyDetails>(
              decoration: const InputDecoration.collapsed(
                hintText: '',
              ),
              hint: Text(_country!.currencyDetails!.first.serviceName!),
              value: _country!.currencyDetails!.first,
              isExpanded: true,
              validator: (value) {
                if (value == null) {
                  return 'Please select a services';
                }
                return null;
              },
              items: _country!.currencyDetails!
                  .map((catModel) => DropdownMenuItem(
                  value: catModel,
                  child: Text(catModel.serviceName!)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  // initialCurrency=null;
                  // selectService = value;
                  // countryMarginRate = null;
                  // sendControler.clear();
                  // receiveControler.clear();
                  // final_rate == 0.0;
                });
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          const Text(
            'Select Currency',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 7.0, bottom: 7, left: 6, right: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(6),
              // border:
              //     Border.all(color: Colors.black, width: 2)
            ),
            child: DropdownButtonFormField<CurrencyDetails>(
              decoration: const InputDecoration.collapsed(
                hintText: '',
              ),
              hint: Text(_country!.currencyDetails!.first.serviceName!),
              value: _country!.currencyDetails!.first,
              isExpanded: true,
              validator: (value) {
                if (value == null) {
                  return 'Please select a currency';
                }
                return null;
              },
              items: _country!.currencyDetails!
                  .map((catModel) => DropdownMenuItem(
                  value: catModel,
                  child: Text(catModel.currency!)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  // initialCurrency=null;
                  // selectService = value;
                  // countryMarginRate = null;
                  // sendControler.clear();
                  // receiveControler.clear();
                  // final_rate == 0.0;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.grey),
                  text: '1 AUD =',
                  children: [
                    TextSpan(
                        text: ' ${_country!.currencyDetails!.first!.finalRate!} ',
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: '${_country!.currencyDetails!.first!.finalRate!}',
                        style: TextStyle(color: Colors.grey))
                  ]),
            ),
          ),
        ],
      )
            // Consumer<CalculatorProvider>(
            //   builder: (context, provider, _) => FutureBuilder(
            //     future: provider.getAllCountryInfo(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         // countryName=provider.getAllCountriesInfoList.first.name;
            //         // img=provider.getAllCountriesInfoList.first.image;
            //         return Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Send to',
            //               style: TextStyle(
            //                   fontSize: 12, color: Colors.grey.shade600),
            //             ),
            //             const SizedBox(
            //               height: 5,
            //             ),
            //             Container(
            //                 height: 40,
            //                 decoration: BoxDecoration(
            //                   color: Colors.grey.shade300,
            //                   borderRadius: BorderRadius.circular(6),
            //                   // border:
            //                   //     Border.all(color: Colors.black, width: 2)
            //                 ),
            //                 child: Row(
            //                   children: [
            //                     Container(
            //                       width: 35,
            //                       padding: const EdgeInsets.only(
            //                           top: 10.0, bottom: 10, left: 6, right: 6),
            //                       decoration: const BoxDecoration(
            //                           borderRadius: BorderRadius.only(
            //                               topLeft: Radius.circular(8),
            //                               bottomLeft: Radius.circular(8)),
            //                           color: Color(0xffD9D9D9)),
            //                       child: countryName == null
            //                           ? Image.network(
            //                         provider.getAllCountriesInfoList.first.image!,
            //                         fit: BoxFit.fitWidth,
            //                       )
            //                           : Image.network(
            //                         img!,
            //                         fit: BoxFit.fitWidth,
            //                       ),
            //                     ),
            //                     Expanded(
            //                       child: Container(
            //                         child: DropdownSearch<Info>(
            //                           selectedItem: _country,
            //                           onChanged: (value) {
            //
            //                             setState(() {
            //                               _country = value;
            //                               img = _country!.image!;
            //                               countryName = value!.name!;
            //                             });
            //                             _country!.currencyDetails!.forEach((element) {
            //                               print(element.toString());
            //                             });
            //                           },
            //                           items: provider.getAllCountriesInfoList,
            //                           dropdownDecoratorProps:
            //                           DropDownDecoratorProps(
            //                             dropdownSearchDecoration:
            //                             InputDecoration(
            //                               labelText: countryName,
            //                               // enabledBorder: OutlineInputBorder(
            //                               //     borderRadius: BorderRadius.circular(6),
            //                               //     borderSide: BorderSide(color: Colors.grey.shade300,),
            //                               // ),
            //                               enabledBorder: InputBorder.none,
            //                               filled: true,
            //                               hintText: countryName ??
            //                                   provider
            //                                       .getAllCountriesInfoList.first.name,
            //                             ),
            //                           ),
            //                           popupProps: PopupProps.menu(
            //                             showSearchBox: true,
            //                             itemBuilder:
            //                                 (context, item, isSelected) {
            //                               return ListTile(
            //                                 title: Text(item.name!),
            //                                 leading: Padding(
            //                                   padding: const EdgeInsets.only(
            //                                       top: 4.0, bottom: 4),
            //                                   child: Image.network(item.image!),
            //                                 ),
            //                               );
            //                             },
            //                             showSelectedItems: false,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 )),
            //             const SizedBox(
            //               height: 15,
            //             ),
            //             const Text(
            //               'Select Service',
            //               style: TextStyle(fontSize: 12, color: Colors.grey),
            //             ),
            //             const SizedBox(
            //               height: 5,
            //             ),
            //
            //             SizedBox(
            //               height: 15,
            //             ),
            //           ],
            //         );
            //       } else {
            //         return Center(
            //           child: Container(
            //               width: 60,
            //               height: 60,
            //               child: const CircularProgressIndicator()),
            //         );
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 2,
      child: Container(
        color: Color(0xff26A6DE),
        child: ListView(
          primary: true,
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 150,
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
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Icon(Icons.person)))
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Calculator',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
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
              onPressed: () {},
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
              onPressed: () {},
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
                    'Receiving',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.transfer_within_a_station_outlined,
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
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.help_outline,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Help Center',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
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
                Navigator.pushNamed(context, LoginPage.routeName);
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
                        Icons.login,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.white, width: 1)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
