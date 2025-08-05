import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:girimote/core/constants/app_constants.dart';

class WelcomeImageWidget extends StatelessWidget {
  const WelcomeImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Welcome to Girimote",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset(
                "assets/icons/chat.svg",
                height: 200,
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
