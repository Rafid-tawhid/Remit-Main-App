class CalculatorInfoModel{
  String? serviceName;
  String? serviceId;
  String? countryName;
  String? countryId;
  String? currency;
  String? sendAmount;
  String? fees;
  String? totalPayable;
  String? exchangeRate;
  String? recipientGets;
  bool? hasDiscount;
  String? previousRate;
  String? discountType;
  String? discountText;


  CalculatorInfoModel(
      {this.serviceName,
      this.serviceId,
      this.countryName,
      this.countryId,
      this.currency,
      this.sendAmount,
      this.fees,
      this.totalPayable,
      this.exchangeRate,
      this.recipientGets,
      this.hasDiscount,
      this.previousRate,
      this.discountType,
      this.discountText});

  Map<String,dynamic> toMap(){
    final map=<String,dynamic>{};
    map['serviceName']=serviceName;
    map['serviceId']=serviceId;
    map['countryName']=countryName;
    map['countryId']=countryId;
    map['currency']=currency;
    map['sendAmount']=sendAmount;
    map['fees']=fees;
    map['totalPayable']=totalPayable;
    map['exchangeRate']=exchangeRate;
    map['recipientGets']=recipientGets;
    map['hasDiscount']=hasDiscount;
    map['previousRate']=previousRate;
    map['discountType']=discountType;
    map['discountText']=discountText;

    return map;
  }

   CalculatorInfoModel.fromMap(Map<String,dynamic> map){

    serviceName=map['serviceName'];
    serviceId=map['serviceId'];
    countryName=map['countryName'];
    countryId=map['countryId'];
    currency=map['currency'];
    sendAmount=map['sendAmount'];
    fees=map['fees'];
    totalPayable=map['totalPayable'];
    exchangeRate=map['exchangeRate'];
    recipientGets=map['recipientGets'];
    hasDiscount=map['hasDiscount'];
    previousRate=map['previousRate'];
    discountType=map['discountType'];
    discountText=map['discountText'];
  }

  @override
  String toString() {
    return 'CalculatorInfoModel{serviceName: $serviceName, serviceId: $serviceId, countryName: $countryName, countryId: $countryId, currency: $currency, sendAmount: $sendAmount, fees: $fees, totalPayable: $totalPayable, exchangeRate: $exchangeRate, recipientGets: $recipientGets, hasDiscount: $hasDiscount, previousRate: $previousRate, discountType: $discountType, discountText: $discountText}';
  }
}