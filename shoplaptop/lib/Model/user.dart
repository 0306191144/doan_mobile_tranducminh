import 'package:flutter/material.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String img;
  final String address;
  final String gender;
  final int isadmin;
  final String birthday;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.address,
    required this.img,
    required this.birthday,
    required this.isadmin,
  });
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'] ?? '',
        img = 'http://10.0.2.2:8000' + json['avatar_path'],
        address = json['adress'] ?? '',
        gender = json['gender'] ?? '',
        birthday = json['birthday'] ?? '',
        isadmin = json['isadmin'];
}
