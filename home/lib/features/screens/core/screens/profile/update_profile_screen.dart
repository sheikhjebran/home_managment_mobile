import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/constants/image_strings.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../authentication/models/user_model.dart';
import '../../controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final formKey = GlobalKey<FormState>();

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
                    UserModel user = snapshot.data as UserModel;

                    //Controller
                    final email = TextEditingController(text: user.email);
                    final password = TextEditingController(text: user.password);
                    final phoneNo =
                        TextEditingController(text: user.phoneNumber);
                    final fullName = TextEditingController(text: user.fullName);
                    final id = TextEditingController(text: user.id);

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
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: tFormHeight - 10),
                          child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: tFormHeight - 20,
                                  ),
                                  TextFormField(
                                    controller: fullName,
                                    decoration: const InputDecoration(
                                        label: Text(tFullName),
                                        prefixIcon:
                                            Icon(Icons.person_outline_rounded)),
                                  ),
                                  const SizedBox(
                                    height: tFormHeight - 20,
                                  ),
                                  TextFormField(
                                    controller: email,
                                    decoration: const InputDecoration(
                                        label: Text(tEmail),
                                        prefixIcon: Icon(Icons.email_outlined)),
                                  ),
                                  const SizedBox(
                                    height: tFormHeight - 20,
                                  ),
                                  TextFormField(
                                    controller: phoneNo,
                                    decoration: const InputDecoration(
                                        label: Text(tPhoneNumber),
                                        prefixIcon: Icon(Icons.numbers)),
                                  ),
                                  const SizedBox(
                                    height: tFormHeight - 20,
                                  ),
                                  TextFormField(
                                    readOnly: true,
                                    obscureText: true,
                                    controller: password,
                                    decoration: const InputDecoration(
                                        label: Text(tPassword),
                                        prefixIcon: Icon(Icons.fingerprint)),
                                  ),
                                  const SizedBox(
                                    height: tFormHeight - 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          final userData = UserModel(
                                              email: email.text.trim(),
                                              password: password.text.trim(),
                                              fullName: fullName.text.trim(),
                                              phoneNumber: phoneNo.text.trim(),
                                              id: id.text.trim());

                                          await controller
                                              .updateProfile(userData);
                                        }
                                      },
                                      child:
                                          Text(tUpdateProfileButton.toString()),
                                    ),
                                  )
                                ],
                              )),
                        ),
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
