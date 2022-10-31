import 'package:deneme_instagram1/instagram/login_screen.dart';
import 'package:deneme_instagram1/widgets/circle_story.dart';
import 'package:deneme_instagram1/widgets/constants.dart';
import 'package:deneme_instagram1/widgets/story_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends StatelessWidget {
  final List _stories = ['natural', 'animal', 'historical', 'visited', 'me'];

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            title: Consumer(
              builder: (context, ref, child) {
                var text1 = ref.watch(postcart2text1);
                return Text(
                  text1,
                  style: TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),

            /* Text(
              'aslıakalın35',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),*/
            actions: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add_box_outlined,
                      size: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.table_rows_rounded,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0, left: 10),
                    child: CircleStory(),
                  ),
                  Row(
                    children: [
                      Column(
                        children: const [
                          Text(
                            '10',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          Text(
                            'Gönderiler',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        '405',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      Text(
                        'Takipçi',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 26.0),
                    child: Column(
                      children: const [
                        Text(
                          '130',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Text(
                          'Takip',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //////////////////////////////////////////////////////////////////////
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Aslı Akalın',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'İzmir / KİMYA mühendisliği / DEU',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              //////////////////////////////////////////////////////////
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      width: 330,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade700,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                          child: Text(
                        'Profili Düzenle',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Icon(
                            Icons.person_add,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
              /////////////////////////////////////////////////////////////
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 18),
                    child: Text(
                      'Hikayenin Öne Çıkanları',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 6.0, left: 18),
                    child: Text(
                      'Favori hikayelerinizi profilinizde tutun',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              ///////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 120,
                child: ListView.builder(
                    itemCount: _stories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return StoryWidget(
                        username: _stories[index],
                      );
                    }),
              ),

              const TabBar(tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.video_collection_outlined),
                ),
                Tab(
                  icon: Icon(Icons.person_add_alt_outlined),
                ),
              ]),

              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 50,
                          ),
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 60,
                          ),
                          Text(
                            "Henüz Gönderi Yok",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 50,
                          ),
                          Icon(
                            Icons.person_add,
                            color: Colors.white,
                            size: 60,
                          ),
                          Text(
                            "Fotoğraf ve videolarınız",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
