import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsc/Pages/Auth/topic_selection_card_with_toggle.dart';
import 'package:gsc/Pages/BaseScaffold.dart';
import 'package:lottie/lottie.dart';

import 'P0_startup.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List topicList = [
    ['Elementary Mathematics', 'math.jpg', Colors.red],
    ['Environmental Science', 'env.jpg', Colors.green],
    ['Commutative  English', 'eng.jpg', Colors.yellow],
    ['Law & Ethics', 'law.jpg', Colors.blue],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const InitPage(),
              ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //
              const SizedBox(
                height: 20,
              ),
              LottieBuilder.network(
                  'https://assets6.lottiefiles.com/packages/lf20_D7l6QPTtOL.json'),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  " 'शिक्षा विना न मुक्ति:।' ",
                  style: GoogleFonts.tiroDevanagariSanskrit(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                "'There is no freedom without education'",
                style: GoogleFonts.eduNswActFoundation(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Select Topics You May Like',
                style: GoogleFonts.ubuntu(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              //Listview of Topics
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: topicList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TopicCardWithToggle(
                      topicName: topicList[index][0],
                      imgName: topicList[index][1],
                      barColor: topicList[index][2],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: Colors.white,
                  height: 60,
                  width: 270,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent),
                    // style: ButtonStyle(backgroundColor: Color(Colors.accents)),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => const HomeScaffold(),
                      ));
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
