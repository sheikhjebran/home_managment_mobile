import 'package:cloud_firestore/cloud_firestore.dart';

class TenentModel {
  final String? id;
  final String tenentName;
  final String tenentNote;
  final String tenentHome;
  final double tenentAdvance;
  final double tenentRent;

  const TenentModel({
    this.id,
    required this.tenentName,
    required this.tenentNote,
    required this.tenentHome,
    required this.tenentAdvance,
    required this.tenentRent,
  });

  factory TenentModel.fromJson(Map<String, dynamic> json) {
    return TenentModel(
      id: json['id'],
      tenentName: json["TenentName"],
      tenentNote: json["TenentNote"],
      tenentHome: json["TenentHome"],
      tenentAdvance: json["TenentAdvance"],
      tenentRent: json["TenentRent"],
    );
  }

  toJson() {
    return {
      "TenentName": tenentName,
      "TenentNote": tenentNote,
      "TenentHome": tenentHome,
      "TenentAdvance": tenentAdvance,
      "TenentRent": tenentRent,
    };
  }

  factory TenentModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return TenentModel(
      id: document.id,
      tenentName: data["TenentName"],
      tenentNote: data["TenentNote"],
      tenentHome: data["TenentHome"],
      tenentAdvance: data["TenentAdvance"],
      tenentRent: data["TenentRent"],
    );
  }
}
