// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers

import 'package:deneme_instagram1/instagram/email_sifre_giris_kayit.dart';
import 'package:deneme_instagram1/instagram/home_screen.dart';
import 'package:deneme_instagram1/instagram/login_screen.dart';
import 'package:deneme_instagram1/instagram/sign_in_page.dart';
import 'package:deneme_instagram1/viewmodel/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//UYGULAMAMIZI BU SAYFADAN BAŞLATIYORUZ
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: true);

    if (_userModel.state == ViewState.Idle) {
      if (_userModel.user == null) {
        return SignInPage();
      } else {
        return HomeScreen();
      }
    } else {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }
}


























/* if (_userModel.user == null) {
      return SignInPage();
    } else {
      return HomePage(user: _userModel.user!);
    } */


    /* if (_userModel.state == ViewState.Idle) {
      if (_userModel.user == null) {
        return SignInPage();
      } else {
        return HomePage(user: _userModel.user!);
      }
    } else {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } */