import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/repository/authentication_repository/authentication_repository.dart';
import 'package:home/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  //- Text editing controller
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNo = TextEditingController();
  final fullName = TextEditingController();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.fireabaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login To Continue...");
    }
  }
}
