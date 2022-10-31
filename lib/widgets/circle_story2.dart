import 'package:flutter/material.dart';

class CircleStory2 extends StatelessWidget {
  const CircleStory2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(6.0),
      child: ClipOval(
        child: Image(
          height: 68,
          width: 68,
          image: NetworkImage(
              'https://i4.hurimg.com/i/hurriyet/75/0x0/61f375e1c03c0e41f4c1d0e8.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
