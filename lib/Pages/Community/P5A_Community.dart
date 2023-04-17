import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 55,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Community",
              style: GoogleFonts.ubuntu(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              //  TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Center(
                    child: SizedBox(
                      height: 300,
                      width: 375,
                      //Post Stack
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            child: Container(
                              height: 280,
                              width: 275,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 245, 225, 151),
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 290,
                            top: 240,
                            child: LikeButton(
                              size: 35,
                              likeCount: 230,
                              countPostion: CountPostion.bottom,
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 285,
                            child: Image.asset(
                              "lib/assets/pfp1.png",
                              scale: 2.2,
                            ),
                          ),
                          Positioned(
                            left: 290,
                            top: 170,
                            child: LikeButton(
                              size: 35,
                              // likeCount: 230,
                              countPostion: CountPostion.bottom,
                              likeBuilder: ((isTapped) {
                                return Icon(
                                  FontAwesomeIcons.radiation,
                                  color: isTapped
                                      ? Colors.orangeAccent
                                      : Colors.grey,
                                  size: 35,
                                );
                              }),
                            ),
                          ),
                          Positioned(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 60.0, left: 45, right: 50, bottom: 50),
                              child: LottieBuilder.network(
                                  'https://assets9.lottiefiles.com/packages/lf20_o86x2brk.json'),
                            ),
                          ),
                          Positioned(
                            top: 250,
                            left: 40,
                            child: Text(
                              "Ayana's First Victory",
                              style: GoogleFonts.satisfy(
                                  color: Colors.white, fontSize: 25),
                            ),
                          ),
                          const Positioned(
                            left: 285,
                            top: 95,
                            child: Icon(
                              Icons.verified,
                              size: 45,
                              color: Colors.white,
                            ),
                          ),
                          const Positioned(
                            left: 293,
                            top: 105,
                            child: Icon(
                              Icons.circle,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            top: 107,
                            left: 295,
                            child: Text(
                              '17',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                //
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Center(
                    child: SizedBox(
                      height: 300,
                      width: 375,
                      //Post Stack
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            child: Container(
                              height: 280,
                              width: 275,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 245, 225, 151),
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 290,
                            top: 240,
                            child: LikeButton(
                              size: 35,
                              likeCount: 230,
                              countPostion: CountPostion.bottom,
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 285,
                            child: Image.asset(
                              "lib/assets/pfp1.png",
                              scale: 2.2,
                            ),
                          ),
                          Positioned(
                            left: 290,
                            top: 170,
                            child: LikeButton(
                              size: 35,
                              // likeCount: 230,
                              countPostion: CountPostion.bottom,
                              likeBuilder: ((isTapped) {
                                return Icon(
                                  FontAwesomeIcons.radiation,
                                  color: isTapped
                                      ? Colors.orangeAccent
                                      : Colors.grey,
                                  size: 35,
                                );
                              }),
                            ),
                          ),
                          Positioned(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 60.0, left: 45, right: 50, bottom: 50),
                              child: LottieBuilder.network(
                                  'https://assets6.lottiefiles.com/packages/lf20_oU9zo80dMq.json'),
                            ),
                          ),
                          Positioned(
                            top: 250,
                            left: 12,
                            child: Text(
                              "Aryaman's Winning Streak",
                              style: GoogleFonts.satisfy(
                                  color: Colors.white, fontSize: 25),
                            ),
                          ),
                          const Positioned(
                            left: 285,
                            top: 95,
                            child: Icon(
                              Icons.verified,
                              size: 45,
                              color: Colors.white,
                            ),
                          ),
                          const Positioned(
                            left: 293,
                            top: 105,
                            child: Icon(
                              Icons.circle,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            top: 107,
                            left: 295,
                            child: Text(
                              '17',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Center(
                    child: SizedBox(
                      height: 300,
                      width: 375,
                      //Post Stack
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            child: Container(
                              height: 280,
                              width: 275,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 245, 225, 151),
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 290,
                            top: 240,
                            child: LikeButton(
                              size: 35,
                              likeCount: 230,
                              countPostion: CountPostion.bottom,
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 285,
                            child: Image.asset(
                              "lib/assets/pfp1.png",
                              scale: 2.2,
                            ),
                          ),
                          Positioned(
                            left: 290,
                            top: 170,
                            child: LikeButton(
                              size: 35,
                              // likeCount: 230,
                              countPostion: CountPostion.bottom,
                              likeBuilder: ((isTapped) {
                                return Icon(
                                  FontAwesomeIcons.radiation,
                                  color: isTapped
                                      ? Colors.orangeAccent
                                      : Colors.grey,
                                  size: 35,
                                );
                              }),
                            ),
                          ),
                          Positioned(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 60.0, left: 45, right: 50, bottom: 50),
                              child: LottieBuilder.network(
                                  'https://assets10.lottiefiles.com/packages/lf20_uktq0eKz9C.json'),
                            ),
                          ),
                          Positioned(
                            top: 250,
                            left: 40,
                            child: Text(
                              "Nihar got to ACE 5",
                              style: GoogleFonts.satisfy(
                                  color: Colors.white, fontSize: 25),
                            ),
                          ),
                          const Positioned(
                            left: 285,
                            top: 95,
                            child: Icon(
                              Icons.verified,
                              size: 45,
                              color: Colors.white,
                            ),
                          ),
                          const Positioned(
                            left: 293,
                            top: 105,
                            child: Icon(
                              Icons.circle,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            top: 107,
                            left: 295,
                            child: Text(
                              '17',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
