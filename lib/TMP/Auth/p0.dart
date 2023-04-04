import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Backend/Data/state_management.dart';

class P0 extends ConsumerStatefulWidget {
  const P0({super.key});

  @override
  ConsumerState<P0> createState() => _P0State();
}

class _P0State extends ConsumerState<P0> {
  //Variables
  final _textControllerEmail = TextEditingController();
  final _textControllerPassword = TextEditingController();

  @override
  void dispose() {
    // _textControllerEmail.dispose();
    // _textControllerPassword.dispose();
    super.dispose();
  }

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
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              controller: _textControllerEmail,
              decoration: InputDecoration(
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
          Text('debugEmail: $debugEmail'),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              controller: _textControllerPassword,
              decoration: InputDecoration(
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
          Text('debugPassword: $debugPassword'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.email),
                    label: const Text('Sign-in')),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.email),
                    label: const Text('Sign-Up')),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.email),
                    label: const Text('Sign-Out')),
              )
            ],
          ),
        ],
        // ),
      ),
    );
  }
}
