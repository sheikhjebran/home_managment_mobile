import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/features/screens/authentication/models/home_model.dart';
import 'package:home/features/screens/authentication/models/tenent_model.dart';

import '../../features/screens/authentication/models/rent_model.dart';

class RentRepository extends GetxController {
  static RentRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<RentModel>> getAllRentDetails() async {
    final rentSnapshot = await _db.collection("Rent").get();
    final rentData =
        rentSnapshot.docs.map((e) => RentModel.fromSnapShot(e)).toList();

    final tenentSnapshot = await _db.collection("Tenent").get();
    final tenentData =
        tenentSnapshot.docs.map((e) => TenentModel.fromSnapShot(e)).toList();

    final homeSnapshot = await _db.collection("Home").get();
    final homeData =
        homeSnapshot.docs.map((e) => HomeModel.fromSnapShot(e)).toList();

    List<RentModel> response = [];

    for (var rent in rentData) {
      var selectedTenentName = "";
      var selectedHomeDetails = "";

      // Find the corresponding tenant data for the rent
      var tenant = tenentData
          .firstWhere((tenant) => tenant.id == rent.rentTenent, orElse: () {
        throw StateError('Tenant not found for rent ID ${rent.id}');
      });
      selectedTenentName = tenant.tenentName;

      // Find the corresponding home data for the tenant
      var home = homeData.firstWhere((home) => home.id == tenant.tenentHome,
          orElse: () {
        throw StateError('Home not found for tenant ID ${tenant.id}');
      });
      selectedHomeDetails = "Home:${home.homeLocation} Floor:${home.homeFloor}";

      response.add(RentModel(
        id: rent.id,
        rentHome: selectedHomeDetails,
        rentTenent: selectedTenentName,
        rentAmount: rent.rentAmount,
        rentMonth: rent.rentMonth,
        rentRecivedDate:
            "Amount:${rent.rentAmount}/- Date:${rent.rentRecivedDate}",
        rentYear: rent.rentYear,
      ));
    }

    return response;
  }

  addRent(RentModel rent) async {
    await _db.collection("Rent").add(rent.toJson()).then((value) {
      Get.snackbar("Success", "Your rent has been added",
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
