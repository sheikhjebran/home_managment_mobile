import 'package:flutter/material.dart';
import 'package:home/constants/image_strings.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';
import 'package:home/features/routing/routing.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    Key? key,
  }) : super(key: key);

  Widget initWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            label: const Text(tSignInWithGoogle),
            icon: const Image(
              image: AssetImage(googleIconImage),
              width: tFormHeight,
            ),
          ),
        ),
        const SizedBox(
          width: tFormHeight - 20,
        ),
        TextButton(
          onPressed: () {
            Go.To(context, '/singUp');
          },
          child: Text.rich(
            TextSpan(
              text: tDontHaveAccount,
              style: Theme.of(context).textTheme.bodyLarge,
              children: const [
                TextSpan(
                  text: tSignUp,
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }
}
