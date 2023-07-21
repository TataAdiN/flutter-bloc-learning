import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {Key? key,
        required this.title,
        required this.errorText,
        this.controller,
        this.isEmail = false,
        this.isReadOnly = false,
        this.extErrorText,
        this.helper})
      : super(key: key);
  final TextEditingController? controller;
  final String title;
  final String errorText;
  final bool isEmail;
  final bool isReadOnly;
  final String? extErrorText;
  final String? helper;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isReadOnly,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        if(isEmail){
          if(!!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
            return "Mohon masukan email yang valid";
          }
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10),
          labelText: title,
          helperText: helper,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          errorText: extErrorText
      ),
    );
  }
}