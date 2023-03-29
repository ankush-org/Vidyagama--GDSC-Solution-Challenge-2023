import 'package:flutter/material.dart';
import 'package:gsc/Pages/Auth/P0_startup.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
              //Name
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                  // controller: _textControllerEmail,
                  decoration: InputDecoration(
                    prefixIconColor: Colors.orangeAccent,
                    suffixIconColor: Colors.orangeAccent,
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.orangeAccent, width: 2.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                    ),
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Your Email',
                    prefixIcon: const Icon(Icons.alternate_email_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.login_sharp),
                    ),
                  ),
                ),
              ),

              //Name
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                  // controller: _textControllerEmail,
                  decoration: InputDecoration(
                    prefixIconColor: Colors.orangeAccent,
                    suffixIconColor: Colors.orangeAccent,
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.orangeAccent, width: 2.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                    ),
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Your Name',
                    prefixIcon: const Icon(Icons.person),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.login_sharp),
                    ),
                  ),
                ),
              ),
              //Password
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                  obscureText: true,
                  // controller: _textControllerEmail,
                  decoration: InputDecoration(
                    prefixIconColor: Colors.orangeAccent,
                    suffixIconColor: Colors.orangeAccent,
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.orangeAccent, width: 2.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                    ),
                    border: const OutlineInputBorder(),
                    hintText: 'Choose A Password',
                    prefixIcon: const Icon(Icons.key_rounded),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.login_sharp),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                  obscureText: true,
                  // controller: _textControllerEmail,
                  decoration: InputDecoration(
                    prefixIconColor: Colors.orangeAccent,
                    suffixIconColor: Colors.orangeAccent,
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.orangeAccent, width: 2.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                    ),
                    border: const OutlineInputBorder(),
                    hintText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.login_sharp),
                    ),
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
                    onPressed: () {},
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
