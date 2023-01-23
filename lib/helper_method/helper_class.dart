import 'package:flutter/material.dart';


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


Future<dynamic> showServerProblemDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Server Problem"),
        content: Text('Try again later...'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'))
        ],
      ));
}


Future<dynamic> showErrorMsgDialog(BuildContext context, data) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(data['message']),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ok'))
        ],
      ));
}