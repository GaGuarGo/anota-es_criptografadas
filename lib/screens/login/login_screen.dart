import 'package:criptografia_anotacoes/colors/colors.dart';
import 'package:criptografia_anotacoes/screens/login/components/login_card.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors().secondColor,
        appBar: AppBar(
          backgroundColor: MyColors().secondColor,
          centerTitle: true,
          title: const Text(
            "Entre para Acessar suas Anotações",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: LoginCard(),
          ),
        ));
  }
}
