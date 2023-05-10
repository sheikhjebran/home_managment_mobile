import 'package:get/get.dart';
import 'package:home/features/screens/authentication/models/user_model.dart';
import 'package:home/repository/authentication_repository/authentication_repository.dart';
import 'package:home/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

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

  updateProfile(UserModel user) async {
    await _userRepo.updateUser(user);
  }

  logout() async {
    Get.lazyPut(() => AuthenticationRepository());
    await AuthenticationRepository.instance.logout();
  }
}
