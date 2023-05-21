import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/features/screens/core/screens/home/add_home.dart';
import 'package:home/features/screens/core/screens/tenent/add_tenent.dart';
import 'features/screens/authentication/screen/forgot_password/foget_password_mail/forget_password_mail.dart';
import 'features/screens/authentication/screen/forgot_password/forget_password_otp/forget_password_otp.dart';
import 'features/screens/authentication/screen/forgot_password/forget_password_phone/forget_password_phone.dart';
import 'features/screens/authentication/screen/login/login_screen.dart';
import 'features/screens/authentication/screen/singup/singup.dart';
import 'features/screens/core/screens/dashboard/dashboard.dart';
import 'features/screens/core/screens/profile/profile_screen.dart';
import 'features/screens/core/screens/profile/update_profile_screen.dart';
import 'features/screens/splash/splash_screen.dart';
import 'features/utils/firebase_options.dart';
import 'features/utils/theme/theme.dart';
import 'repository/authentication_repository/authentication_repository.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/singUp': (context) => const SingUpScreen(),
        '/home': (context) => const Dashboard(),
        '/forget_password_mail': (context) => const ForgetPasswordMailScreen(),
        '/forget_password_phone': (context) =>
            const ForgetPasswordPhoneScreen(),
        '/forget_password_otp': (context) => const ForgetPasswordOtpScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/update_profile': (context) => const UpdateProfileScreen(),
        '/rent': (context) => const Dashboard(),
        '/add_home': (context) => const AddHomeScreen(),
        '/add_tenent': (context) => const AddTenentScreen(),
      },
    );
  }
}
