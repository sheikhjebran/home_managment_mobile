import 'package:cloud_firestore/cloud_firestore.dart';

class TenentModel {
  final String? id;
  final String tenentName;
  final String tenentNote;
  final String tenentHome;
  final double tenentAdvance;
  final double tenentRent;
  String tenentStatus = "Active";

  TenentModel({
    this.id,
    this.tenentStatus = "Active",
    required this.tenentName,
    required this.tenentNote,
    required this.tenentHome,
    required this.tenentAdvance,
    required this.tenentRent,
  });

  toJson() {
    return {
      "TenentName": tenentName,
      "TenentNote": tenentNote,
      "TenentHome": tenentHome,
      "TenentAdvance": tenentAdvance,
      "TenentRent": tenentRent,
      "TenentStatus": tenentStatus
    };
  }

  factory TenentModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    if (data == null) {
      // Handle the case when data is null
      // You might want to return a default TenentModel or throw an exception
      throw Exception("Document data is null");
    }

    return TenentModel(
      id: document.id,
      tenentStatus: data["TenentStatus"].toString(),
      tenentName: data["TenentName"].toString(),
      tenentNote: data["TenentNote"].toString(),
      tenentHome: data["TenentHome"].toString(),
      tenentAdvance: data["TenentAdvance"].toDouble() ?? 0.0,
      tenentRent: data["TenentRent"].toDouble() ?? 0.0,
    );
  }
}
