import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Login/login_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 80, bottom: 10, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Hi, Giridhar!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
                padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  // color: Colors.blueGrey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Dashboard",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 50),
                    ToggleSwitch(
                      minWidth: 150.0,
                      minHeight: 60.0,
                      initialLabelIndex: 0,
                      cornerRadius: 20.0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      totalSwitches: 2,
                      icons: const [
                        FontAwesomeIcons.lightbulb,
                        FontAwesomeIcons.solidLightbulb,
                      ],
                      iconSize: 30.0,
                      activeBgColors: const [
                        [Colors.black, Colors.red],
                        [Colors.green, Colors.yellow]
                      ],
                      animate:
                          true, // with just animate set to true, default curve = Curves.easeIn
                      curve: Curves
                          .easeIn, // animate must be set to true when using custom curve
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                    const SizedBox(height: 10),
                    ToggleSwitch(
                      minWidth: 150,
                      minHeight: 60.0,
                      initialLabelIndex: 0,
                      cornerRadius: 20.0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      totalSwitches: 2,
                      icons: const [
                        FontAwesomeIcons.fan,
                        FontAwesomeIcons.fan,
                      ],
                      iconSize: 30.0,
                      activeBgColors: const [
                        [Colors.black, Colors.red],
                        [Colors.green, Colors.yellow]
                      ],
                      animate:
                          true, // with just animate set to true, default curve = Curves.easeIn
                      curve: Curves
                          .easeIn, // animate must be set to true when using custom curve
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              child: const Text(
                'Sign Out',
                // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
