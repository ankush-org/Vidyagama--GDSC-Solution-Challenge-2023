import 'package:flutter/material.dart';

class TopicCardWithToggle extends StatefulWidget {
  final String topicName;
  final String imgName;
  final Color barColor;

  const TopicCardWithToggle({
    super.key,
    required this.topicName,
    required this.imgName,
    required this.barColor,
  });

  @override
  State<TopicCardWithToggle> createState() => _TopicCardWithToggleState();
}

class _TopicCardWithToggleState extends State<TopicCardWithToggle> {
  bool isSelected = false;

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
            child: Image.asset("lib/assets/${widget.imgName}"),
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
                    bottom: BorderSide(color: widget.barColor, width: 2),
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
                    widget.topicName,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 135,
            top: 140,
            child: IconButton(
              onPressed: () {
                setState(
                  () {
                    isSelected = !isSelected;
                  },
                );
              },
              icon: isSelected
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 40,
                    )
                  : const Icon(
                      Icons.circle_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
