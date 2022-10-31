// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class ButtonWidget extends StatefulWidget {
  final String title;
  final VoidCallback onTab;
  const ButtonWidget({Key? key, required this.title, required this.onTab})
      : super(key: key);

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: widget.onTab,
      child: Container(
        margin: EdgeInsets.only(left: 22, right: 26),
        padding: EdgeInsets.only(right: 26, left: 22),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
