import 'package:flutter/material.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';
import 'package:home/features/screens/authentication/screen/forgot_password/forget_password_options/forget_password_btn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModelButtonSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tForgetPasswordTitle,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              tForgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: tFormHeight,
            ),
            ForgetPasswordBtnWidget(
              btIcon: Icons.mail_outline_rounded,
              title: tEmail,
              subTitle: tResetViaEmail,
              onTap: () {
                Navigator.pop(context);
                Go.To(context, '/forget_password_mail');
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            ForgetPasswordBtnWidget(
              btIcon: Icons.mobile_friendly_rounded,
              title: tPhoneNo,
              subTitle: tResetViaPhone,
              onTap: () {
                Navigator.pop(context);
                Go.To(context, '/forget_password_phone');
              },
            ),
          ],
        ),
      ),
    );
  }
}
