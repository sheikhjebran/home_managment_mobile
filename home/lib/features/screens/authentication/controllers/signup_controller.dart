import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/features/screens/authentication/models/user_model.dart';
import 'package:home/repository/user_repository/user_repository.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //- Text editing controller
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNo = TextEditingController();
  final fullName = TextEditingController();
  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password) {
    Get.lazyPut(() => AuthenticationRepository());
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    registerUser(user.email, user.password);
  }
}
