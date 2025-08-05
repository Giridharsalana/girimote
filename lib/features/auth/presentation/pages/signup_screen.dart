import 'package:flutter/material.dart';
import 'package:girimote/common/widgets/background_widget.dart';
import 'package:girimote/common/helpers/responsive_helper.dart';
import 'package:girimote/features/auth/presentation/widgets/signup_form_widget.dart';
import 'package:girimote/core/constants/app_constants.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SingleChildScrollView(
        child: ResponsiveHelper(
          mobile: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: SignupFormWidget(),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
          desktop: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: const SignupFormWidget(),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
