import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:home/features/screens/authentication/screen/login/login_screen.dart';
import 'package:home/features/screens/core/screens/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'exceptions/singup_email_password_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //-- variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> fireabaseUser;

  @override
  void onReady() {
    fireabaseUser = Rx<User?>(_auth.currentUser);
    fireabaseUser.bindStream(_auth.userChanges());

    ever(fireabaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const Dashboard());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      fireabaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.offAll(() => const LoginScreen());
    } on FirebaseException catch (e) {
      final ex = SignUpWithEmailPasswordFailure.code(e.code);
      // ignore: avoid_print
      print('FIREBASE AUTH EXCEPTION ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailPasswordFailure();
      // ignore: avoid_print
      print('FIREBASE AUTH EXCEPTION ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final prefs = await SharedPreferences.getInstance();

      var value = fireabaseUser.value;
      if (value != null) {
        prefs.setString('uid', value.toString());
      }
    } on FirebaseException catch (e) {
      final ex = SignUpWithEmailPasswordFailure.code(e.code);
      // ignore: avoid_print
      print('FIREBASE EXCEPTION ${ex.message}');
      throw ex;
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
