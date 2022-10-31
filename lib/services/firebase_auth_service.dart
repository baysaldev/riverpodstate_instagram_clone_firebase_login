// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:deneme_instagram1/model/user_model.dart';
import 'package:deneme_instagram1/services/auth_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserData?> currentUser() async {
    try {
      User? user = await _firebaseAuth.currentUser;
      return _userFromFirebase(user);
    } catch (e) {
      debugPrint("hata current user " + e.toString());
      return null;
    }
  }

  UserData _userFromFirebase(User? user) {
    if (user == null) {
      //throw FirebaseAuthException(code: '');
      return null!;
    } else {
      return UserData(userID: user.uid);
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      final _gooleSignIn = GoogleSignIn();
      await _gooleSignIn.signOut();
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      debugPrint("hata  signOut" + e.toString());
      return false;
    }
  }

  @override
  Future<UserData?> signInAnonymously() async {
    try {
      UserCredential sonuc = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(sonuc.user);
    } catch (e) {
      debugPrint("anonim giriş hata" + e.toString());
      return null;
    }
  }

  @override
  Future<UserData?> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();

    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        UserCredential sonuc = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken));
        User? _user = sonuc.user;
        return _userFromFirebase(_user);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<UserData?> createEmailandPassword(String email, String sifre) async {
    UserCredential sonuc = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: sifre);
    return _userFromFirebase(sonuc.user);
  }

  @override
  Future<UserData?> signInWithEmailandPassword(
      String email, String sifre) async {
    UserCredential sonuc = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: sifre);
    return _userFromFirebase(sonuc.user);
  }
}
