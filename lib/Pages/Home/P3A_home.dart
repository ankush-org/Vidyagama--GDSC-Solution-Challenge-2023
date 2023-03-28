import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../Backend/Data/state_management.dart';
import '../../Backend/Routes/app_route_constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final homeUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        //UI
        appBar: AppBar(
            backgroundColor: Colors.black,
            toolbarHeight: 60,
            title: const Text(
              "Namaste",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            )),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 50,
                  width: 400,
                  padding: const EdgeInsets.only(top: 10),
                  color: Colors.black,
                  child: const Text(
                    "Your Battle Arena",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                height: 200,
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(250, 207, 247, 123),
                    borderRadius: BorderRadius.circular(20)),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 20),
                height: 60,
                width: 400,
                color: Colors.black,
                child: const Text(
                  "Your Cources",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: SafeArea(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        height: 190,
                        width: 190,
                        child: Image.asset("lib/assets/math.jpg"),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: 90,
                            width: 200,
                            padding: const EdgeInsets.only(top: 20),
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(255, 70, 147, 72),
                                        width: 3)),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black,
                                    Color.fromARGB(242, 0, 0, 0),
                                    Color.fromARGB(221, 25, 24, 24),
                                    Color.fromARGB(36, 25, 24, 24),
                                  ],
                                )),
                            child: const Text(
                              "algebra ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
                child: Text(
                  "Math",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 5, right: 5)),
                  Container(
                    color: const Color.fromARGB(176, 54, 53, 53),
                    height: 60,
                    child: Image.asset("lib/assets/math.png"),
                  ),
                  Container(
                    color: const Color.fromARGB(176, 54, 53, 53),
                    height: 60,
                    width: 250,
                    child: const Text("ALGEBRA",
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    color: const Color.fromARGB(176, 54, 53, 53),
                    child: const Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        //
        //
        //Auth *Do Not Touch*
        //     Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(homeUser!.email.toString()),
        //       Padding(
        //         padding: const EdgeInsets.all(2.0),
        //         child: ElevatedButton.icon(
        //             onPressed: () {
        //               FirebaseAuth.instance.signOut();
        //             },
        //             icon: const Icon(Icons.email),
        //             label: const Text('Sign-Out')),
        //       )
        //     ],
        //   ),
        // ),
        //
        // bottomNavigationBar: Consumer(
        //   builder: (context, ref, child) {
        //     return GNav(
        //       haptic: true,
        //       backgroundColor: Colors.black,
        //       color: Colors.white,
        //       activeColor: Colors.white,
        //       padding: EdgeInsets.all(20),
        //       tabs: const [
        //         GButton(icon: Icons.home, text: "Home"),
        //         GButton(icon: Icons.edit, text: "Test"),
        //         GButton(icon: Icons.person_2, text: "Profile"),
        //         GButton(icon: Icons.settings, text: "Setting"),
        //       ],
        //       selectedIndex: ref.read(bottomBarindexProvider),
        //       //Routing Based on the index
        //       onTabChange: (index) {
        //         // print(index);
        //         if (index == 0) {
        //           //Home()
        //           ref
        //               .read(bottomBarindexProvider.notifier)
        //               .update((state) => index);
        //           GoRouter.of(context)
        //               .pushNamed(AppNavRouteConstants.homeRouteName);
        //         } else if (index == 1) {
        //           //Testing()
        //           ref
        //               .read(bottomBarindexProvider.notifier)
        //               .update((state) => index);
        //           GoRouter.of(context)
        //               .pushNamed(AppNavRouteConstants.testingRouteName);
        //         } else if (index == 2) {
        //           //Profile()
        //           ref
        //               .read(bottomBarindexProvider.notifier)
        //               .update((state) => index);
        //           GoRouter.of(context)
        //               .pushNamed(AppNavRouteConstants.profileRouteName);
        //         } else if (index == 3) {
        //           //Settings()
        //           ref
        //               .read(bottomBarindexProvider.notifier)
        //               .update((state) => index);
        //           GoRouter.of(context)
        //               .pushNamed(AppNavRouteConstants.settingsRouteName);
        //         } else {
        //           //Home()
        //           ref
        //               .read(bottomBarindexProvider.notifier)
        //               .update((state) => index);
        //           GoRouter.of(context)
        //               .pushNamed(AppNavRouteConstants.homeRouteName);
        //         }
        //       },
        //     );
        //   },
        // ),
      ),
    );
  }
}
