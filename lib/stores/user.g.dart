// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$User on UserBase, Store {
  Computed<UserModel>? _$userComputed;

  @override
  UserModel get user => (_$userComputed ??=
          Computed<UserModel>(() => super.user, name: 'UserBase.user'))
      .value;
  Computed<bool>? _$loginValidComputed;

  @override
  bool get loginValid => (_$loginValidComputed ??=
          Computed<bool>(() => super.loginValid, name: 'UserBase.loginValid'))
      .value;
  Computed<bool>? _$passValidComputed;

  @override
  bool get passValid => (_$passValidComputed ??=
          Computed<bool>(() => super.passValid, name: 'UserBase.passValid'))
      .value;
  Computed<bool>? _$buttonValidComputed;

  @override
  bool get buttonValid => (_$buttonValidComputed ??=
          Computed<bool>(() => super.buttonValid, name: 'UserBase.buttonValid'))
      .value;

  late final _$loadingAtom = Atom(name: 'UserBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$loginAtom = Atom(name: 'UserBase.login', context: context);

  @override
  String get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  late final _$passwordAtom = Atom(name: 'UserBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$entrarAsyncAction =
      AsyncAction('UserBase.entrar', context: context);

  @override
  Future<void> entrar(dynamic context) {
    return _$entrarAsyncAction.run(() => super.entrar(context));
  }

  late final _$verifyUserAsyncAction =
      AsyncAction('UserBase.verifyUser', context: context);

  @override
  Future<bool> verifyUser() {
    return _$verifyUserAsyncAction.run(() => super.verifyUser());
  }

  late final _$getUserAsyncAction =
      AsyncAction('UserBase.getUser', context: context);

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$UserBaseActionController =
      ActionController(name: 'UserBase', context: context);

  @override
  String onChangedLogin(String text) {
    final _$actionInfo =
        _$UserBaseActionController.startAction(name: 'UserBase.onChangedLogin');
    try {
      return super.onChangedLogin(text);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String onChangedPassword(String text) {
    final _$actionInfo = _$UserBaseActionController.startAction(
        name: 'UserBase.onChangedPassword');
    try {
      return super.onChangedPassword(text);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sair(dynamic context) {
    final _$actionInfo =
        _$UserBaseActionController.startAction(name: 'UserBase.sair');
    try {
      return super.sair(context);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
login: ${login},
password: ${password},
user: ${user},
loginValid: ${loginValid},
passValid: ${passValid},
buttonValid: ${buttonValid}
    ''';
  }
}
