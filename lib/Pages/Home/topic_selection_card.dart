import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  final String topicName;
  final String imgName;
  final Color barColor;

  const TopicCard({
    super.key,
    required this.topicName,
    required this.imgName,
    required this.barColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                child: Text(
                  topicName,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
