import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final String topImage;
  final String bottomImage;

  const BackgroundWidget({
    super.key,
    required this.child,
    this.topImage = "assets/images/main_top.png",
    this.bottomImage = "assets/images/login_bottom.png",
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                topImage,
                width: size.width * 0.35,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                bottomImage,
                width: size.width * 0.4,
              ),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
