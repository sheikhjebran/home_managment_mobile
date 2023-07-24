import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../repository/rent_repository/rent_repository.dart';
import '../../authentication/models/rent_model.dart';

class RentController extends GetxController {
  static RentController get instance => Get.find();

  //- Text editing controller
  final tenentName = TextEditingController();
  final tenentNote = TextEditingController();
  final tenentHome = TextEditingController();
  final tenentAdvance = TextEditingController();
  final tenentRent = TextEditingController();

  final _rentRepo = Get.put(RentRepository());

  Future<List<RentModel>> getAllRent() async {
    return await _rentRepo.getAllRentDetails();
  }

  Future<void> addRent(RentModel rent) async {
    await _rentRepo.addRent(rent);
  }
}
