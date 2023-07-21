import 'package:bloc_learning/components/form/my_obsecurefield.dart';
import 'package:bloc_learning/components/form/my_textfield.dart';
import 'package:bloc_learning/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              const MyTextField(
                  title: 'Username', errorText: 'username tidak boleh kosong'),
              const SizedBox(height: 10),
              MyObsecureField(
                  controller: controller,
                  title: 'Password',
                  errorText: 'password tidak boleh kosong'),
              MyButton(
                  onClick: () => context.pushNamed('detail'), label: 'Login')
            ])));
  }
}
