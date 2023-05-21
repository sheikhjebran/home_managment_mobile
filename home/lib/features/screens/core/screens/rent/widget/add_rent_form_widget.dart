import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/common_widgets/card/formcard.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';
import 'package:home/features/screens/authentication/models/rent_model.dart';
import 'package:home/features/screens/authentication/models/tenent_model.dart';
import 'package:home/features/screens/core/controllers/home_controller.dart';
import 'package:home/features/screens/core/controllers/rent_controller.dart';
import 'package:home/features/screens/core/controllers/tenent_controller.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddRentFormWidget extends StatefulWidget {
  const AddRentFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  MainWidget createState() => MainWidget();
}

class MainWidget extends State<AddRentFormWidget> {
  final formKey = GlobalKey<FormState>();
  final tenentController = Get.put(TenentController());
  final homeController = Get.put(HomeController());
  final rentController = Get.put(RentController());
  List<dynamic> rentList = [];
  String? rentId;
  List<dynamic> tenentList = [];
  String? tenentId;
  String? selectedMonth;
  String? selectedYear;
  String? homeId;

  //- Text editing controller
  final rentHome = TextEditingController();
  final rentTenent = TextEditingController();
  final rentAmount = TextEditingController();
  final rentMonth = TextEditingController();
  final rentYear = TextEditingController();
  final rentRecivedDate = TextEditingController();
  final rentTenentName = TextEditingController();

  Future<void> _refresh() async {
    getYear();
    setState(() {});
  }

  List<String> month = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  List<String> year = [];

  Future<void> getYear() async {
    DateTime now = DateTime.now();
    int currentYear = now.year;

    year.add(currentYear.toString());
    year.add((currentYear - 1).toString());
  }

  String getCurrentDate() {
    return DateFormat("yyyy-MM-dd").format(DateTime.now());
  }

  getTenentDetail() async {
    await tenentController.getTenentDetail(tenentId!).then((value) {
      homeId = value.tenentHome;
      rentTenentName.text = value.tenentName;
      rentAmount.text = value.tenentRent.toString();
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _refresh();
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
              FutureBuilder<List<TenentModel>>(
                  future: tenentController.getAllTenent(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      tenentList = snapshot.data!;
                      return FormCard.dropDownWidget(
                          context, tSelectTenent, tenentList, tenentId,
                          (onChangedValue) {
                        tenentId = onChangedValue;
                        getTenentDetail();
                      });
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return const Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator()],
                      ));
                    }
                  }),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: rentTenentName,
                decoration: const InputDecoration(
                    label: Text(tTenentName), prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: rentAmount,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    label: Text(tTenentRent),
                    prefixIcon: Icon(Icons.attach_money)),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              FormCard.dropDownSingleWidget(
                  context, tRentMonth, month, selectedMonth, (onChangedValue) {
                selectedMonth = onChangedValue;
              }),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              FormCard.dropDownSingleWidget(
                  context, tRentYear, year, selectedYear, (onChangedValue) {
                selectedYear = onChangedValue;
              }),
              const SizedBox(
                height: tFormHeight - 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final rent = RentModel(
                          rentHome: homeId!,
                          rentTenent: tenentId!,
                          rentAmount: double.parse(rentAmount.text.trim()),
                          rentMonth: selectedMonth!,
                          rentYear: selectedYear!,
                          rentRecivedDate: getCurrentDate());
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
