import 'package:flutter/material.dart';
import 'package:home/common_widgets/form/form_headder_widget.dart';
import 'package:home/constants/image_strings.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';
import 'package:home/features/screens/core/screens/tenent/widget/add_tenent_form_widget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AddTenentScreen extends StatelessWidget {
  const AddTenentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Go.back(context);
            },
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          tAddTenent,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: tFormHeight - 10, horizontal: tFormHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            FormHeadderWidget(
              image: tAddTenentImage,
              title: tAddTenentTitle,
              subTitle: tAddTenentSubTitle,
              imageHeight: 0.3,
            ),
            AddTenentFormWidget(),
          ],
        ),
      )),
    );
  }
}
