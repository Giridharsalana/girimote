import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Login/login_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var one = 0;
var two = 0;
var name = "Giri";

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
    var userres =
        FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    var res = FirebaseFirestore.instance.collection('Data').doc(user.uid).get();

    res.then(
        (value) => {one = value['Light'], two = value['Fan'], setState(() {})});

    userres.then((value) => {name = value['name'], setState(() {})});

    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 80, bottom: 10, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hi, $name !',
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
                      initialLabelIndex: one,
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
                      onToggle: (index) {
                        FirebaseFirestore.instance
                            .collection('Data')
                            .doc(user.uid)
                            .update({'Light': index});
                      },
                    ),
                    const SizedBox(height: 10),
                    ToggleSwitch(
                      minWidth: 150,
                      minHeight: 60.0,
                      initialLabelIndex: two,
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
                      onToggle: (index) {
                        FirebaseFirestore.instance
                            .collection('Data')
                            .doc(user.uid)
                            .update({'Fan': index});
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
