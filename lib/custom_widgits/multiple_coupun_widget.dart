import 'package:flutter/material.dart';

import '../colors.dart';
import '../models/calculator_info_model.dart';

class NormalCalculatorCardInfo extends StatelessWidget {
  const NormalCalculatorCardInfo({
    Key? key,
    this.serviceName,
    this.currency,
    this.sendAmount,
    this.fees,
    this.totalPayable,
    this.rate,
    this.recipientGets,
  }) : super(key: key);

  final String? serviceName;
  final String? currency;
  final String? sendAmount;
  final String? fees;
  final String? totalPayable;
  final String? rate;
  final String? recipientGets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: MyColor.grey),
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$serviceName',
                style: TextStyle(fontSize: 22),
              ),
              Align(
                  alignment: Alignment.topRight, child: Text('AUD-$currency')),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Send Amount'), Text('$sendAmount AUD')],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Fees'), Text('$fees AUD')],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('You pay in total'), Text('$totalPayable AUD')],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exchange Rate',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '1 AUD->$rate $currency',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your recipient gets',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$recipientGets $currency',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorInfoWithSendCoupon extends StatelessWidget {
  const CalculatorInfoWithSendCoupon({
    Key? key,
    required this.serviceName,
    required this.currency,
    required this.sendAmount,
    required this.fees,
    required this.calculatorInfo,
    required this.totalPayable,
    required this.rate,
  }) : super(key: key);

  final String? serviceName;
  final String? currency;
  final String? sendAmount;
  final String? fees;
  final CalculatorInfoModel calculatorInfo;
  final String? totalPayable;
  final String? rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: MyColor.grey),
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$serviceName',
                style: TextStyle(fontSize: 22),
              ),
              Align(
                  alignment: Alignment.topRight, child: Text('AUD-$currency')),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Send Amount'), Text('$sendAmount AUD')],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Fees'), Text('${double.parse(fees!).toStringAsFixed(2)} AUD')],
              ),
              SizedBox(height: 5,),
              calculatorInfo.couponData!.discountType == 'P'
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount Send Amount ${calculatorInfo.couponData!.discount}(%)',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('${calculatorInfo.couponData!.discountPrice} ${calculatorInfo.currency}',style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount Send Amount (Fixed)',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(
                    '${calculatorInfo.couponData!.discountPrice} ${calculatorInfo.currency}',style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('You pay in total'), Text('$totalPayable AUD')],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exchange Rate',

                  ),
                  Text(
                    '1 AUD->$rate $currency',
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your recipient gets',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${calculatorInfo.couponData!.recipientGetAmount} $currency',
                        style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),
                      ),
                      Text(
                        '${calculatorInfo.couponData!.recipientGetAmountDiscount} $currency',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorInfoWithRateCoupon extends StatelessWidget {
  const CalculatorInfoWithRateCoupon({
    Key? key,
    required this.serviceName,
    required this.currency,
    required this.sendAmount,
    required this.fees,
    required this.calculatorInfo,
    required this.totalPayable,
  }) : super(key: key);

  final String? serviceName;
  final String? currency;
  final String? sendAmount;
  final String? fees;
  final CalculatorInfoModel calculatorInfo;
  final String? totalPayable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: MyColor.grey),
        ),
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$serviceName',
                style: TextStyle(fontSize: 22),
              ),
              Align(
                  alignment: Alignment.topRight, child: Text('AUD-$currency')),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Send Amount'), Text('$sendAmount AUD')],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Fees'), Text('$fees AUD')],
              ),
              SizedBox(
                height: 5,
              ),
              calculatorInfo.couponData!.discountType == 'P'
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Discount rate ${calculatorInfo.couponData!.discount}(%)'),
                  Text(
                    '${calculatorInfo.couponData!.rateAfterDiscount} AUD',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Discount Rate (Fixed) '),
                  Text(
                    '1 AUD -> ${calculatorInfo.couponData!.rateAfterDiscount} ${calculatorInfo.currency}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('You pay in total'), Text('$totalPayable AUD')],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exchange Rate',
                  ),
                  Text(
                    '1 AUD->${calculatorInfo.couponData!.rate}',
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your recipient gets',
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${calculatorInfo.couponData!.recipientGetAmount} ${calculatorInfo.currency}',
                        style:
                        TextStyle(decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${calculatorInfo.couponData!.recipientGetAmountDiscount} ${calculatorInfo.currency}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorInfoWithFeesCoupon extends StatelessWidget {
  const CalculatorInfoWithFeesCoupon({
    Key? key,
    required this.serviceName,
    required this.currency,
    required this.sendAmount,
    required this.fees,
    required this.calculatorInfo,
    required this.totalPayable,
  }) : super(key: key);

  final String? serviceName;
  final String? currency;
  final String? sendAmount;
  final String? fees;
  final CalculatorInfoModel calculatorInfo;
  final String? totalPayable;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: MyColor.grey),
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$serviceName',
                style: TextStyle(fontSize: 22),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Text('AUD-$currency')),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Send Amount'),
                  Text('$sendAmount AUD')
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Fees'), Text('${double.parse(calculatorInfo.couponData!.discountPrice.toString())+double.parse(calculatorInfo.couponData!.discountValue!.toString())} AUD',style: TextStyle(decoration: TextDecoration.lineThrough),)],
              ),
              SizedBox(
                height: 5,
              ),
              calculatorInfo.couponData!.discountType == 'P'
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount fees ${calculatorInfo.couponData!.discount}(%)',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(
                    '${calculatorInfo.couponData!.discountPrice} AUD',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Discount Fees ${calculatorInfo.couponData!.discount} (Fixed) ',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(
                    ' ${calculatorInfo.couponData!.discountPrice} AUD',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('You pay in total'),
                  Text('$totalPayable AUD')
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exchange Rate',

                  ),
                  Text(
                    '1 AUD->${calculatorInfo.couponData!.rate} $currency',

                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your recipient gets',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${calculatorInfo.recipientGets} $currency',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 5,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}