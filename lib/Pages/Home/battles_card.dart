import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BattleCard extends StatelessWidget {
  final String pfp1;
  final String pfp2;
  final String topicName;
  const BattleCard(
      {super.key,
      required this.pfp1,
      required this.pfp2,
      required this.topicName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (BuildContext context) => const VideoPlayerHome(),
        // ));
      },
      child: Stack(
        children: [
          Positioned(
            child: Image.asset("lib/assets/vs.jpg"),
          ),
          Row(
            children: [],
          ),
          Positioned(
            left: 30,
            top: 40,
            child: Image.asset("lib/assets/$pfp1"),
          ),
          Positioned(
            left: 200,
            top: 30,
            child: Image.asset("lib/assets/$pfp2"),
          ),
          Positioned(
            top: 30,
            left: 40,
            child: Text(
              topicName,
              style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
