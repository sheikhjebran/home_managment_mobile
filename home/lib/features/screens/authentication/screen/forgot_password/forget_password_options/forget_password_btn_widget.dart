import 'package:flutter/material.dart';
import 'package:home/constants/sizes.dart';
import 'package:home/constants/text_strings.dart';

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    required this.btIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final IconData btIcon;
  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(tFormHeight - 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color.fromARGB(255, 203, 202, 202)),
        child: Row(
          children: [
            Icon(
              btIcon,
              size: 60.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tEmail, style: Theme.of(context).textTheme.headline6),
                Text(tResetViaEmail,
                    style: Theme.of(context).textTheme.bodyText2)
              ],
            )
          ],
        ),
      ),
    );
  }
}
