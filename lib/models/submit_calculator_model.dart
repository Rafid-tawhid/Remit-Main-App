class SubmitCalculatorModel{
  String? email;
  String? user_token;
  String? getCountry;
  String? service_id;
  String? receive_currency_code;
  String? input_aud_currency;
  String? currency_rate;
  String? service_charge;
  String? input_receiver_currency;
  String? session_id;
  String? promo_code;
  String? discount;
  String? discount_type;
  String? calculate_with;
  String? discount_value;
  String? discount_price;


  SubmitCalculatorModel(
      {this.email,
      this.user_token,
      this.getCountry,
      this.service_id,
      this.receive_currency_code,
      this.input_aud_currency,
      this.currency_rate,
      this.service_charge,
        this.input_receiver_currency,
      this.session_id,
      this.promo_code,
      this.discount,
      this.discount_type,
      this.calculate_with,
      this.discount_value,
      this.discount_price});


  Map<String,dynamic> toMap(){

    final map=<String,dynamic>{};
    map['email']=email;
    map['user_token']=user_token;
    map['getCountry']=getCountry;
    map['service_id']=service_id;
    map['receive_currency_code']=receive_currency_code;
    map['input_aud_currency']=input_aud_currency;
    map['currency_rate']=currency_rate;
    map['service_charge']=service_charge;
    map['input_receiver_currency']=input_receiver_currency;
    // map['session_id']='';
    map['promo_code']='';
    map['discount']='';
    map['discount_type']='';
    map['calculate_with']='';
    map['discount_value']='';
    map['discount_price']='';
    // map['session_id']=session_id;
    // map['promo_code']=promo_code;
    // map['discount']=discount;
    // map['discount_type']=discount_type;
    // map['calculate_with']=calculate_with;
    // map['discount_value']=discount_value;
    // map['discount_price']=discount_price;
    return map;
  }
  SubmitCalculatorModel.fromMap(Map<String,dynamic> map){
    email=map['email'];
    user_token=map['user_token'];
    getCountry=map['getCountry'];
    service_id=map['service_id'];
    receive_currency_code=map['receive_currency_code'];
    currency_rate=map['currency_rate'];
    service_charge=map['service_charge'];
    input_receiver_currency=map['input_receiver_currency'];
    session_id=map['session_id'];
    promo_code=map['promo_code'];
    discount=map['discount'];
    discount_type=map['discount_type'];
    calculate_with=map['calculate_with'];
    discount_value=map['discount_value'];
    discount_price=map['discount_price'];
  }

  @override
  String toString() {
    return 'SubmitCalculatorModel{email: $email, user_token: $user_token, getCountry: $getCountry, service_id: $service_id, receive_currency_code: $receive_currency_code, input_aud_currency: $input_aud_currency, currency_rate: $currency_rate, service_charge: $service_charge, input_receiver_currency: $input_receiver_currency, session_id: $session_id, promo_code: $promo_code, discount: $discount, discount_type: $discount_type, calculate_with: $calculate_with, discount_value: $discount_value, discount_price: $discount_price}';
  }
}