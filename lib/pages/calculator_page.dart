import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../models/country_margin_rate.dart';
import '../models/country_models.dart';
import '../providers/calculator_provider.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);
  static const String routeName = 'calculator';

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  CountryModels? _country;
  // late CalculatorProvider provider;
  Facilities? selectService;
  double? final_rate;
  double rate = 1.0;
  String? curencyName;
  double totallCost = 0.00;
  String fees = '0.00';
  double? initialRate;
  String? initialService;
  String? initialCurrency;
  String maxLimit = '0.00';
  String minLimit = '0.00';
  String? countryName;
  CountryMarginRate? countryMarginRate;

  bool showMax = false;
  bool showMin = false;
  bool callOnce = true;

  final sendControler = TextEditingController();
  final receiveControler = TextEditingController();
  // var img = 'https://remit.daneshexchange.com/staging/assets/uploads/country/6347faed94d991665661677.jpg';
  var img;
  @override
  void didChangeDependencies() {
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
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'International Money Transfer',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<CalculatorProvider>(
              builder: (context, provider, _) => FutureBuilder(
                future: provider.getAllCountryInfo(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (callOnce) {
                      EasyLoading.show();
                      provider
                          .getFirstCallInfo(
                              provider.countryInfoList.first.name!)
                          .then((value) async {
                        var total;
                          total= await  provider.getRateByCountryId("3000", value.first.currencyId,value.first.serviceId);

                        setState(() {
                           initialCurrency = value.first.currency!;
                          
                          initialCurrency = 'Select Services';
                         fees=total['single_fee'].toString();
                        totallCost=3000*double.parse(value.first.finalRate!)+double.parse(fees);
                          rate=double.parse(value.first.finalRate!);
                          sendControler.text = '3000';
                          receiveControler.text =
                              '${double.parse(value.first.finalRate!) * 3000}';
                          final_rate = double.parse(value.first.finalRate!);
                          curencyName = value.first.currency;
                        });
                        EasyLoading.dismiss();
                      });
                    }
                    callOnce = false;
                    return Column(
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
                                          provider.countryInfoList.first.flag!,
                                          fit: BoxFit.fitWidth,
                                        )
                                      : Image.network(
                                          img!,
                                          fit: BoxFit.fitWidth,
                                        ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: DropdownSearch<CountryModels>(
                                      selectedItem: _country,
                                      onChanged: (value) {
                                        selectService = null;
                                        countryMarginRate = null;
                                        initialRate = null;
                                        initialCurrency = null;
                                        initialCurrency = null;
                                        setState(() {
                                          _country = value;
                                          img = _country!.flag!;
                                          countryName = value!.name!;

                                          print(provider
                                              .getAllFacilitiesByCountryName(
                                                  _country!.name!));
                                          provider.getCurrencyByCountryName(
                                              _country!.name!);
                                        });
                                      },
                                      items: provider.countryInfoList2,
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          labelText: countryName,
                                          // enabledBorder: OutlineInputBorder(
                                          //     borderRadius: BorderRadius.circular(6),
                                          //     borderSide: BorderSide(color: Colors.grey.shade300,),
                                          // ),
                                          enabledBorder: InputBorder.none,
                                          filled: true,
                                          hintText: countryName ??
                                              provider
                                                  .countryInfoList.first.name,
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
                                              child: Image.network(item.flag!),
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
                          child: DropdownButtonFormField<Facilities>(
                            decoration: const InputDecoration.collapsed(
                              hintText: '',
                            ),
                            hint: initialService == null
                                ? Text(provider.countryInfoList.first
                                    .facilities!.first.name!)
                                : Text('$initialService'),
                            value: selectService,
                            isExpanded: true,
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a services';
                              }
                              return null;
                            },
                            items: provider.countryFacilitiesList
                                .map((catModel) => DropdownMenuItem(
                                    value: catModel,
                                    child: Text(catModel.name!)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                initialCurrency=null;
                                selectService = value;
                                countryMarginRate = null;
                                sendControler.clear();
                                receiveControler.clear();
                                final_rate == 0.0;
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
                            //     Border.all(color: Colors.black, width: 2),
                          ),
                          child: DropdownButtonFormField<CountryMarginRate>(
                            decoration: const InputDecoration.collapsed(
                              hintText: '',
                            ),
                            hint: initialCurrency == null
                                ? Text(provider.countryInfoList.first.name!)
                                : Text('$initialCurrency'),
                            value: countryMarginRate,
                            isExpanded: true,
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a services';
                              }
                              return null;
                            },
                            items: provider.countryCurrencyList2
                                .map((currency) => DropdownMenuItem(
                                    value: currency,
                                    child: Text(currency.currency!)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                countryMarginRate = value;
                                final_rate = provider
                                    .getCurrencyRateByCountryNameServiceCurrency(
                                        _country!.name!,
                                        selectService!.name!,
                                        countryMarginRate!.currency!);
                                curencyName =
                                    provider.getCurrencyNameCountryName(
                                        _country!.name!);
                                // sendControler.text=3000.toString();
                                sendControler.text = 3000.toString();
                                receiveControler.text =
                                    (final_rate! * 3000).toString();
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
                                      text: ' $final_rate ',
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                      text: curencyName,
                                      style: TextStyle(color: Colors.grey))
                                ]),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'You send',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.grey.shade300),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            child: Flexible(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: TextField(
                                                  decoration:
                                                      const InputDecoration(
                                                          border:
                                                              InputBorder.none),
                                                  controller: sendControler,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  onChanged: (value) async {
                                                    //  EasyLoading.show();
                                                    rate = double.parse(value) *
                                                        final_rate!;
                                                    receiveControler.text =
                                                        rate.toStringAsFixed(2);
                                                    await provider
                                                        .getRateByCountryId(
                                                            sendControler.text,
                                                            countryMarginRate!
                                                                .currencyId
                                                                .toString(),
                                                            countryMarginRate!
                                                                .serviceId
                                                                .toString())
                                                        .then((value) {
                                                      print(
                                                          value['single_fee']);
                                                      print(sendControler.text +
                                                          countryMarginRate!
                                                              .currencyId
                                                              .toString() +
                                                          countryMarginRate!
                                                              .serviceId!);

                                                      setState(() {
                                                        fees =
                                                            value['single_fee'];
                                                        totallCost = double
                                                                .parse(fees) +
                                                            double.parse(
                                                                sendControler
                                                                    .text);
                                                      });
                                                    });
                                                    await provider
                                                        .getMinAndMaxRateByCountryTblId(
                                                            countryMarginRate!
                                                                .countryTableId
                                                                .toString(),
                                                            countryMarginRate!
                                                                .serviceName
                                                                .toString())
                                                        .then((value) {
                                                      if (double.parse(value!
                                                              .maximumLimit!) <
                                                          double.parse(
                                                              sendControler
                                                                  .text)) {
                                                        setState(() {
                                                          maxLimit = value!
                                                              .maximumLimit!;
                                                          print(
                                                              'maxLimit ${value!.maximumLimit!}');
                                                          showMax = true;
                                                          showMin = false;
                                                        });
                                                      } else {
                                                        minLimit = value!
                                                            .minimumLimit!;
                                                        setState(() {
                                                          print(
                                                              'minLimit $minLimit');
                                                          showMin = true;
                                                          showMax = false;
                                                        });
                                                      }

                                                      // EasyLoading.dismiss();
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              height: 40,
                                              width: 2,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Text(
                                              'AUD',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Receiver gets',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.grey.shade300),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            InputBorder.none),
                                                controller: receiveControler,
                                                onChanged: (value) {
                                                  rate = double.parse(value) /
                                                      final_rate!;
                                                  sendControler.text =
                                                      rate.toStringAsFixed(2);
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              height: 40,
                                              width: 2,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: curencyName == null
                                                ? Text(
                                                    provider.countryInfoList
                                                        .first.code!,
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  )
                                                : Text(
                                                    curencyName!,
                                                    style: const TextStyle(
                                                        fontSize: 20),
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Stack(
                          children: [
                            if (showMax)
                              Text(
                                'Maximum Limit: $maxLimit $curencyName',
                                style: TextStyle(color: Colors.red),
                              ),
                            if (showMin)
                              Text(
                                'Minimum Limit: $minLimit $curencyName',
                                style: TextStyle(color: Colors.red),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Service fee:'), Text('${fees} AUD')],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total payable:'),
                            Text('${totallCost} AUD')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('Send now')),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              sendControler.clear();
                              receiveControler.clear();
                              setState(() {
                                fees == 0.00;
                                totallCost == 0.00;
                              });
                            },
                            child: Text('Clear items'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.blue),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Popular countries our customers send money to',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 80,
                          color: Colors.white.withOpacity(.5),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.featuredcountryInfo.length,
                              itemBuilder: (context, index) {
                                var country =
                                    provider.featuredcountryInfo[index];
                                return Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        country.flag!,
                                        height: 35,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        country.name!,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Container(
                          width: 60,
                          height: 60,
                          child: const CircularProgressIndicator()),
                    );
                  }
                },
              ),
            ),
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
              onPressed: () {},
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
