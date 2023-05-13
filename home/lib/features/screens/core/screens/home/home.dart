import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/common_widgets/card/view_card.dart';
import 'package:home/constants/colors.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/features/routing/routing.dart';
import 'package:home/features/screens/authentication/models/home_model.dart';
import 'package:home/features/screens/core/controllers/home_controller.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  MainWidget createState() => MainWidget();
}

// ignore: camel_case_types
class MainWidget extends State<Home> {
  Future<void> _refresh() async {
    // Add your refresh logic here, such as fetching new data from a server.
    // For example:
    setState(() {
      // Update your data here, such as setting the state of a list to the new data.
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: FutureBuilder<List<HomeModel>>(
                future: controller.getAllHome(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (c, index) {
                          return Column(
                            children: [
                              CardWidget(
                                title:
                                    "Home: ${snapshot.data![index].homeLocation}",
                                subTitle: snapshot.data![index].homeFloor,
                                titleDescription:
                                    snapshot.data![index].homeAddress,
                                snapshot: snapshot,
                                index: index,
                                cardIcon: const Icon(LineAwesomeIcons.home),
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
        onPressed: () {
          Go.To(context, '/add_home');
        },
        label: const Text(
          'Add Home',
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
