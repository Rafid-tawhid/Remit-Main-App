import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:remit_app/pages/calculator_page_prac.dart';

import '../custom_widgits/home.dart';
import '../custom_widgits/receiver.dart';
import '../custom_widgits/send.dart';
import '../custom_widgits/send_money.dart';
import '../helper_method/helper_class.dart';
import '../models/user_profile_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/home';


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [

    HomeWidget(),
    ReceipientWidget(),
    CalculatorPage2(),
    SendWidget(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Colors.blue,
        unSelectedColor: Colors.black54,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        unselectedIconSize: 20,
        selectedIconSize: 25,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 4,
        indicatorType: IndicatorType.Top,
        // gradient: LinearGradient(
        //   colors: [Colors.pink, Colors.yellow],
        // ),
        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Home',
            icon: Icons.home,
          ),
          CustomBottomBarItems(
            label: 'Receiver',
            icon: MyIcons2.person,
          ),
          CustomBottomBarItems(
              label: 'Send', icon: Icons.send),
          CustomBottomBarItems(
            label: 'Track',
            icon: MyIcons.location,
          ),
        ],
      ),
    );
  }
}



