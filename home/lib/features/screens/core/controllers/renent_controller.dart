import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../repository/rent_repository/rent_repository.dart';
import '../../authentication/models/rent_model.dart';

class RentController extends GetxController {
  static RentController get instance => Get.find();

  //- Text editing controller
  final rentTenent = TextEditingController();
  final rentAmount = TextEditingController();
  final rentMonth = TextEditingController();
  final rentYear = TextEditingController();
  final rentTenentId = TextEditingController();

  final _rentRepo = Get.put(RentRepository());

  Future<List<RentModel>> getAllRent() async {
    return await _rentRepo.getAllRentDetails();
  }

  Future<void> addRent(RentModel rent) async {
    await _rentRepo.addRent(rent);
  }

  Future<void> fetchTenentDataForSelectedHome(String selectedHome) async {
    dynamic tenentModel =
        await _rentRepo.fetchTenentDataForSelectedHome(selectedHome);
    rentTenent.text = tenentModel.tenentName;
    rentAmount.text = tenentModel.tenentRent.toString();
    rentTenentId.text = tenentModel.id;
  }
}
