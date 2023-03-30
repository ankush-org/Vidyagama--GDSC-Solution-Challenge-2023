import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsc/Pages/BaseScaffold.dart';
import 'package:gsc/Pages/Test/P4A_testing.dart';
import 'package:gsc/Pages/Test/P4B_test.dart';

class VideoPlayerHome extends StatefulWidget {
  const VideoPlayerHome({super.key});

  @override
  State<VideoPlayerHome> createState() => _VideoPlayerHomeState();
}

class _VideoPlayerHomeState extends State<VideoPlayerHome> {
  //Variables
  String? mcq;
  String? answer;
  String? response;

  final _textControllerAns = TextEditingController();

  //Chat GPT
  late OpenAI? chatGPT;

  //Quiery Gen
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
    return DefaultTabController(
      length: 3,
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
                      size: 30,
                    ),
                  ),
                  Tab(
                    height: 70,
                    text: 'Playlist',
                    icon: Icon(
                      Icons.video_collection,
                      color: Color.fromARGB(255, 245, 225, 151),
                    ),
                  ),
                  Tab(
                    height: 70,
                    text: 'Classroom',
                    icon: Icon(
                      Icons.people,
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
                          'Plastic pollution is one of the most significant environmental issues of our time. Plastic waste can take hundreds of years to decompose, and when it does, it releases harmful chemicals that can pollute our soil, water, and air. Plastic pollution also harms wildlife, as animals can become entangled in plastic debris or mistake it for food, leading to injury or death.',
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
                  Container(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
