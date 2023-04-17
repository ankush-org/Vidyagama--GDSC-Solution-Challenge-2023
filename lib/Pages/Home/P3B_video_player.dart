import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsc/Pages/BaseScaffold.dart';
import 'package:gsc/Pages/Test/P4A_testing.dart';
import 'package:gsc/Pages/Test/P4B_test.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class VideoPlayerHome extends StatefulWidget {
  const VideoPlayerHome({super.key});

  @override
  State<VideoPlayerHome> createState() => _VideoPlayerHomeState();
}

class _VideoPlayerHomeState extends State<VideoPlayerHome> {
  //Variables
  String? mcq = '';
  String? answer = '';
  String? promptResponse = '';
  int percentScore = 0;
  int sessionScore = 0;

  //Doubt
  String? question = '';
  String? qsnResponse = '';

  final _textControllerAns = TextEditingController();
  final _textControllerQsn = TextEditingController();

  //Chat GPT
  late OpenAI? chatGPT;

  //Quiery Gen
  Future generateQsn() async {
    //Prompting for Quesn Generation
    print('pressed'); //Debug
    final request = CompleteText(
        prompt: 'Ask a question on basic addition', model: kTranslateModelV3);
    final response = await chatGPT!.onCompleteText(request: request);
    print(response!.choices[0].text); //Debug
    setState(
      () {
        mcq = response.choices[0].text;
      },
    );
  }

  // Ask Question
  //Quiery Gen
  Future askQuestion(String qsn) async {
    //Prompting for Quesn Generation
    print('pressed aske question'); //Debug
    print(qsn);
    final request3 = CompleteText(prompt: qsn, model: kTranslateModelV3);
    print(request3.prompt);
    final response3 = await chatGPT!.onCompleteText(request: request3);
    print(response3!.choices[0].text); //Debug
    setState(
      () {
        print('set cale');
        qsnResponse = response3.choices[0].text;
        print(qsnResponse);
      },
    );
  }

  //Generating a Response
  Future generateAns() async {
    //prompting for an answer review
    final request2 = CompleteText(
      prompt:
          'Just tell if "${int.parse(answer.toString())}" is correct answer to the question "$mcq", and give me a percentage score, do not explain the solution',
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
        // token: "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",
        //updated api-key
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
    return DefaultTabController(
      length: 4,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 30,
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
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 23.0),
                child: Image.asset("lib/assets/thmb.jpg"),
              ),
              const TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.grey,
                tabs: [
                  Tab(
                    height: 70,
                    text: 'Description',
                    icon: Icon(
                      Icons.info,
                      color: Color.fromARGB(255, 245, 225, 151),
                      size: 25,
                    ),
                  ),
                  Tab(
                    height: 70,
                    text: 'Playlist',
                    icon: Icon(
                      Icons.video_collection,
                      size: 25,
                      color: Color.fromARGB(255, 245, 225, 151),
                    ),
                  ),
                  Tab(
                    height: 70,
                    text: 'Classroom',
                    icon: Icon(
                      Icons.people,
                      size: 25,
                      color: Color.fromARGB(255, 245, 225, 151),
                    ),
                  ),
                  Tab(
                    height: 70,
                    text: 'Doubt',
                    icon: Icon(
                      Icons.question_mark,
                      size: 25,
                      color: Color.fromARGB(255, 245, 225, 151),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        //Description Tab
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 10),
                          child: Text(
                            'Addition in math is a process of combining two or more numbers. Addends are the numbers being added, and the result or the final answer we get after the process is called the sum. It is one of the essential mathematical functions we use in our everyday activities. There are many situations in which we add numbers. One of the most common everyday uses for adding numbers is when we work with time or money—for example, adding up bills and receipts.',
                            style: GoogleFonts.ubuntu(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Download Notes'),
                          ),
                        ),
                      ],
                    ),
                    //Playlist Tab
                    Image.asset("lib/assets/plalist.jpg"),
                    //CLassroom Tab
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: LinearPercentIndicator(
                              lineHeight: 45,
                              width: 355,
                              progressColor: Colors.redAccent,
                              percent: (sessionScore / 1000).toDouble(),
                              center: Text(
                                'Classroom Score: $sessionScore',
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
                                          color: Color.fromARGB(
                                              255, 245, 225, 151),
                                          width: 1.5,
                                        )),
                                    height: 220,
                                    width: 340,
                                    // color: Colors.white,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Center(
                                            child: Text(
                                              'Question',
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              '$mcq',
                                              style: GoogleFonts.aBeeZee(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: Text(
                                              'Assesment: ',
                                              style: GoogleFonts.ubuntu(
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                '$promptResponse',
                                                style: GoogleFonts.aBeeZee(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          )
                                          // Center(
                                          //   child: Text(
                                          //     '$percentScore',
                                          //     style: const TextStyle(
                                          //         color: Colors.white),
                                          //   ),
                                          // ),
                                          // Center(
                                          //   child: Text(
                                          //     '$sessionScore',
                                          //     style: const TextStyle(
                                          //         color: Colors.white),
                                          //   ),
                                          // )
                                        ],
                                      ),
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
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 245, 225, 151),
                                      width: 2.0),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 245, 225, 151)),
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
                                  backgroundColor:
                                      Color.fromARGB(255, 245, 225, 151)),
                              child: Text(
                                'Get Assignment',
                                style: GoogleFonts.ubuntu(
                                    color: Colors.black, fontSize: 17),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Color.fromARGB(255, 245, 225, 151),
                                      width: 1.5,
                                    )),
                                height: 220,
                                width: 340,
                                child: Center(
                                  child: Text(
                                    'Response $qsnResponse',
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: TextField(
                                style: const TextStyle(color: Colors.white),
                                controller: _textControllerQsn,
                                onSubmitted: (val) {
                                  setState(
                                    () {
                                      question = val;
                                      print(question);
                                    },
                                  );
                                  askQuestion(question.toString());
                                  print(qsnResponse);
                                },
                                decoration: InputDecoration(
                                  prefixIconColor: Colors.orangeAccent,
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 245, 225, 151),
                                        width: 2.0),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 245, 225, 151)),
                                  ),
                                  // border: OutlineInputBorder(),
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  hintText: 'Ask Your Doubt',
                                  prefixIcon: const Icon(Icons.data_array),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      _textControllerQsn.clear();
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
