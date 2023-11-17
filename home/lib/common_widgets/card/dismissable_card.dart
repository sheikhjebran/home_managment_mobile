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
    return Dismissible(
        background: Container(
          color: Colors.red,
          child: const Icon(Icons.delete),
          alignment: Alignment.centerLeft,
        ),
        dismissThresholds: const {
          DismissDirection.startToEnd: 0.2,
          DismissDirection.endToStart: 0.2,
        },
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            // Show confirmation dialog or perform delete action
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Delete Tenent'),
                content:
                    const Text('Are you sure you want to delete this tenant?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      print("OMG! this is going to dismiss $index");
                      print("OMG! this is snpshot ${snapshot.data![index].id}");
                      Navigator.pop(context);
                    },
                    child: const Text('Delete'),
                  ),
                ],
              ),
            );
          }
        },
        key: Key('${snapshot.data![index].id}'),
        child: ListTile(
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
            ])));
  }
}
