import 'package:criptografia_anotacoes/colors/colors.dart';
import 'package:criptografia_anotacoes/stores/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginCard extends StatelessWidget {
  LoginCard({super.key});

  final userController = User();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.person_alt_circle,
                    color: MyColors().secondColor,
                    size: 64,
                  ),
                  Icon(
                    CupertinoIcons.book_circle,
                    color: MyColors().secondColor,
                    size: 64,
                  ),
                ],
              ),
            ),
            TextField(
              keyboardType: TextInputType.name,
              onChanged: userController.onChangedLogin,
              decoration: InputDecoration(
                icon: const Icon(Icons.person),
                fillColor: Colors.blueGrey.shade100,
                filled: true,
                labelText: 'Insira seu Usuário',
                labelStyle: const TextStyle(color: Colors.black),
                hintText: "Digite Aqui!",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              onChanged: userController.onChangedPassword,
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
            const SizedBox(height: 16),
            Observer(builder: (context) {
              return ElevatedButton(
                onPressed: userController.buttonValid
                    ? () async {
                        await userController.entrar(context);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors().secondColor),
                child: !userController.loading
                    ? const Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white),
                      )
                    : const CircularProgressIndicator(),
              );
            })
          ],
        ),
      ),
    );
  }
}
