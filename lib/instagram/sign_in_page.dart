// ignore_for_file: unnecessary_null_comparison, use_key_in_widget_constructors, curly_braces_in_flow_control_structures, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:deneme_instagram1/instagram/email_sifre_giris_kayit.dart';
import 'package:deneme_instagram1/instagram/social_log_in_button.dart';
import 'package:deneme_instagram1/model/user_model.dart';
import 'package:deneme_instagram1/viewmodel/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  void _misafirGiris(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    UserData? _user = await _userModel.signInAnonymously();
    debugPrint("Oturum açan user id :" + _user!.userID.toString());
  }

  void _googleIleGiris(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    UserData? _user = await _userModel.signInWithGoogle();
    if (_user!.userID != null)
      debugPrint("Oturum açan user id :" + _user.userID.toString());
  }

  void _emailVeSifreGiris(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EmailveSifreLoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text(
          "Wingding",
          style: TextStyle(fontSize: 24),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Oturum Açın",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            SocialLoginButton(
              butonText: "Google İle Giriş Yap",
              textColor: Colors.black87,
              butonColor: Colors.white,
              butonIcon: Image.asset("assets/images/google-logo.png"),
              onPressed: () => _googleIleGiris(context),
            ),
            /*   SocialLoginButton(
              butonText: "Facebook ile Giriş Yap",
              butonIcon: Image.asset("images/facebook-logo.png"),
              butonColor: Color(0XFF334D92),
              onPressed: () {},
            ),*/
            SocialLoginButton(
              butonText: "E-mail ve Şifre İle Giriş Yap",
              butonIcon: Icon(
                Icons.email,
                size: 32,
                color: Colors.white,
              ),
              butonColor: Colors.blue,
              onPressed: () => _emailVeSifreGiris(context),
            ),
            SocialLoginButton(
              butonText: "Misafir Giriş Yap",
              butonIcon: Icon(Icons.supervised_user_circle),
              butonColor: Colors.teal,
              onPressed: () => _misafirGiris(context),
            )
          ],
        ),
      ),
    );
  }
}
