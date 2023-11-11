import 'package:flutter/material.dart';

class ConfirmationAlert extends StatelessWidget {
  ConfirmationAlert({super.key});

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text("Confirme sua Senha!"),
      content: TextField(
        controller: _textController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          icon: const Icon(Icons.lock),
          fillColor: Colors.blueGrey.shade100,
          filled: true,
          labelText: 'Insira sua Senha',
          labelStyle: const TextStyle(color: Colors.black),
          hintText: "Digite Aqui!",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context, "");
            },
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.red),
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context, _textController.text);
            },
            child: const Text(
              "Confirmar",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
