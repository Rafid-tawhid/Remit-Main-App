import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/colors.dart';
import 'package:remit_app/pages/calculator_page_prac.dart';
import 'package:remit_app/providers/user_profile_provider.dart';

import '../custom_widgits/home.dart';
import '../custom_widgits/receiver.dart';
import '../custom_widgits/send.dart';
import '../custom_widgits/send_money.dart';
import '../custom_widgits/tab_widgits_list.dart';
import '../helper_method/helper_class.dart';
import '../models/user_profile_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/home';


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserProfileProvider provider;
  bool callOnce=true;

  @override
  void didChangeDependencies() {

    provider=Provider.of(context,listen: false);
    if(callOnce){
      provider.getSenderRelationshipData();
      callOnce=false;
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: MyColor.blue,
        unSelectedColor: Colors.black54,
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        unselectedIconSize: 20,
        selectedIconSize: 25,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
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



