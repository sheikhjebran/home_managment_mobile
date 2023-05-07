import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;

  const UserModel({
    this.id,
    required this.email,
    required this.fullName,
    required this.password,
    required this.phoneNumber,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "Password": password,
    };
  }

  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return UserModel(
      id: document.id,
      email: data["Email"],
      fullName: data["FullName"],
      password: data["Password"],
      phoneNumber: data["PhoneNumber"],
    );
  }
}
