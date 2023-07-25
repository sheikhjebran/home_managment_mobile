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
    final data = document.data();

    if (data == null) {
      // Handle the case when data is null
      // You might want to return a default TenentModel or throw an exception
      throw Exception("Document data is null");
    }

    return TenentModel(
      id: document.id,
      tenentName:
          data["TenentName"] ?? '', // Provide a default value if data is null
      tenentNote: data["TenentNote"] ?? '',
      tenentHome: data["TenentHome"] ?? '',
      tenentAdvance: data["TenentAdvance"] ?? 0.0,
      tenentRent: data["TenentRent"] ?? 0.0,
    );
  }
}
