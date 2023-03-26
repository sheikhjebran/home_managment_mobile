import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/image_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkForAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  void _checkForAuthentication() async {
    final prefs = await SharedPreferences.getInstance();

    final String? uid = prefs.getString('uid');
    // ignore: unrelated_type_equality_checks
    if (uid == null) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  Widget initWidget() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    colors: [(Colors.white), (Colors.white)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          const Center(
            child: Image(image: AssetImage(logoImage)),
          )
        ],
      ),
    );
  }
}
