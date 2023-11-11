// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'note.g.dart';

class Note = NoteBase with _$Note;

abstract class NoteBase with Store {
  @observable
  bool loading = false;

  @observable
  String note = "";

  @action
  String onChanged(String value) {
    note = value;
    return note;
  }

  List<List<int>> chave = [
    [2, 1],
    [7, 4]
  ];

  List<List<int>> chaveInversa = [
    [4, -1],
    [-7, 2]
  ];

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @action
  Future<void> saveNote(String login, String pass) async {
    loading = true;

    final SharedPreferences prefs = await _prefs;
    await Future.delayed(const Duration(seconds: 2)).then((value) async {
      await prefs.setString('myNotes/${login.toLowerCase().trim()}$pass', note);
    });

    loading = false;
  }

  @action
  Future<String> getNote(String login, String pass) async {
    final SharedPreferences prefs = await _prefs;
    final docNote =
        prefs.getString('myNotes/${login.toLowerCase().trim()}$pass');

    if (docNote != null) {
      // print("Anotações de $login: $docNote");
      return note = docNote;
    } else {
      return note = "";
    }
  }

  List<List<String>> converterMatrizParaString(List<List<int>> matrizInt) {
    return matrizInt.map((linha) {
      return linha.map((valor) => valor.toString()).toList();
    }).toList();
  }

  @action
  Future<void> cript(String login, String pass) async {
    //Pega as Anotações
    final myNote = await getNote(login, pass);
    //Transforma em Matriz
    final noteMatriz = changeNoteToMatriz(myNote);
    //Multiplica pela Chave
    final encriptedNote = multiplicarMatriz(noteMatriz, chave);
    //Transforma em uma matriz de String
    List<List<String>> stringEncriptedNote =
        converterMatrizParaString(encriptedNote);

    String noteToBeSaved = "";

    //Junta tudo em uma única variável
    stringEncriptedNote.map((linha) {
      return linha.map((item) {
        noteToBeSaved += "$item ";
      }).toList();
    }).toList();

    note = noteToBeSaved;

    //Salva a anotação criptografada

    await saveNote(login, pass);
  }

  @action
  Future<void> deCript(String login, String pass) async {
    //Pega as Anotações
    final myNote = await getNote(login, pass);
    //Converte para uma matriz inteira novamente
    final noteEncriptedMatriz =
        changeEncriptedNoteToMatriz(myNote.trimLeft().trimRight());
    //Descriptografa a Matriz
    final decriptedMatrizNote =
        multiplicarMatriz(noteEncriptedMatriz, chaveInversa);
    //Transforma tudo em texto Novamente
    final thisNote =
        changeMatrizToNote(decriptedMatrizNote).trimLeft().trimRight();

    note = thisNote;
    //Salva as Anotações

    await saveNote(login, pass);
  }

  //Transforma o texto Criptografdo em matriz
  List<List<int>> changeEncriptedNoteToMatriz(String note) {
    List<int> numeros =
        note.split(' ').map((numero) => int.parse(numero)).toList();
    int numeroDeColunas = 2;

    // Verifica se o número total de elementos é divisível por 2
    if (numeros.length % numeroDeColunas != 0) {
      throw Exception("O número de elementos na string não é divisível por 2.");
    }

    List<List<int>> matriz = [];

    for (int i = 0; i < numeros.length; i += numeroDeColunas) {
      matriz.add(numeros.sublist(i, i + numeroDeColunas));
    }

    return matriz;
  }

  //Transforma o Texto em uma Matriz De Inteiros Nx2
  List<List<int>> changeNoteToMatriz(String note) {
    final matriz = <List<int>>[];

    final noteStringList = note.characters.toList();
    int pos = 0;

    for (int i = 0; i < (noteStringList.length / 2).floor(); i++) {
      final matrizLinha = <int>[];

      for (int j = 0; j < 2; j++) {
        int? letra = noteStringList[pos].codeUnits.single;

        matrizLinha.add(letra);
        pos++;
      }

      matriz.add(matrizLinha);
    }
    return matriz;
  }

  String changeMatrizToNote(List<List<int>> matriz) {
    List<int> codeUnits = [];

    // Concatenando os codeUnits da matriz
    for (var linha in matriz) {
      codeUnits.addAll(linha);
    }

    // Criando a string a partir dos codeUnits
    String texto = String.fromCharCodes(codeUnits);

    return texto;
  }

  List<List<int>> multiplicarMatriz(
    List<List<int>> matrizA,
    List<List<int>> matrizB,
  ) {
    int linhasA = matrizA.length;
    int colunasA = matrizA[0].length;
    int linhasB = matrizB.length;
    int colunasB = matrizB[0].length;

    // Verifica se as matrizes são multiplicáveis
    if (colunasA != linhasB) {
      throw Exception(
          "Número de colunas de A deve ser igual ao número de linhas de B");
    }

    // Inicializa a matriz resultante com zeros
    List<List<int>> resultado =
        List.generate(linhasA, (i) => List<int>.filled(colunasB, 0));

    // Realiza a multiplicação
    for (int i = 0; i < linhasA; i++) {
      for (int j = 0; j < colunasB; j++) {
        for (int k = 0; k < colunasA; k++) {
          resultado[i][j] += matrizA[i][k] * matrizB[k][j];
        }
      }
    }
    return resultado;
  }
}
