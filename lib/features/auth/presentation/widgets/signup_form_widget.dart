import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:girimote/services/auth_service.dart';
import 'package:girimote/core/constants/app_constants.dart';
import 'package:girimote/common/widgets/or_divider_widget.dart';
import 'package:girimote/common/widgets/already_have_account_check_widget.dart';
import 'package:girimote/routes/app_routes.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({super.key});

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Your name",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            obscureText: true,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Your password",
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () async {
              final user = await _authService.signUpWithEmailAndPassword(
                _emailController.text,
                _passwordController.text,
                _nameController.text,
              );
              if (user != null) {
                Navigator.pushReplacementNamed(context, AppRoutes.dashboardRoute);
              }
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          const OrDividerWidget(),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () async {
              final user = await _authService.signInWithGoogle();
              if (user != null) {
                Navigator.pushReplacementNamed(context, AppRoutes.dashboardRoute);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/google.svg',
                  height: 24,
                ),
                const SizedBox(width: defaultPadding),
                const Text("Sign up with Google"),
              ],
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAccountCheckWidget(
            login: false,
            press: () {
              Navigator.pushNamed(context, AppRoutes.loginRoute);
            },
          ),
        ],
      ),
    );
  }
}
