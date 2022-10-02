import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Login/login_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  final userInfo = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>> getUserData() async {
    DocumentReference userDataRef =
        FirebaseFirestore.instance.collection('users').doc(userInfo!.uid);

    return userDataRef.get().then((value) {
      Map<String, dynamic> data = value.data() as Map<String, dynamic>;
      return data;
    });
  }

  @override
  Widget build(BuildContext context) {
    DocumentReference userDataRef =
        FirebaseFirestore.instance.collection('users').doc(userInfo!.uid);
    return Scaffold(
      body: FutureBuilder(
          future: getUserData(),
          initialData: const {
            "Name": "GS",
            "Email": "gs@gmail.com",
          },
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> snapShot =
                  snapshot.data as Map<String, dynamic>;
              return Container(
                padding: const EdgeInsets.only(
                    top: 80, bottom: 10, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, ${snapShot["Name"]} !',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
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
                              initialLabelIndex: snapShot["Light"],
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
                                userDataRef.update({'Light': index});
                              },
                            ),
                            const SizedBox(height: 10),
                            ToggleSwitch(
                              minWidth: 150,
                              minHeight: 60.0,
                              initialLabelIndex: snapShot["Fan"],
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
                                userDataRef.update({'Fan': index});
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
              );
            }
            if (snapshot.hasError) {
              return const Text("Error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
