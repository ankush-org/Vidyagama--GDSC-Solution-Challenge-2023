import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final homeUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                homeUser!.email.toString(),
                style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton.icon(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    icon: const Icon(Icons.email),
                    label: Text(
                      'Sign-Out',
                      style: GoogleFonts.ubuntu(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
