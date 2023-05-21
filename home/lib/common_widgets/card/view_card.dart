// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:home/constants/colors.dart';
import 'package:home/constants/sizes.dart';

class CardWidget extends StatelessWidget {
  final title, subTitle, titleDescription, dateTimeDescription;
  final AsyncSnapshot snapshot;
  final int index;
  final Icon cardIcon;
  const CardWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.titleDescription,
    this.dateTimeDescription = Null,
    required this.snapshot,
    required this.index,
    required this.cardIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
          dateTimeDescription != Null
              ? Text(
                  dateTimeDescription,
                  style: const TextStyle(color: tSecondaryColor),
                )
              : const SizedBox(
                  height: 0,
                ),
        ]));
  }
}
