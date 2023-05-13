import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:home/constants/colors.dart';
import 'package:home/constants/image_strings.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';
import 'package:home/features/screens/core/screens/home/home.dart';
import 'package:home/features/screens/core/screens/rent/rent.dart';
import 'package:home/features/screens/core/screens/tenent/tenent.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _dashBoard createState() => _dashBoard();
}

// ignore: camel_case_types
class _dashBoard extends State<Dashboard> {
  int selectedIndex = 0;
  String currentScreenTitle = "Rent";
  List<String> screenTitle = const ["Rent", "Home", "Tenent", "Profile"];

  List<Widget> widgetList = const [
    Rent(),
    Home(),
    Tenent(),
    Text(
      "Custom4",
      style: TextStyle(fontSize: 40.0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentScreenTitle,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: tCardBgColor),
            child: IconButton(
                onPressed: () {
                  Go.To(context, '/profile');
                },
                icon: const Image(image: AssetImage(tPersonIconImage))),
          )
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: widgetList,
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow.shade500,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.yellow.shade500,
            color: tSecondaryColor,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabBackgroundColor: Colors.yellow.shade200,
            activeColor: tSecondaryColor,
            padding: const EdgeInsets.all(16),
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
                currentScreenTitle = screenTitle[selectedIndex];
              });
            },
            tabs: const [
              GButton(icon: Icons.attach_money_sharp, text: "Rent"),
              GButton(
                icon: Icons.apartment,
                text: "Home",
                textColor: tSecondaryColor,
              ),
              GButton(
                icon: Icons.family_restroom_rounded,
                text: "Tenent",
                textColor: tSecondaryColor,
              ),
              GButton(
                icon: Icons.face_6_rounded,
                text: "Profile",
                textColor: tSecondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
