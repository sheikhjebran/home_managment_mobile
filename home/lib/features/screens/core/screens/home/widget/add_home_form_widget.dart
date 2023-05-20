import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';
import 'package:home/features/screens/authentication/models/home_model.dart';
import 'package:home/features/screens/core/controllers/home_controller.dart';

class AddHomeFormWidget extends StatelessWidget {
  const AddHomeFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
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
                controller: controller.homeLocation,
                decoration: const InputDecoration(
                    label: Text(tHomeLocation),
                    prefixIcon: Icon(Icons.add_location_alt_outlined)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.homeFloor,
                decoration: const InputDecoration(
                    label: Text(tHomeFloor), prefixIcon: Icon(Icons.domain)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.homeRent,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    label: Text(tHomeRent),
                    prefixIcon: Icon(Icons.monetization_on_outlined)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.homePaintingCharges,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    label: Text(tHomePaintingCharges),
                    prefixIcon: Icon(Icons.format_paint)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.homeAdvance,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    label: Text(tHomeAdvance),
                    prefixIcon: Icon(Icons.attach_money)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.homeNotes,
                decoration: const InputDecoration(
                    label: Text(tHomeNotes),
                    prefixIcon: Icon(Icons.speaker_notes_outlined)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.homeAddress,
                decoration: const InputDecoration(
                    label: Text(tHomeAddress),
                    prefixIcon: Icon(Icons.maps_home_work)),
              ),
              const SizedBox(
                height: tFormHeight - 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final home = HomeModel(
                        homeLocation: controller.homeLocation.text.trim(),
                        homeFloor: controller.homeFloor.text.trim(),
                        homeRent: double.parse(controller.homeRent.text.trim()),
                        homePaintingCharges: double.parse(
                            controller.homePaintingCharges.text.trim()),
                        homeAdvance:
                            double.parse(controller.homeAdvance.text.trim()),
                        homeNotes: controller.homeNotes.text.trim(),
                        homeAddress: controller.homeAddress.text.trim(),
                      );
                      HomeController.instance.addHome(home).then((value) {
                        Go.back(context);
                      }).catchError((error) {
                        Get.snackbar("Error", "Something went wrong, Try again",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.green.withOpacity(0.1),
                            colorText: Colors.red);
                      });
                    }
                  },
                  child: Text(tAddHome.toUpperCase()),
                ),
              )
            ],
          )),
    );
  }
}
