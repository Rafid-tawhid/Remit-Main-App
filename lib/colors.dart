import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyColor{
  static Color blue=Color(0xff02A6EB);
  static Color grey=Color(0xff404040);
  static Color greyLight=Color(0xff4D4D4D);
}
class MyStyle{
  static TextStyle mytext(TextStyle textStyle){
    return GoogleFonts.rubik(textStyle: textStyle);
  }
}