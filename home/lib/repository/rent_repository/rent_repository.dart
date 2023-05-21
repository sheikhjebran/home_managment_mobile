import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/features/screens/authentication/models/home_model.dart';
import 'package:home/features/screens/authentication/models/rent_model.dart';
import 'package:home/features/screens/authentication/models/tenent_model.dart';

class RentRepository extends GetxController {
  static RentRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<RentModel>> getAllRentDetails() async {
    final snapshot = await _db.collection("Rent").get();
    final rentData =
        snapshot.docs.map((e) => RentModel.fromSnapShot(e)).toList();

    List<RentModel> response = [];

    for (RentModel rent in rentData) {
      final homeSnapshot =
          await _db.collection("Home").doc(rent.rentHome).get();
      final tenentSnapshot =
          await _db.collection("Tenent").doc(rent.rentTenent).get();

      if (homeSnapshot.exists && tenentSnapshot.exists) {
        HomeModel home =
            HomeModel.fromJson(homeSnapshot.data() as Map<String, dynamic>);

        TenentModel tenent =
            TenentModel.fromJson(tenentSnapshot.data() as Map<String, dynamic>);
        response.add(RentModel(
            id: rent.id,
            rentAmount: rent.rentAmount,
            rentHome: "Home: ${home.homeLocation} Floor: ${home.homeFloor}",
            rentMonth: rent.rentMonth,
            rentRecivedDate: rent.rentRecivedDate,
            rentTenent: tenent.tenentName,
            rentYear: rent.rentYear));
      }
    }

    return response;
  }

  addRent(RentModel rent) async {
    await _db.collection("Rent").add(rent.toJson()).then((value) {
      Get.snackbar("Success", "Your Renr has been added",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
    }).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong, Try again",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.red);
    });
  }
}
