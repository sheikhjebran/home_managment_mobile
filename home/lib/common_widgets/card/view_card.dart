// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:home/constants/colors.dart';
import 'package:home/constants/sizes.dart';

class CardWidget extends StatelessWidget {
  final title, subTitle, titleDescription;
  final AsyncSnapshot snapshot;
  final int index;
  final Icon cardIcon;
  final Function onTap;

  const CardWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.titleDescription,
    required this.snapshot,
    required this.index,
    required this.cardIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          return onTap(index);
        },
        contentPadding: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        iconColor: Colors.black,
        tileColor: Colors.yellow,
        leading: cardIcon,
        title: Text(
          title,
          style: const TextStyle(
              color: tSecondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: tCardSubTitleSize),
        ),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            subTitle,
            style: const TextStyle(color: tSecondaryColor),
          ),
          Text(
            titleDescription,
            style: const TextStyle(color: tSecondaryColor),
          ),
        ]));
  }
}
