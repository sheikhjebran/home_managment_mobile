import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';
import 'package:home/features/screens/authentication/controllers/signin_controller.dart';
import 'package:home/features/screens/authentication/screen/forgot_password/forget_password_options/forget_password_model_button_sheet.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    final controller = Get.put(SignInController());
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: emailText,
                  hintText: emailText,
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: passwordText,
                  hintText: passwordText,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: null, icon: Icon(Icons.remove_red_eye_sharp))),
            ),
            const SizedBox(
              width: tFormHeight,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ForgetPasswordScreen.buildShowModelButtonSheet(context);
                  },
                  child: const Text(tForgetPassword),
                )),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await SignInController.instance
                            .signInUsingEmailAndPassword(
                                controller.email.text.trim(),
                                controller.password.text.trim());
                        // ignore: use_build_context_synchronously
                        Go.BackTo(context, '/home');
                      } catch (error) {
                        Get.snackbar(
                            "Login Error", "Username or password is invalid",
                            snackPosition: SnackPosition.TOP,
                            colorText: Colors.black,
                            backgroundColor: Colors.yellow[400]);
                      }
                    }
                  },
                  child: Text(tLogin.toUpperCase())),
            )
          ],
        ),
      ),
    );
  }
}
