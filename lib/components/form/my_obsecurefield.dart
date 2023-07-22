import 'package:flutter/material.dart';

import 'my_obsecurefieldstate.dart';

class MyObsecureField extends StatefulWidget
{
  const MyObsecureField({
    Key? key,
    required this.controller,
    required this.title,
    required this.errorText,
    this.isReadOnly = false,
    this.extErrorText
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final String errorText;
  final bool isReadOnly;
  final String? extErrorText;

  @override
  MyObsecureState createState()=> MyObsecureState();
}