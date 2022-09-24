import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Login/login_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    // final db = FirebaseFirestore.instance.collection('data');

    // Future addOrUpdateWithId(
    //     String collection, String documentId, Map<String, dynamic> data) async {
    //   await FirebaseFirestore.instance
    //       .collection('data')
    //       .doc('new')
    //       .set([1, 2, 3]);
    // }

    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 80, bottom: 10, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hi, ${user.displayName} !',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      color: Colors.green,
                      width: 3,
                    )
                    // color: Colors.blueGrey,
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Dashboard",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 30),
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
                          false, // with just animate set to true, default curve = Curves.easeIn
                      curve: Curves
                          .easeIn, // animate must be set to true when using custom curve
                      onToggle: (index) {},
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
                          false, // with just animate set to true, default curve = Curves.easeIn
                      curve: Curves
                          .easeIn, // animate must be set to true when using custom curve
                      onToggle: (index) {},
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
