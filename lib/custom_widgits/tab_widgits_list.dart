import 'package:flutter/material.dart';
import 'package:remit_app/custom_widgits/receiver.dart';
import 'package:remit_app/custom_widgits/send.dart';

import '../pages/calculator_page_prac.dart';
import 'home.dart';

int selectedIndex = 0;
List<Widget> widgetOptions = [

  HomeWidget(),
  ReceipientWidget(),
  CalculatorPage2(),
  SendWidget(),

];