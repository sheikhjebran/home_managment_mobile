import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  //- Text editing controller
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> signInUsingEmailAndPassword(
      String email, String password) async {
    Get.lazyPut(() => AuthenticationRepository());
    try {
      await AuthenticationRepository.instance
          .loginUserWithEmailAndPassword(email, password);
    } catch (error) {
      throw Exception(error);
    }
  }
}
