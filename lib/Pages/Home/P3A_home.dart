import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gsc/Pages/Home/topic_selection_card.dart';
// import 'package:gsc/TMP/Home/topic_card.dart';

import '../../Backend/Data/state_management.dart';
import '../../Backend/Routes/app_route_constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List topicList = [
    ['Elementary Mathematics', 'math.jpg', Colors.red],
    ['Environmental Science', 'env.jpg', Colors.green],
    ['Commutative  English', 'eng.jpg', Colors.yellow],
    ['Law & Ethics', 'law.jpg', Colors.blue],
  ];
  final homeUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        //UI
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 107,
          title: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "Namaste !",
              style: GoogleFonts.ubuntu(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              //  TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 35.0, right: 15),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.bell,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            )
          ],
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 400,
                padding: const EdgeInsets.only(left: 10, right: 10),
                color: Colors.black,
                child: const Text(
                  "Your Battle Arena",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 200,
                margin: const EdgeInsets.only(left: 8, right: 8),
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
                  "Your Courses",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Listview of Topics
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: topicList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TopicCard(
                      topicName: topicList[index][0],
                      imgName: topicList[index][1],
                      barColor: topicList[index][2],
                    );
                  },
                ),
              ),
              //Resume-Button
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: 5, right: 5, top: 10)),
                  Container(
                    color: const Color.fromARGB(176, 54, 53, 53),
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("lib/assets/math.jpg"),
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(176, 54, 53, 53),
                    height: 70,
                    width: 250,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Text(
                        "Cross Multiplication",
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
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
