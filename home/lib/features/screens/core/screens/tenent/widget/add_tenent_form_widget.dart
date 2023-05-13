import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';
import 'package:home/features/screens/authentication/models/tenent_model.dart';
import 'package:home/features/screens/core/controllers/tenent_controller.dart';

class AddTenentFormWidget extends StatelessWidget {
  const AddTenentFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TenentController());
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
                controller: controller.tenentName,
                decoration: const InputDecoration(
                    label: Text(tTenentName), prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.tenentHome,
                decoration: const InputDecoration(
                    label: Text(tTenentHome), prefixIcon: Icon(Icons.domain)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.tenentAdvance,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    label: Text(tTenentAdvance),
                    prefixIcon: Icon(Icons.monetization_on_outlined)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.tenentRent,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    label: Text(tTenentRent),
                    prefixIcon: Icon(Icons.attach_money)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.tenentNote,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    label: Text(tTenentNote),
                    prefixIcon: Icon(Icons.note_rounded)),
              ),
              const SizedBox(
                height: tFormHeight - 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final tenent = TenentModel(
                        tenentName: controller.tenentName.text.trim(),
                        tenentHome: controller.tenentHome.text.trim(),
                        tenentAdvance:
                            double.parse(controller.tenentAdvance.text.trim()),
                        tenentRent:
                            double.parse(controller.tenentRent.text.trim()),
                        tenentNote: controller.tenentNote.text.trim(),
                      );
                      TenentController.instance.addTenent(tenent).then((value) {
                        Go.back(context);
                      }).catchError((error) {
                        Get.snackbar("Error", "Something went wrong, Try again",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.green.withOpacity(0.1),
                            colorText: Colors.red);
                      });
                    }
                  },
                  child: Text(tAddTenent.toUpperCase()),
                ),
              )
            ],
          )),
    );
  }
}
