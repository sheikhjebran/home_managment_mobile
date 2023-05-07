import 'package:flutter/material.dart';
import 'package:home/constants/image_strings.dart';
import 'package:home/constants/text_strings.dart';

class SingUpFooterWidget extends StatelessWidget {
  const SingUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InitWidget();
  }
}

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(googleIconImage),
              width: 20.0,
            ),
            label: Text(tSignInWithGoogle.toUpperCase()),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: tAlreadyHaveAccount,
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(text: tLogin.toUpperCase()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
