import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gsc/Pages/Test/test_overview_card.dart';
import '../../Backend/Routes/app_route_constants.dart';
import '../../Backend/Data/state_management.dart';
import '../Home/topic_selection_card.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final List progressList = [
    ['Law & Ethics', 0.78, 0.26],
    ['Environmental Science', 0.92, 0.66],
    ['Elementary Mathematics', 0.64, 0.46],
  ];
  final List topicList = [
    ['Elementary Mathematics', 'math.jpg', Colors.red, 2],
    ['Environmental Science', 'env.jpg', Colors.green, 2],
    ['Commutative  English', 'eng.jpg', Colors.yellow, 2],
    ['Law & Ethics', 'law.jpg', Colors.blue, 2],
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 107,
          title: Text(
            "Examinations",
            style: GoogleFonts.ubuntu(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        //UI
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
                  "Your Results",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //Listview of Topics
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: progressList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TestOverViewCard(
                      topicName: progressList[index][0],
                      currentGrowth: progressList[index][1],
                      allTimeGrowth: progressList[index][2],
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 20),
                height: 60,
                width: 400,
                color: Colors.black,
                child: const Text(
                  "Choose A Topic",
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
            ],
          ),
        ),
        //
      ),
    );
  }
}
