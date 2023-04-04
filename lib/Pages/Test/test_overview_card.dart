import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsc/Pages/Home/topic_selection_card.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TestOverViewCard extends StatelessWidget {
  final String topicName;
  final double currentGrowth;
  final double allTimeGrowth;

  const TestOverViewCard(
      {super.key,
      required this.topicName,
      required this.currentGrowth,
      required this.allTimeGrowth});

  @override
  Widget build(BuildContext context) {
    double currentGrowthPercent = currentGrowth * 100;
    double allGrowthPercent = allTimeGrowth * 100;
    return Stack(
      children: [
        Positioned(
            child: Padding(
          padding: const EdgeInsets.only(left: 13),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Colors.orangeAccent,
                  width: 1.5,
                )),
            height: 320,
            width: 350,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset("lib/assets/test.jpg",
                  color: const Color.fromRGBO(255, 255, 255, 0.2),
                  colorBlendMode: BlendMode.modulate),
            ),
            // color: Colors.white,
          ),
        )),
        Positioned(
          left: 55,
          top: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularPercentIndicator(
                radius: 55,
                lineWidth: 12,
                percent: currentGrowth,
                progressColor: Colors.greenAccent,
                backgroundColor: Colors.white12,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  "$currentGrowthPercent %",
                  style: GoogleFonts.ubuntu(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              CircularPercentIndicator(
                radius: 55,
                lineWidth: 12,
                percent: allTimeGrowth,
                progressColor: Colors.amberAccent,
                backgroundColor: Colors.white12,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  '$allGrowthPercent %',
                  style: GoogleFonts.ubuntu(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 140,
          left: 65,
          child: Row(
            children: [
              Text(
                'Current Growth',
                style: GoogleFonts.ubuntu(color: Colors.white),
              ),
              SizedBox(
                width: 60,
              ),
              Text(
                'All Time Growth',
                style: GoogleFonts.ubuntu(color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
            top: 165,
            left: 30,
            child: Text(
              topicName,
              style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
