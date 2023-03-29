import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Backend/Data/state_management.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gsc/main.dart';
import 'package:lottie/lottie.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_fonts/google_fonts.dart';

class InitPage extends ConsumerStatefulWidget {
  const InitPage({super.key});

  @override
  ConsumerState<InitPage> createState() => _P0State();
}

class _P0State extends ConsumerState<InitPage> {
  //Variables
  final _textControllerEmail = TextEditingController();
  final _textControllerPassword = TextEditingController();

  //Auth
  // final user = FirebaseAuth.instance.currentUser;

  Future signIn() async {
    //sign-in loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //sign-in logic
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: ref.read(userEmail).toString(),
        password: ref.read(userPassword).toString(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    //post sign-in
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  //Dispose()
  @override
  void dispose() {
    // _textControllerEmail.dispose();
    // _textControllerPassword.dispose();
    super.dispose();
  }

  //Scaffold
  @override
  Widget build(BuildContext context) {
    //TMP Vars
    String? debugEmail = ref.watch(userEmail);
    String? debugPassword = ref.watch(userPassword);

    //Scaffold
    return Scaffold(
      body:
          // SingleChildScrollView(
          //   child:
          SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              //App Name
              const SizedBox(
                height: 30,
              ),
              Text(
                'Vidyagamah',
                style: GoogleFonts.satisfy(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
                // TextStyle(
                //   fontSize: 45,
                //   fontWeight: FontWeight.bold,
                // ),
              ),
              //Animation
              Lottie.network(
                  'https://assets9.lottiefiles.com/packages/lf20_e6qptb87.json'),
              //Sign-in with google
              Container(
                color: Colors.blue,
                height: 60,
                width: 380,
                child: SignInButton(
                  Buttons.google,
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('OR'),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                  controller: _textControllerEmail,
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
                    hintText: 'Enter email',
                    prefixIcon: const Icon(Icons.alternate_email_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (_textControllerEmail.text != '') {
                          ref.read(userEmail.notifier).update(
                                (state) => _textControllerEmail.text,
                              );
                        }
                      },
                      icon: const Icon(Icons.login_sharp),
                    ),
                  ),
                ),
              ),
              // Text('debugEmail: $debugEmail'),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                  controller: _textControllerPassword,
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
                    hintText: 'Enter Password',
                    prefixIcon: const Icon(Icons.key_rounded),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (_textControllerPassword.text != '') {
                          ref.read(userPassword.notifier).update(
                                (state) => _textControllerPassword.text,
                              );
                        }
                      },
                      icon: const Icon(Icons.login_sharp),
                    ),
                  ),
                ),
              ),
              // Text('debugPassword: $debugPassword'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(2.0),
                  //   child: ElevatedButton.icon(
                  //       onPressed: () {
                  //         signIn();
                  //       },
                  //       icon: const Icon(Icons.email),
                  //       label: const Text('Sign-in')),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(2.0),
                  //   child: ElevatedButton.icon(
                  //       onPressed: () {},
                  //       icon: const Icon(Icons.email),
                  //       label: const Text('Sign-Up')),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(2.0),
                  //   child: ElevatedButton.icon(
                  //       onPressed: () {},
                  //       icon: const Icon(Icons.email),
                  //       label: const Text('Sign-Out')),
                  // )
                  Row(
                    children: const [
                      Text("Don't have an account? "),
                      Text(
                        "Sign-Up",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color.fromARGB(255, 244, 86, 13),
                        ),
                      ),
                    ],
                  )
                  // RichText(
                  //   text: const TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         // recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignUp,
                  //         text: 'No Account?',
                  //         style: TextStyle(
                  //           decoration: TextDecoration.underline,
                  //           color: Colors.blue,
                  //         ),
                  //         children: [TextSpan(text: 'Sign Up?')],
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ],
            // ),
          ),
        ),
      ),
    );
  }
}
