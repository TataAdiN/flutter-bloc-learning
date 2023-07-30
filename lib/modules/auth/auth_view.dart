import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../components/form/my_obsecurefield.dart';
import '../../components/form/my_textfield.dart';
import '../../components/my_button.dart';
import 'bloc/auth_bloc.dart';
import 'event/auth_login_event.dart';
import 'state/auth_fail.dart';
import 'state/auth_initial.dart';
import 'state/auth_loading.dart';
import 'state/auth_state.dart';
import 'state/auth_success.dart';

class AuthView extends StatelessWidget {
  AuthView({super.key});

  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final GlobalKey<FormState> formLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailState) {
              showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return dialog(context, state.message);
                  });
            }else if(state is AuthSuccessState){
              context.replaceNamed('post');
            }
          },
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return loadingIndicator(state.message);
            } else if (state is AuthInitialState) {
              return loginForm(context);
            } else if (state is AuthFailState) {
              return loginForm(context);
            } else {
              return Container();
            }
          },
        ));
  }

  Widget loginForm(BuildContext context) => Padding(
      padding: const EdgeInsets.all(10),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: formLogin,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(children: [
                  MyTextField(
                      controller: usernameCtrl,
                      title: 'Username',
                      errorText: 'username tidak boleh kosong'),
                  const SizedBox(height: 10),
                  MyObsecureField(
                      controller: passwordCtrl,
                      title: 'Password',
                      errorText: 'password tidak boleh kosong'),
                  MyButton(
                      onClick: () {
                        if (formLogin.currentState!.validate()) {
                          String username = usernameCtrl.text;
                          String password = passwordCtrl.text;
                          context.read<AuthBloc>().add(AuthLoginEvent(
                              username: username, password: password));
                        }
                      },
                      label: 'Login')
                ]),
              ),
            )),
      ]));

  Widget loadingIndicator(String message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 10),
            Text(message)
          ],
        ),
      );

  Widget dialog(BuildContext context, String message) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      color: Colors.white,
                      size: 32,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Login Fail',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            decoration: TextDecoration.none))
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          decoration: TextDecoration.none),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text("Tutup"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
