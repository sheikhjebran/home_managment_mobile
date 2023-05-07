import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/constants/image_strings.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';
import 'package:home/features/screens/core/screens/profile/widget/update_profile_form_widget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../authentication/models/user_model.dart';
import '../../controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Go.back(context);
            },
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          tEditProfile,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel userData = snapshot.data as UserModel;
                    return Column(
                      children: [
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                image: AssetImage(tPersonIconImage),
                              )),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          tProfileHeading,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          tProfileSubHeading,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 30),
                        const Divider(),
                        const SizedBox(height: 10),
                        UpdateProfileFormWidget(userData: userData),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: Text("Something went wrong"));
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
      ),
    );
  }
}
