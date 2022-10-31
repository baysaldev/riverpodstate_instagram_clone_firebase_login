import 'package:deneme_instagram1/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'circle_story2.dart';

class PostCart2 extends StatelessWidget {
  const PostCart2({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        /////////////////////////////////////////////////////////////////////
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 3),
                  child: SizedBox(height: 55, width: 55, child: CircleStory2()),
                ),
                SizedBox(
                  width: 3,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    var text1 = ref.watch(postcart2text1);
                    return Text(
                      text1,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    );
                  },
                ),

                /*  Text(
                  'barısalper',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )*/
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            )
          ],
        ),
        ///////////////////////////////////////////////////////////////////////////
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Image(
              image: NetworkImage(
                  'https://i4.hurimg.com/i/hurriyet/75/0x0/61f375e1c03c0e41f4c1d0e8.jpg')),
        ),
        //////////////////////////////////////////////////////////////////////////
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 2.0),
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13.0),
                    child: Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13.0),
                    child: Icon(
                      Icons.near_me_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
              const Icon(
                Icons.bookmark_border,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  var text2 = ref.watch(postcart2text2);
                  return Text(text2, style: TextStyle(color: Colors.white));
                },
              ),

              /*Text(
                'pınarsendul ve 57 diğer kişi beğendi',
                style: TextStyle(color: Colors.white),
              ),*/
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Consumer(
                    builder: (context, ref, child) {
                      var text3 = ref.watch(postcart2text3);
                      return Text(text3,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold));
                    },
                  ),

                  /*  Text(
                    'barısalper :',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),*/
                ),
                SizedBox(
                  width: 3,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    var text4 = ref.watch(postcart2text4);
                    return Text(
                      text4,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    );
                  },
                ),

                /* Text(
                  'Antreman...',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),*/
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  var text5 = ref.watch(postcart2text5);
                  return Text(
                    text5,
                    style: TextStyle(color: Colors.grey.shade500),
                  );
                },
              ),

              /* Text(
                '145 Görüntüleme',
                style: TextStyle(color: Colors.grey.shade500),
              ),*/
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 5),
          child: Row(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  var text6 = ref.watch(postcart2text6);
                  return Text(
                    text6,
                    style: TextStyle(color: Colors.grey.shade500),
                  );
                },
              ),

              /*Text(
                '13 haziran 2022',
                style: TextStyle(color: Colors.grey.shade500),
              ),*/
            ],
          ),
        ),
      ],
    );
  }
}
