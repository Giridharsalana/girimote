import 'package:flutter/material.dart';
import 'package:girimote/common/helpers/responsive_helper.dart';
import 'package:girimote/common/widgets/background_widget.dart';
import 'package:girimote/features/auth/presentation/widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                    child: LoginFormWidget(),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
          desktop: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: const LoginFormWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
