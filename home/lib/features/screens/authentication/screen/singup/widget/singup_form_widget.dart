import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/screens/authentication/controllers/signup_controller.dart';
import 'package:home/features/screens/authentication/models/user_model.dart';

class SingUpFormWidget extends StatelessWidget {
  const SingUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.fullName,
                decoration: const InputDecoration(
                    label: Text(tFullName),
                    prefixIcon: Icon(Icons.person_outline_rounded)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                    label: Text(tEmail),
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.phoneNo,
                decoration: const InputDecoration(
                    label: Text(tPhoneNumber), prefixIcon: Icon(Icons.numbers)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                    label: Text(tPassword),
                    prefixIcon: Icon(Icons.fingerprint)),
              ),
              const SizedBox(
                height: tFormHeight - 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final user = UserModel(
                          email: controller.email.text.trim(),
                          password: controller.password.text.trim(),
                          fullName: controller.fullName.text.trim(),
                          phoneNumber: controller.phoneNo.text.trim());

                      SignUpController.instance.createUser(user);
                    }
                  },
                  child: Text(tSignUp.toUpperCase()),
                ),
              )
            ],
          )),
    );
  }
}
