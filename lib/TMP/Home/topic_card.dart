import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  //Fields
  final String? topicName;
  final String? thumbnailPath;

  //Constructor
  const TopicCard({
    super.key,
    required this.topicName,
    required this.thumbnailPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      width: 200,
      child: Column(children: [
        // Text('$topicName'),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 240,
          ),
        )
      ]),
    );
  }
}
