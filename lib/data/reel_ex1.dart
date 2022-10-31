import 'package:deneme_instagram1/widgets/circle_story.dart';
import 'package:deneme_instagram1/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReelEx1 extends StatelessWidget {
  const ReelEx1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'Reels',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(child: Center(
            child: Consumer(
              builder: (context, ref, child) {
                var text = ref.watch(reeltext);
                return Text(
                  text,
                  style: TextStyle(color: Colors.white),
                );
              },
            ),
            /*Text(
              'REEL 1 (video koymadım..)',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),*/
          )),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 30,
                            ),
                            Consumer(
                              builder: (context, ref, child) {
                                var text1 = ref.watch(reeltext1);
                                return Text(
                                  text1,
                                  style: TextStyle(color: Colors.white),
                                );
                              },
                            ),
                            /*Text(
                              '122k',
                              style: TextStyle(color: Colors.white),
                            )*/
                          ],
                        ),
                      )
                    ],
                  ),
                  //////////////////////////////////////////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            Consumer(
                              builder: (context, ref, child) {
                                var text2 = ref.watch(reeltext2);
                                return Text(
                                  text2,
                                  style: TextStyle(color: Colors.white),
                                );
                              },
                            ),

                            /*  Text(
                              '563',
                              style: TextStyle(color: Colors.white),
                            )*/
                          ],
                        ),
                      )
                    ],
                  ),
                  ///////////////////////////////////////////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0, top: 3),
                            child: SizedBox(
                                height: 55, width: 55, child: CircleStory()),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Consumer(
                            builder: (context, ref, child) {
                              var text3 = ref.watch(reeltext3);
                              return Text(
                                text3,
                                style: TextStyle(color: Colors.white),
                              );
                            },
                          ),

                          /*   Text(
                            'hasanalişen',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),*/
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.near_me_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  /////////////////////////////////
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
