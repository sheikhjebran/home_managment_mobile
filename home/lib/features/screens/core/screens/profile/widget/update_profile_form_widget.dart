import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/screens/authentication/models/user_model.dart';
import 'package:home/features/screens/core/controllers/profile_controller.dart';

import 'package:home/features/screens/core/screens/profile/update_profile_screen.dart';

class UpdateProfileFormWidget extends StatelessWidget {
  const UpdateProfileFormWidget({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
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
                initialValue: userData.fullName,
                controller: controller.fullName,
                decoration: const InputDecoration(
                    label: Text(tFullName),
                    prefixIcon: Icon(Icons.person_outline_rounded)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                initialValue: userData.email,
                controller: controller.email,
                decoration: const InputDecoration(
                    label: Text(tEmail),
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                initialValue: userData.phoneNumber,
                controller: controller.phoneNo,
                decoration: const InputDecoration(
                    label: Text(tPhoneNumber), prefixIcon: Icon(Icons.numbers)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                initialValue: userData.password,
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
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  child: Text(tUpdateProfileButton.toString()),
                ),
              )
            ],
          )),
    );
  }
}
