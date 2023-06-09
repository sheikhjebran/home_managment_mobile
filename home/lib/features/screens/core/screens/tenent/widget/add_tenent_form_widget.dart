import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/common_widgets/card/formcard.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';
import 'package:home/features/screens/authentication/models/home_model.dart';
import 'package:home/features/screens/authentication/models/tenent_model.dart';
import 'package:home/features/screens/core/controllers/home_controller.dart';
import 'package:home/features/screens/core/controllers/tenent_controller.dart';

// ignore: must_be_immutable
class AddTenentFormWidget extends StatefulWidget {
  const AddTenentFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  MainWidget createState() => MainWidget();
}

class MainWidget extends State<AddTenentFormWidget> {
  final formKey = GlobalKey<FormState>();
  final tenentController = Get.put(TenentController());
  final homeController = Get.put(HomeController());
  List<dynamic> homeList = [];
  String? homeId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              FutureBuilder<List<HomeModel>>(
                  future: homeController.getAllHome(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      homeList = snapshot.data!;
                      return FormCard.dropDownWidget(
                          context, "Select", homeList, homeId, tenentController,
                          (onChangedValue) {
                        homeId = onChangedValue;
                      });
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return const Center(
                        child: Text('SomeThing went wrong'),
                      );
                    }
                  }),
              TextFormField(
                controller: tenentController.tenentName,
                decoration: const InputDecoration(
                    label: Text(tTenentName), prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: tenentController.tenentAdvance,
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
                controller: tenentController.tenentRent,
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
                controller: tenentController.tenentNote,
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
                        tenentName: tenentController.tenentName.text.trim(),
                        tenentHome: homeId!,
                        tenentAdvance: double.parse(
                            tenentController.tenentAdvance.text.trim()),
                        tenentRent: double.parse(
                            tenentController.tenentRent.text.trim()),
                        tenentNote: tenentController.tenentNote.text.trim(),
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
