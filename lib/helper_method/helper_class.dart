import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/errors_model.dart';


class MyIcons {

  MyIcons();
  static const _kFonts='MyIcons';
  static const _kFonts2='MyIcons2';
  static const IconData location=IconData(0XE800,fontFamily: _kFonts);
  static const IconData person=IconData(0XE800,fontFamily: _kFonts2);

}

class MyIcons2 {

  MyIcons2();
  static const _kFonts2='MyIcons2';
  static const IconData person=IconData(0XE800,fontFamily: _kFonts2);

}
class MapUtils {

  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}


