// ignore_for_file: constant_identifier_names, prefer_final_fields

import 'package:deneme_instagram1/locator/locator.dart';
import 'package:deneme_instagram1/model/user_model.dart';
import 'package:deneme_instagram1/services/auth_base.dart';
import 'package:deneme_instagram1/services/fake_auth_service.dart';
import 'package:deneme_instagram1/services/firebase_auth_service.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthenticationService _fakeAuthenticationService =
      locator<FakeAuthenticationService>();

//Debug konuma getirerek kendi oluşturduğumuz firebase kuallanıcı ile bağlanır
//RELEASE konuma getirirsek kendi firebaseden kayıt oluşturarak online kullanıcı oluşturur
  AppMode appMode = AppMode.RELEASE;

  @override
  Future<UserData?> currentUser() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.currentUser();
    } else {
      return await _firebaseAuthService.currentUser();
    }
  }

  @override
  Future<bool> signOut() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signOut();
    } else {
      return await _firebaseAuthService.signOut();
    }
  }

  @override
  Future<UserData?> signInAnonymously() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInAnonymously();
    } else {
      return await _firebaseAuthService.signInAnonymously();
    }
  }

  @override
  Future<UserData?> signInWithGoogle() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInWithGoogle();
    } else {
      return await _firebaseAuthService.signInWithGoogle();
    }
  }

  @override
  Future<UserData?> createEmailandPassword(String email, String sifre) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.createEmailandPassword(
          email, sifre);
    } else {
      return await _firebaseAuthService.createEmailandPassword(email, sifre);
    }
  }

  @override
  Future<UserData?> signInWithEmailandPassword(
      String email, String sifre) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInWithEmailandPassword(
          email, sifre);
    } else {
      return await _firebaseAuthService.signInWithEmailandPassword(
          email, sifre);
    }
  }
}
