import 'package:deneme_instagram1/data/reel_ex1.dart';
import 'package:deneme_instagram1/data/reel_ex2.dart';
import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  ReelsScreen({Key? key}) : super(key: key);

  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: [ReelEx1(), ReelEx2()],
      ),
    );
  }
}
