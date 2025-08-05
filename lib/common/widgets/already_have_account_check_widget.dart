import 'package:flutter/material.dart';
import 'package:girimote/core/constants/app_constants.dart';

class AlreadyHaveAccountCheckWidget extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAccountCheckWidget({
    super.key,
    this.login = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: const TextStyle(color: kPrimaryColor),
        ),
        TextButton(
          onPressed: press as void Function()?,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
