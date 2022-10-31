// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:deneme_instagram1/instagram/hata_exception.dart';
import 'package:deneme_instagram1/instagram/social_log_in_button.dart';
import 'package:deneme_instagram1/model/user_model.dart';
import 'package:deneme_instagram1/viewmodel/user_view_model.dart';
import 'package:deneme_instagram1/widgets/platform_duyarli_alert_dialog.dart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FormType { Register, LogIn }

class EmailveSifreLoginPage extends StatefulWidget {
  @override
  _EmailveSifreLoginPageState createState() => _EmailveSifreLoginPageState();
}

class _EmailveSifreLoginPageState extends State<EmailveSifreLoginPage> {
  String? _email, _sifre;
  String? _butonText, _linkText;
  var _formType = FormType.LogIn;

  final _formKey = GlobalKey<FormState>();

  void _formSubmit() async {
    _formKey.currentState!.save();
    debugPrint("email :" + _email! + " şifre:" + _sifre!);

    final _userModel = Provider.of<UserModel>(context, listen: false);

    if (_formType == FormType.LogIn) {
      try {
        UserData? _girisYapanUser =
            await _userModel.signInWithEmailandPassword(_email!, _sifre!);
        //if (_girisYapanUser != null)
        //print("Oturum açan user id:" + _girisYapanUser.userID.toString());
      } on FirebaseAuthException catch (e) {
        print("hata ${e.code}");
        PlatformDuyarliAlertDialog(
          baslik: "Oturum Açma HATA",
          icerik: Hatalar.goster(e.code),
          anaButonYazisi: 'Tamam',
        ).goster(context);
      }
    } else {
      try {
        UserData? _olusturulanUser =
            await _userModel.createEmailandPassword(_email!, _sifre!);
        /* if (_olusturulanUser != null)
          print("Oturum açan user id:" + _olusturulanUser.userID.toString());*/
      } on FirebaseAuthException catch (e) {
        print("hata ${e.code}");
        PlatformDuyarliAlertDialog(
          baslik: "Kullanıcı Oluşturma HATA",
          icerik: Hatalar.goster(e.code),
          anaButonYazisi: 'Tamam',
        ).goster(context);
      }
    }
  }

  void _degistir() {
    setState(() {
      _formType =
          _formType == FormType.LogIn ? FormType.Register : FormType.LogIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    _butonText = _formType == FormType.LogIn ? "Giriş Yap " : "Kayıt Ol";
    _linkText = _formType == FormType.LogIn
        ? "Hesabınız Yok Mu? Kayıt Olun"
        : "Hesabınız Var Mı? Giriş Yapın";
    final _userModel = Provider.of<UserModel>(context);

    if (_userModel.user != null) {
      Future.delayed(Duration(milliseconds: 1), () {
        Navigator.of(context).popUntil(ModalRoute.withName("/"));
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: _userModel.state == ViewState.Idle
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                            height: 60,
                            width: 180,
                            child: Image(
                              image:
                                  AssetImage('assets/images/google-logo.png'),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          //initialValue: "emre@emre.com",
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: 'Email',
                            labelText: 'Phone number,username or email adress',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            fillColor: Colors.grey.shade700,
                            filled: true,
                            prefixIconColor: Colors.white,
                            constraints:
                                BoxConstraints.tightFor(width: 365, height: 50),
                          ),
                          onSaved: (String? girilenEmail) {
                            _email = girilenEmail;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: 'Password',
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            fillColor: Colors.grey.shade700,
                            filled: true,
                            prefixIconColor: Colors.white,
                            constraints:
                                BoxConstraints.tightFor(width: 365, height: 50),
                          ),
                          onSaved: (String? girilenSifre) {
                            _sifre = girilenSifre;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgetten Passwword?",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SocialLoginButton(
                          butonText: _butonText,
                          butonColor: Theme.of(context).primaryColor,
                          radius: 10,
                          onPressed: () => _formSubmit(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                          onPressed: () => _degistir(),
                          child: Text(_linkText!),
                        ),
                      ],
                    )),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
