import 'package:deneme_instagram1/locator/locator.dart';
import 'package:deneme_instagram1/model/user_model.dart';
import 'package:deneme_instagram1/repository/user_repository.dart';
import 'package:deneme_instagram1/services/auth_base.dart';
import 'package:flutter/material.dart';

enum ViewState { Idle, Busy }

class UserModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  UserData? _user;

  UserData? get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel() {
    currentUser();
  }

//ilgili repositorye istekte bulunuruz bu alanlardan
  @override
  Future<UserData?> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      return _user;
    } catch (e) {
      debugPrint("Viewmodeldeki current user hata:" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      bool sonuc = await _userRepository.signOut();
      _user = null;
      return sonuc;
    } catch (e) {
      debugPrint("ViewModeldeki signOut hata:" + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserData?> signInAnonymously() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInAnonymously();
      return _user;
    } catch (e) {
      debugPrint("ViewModeldeki SignAnonmysly hata:" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserData?> signInWithGoogle() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInWithGoogle();
      if (_user != null)
        return _user;
      else
        return null;
    } catch (e) {
      debugPrint("Viewmodeldeki current user hata:" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserData?> createEmailandPassword(String email, String sifre) async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.createEmailandPassword(email, sifre);
      return _user;
    } catch (e) {
      debugPrint(
          "Viewmodeldeki createWithEmailandPassword user hata:" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserData?> signInWithEmailandPassword(
      String email, String sifre) async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInWithEmailandPassword(email, sifre);
      return _user;
    } catch (e) {
      debugPrint(
          "Viewmodeldeki signInWithEmailandPassword  hata:" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }
}
