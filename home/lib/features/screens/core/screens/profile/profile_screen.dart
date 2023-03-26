import 'package:flutter/material.dart';
import 'package:home/constants/sizes.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:home/constants/colors.dart';
import 'package:home/constants/image_strings.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/screens/core/screens/profile/widget/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          tProfile,
          style: Theme.of(context).textTheme.headline3,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
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
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  tProfileSubHeading,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 20),
                SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: tPrimaryColor,
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      child: const Text(tEditProfile,
                          style: TextStyle(color: tDarkColor)),
                    )),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 10),

                //Menu
                ProfileMenuWidget(
                  title: tMenu1,
                  icon: LineAwesomeIcons.cog,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: tMenu4,
                  icon: LineAwesomeIcons.info,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: tMenu5,
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {},
                ),
              ],
            )),
      ),
    );
  }
}
