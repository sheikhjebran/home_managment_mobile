import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/common_widgets/card/view_card.dart';
import 'package:home/constants/colors.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';
import 'package:home/features/screens/authentication/models/rent_model.dart';
import 'package:home/features/screens/core/controllers/rent_controller.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Rent extends StatefulWidget {
  const Rent({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  MainWidget createState() => MainWidget();
}

// ignore: camel_case_types
class MainWidget extends State<Rent> {
  Future<void> _refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RentController());

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: FutureBuilder<List<RentModel>>(
                future: controller.getAllRent(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (c, index) {
                          return Column(
                            children: [
                              CardWidget(
                                title:
                                    "Name: ${snapshot.data![index].rentTenent}",
                                subTitle: snapshot.data![index].rentHome,
                                titleDescription:
                                    "Amount: ${snapshot.data![index].rentAmount}",
                                dateTimeDescription:
                                    "Month: ${snapshot.data![index].rentMonth}  Year:${snapshot.data![index].rentYear} \nRecivedDate: ${snapshot.data![index].rentRecivedDate}",
                                snapshot: snapshot,
                                index: index,
                                cardIcon: const Icon(
                                    LineAwesomeIcons.alternate_wavy_money_bill),
                              ),
                              const SizedBox(
                                height: tFormHeight - 20,
                              )
                            ],
                          );
                        },
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
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )),
        ),
      ),
      // floating button start
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "rent_floating_action_button",
        onPressed: () {
          Go.To(context, '/add_rent');
        },
        label: const Text(
          tAddRent,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: tSecondaryColor,
        elevation: 4.0,
      ),
      // floating button ends
    );
  }
}
