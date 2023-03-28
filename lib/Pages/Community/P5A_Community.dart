import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return 
    WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        body: Center(
          child: Text('Community'),
        ),
      ),
    );
  }
}
