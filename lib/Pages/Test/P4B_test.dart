import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsc/Pages/BaseScaffold.dart';
import 'package:gsc/Pages/Test/P4A_testing.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// import '../../Backend/Data/state_management.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  //Variables
  String? mcq = '';
  String? answer = '';
  String? promptResponse = '';
  int sessionScore = 0;
  int percentScore = 0;

  final _textControllerAns = TextEditingController();

  //Chat GPT
  late OpenAI? chatGPT;

  //Quiery Gen
  Future generateQsn() async {
    //Prompting for Quesn Generation
    print('pressed'); //Debug
    final request = CompleteText(
        prompt: 'Ask a subjective question on hydrogen',
        model: kTranslateModelV3);
    final response = await chatGPT!.onCompleteText(request: request);
    print(response!.choices[0].text); //Debug
    setState(
      () {
        mcq = response.choices[0].text;
      },
    );
  }

  //Generating a Response
  Future generateAns() async {
    //prompting for an answer review
    final request2 = CompleteText(
      prompt:
          'analyze and tell if answer - $answer is correct answer to question - $mcq, and also explain why I am wrong and give me a percentage score',
      model: kTranslateModelV3,
    );
    final response = await chatGPT!.onCompleteText(request: request2);
    print(response!.choices[0].text); //Debug
    setState(
      () {
        promptResponse = response.choices[0].text;
        int startingid = response.choices[0].text.indexOf('%');
        print(startingid);
        if (response.choices[0].text.toString()[startingid - 2] != ' ' &&
            response.choices[0].text.toString()[startingid - 3] != ' ') {
          print('triple');

          percentScore = int.parse(response.choices[0].text
              .toString()
              .substring(startingid - 3, startingid));
        } else if (response.choices[0].text.toString()[startingid - 2] != ' ' &&
            response.choices[0].text.toString()[startingid - 1] != ' ') {
          print('double');
          percentScore = int.parse(response.choices[0].text
              .toString()
              .substring(startingid - 2, startingid));
        } else {
          percentScore = int.parse(response.choices[0].text
              .toString()
              .substring(startingid - 1, startingid));
        }
        sessionScore += percentScore;
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: LinearPercentIndicator(
                    lineHeight: 45,
                    width: 380,
                    progressColor: Colors.redAccent,
                    percent: (sessionScore / 1000).toDouble(),
                    center: Text(
                      'Streak Level: 1',
                      style: GoogleFonts.pacifico(
                          color: Colors.black, fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(
                                color: Colors.orangeAccent,
                                width: 1.5,
                              )),
                          height: 500,
                          width: 362,
                          // color: Colors.white,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  'Question',
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '$mcq',
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: Text(
                                  'Assesment: ',
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '$promptResponse',
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '$percentScore',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '$sessionScore',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
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
                          generateAns();
                        },
                      );
                    },
                    decoration: InputDecoration(
                      prefixIconColor: Colors.orangeAccent,
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.orangeAccent, width: 2.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orangeAccent),
                      ),
                      // border: OutlineInputBorder(),
                      hintStyle: const TextStyle(color: Colors.white),
                      hintText: 'Enter Your Answer',
                      prefixIcon: const Icon(Icons.data_array),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _textControllerAns.clear();
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          mcq = '';
                          answer = '';
                          promptResponse = '';
                        },
                      );
                      generateQsn();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent),
                    child: Text(
                      'Generate Question',
                      style:
                          GoogleFonts.ubuntu(color: Colors.black, fontSize: 17),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
