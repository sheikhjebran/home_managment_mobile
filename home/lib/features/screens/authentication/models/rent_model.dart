import 'package:cloud_firestore/cloud_firestore.dart';

class RentModel {
  final String? id;
  final String rentHome;
  final String rentTenent;
  final double rentAmount;
  final String rentMonth;
  final String rentRecivedDate;
  final String rentYear;

  const RentModel({
    this.id,
    required this.rentHome,
    required this.rentTenent,
    required this.rentAmount,
    required this.rentMonth,
    required this.rentYear,
    required this.rentRecivedDate,
  });

  toJson() {
    return {
      "RentHome": rentHome,
      "RentTenent": rentTenent,
      "RentAmount": rentAmount,
      "RentMonth": rentMonth,
      "RentYear": rentYear,
      "RentRecivedDate": rentRecivedDate,
    };
  }

  factory RentModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return RentModel(
      id: document.id,
      rentHome: data["RentHome"].toString(),
      rentTenent: data["RentTenent"].toString(),
      rentAmount: data["RentAmount"].toDouble(),
      rentMonth: data["RentMonth"].toString(),
      rentYear: data["RentYear"].toString(),
      rentRecivedDate: data["RentRecivedDate"].toString(),
    );
  }
}
