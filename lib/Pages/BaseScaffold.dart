import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gsc/Pages/Community/P5A_Community.dart';
import 'package:gsc/Pages/Home/P3A_home.dart';
import 'package:gsc/Pages/Profile/P6A_Profile.dart';
import 'package:gsc/Pages/Test/P4A_testing.dart';
import 'package:gsc/Pages/Test/P4B_test.dart';
// import 'package:line_icons/line_icons.dart';

// void main() => runApp(MaterialApp(
//     builder: (context, child) {
//       return Directionality(textDirection: TextDirection.ltr, child: child!);
//     },
//     title: 'GNav',
//     theme: ThemeData(
//       primaryColor: Colors.grey[800],
//     ),
//     home: Example()));

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({super.key});

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  //List Of Routes
  int _selectedIndex = 0;
  //Navigation Widgest Array
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Testing(),
    Community(),
    UserProfile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.black,
              hoverColor: Colors.black,
              backgroundColor: Colors.black,
              gap: 10,
              activeColor: Colors.black,
              iconSize: 20,
              padding: const EdgeInsets.all(9),
              duration: const Duration(milliseconds: 250),
              tabBackgroundColor: Colors.grey[700]!,
              color: Colors.white,
              tabs: const [
                GButton(icon: FontAwesomeIcons.house, text: 'Home'),
                GButton(icon: FontAwesomeIcons.pen, text: 'Test'),
                GButton(icon: FontAwesomeIcons.peopleGroup, text: 'Community'),
                GButton(icon: FontAwesomeIcons.userLarge, text: 'Profile'),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(
                  () {
                    _selectedIndex = index;
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
