import 'dart:convert';

import 'package:flutter/cupertino.dart';

class UpdateUserProfile {
  String user_token;
  String profile_image;
  String current_password;
  String password='';
  String password_confirmation;
  String phone_number;
  String occupation;
  String address;


  UpdateUserProfile(
      {
        this.user_token='',
        this.profile_image='',
        this.current_password='',
        this.password='',
        this.password_confirmation='',
        this.phone_number='',
        this.occupation='',
        this.address=''
      });
  // String? user_token;
  // String? profile_image;
  // String? current_password;
  // String? password;
  // String? password_confirmation;
  // String? phone_number;
  // String? occupation;
  // String? address;
  //
  // UpdateUserProfile(
  //     {this.user_token,
  //     this.profile_image,
  //     this.current_password,
  //     this.password,
  //     this.password_confirmation,
  //     this.phone_number,
  //     this.occupation,
  //       this.address
  // });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['user_token'] = user_token;
    map['profile_image'] = profile_image;
    map['current_password'] = current_password;
    map['password'] = password;
    map['password_confirmation'] = password_confirmation;
    map['phone_number'] = phone_number;
    map['occupation'] = occupation;
    map['address'] = address;

    return map;
  }




  @override
  String toString() {
    return 'UpdateUserProfile{user_token: $user_token, profile_image: $profile_image, current_password: $current_password, password: $password, password_confirmation: $password_confirmation, phone_number: $phone_number, occupation: $occupation, address: $address}';
  }
}