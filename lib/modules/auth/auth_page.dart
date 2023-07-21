import 'package:flutter/material.dart';

import 'auth_view.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthView(),
    );
  }
}