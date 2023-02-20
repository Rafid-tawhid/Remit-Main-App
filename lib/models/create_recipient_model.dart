class RecipientCreateModel{
      String token;
      String firstName;
      String? middleName;
      String lastName;
      String phone;
      String? email;
      String street;
      String city;
      String country;

      RecipientCreateModel(
      {
      required this.token,
      required this.firstName,
      this.middleName,
      required this.lastName,
      required this.phone,
      this.email,
      required this.street,
      required this.city,
      required this.country,
      });

      Map toMap(){
            final map={};
            map['user_token']=token;
            map['recipient_firstname']=firstName;
            map['recipient_middlename']=middleName;
            map['recipient_lastname']=lastName;
            map['recipient_phone']=phone;
            map['recipient_email']=email;
            map['recipient_street_name']=street;
            map['recipient_street_city']=city;
            map['recipient_country']=country;

            return map;
      }
}