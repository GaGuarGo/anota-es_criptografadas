import 'package:criptografia_anotacoes/models/user_model.dart';
import 'package:criptografia_anotacoes/screens/login/login_screen.dart';
import 'package:criptografia_anotacoes/screens/note/note_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'user.g.dart';

class User = UserBase with _$User;

abstract class UserBase with Store {
  @observable
  bool loading = false;

  @observable
  String login = "";

  @observable
  String password = "";

  @action
  String onChangedLogin(String text) {
    login = text;
    return login;
  }

  @action
  String onChangedPassword(String text) {
    password = text;
    return password;
  }

  @computed
  UserModel get user => UserModel(login, password);

  @computed
  bool get loginValid => login.isNotEmpty && login.length > 5;

  @computed
  bool get passValid => password.isNotEmpty && password.length > 5;

  @computed
  bool get buttonValid => loginValid && passValid;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @action
  Future<void> entrar(context) async {
    loading = true;

    if (await verifyUser()) {
      await getUser().then((value) {
        loading = false;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => NoteScreen(
                  user: user,
                )));
      });
    } else {
      final SharedPreferences prefs = await _prefs;
      await prefs.setStringList('user/${login.toLowerCase().trim()}$password', [
        login,
        password,
      ]).then((value) {
        loading = false;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => NoteScreen(
                  user: user,
                )));
      });
    }
  }

  @action
  void sair(context) {
    login = "";
    password = "";

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @action
  Future<bool> verifyUser() async {
    final SharedPreferences prefs = await _prefs;

    final user =
        prefs.getStringList('user/${login.toLowerCase().trim()}$password');
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }

  @action
  Future<void> getUser() async {
    final SharedPreferences prefs = await _prefs;

    final docUser =
        prefs.getStringList('user/${login.toLowerCase().trim()}$password');

    login = docUser![0];
    password = docUser[1];
  }
}
