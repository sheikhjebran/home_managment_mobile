import 'package:flutter/material.dart';
import 'package:home/common_widgets/form/form_headder_widget.dart';
import 'package:home/constants/image_strings.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/screens/authentication/screen/singup/widget/signup_footer_widget.dart';
import 'package:home/features/screens/authentication/screen/singup/widget/singup_form_widget.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  SingUpScreenState createState() => SingUpScreenState();
}

class SingUpScreenState extends State<SingUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeadderWidget(
                  image: welcomeScreenImage,
                  title: tSingUpTitle,
                  subTitle: tSingUpSubTitle,
                ),
                SingUpFormWidget(),
                SingUpFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
