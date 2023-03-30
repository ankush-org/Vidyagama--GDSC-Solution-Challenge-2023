// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gsc/Pages/Home/P3B_video_player.dart';
import 'package:gsc/Pages/Test/P4B_test.dart';
import 'package:gsc/Pages/Test/P4C_english.dart';

class TopicCard extends StatelessWidget {
  final String topicName;
  final String imgName;
  final Color barColor;
  final int navId;

  const TopicCard({
    super.key,
    required this.topicName,
    required this.imgName,
    required this.barColor,
    required this.navId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (navId == 1) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const VideoPlayerHome(),
          ));
        } else if (navId == 2) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => const TestPage(),
            ),
          );
        } else if (navId == 3) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => const LanguageTest(),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              height: 190,
              width: 190,
              child: Image.asset("lib/assets/$imgName"),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 90,
                  width: 200,
                  padding: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border(
                      bottom: BorderSide(
                          color: barColor,
                          // Color.fromARGB(255, 70, 147, 72),
                          width: 2),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black,
                        Color.fromARGB(242, 0, 0, 0),
                        Color.fromARGB(221, 25, 24, 24),
                        Color.fromARGB(36, 25, 24, 24),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      topicName,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
