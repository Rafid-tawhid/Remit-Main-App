import 'package:flutter/material.dart';

import '../models/errors_model.dart';

class MyDialog{
  static Future<dynamic> showServerProblemDialog(BuildContext context) {
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


  static Future<dynamic> showErrorMsgDialog(BuildContext context, data) {
    List<String> errorList=[];
    var errors=ErrorsModel.fromJson(data);
    if(errors.errors!.email!=null){
      errorList.addAll(errors.errors!.email!);
    }
    if(errors.errors!.password!=null){
      errorList.addAll(errors.errors!.password!);
    }
    else {
      errorList[0]=errors.errors.toString();
    }
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text(errorList.first.toString()),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'))
          ],
        ));
  }

  static Future<dynamic> showMsgDialog(BuildContext context,title,message) {

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'))
          ],
        ));
  }
}