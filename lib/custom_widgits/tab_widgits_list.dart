import 'package:flutter/material.dart';
import 'package:remit_app/custom_widgits/receiver.dart';
import 'package:remit_app/custom_widgits/track_transfer.dart';

import '../pages/calculator_page.dart';
import 'home.dart';

int selectedIndex = 0;
List<Widget> widgetOptions = [

  HomeWidget(),
  ReceipientWidget(),
  CalculatorPage(),
  TrackTransferPage(),

];