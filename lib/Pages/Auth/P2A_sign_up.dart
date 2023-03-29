import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsc/Pages/Auth/P0_startup.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Backend/Data/state_management.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  //Variables
  final _textControllerEmail = TextEditingController();
  final _textControllerName = TextEditingController();
  final _textControllerPassword = TextEditingController();
  final _textControllerPasswordVer = TextEditingController();
  String? passWordver;
  //Auth
  final user = FirebaseAuth.instance.currentUser;

  Future signUp() async {
    //sign-up logic
    print('signup called');
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _textControllerEmail.text.trim(),
        password: _textControllerPassword.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  //Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const InitPage(),
              ));
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Sign-Up Text
              Text(
                'Sign-Up',
                style: GoogleFonts.ubuntu(
                    fontSize: 50, fontWeight: FontWeight.bold),
              ),
              LottieBuilder.network(
                'https://assets4.lottiefiles.com/packages/lf20_Cm5ERobRJM.json',
                width: 250,
              ),
              //Email
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                  controller: _textControllerEmail,
                  onSubmitted: (val) {
                    setState(
                      () {
                        if (_textControllerEmail.text != '') {
                          ref.read(userEmail.notifier).update(
                                (state) => _textControllerEmail.text,
                              );
                        }
                      },
                    );
                  },
                  decoration: const InputDecoration(
                    prefixIconColor: Colors.orangeAccent,
                    suffixIconColor: Colors.orangeAccent,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.orangeAccent, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Email',
                    prefixIcon: Icon(Icons.alternate_email_outlined),
                    // suffixIcon: Icon(Icons.login_sharp),
                  ),
                ),
              ),
              //Name
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                  controller: _textControllerName,
                  onSubmitted: (val) {
                    setState(
                      () {
                        if (_textControllerName.text != '') {
                          ref.read(userName.notifier).update(
                                (state) => _textControllerName.text,
                              );
                        }
                      },
                    );
                  },
                  decoration: const InputDecoration(
                    prefixIconColor: Colors.orangeAccent,
                    suffixIconColor: Colors.orangeAccent,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.orangeAccent, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Name',
                    prefixIcon: Icon(Icons.person),
                    // suffixIcon: Icon(Icons.login_sharp),
                  ),
                ),
              ),
              //Password
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                  controller: _textControllerPassword,
                  onSubmitted: (val) {
                    setState(
                      () {
                        if (_textControllerPassword.text != '') {
                          ref.read(userPassword.notifier).update(
                                (state) => _textControllerPassword.text,
                              );
                        }
                      },
                    );
                  },
                  decoration: const InputDecoration(
                    prefixIconColor: Colors.orangeAccent,
                    suffixIconColor: Colors.orangeAccent,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.orangeAccent, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.key),
                    // suffixIcon: Icon(Icons.login_sharp),
                  ),
                ),
              ),
              //Password Ver
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                  controller: _textControllerPasswordVer,
                  onSubmitted: (val) {
                    passWordver = val;
                  },
                  decoration: const InputDecoration(
                    prefixIconColor: Colors.orangeAccent,
                    suffixIconColor: Colors.orangeAccent,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.orangeAccent, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Email',
                    prefixIcon: Icon(Icons.alternate_email_outlined),
                    // suffixIcon: Icon(Icons.login_sharp),
                  ),
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
                        backgroundColor: Colors.amberAccent),
                    // style: ButtonStyle(backgroundColor: Color(Colors.accents)),
                    onPressed: () {
                      print('pressed');
                      if (passWordver == ref.read(userPassword) &&
                          ref.read(userEmail) != 'null' &&
                          ref.read(userName) != 'null') {
                        print(_textControllerEmail.toString());
                        print(_textControllerName.toString());
                        print(_textControllerPassword.toString());
                        print(_textControllerPasswordVer.toString());
                        print(ref.read(userEmail));
                        print(ref.read(userName));
                        print(ref.read(userPassword));
                        signUp();
                      }
                    },
                    child: const Text(
                      'Agree & Continue',
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
