import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/features/screens/authentication/models/tenent_model.dart';

class TenentRepository extends GetxController {
  static TenentRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<TenentModel>> getAllTenentDetails() async {
    final snapshot = await _db.collection("Tenent").get();
    final tenentData =
        snapshot.docs.map((e) => TenentModel.fromSnapShot(e)).toList();
    return tenentData;
  }

  addTenent(TenentModel tenent) async {
    await _db.collection("Tenent").add(tenent.toJson()).then((value) {
      Get.snackbar("Success", "Your tenent has been added",
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
