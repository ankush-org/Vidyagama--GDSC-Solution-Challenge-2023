import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Backend/Data/state_management.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  //Variables
  String? mcq;

  //Chat GPT
  late OpenAI? chatGPT;

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
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          mcq = ref.watch(mcqQuestion);
          return SafeArea(child: Center(child: Text('$mcq')));
        },
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(onPressed: () async {
            //Prompting for Quesn Generation
            print('pressed'); //Debug
            final request = CompleteText(
                prompt: 'Make another mcq question on algebra with solution',
                model: kTranslateModelV3);
            final response = await chatGPT!.onCompleteText(request: request);
            print(response!.choices[0].text); //Debug
            // // Checking State
            ref
                .read(mcqQuestion.notifier)
                .update((state) => response.choices[0].text.toString());
            // //
          });
        },
      ),
    );
  }
}
