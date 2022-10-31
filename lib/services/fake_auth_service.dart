// ignore_for_file: prefer_const_constructors

import 'package:deneme_instagram1/model/user_model.dart';
import 'package:deneme_instagram1/services/auth_base.dart';

class FakeAuthenticationService implements AuthBase {
  String userID = "123456798";

  @override
  Future<UserData> currentUser() async {
    return await Future.value(UserData(
      userID: userID,
    ));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<UserData> signInAnonymously() async {
    return await Future.delayed(
        Duration(seconds: 2),
        () => UserData(
              userID: userID,
            ));
  }

  @override
  Future<UserData?> signInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<UserData?> createEmailandPassword(String email, String sifre) {
    throw UnimplementedError();
  }

  @override
  Future<UserData?> signInWithEmailandPassword(String email, String sifre) {
    throw UnimplementedError();
  }
}
