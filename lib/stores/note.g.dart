// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Note on NoteBase, Store {
  late final _$loadingAtom = Atom(name: 'NoteBase.loading', context: context);

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

  late final _$noteAtom = Atom(name: 'NoteBase.note', context: context);

  @override
  String get note {
    _$noteAtom.reportRead();
    return super.note;
  }

  @override
  set note(String value) {
    _$noteAtom.reportWrite(value, super.note, () {
      super.note = value;
    });
  }

  late final _$saveNoteAsyncAction =
      AsyncAction('NoteBase.saveNote', context: context);

  @override
  Future<void> saveNote(String login, String pass) {
    return _$saveNoteAsyncAction.run(() => super.saveNote(login, pass));
  }

  late final _$getNoteAsyncAction =
      AsyncAction('NoteBase.getNote', context: context);

  @override
  Future<String> getNote(String login, String pass) {
    return _$getNoteAsyncAction.run(() => super.getNote(login, pass));
  }

  late final _$criptAsyncAction =
      AsyncAction('NoteBase.cript', context: context);

  @override
  Future<void> cript(String login, String pass) {
    return _$criptAsyncAction.run(() => super.cript(login, pass));
  }

  late final _$deCriptAsyncAction =
      AsyncAction('NoteBase.deCript', context: context);

  @override
  Future<void> deCript(String login, String pass) {
    return _$deCriptAsyncAction.run(() => super.deCript(login, pass));
  }

  late final _$NoteBaseActionController =
      ActionController(name: 'NoteBase', context: context);

  @override
  String onChanged(String value) {
    final _$actionInfo =
        _$NoteBaseActionController.startAction(name: 'NoteBase.onChanged');
    try {
      return super.onChanged(value);
    } finally {
      _$NoteBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
note: ${note}
    ''';
  }
}
