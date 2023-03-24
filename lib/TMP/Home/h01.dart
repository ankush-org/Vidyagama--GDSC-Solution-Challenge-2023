import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gsc/TMP/Home/topic_card.dart';

import '../../Backend/Data/state_management.dart';
import '../../Backend/Routes/app_route_constants.dart';

class h01 extends StatefulWidget {
  const h01({super.key});

  @override
  State<h01> createState() => _h01State();
}

class _h01State extends State<h01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF201c1c),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22, top: 50),
              child: RichText(
                text: TextSpan(
                  // text: ,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 220,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                // color: Colors.amber,
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const TopicCard(
                        topicName: 'topicName',
                        thumbnailPath: '',
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 13),
              child: Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('lib/assets/math.png'),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Elementary Mathematics",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('lib/assets/play-button.png'),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 60,
                // color: Colors.green,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          return const GNav(
            color: Color(0xFF201c1c),
            tabs: [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.edit, text: "Test"),
              GButton(icon: Icons.person_2, text: "Profile"),
              GButton(icon: Icons.settings, text: "Setting"),
            ],
          );
        },
      ),
    );
  }
}
