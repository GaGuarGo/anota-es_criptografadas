import 'package:criptografia_anotacoes/models/user_model.dart';
import 'package:criptografia_anotacoes/screens/note/components/confimation_alert.dart';
import 'package:criptografia_anotacoes/stores/note.dart';
import 'package:criptografia_anotacoes/stores/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../colors/colors.dart';

// ignore: must_be_immutable
class NoteScreen extends StatefulWidget {
  UserModel user;
  NoteScreen({super.key, required this.user});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final userController = User();
  final noteController = Note();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().secondColor,
      appBar: AppBar(
        backgroundColor: MyColors().secondColor,
        centerTitle: true,
        title: Text(
          "Minhas Anotações - ${widget.user.name}",
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              noteController.saveNote(widget.user.name!, widget.user.password!);
            },
            icon: const Icon(
              CupertinoIcons.checkmark_alt_circle_fill,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () async {
                final confirmedPassword = await showDialog(
                    context: context,
                    builder: (context) => ConfirmationAlert());

                if (confirmedPassword == "") {
                } else if (confirmedPassword == widget.user.password!) {
                  noteController.cript(
                      widget.user.name!, widget.user.password!);
                } else {
                  callSnackBar();
                }
              },
              icon: const Icon(
                CupertinoIcons.lock,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () async {
                final confirmedPassword = await showDialog(
                    context: context,
                    builder: (context) => ConfirmationAlert());
                if (confirmedPassword == "") {
                } else if (confirmedPassword == widget.user.password!) {
                  noteController.deCript(
                      widget.user.name!, widget.user.password!);
                } else {
                  callSnackBar();
                }
              },
              icon: const Icon(
                CupertinoIcons.lock_open,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                userController.sair(context);
              },
              icon: const Icon(
                Icons.exit_to_app_rounded,
                color: Colors.white,
              )),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Observer(builder: (context) {
              if (!noteController.loading) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<String>(
                      future: noteController.getNote(
                          widget.user.name!, widget.user.password!),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return const CircularProgressIndicator();
                          case ConnectionState.active:
                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'[Z0-9]'))
                                ],
                                keyboardType: TextInputType.none,
                                initialValue: snapshot.data,
                                onChanged: noteController.onChanged,
                                expands: true,
                                maxLines: null,
                                minLines: null,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Digite Aqui Suas Anotações'),
                              );
                            }
                        }
                      }),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("SALVANDO......"),
                      const SizedBox(width: 24),
                      LinearProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation(MyColors().secondColor),
                      )
                    ],
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }

  void callSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Senha Não Correspondente!",
          style: TextStyle(color: Colors.white),
        )));
  }
}
