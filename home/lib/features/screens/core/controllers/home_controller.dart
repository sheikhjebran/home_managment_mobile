import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/features/screens/authentication/models/home_model.dart';
import 'package:home/repository/home_repository/home_repository.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  //- Text editing controller
  final homeLocation = TextEditingController();
  final homeFloor = TextEditingController();
  final homeRent = TextEditingController();
  final homePaintingCharges = TextEditingController();
  final homeAdvance = TextEditingController();
  final homeNotes = TextEditingController();
  final homeAddress = TextEditingController();

  final _homeRepo = Get.put(HomeRepository());

  Future<List<HomeModel>> getAllHome() async {
    return await _homeRepo.getAllHomeDetails();
  }

  Future<void> addHome(HomeModel home) async {
    await _homeRepo.addHome(home);
  }
}
