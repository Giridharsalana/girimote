import 'package:flutter/material.dart';
import 'package:girimote/core/constants/app_constants.dart';
import 'package:girimote/common/helpers/responsive_helper.dart';
import 'package:girimote/common/widgets/background_widget.dart';
import 'package:girimote/features/welcome/presentation/widgets/welcome_image_widget.dart';
import 'package:girimote/features/welcome/presentation/widgets/login_signup_button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SingleChildScrollView(
        child: SafeArea(
          child: ResponsiveHelper(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: WelcomeImageWidget(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: LoginSignupButtonWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const WelcomeImageWidget(),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 8,
                      child: LoginSignupButtonWidget(),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
