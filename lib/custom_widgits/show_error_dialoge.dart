import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/services.dart';

void ShowErrorDialoge(context) {
  ArtSweetAlert.show(
    context: context,
    artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.info,
        title: "Server Problem !!",
        text: "Please try after sometime..",
        confirmButtonText: 'Exit',
        onConfirm: (){
          SystemNavigator.pop();
        }
    ),
  );
}

void ShowMessageDialoge(context,title,text,btnTxt,function()) {
  ArtSweetAlert.show(
    context: context,
    artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.info,
        title: title,
        text: text,
        confirmButtonText: btnTxt,
        onConfirm: function
    ),
  );
}