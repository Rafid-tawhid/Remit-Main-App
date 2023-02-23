import 'package:remit_app/models/recipents_model.dart';

import '../models/calculator_info_model.dart';

class SetCalculatorAndRecipientInfo{
  static CalculatorInfoModel? calculatorInfoModel;
  static Recipients? recipients;

  static void setCalculatorInfo(CalculatorInfoModel model) {

    calculatorInfoModel=model;
  }

  static CalculatorInfoModel? getCalculatorInfo()=>calculatorInfoModel;


  static void setRecipeintInfo(Recipients recipient) {

    recipients=recipient;
  }

  static Recipients? getRecipientInfo()=>recipients;
}