import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';
import 'package:home/features/screens/authentication/models/home_model.dart';
import 'package:home/features/screens/core/controllers/home_controller.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../../../authentication/models/rent_model.dart';
import '../../../controllers/renent_controller.dart';
import 'package:intl/intl.dart';

class AddRentFormWidget extends StatefulWidget {
  const AddRentFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  MainWidget createState() {
    return MainWidget();
  }
}

class MainWidget extends State<AddRentFormWidget> {
  final formKey = GlobalKey<FormState>();
  final rentController = Get.put(RentController());
  final homeController = Get.put(HomeController());
  List<dynamic> homeList = [];
  String? homeId;
  String? rentSelectedMonth;
  var localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    // Add more delegates for other languages if needed
  ];
  String selectedRentMonth = tRentSelectMonth;

  @override
  void initState() {
    super.initState();
  }

  DateTime? _selected;

  String formatDateTimeToMonthYear(DateTime dateTime) {
    // Create a DateFormat instance with the desired format
    final formatter = DateFormat('MMMM yyyy');

    // Use the formatter to format the DateTime value into the desired string format
    return formatter.format(dateTime);
  }

  Future<void> _showCalendar({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
      locale: localeObj,
    );
    if (selected != null) {
      setState(() {
        _selected = selected;
        rentSelectedMonth = formatDateTimeToMonthYear(selected);
        selectedRentMonth = "Selected : $rentSelectedMonth";
      });
    }
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
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _showCalendar(context: context),
                    child: Text(selectedRentMonth.toUpperCase()),
                  )),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              FutureBuilder<List<HomeModel>>(
                  future: homeController.getAllHome(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      homeList = snapshot.data!;
                      return DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          // Add Horizontal padding using menuItemStyleData.padding so it matches
                          // the menu padding when button's width is not specified.
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // Add more decoration..
                        ),
                        hint: const Text(
                          'Select Tenent',
                          style: TextStyle(fontSize: 14),
                        ),
                        items: homeList
                            .map((item) => DropdownMenuItem(
                                  value: item.id.toString(),
                                  child: Text(
                                    "${item.homeLocation} : ${item.homeFloor}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select Tenent.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          homeId = value.toString();
                          rentController
                              .fetchTenentDataForSelectedHome(homeId!);
                        },
                        onSaved: (value) {
                          homeId = value.toString();
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 8),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      );
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
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: rentController.rentTenent,
                decoration: const InputDecoration(
                    label: Text(tTenentName), prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: rentController.rentAmount,
                decoration: const InputDecoration(
                    label: Text(tTenentRent),
                    prefixIcon: Icon(Icons.attach_money)),
              ),
              const SizedBox(
                height: tFormHeight - 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final rent = RentModel(
                        rentTenent: rentController.rentTenentId.text.trim(),
                        rentHome: homeId!,
                        rentAmount:
                            double.parse(rentController.rentAmount.text.trim()),
                        rentMonth: rentSelectedMonth.toString(),
                        rentRecivedDate: DateTime.now().toString(),
                        rentYear: rentSelectedMonth.toString(),
                      );

                      RentController.instance.addRent(rent).then((value) {
                        Go.back(context);
                      }).catchError((error) {
                        Get.snackbar("Error", "Something went wrong, Try again",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.green.withOpacity(0.1),
                            colorText: Colors.red);
                      });
                    }
                  },
                  child: Text(tAddRent.toUpperCase()),
                ),
              )
            ],
          )),
    );
  }
}
