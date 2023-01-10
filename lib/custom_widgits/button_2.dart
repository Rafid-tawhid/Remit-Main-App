import 'package:flutter/material.dart';
import 'package:remit_app/colors.dart';

class SecondaryButton extends StatefulWidget {
  String title;
  String? route;
  SecondaryButton({required this.title, this.route});

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              fixedSize: Size.fromHeight(50),
              side: BorderSide(
                  color: MyColor.blue,
                  width: 1
              )
          ),
          onPressed: () {
            widget.route==null?null:Navigator.pushNamed(context, widget.route!);
          },
          child: Text(widget.title,style: MyStyle.mytext(TextStyle(color: MyColor.blue,fontSize: 16),))),
    );
  }
}
