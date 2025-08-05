import 'package:flutter/material.dart';
import 'package:girimote/routes/app_routes.dart';
import 'package:girimote/core/constants/app_constants.dart';

class LoginSignupButtonWidget extends StatelessWidget {
  const LoginSignupButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.loginRoute);
            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.signupRoute);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryLightColor, elevation: 0),
          child: Text(
            "Sign Up".toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
