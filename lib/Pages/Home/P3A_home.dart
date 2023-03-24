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
        appBar: AppBar(
          title: const Text("Home"),
          automaticallyImplyLeading: false,
        ),
        //UI
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(homeUser!.email.toString()),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ElevatedButton.icon(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: const Icon(Icons.email),
                  label: const Text('Sign-Out')),
            )
          ],
        )),
        //
        bottomNavigationBar: Consumer(
          builder: (context, ref, child) {
            return GNav(
              tabs: const [
                GButton(icon: Icons.home, text: "Home"),
                GButton(icon: Icons.edit, text: "Test"),
                GButton(icon: Icons.person_2, text: "Profile"),
                GButton(icon: Icons.settings, text: "Setting"),
              ],
              selectedIndex: ref.read(bottomBarindexProvider),
              //Routing Based on the index
              onTabChange: (index) {
                // print(index);
                if (index == 0) {
                  //Home()
                  ref
                      .read(bottomBarindexProvider.notifier)
                      .update((state) => index);
                  GoRouter.of(context)
                      .pushNamed(AppNavRouteConstants.homeRouteName);
                } else if (index == 1) {
                  //Testing()
                  ref
                      .read(bottomBarindexProvider.notifier)
                      .update((state) => index);
                  GoRouter.of(context)
                      .pushNamed(AppNavRouteConstants.testingRouteName);
                } else if (index == 2) {
                  //Profile()
                  ref
                      .read(bottomBarindexProvider.notifier)
                      .update((state) => index);
                  GoRouter.of(context)
                      .pushNamed(AppNavRouteConstants.profileRouteName);
                } else if (index == 3) {
                  //Settings()
                  ref
                      .read(bottomBarindexProvider.notifier)
                      .update((state) => index);
                  GoRouter.of(context)
                      .pushNamed(AppNavRouteConstants.settingsRouteName);
                } else {
                  //Home()
                  ref
                      .read(bottomBarindexProvider.notifier)
                      .update((state) => index);
                  GoRouter.of(context)
                      .pushNamed(AppNavRouteConstants.homeRouteName);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
