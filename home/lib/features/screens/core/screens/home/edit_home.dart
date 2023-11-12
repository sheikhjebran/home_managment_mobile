import 'package:flutter/material.dart';
import 'package:home/common_widgets/form/form_headder_widget.dart';
import 'package:home/constants/image_strings.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';
import 'package:home/features/screens/authentication/models/home_model.dart';
import 'package:home/features/screens/core/screens/home/widget/edit_home_form_widget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class EditHomeScreen extends StatelessWidget {
  const EditHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeModel homeModel =
        ModalRoute.of(context)!.settings.arguments as HomeModel;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Go.back(context);
            },
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          tEditHome,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: tFormHeight - 10, horizontal: tFormHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeadderWidget(
              image: tAddHomeBuilding,
              title: "$tEditHomeTitle - ${homeModel.homeLocation}",
              subTitle: tEditHomeSubTitle,
              imageHeight: 0.3,
            ),
            const EditHomeFormWidget(),
          ],
        ),
      )),
    );
  }
}
