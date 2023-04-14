import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../core/screens/dashboard/dashboard.dart';
import '../screen/login/login_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //- Text editing controller
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNo = TextEditingController();
  final fullName = TextEditingController();

  void registerUser(String email, String password) {
    Get.lazyPut(() => AuthenticationRepository());
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }
}
