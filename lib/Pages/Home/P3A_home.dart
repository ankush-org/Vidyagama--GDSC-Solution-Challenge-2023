import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gsc/Pages/Home/battles_card.dart';
import 'package:gsc/Pages/Home/topic_selection_card.dart';
// import 'package:gsc/TMP/Home/topic_card.dart';

import '../../Backend/Data/state_management.dart';
import '../../Backend/Routes/app_route_constants.dart';
import './battle_card_template.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List topicList = [
    ['Elementary Mathematics', 'math.jpg', Colors.red, 1],
    ['Environmental Science', 'env.jpg', Colors.green, 1],
    ['Commutative  English', 'eng.jpg', Colors.yellow, 1],
    ['Law & Ethics', 'law.jpg', Colors.blue, 1],
  ];
  final List battleList = [
    ['pfp1.png', 'pfp2.png', 'Environmental Science'],
    ['pfp1.png', 'pfp2.png', 'Elementary Mathematics'],
    ['pfp1.png', 'pfp2.png', 'Law & Ethics'],
  ];
  final homeUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 25,
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
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: battleList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return BattleWidget(
                      pfp1: battleList[index][0],
                      pfp2: battleList[index][1],
                      topicName: battleList[index][2],
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 30,
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
                      navId: topicList[index][3],
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
                    width: 200,
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
      ),
    );
  }
}
