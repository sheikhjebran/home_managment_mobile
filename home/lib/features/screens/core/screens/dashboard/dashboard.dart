import 'package:flutter/material.dart';
import 'package:home/constants/colors.dart';
import 'package:home/constants/image_strings.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.black),
        title:
            Text(tAppName, style: Theme.of(context).textTheme.headlineMedium),
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
      body: const SingleChildScrollView(),
    );
  }
}
