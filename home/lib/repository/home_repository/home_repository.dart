import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/features/screens/authentication/models/home_model.dart';

class HomeRepository extends GetxController {
  static HomeRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<HomeModel>> getAllHomeDetails() async {
    final snapshot = await _db.collection("Home").get();
    final homeData =
        snapshot.docs.map((e) => HomeModel.fromSnapShot(e)).toList();
    return homeData;
  }

  addHome(HomeModel home) async {
    await _db.collection("Home").add(home.toJson()).then((value) {
      Get.snackbar("Success", "Your home has been added",
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
