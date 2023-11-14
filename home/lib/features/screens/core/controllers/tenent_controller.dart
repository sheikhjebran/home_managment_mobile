import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/features/screens/authentication/models/tenent_model.dart';
import 'package:home/repository/tenent_repository/tenent_repository.dart';

class TenentController extends GetxController {
  static TenentController get instance => Get.find();

  //- Text editing controller
  final tenentName = TextEditingController();
  final tenentNote = TextEditingController();
  final tenentHome = TextEditingController();
  final tenentAdvance = TextEditingController();
  final tenentRent = TextEditingController();

  final _tenentRepo = Get.put(TenentRepository());

  Future<List<TenentModel>> getAllTenent() async {
    return await _tenentRepo.getAllTenentDetails();
  }

  Future<void> addTenent(TenentModel tenent) async {
    await _tenentRepo.addTenent(tenent);
  }

  Future<void> deleteTenent(id) async {
    await _tenentRepo.deleteTenent(id);
  }
}
