import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsc/Pages/BaseScaffold.dart';
import 'package:gsc/Pages/Test/P4A_testing.dart';

// import '../../Backend/Data/state_management.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  //Variables
  String? mcq;
  String? answer;
  String? response;

  final _textControllerAns = TextEditingController();

  //Chat GPT
  late OpenAI? chatGPT;

  Future generateQsn() async {
    //Prompting for Quesn Generation
    print('pressed'); //Debug
    final request = CompleteText(
        prompt: 'Ask a subjective question on matter',
        model: kTranslateModelV3);
    final response = await chatGPT!.onCompleteText(request: request);
    print(response!.choices[0].text); //Debug
    setState(
      () {
        mcq = response.choices[0].text;
      },
    );
  }
  
  //init
  @override
  void initState() {
    chatGPT = OpenAI.instance.build(
        token: "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",
        baseOption: HttpSetup(receiveTimeout: 60000));
    super.initState();
  }
  
  //dispose
  @override
  void dispose() {
    chatGPT?.close();
    chatGPT?.genImgClose();
    super.dispose();
  }

  //Scaffold
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const HomeScaffold(),
              ));
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            // mcq = ref.watch(mcqQuestion);
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: 200,
                        width: 300,
                        color: Colors.white,
                        child: Text(
                          '$mcq',
                          style: GoogleFonts.aBeeZee(color: Colors.black),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 200,
                        width: 300,
                        color: Colors.white,
                        child: Text(
                          '$response',
                          style: GoogleFonts.aBeeZee(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: _textControllerAns,
                        onSubmitted: (val) {
                          setState(
                            () {
                              answer = val;
                            },
                          );
                        },
                        decoration: const InputDecoration(
                          prefixIconColor: Colors.orangeAccent,
                          suffixIconColor: Colors.orangeAccent,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.orangeAccent, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orangeAccent),
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'Enter Your Answer',
                          prefixIcon: Icon(Icons.data_array),
                          // suffixIcon: Icon(Icons.login_sharp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: Consumer(
          builder: (context, ref, child) {
            return FloatingActionButton(onPressed: () async {
              generateQsn();
            }
                // () async {
                //   //Prompting for Quesn Generation
                //   print('pressed'); //Debug
                //   final request = CompleteText(
                //       prompt: 'Ask a subjective question on addition',
                //       model: kTranslateModelV3);
                //   final response =
                //       await chatGPT!.onCompleteText(request: request);
                //   print(response!.choices[0].text); //Debug
                //   setState(
                //     () {
                //       mcq = response.choices[0].text;
                //     },
                //   );
                //   // // Checking State
                //   // ref
                //   //     .read(mcqQuestion.notifier)
                //   //     .update((state) => response.choices[0].text.toString());
                //   // //
                // },
                );
          },
        ),
      ),
    );
  }
}
