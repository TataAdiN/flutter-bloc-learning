import 'package:flutter/material.dart';

import 'my_obsecurefield.dart';

class MyObsecureState extends State<MyObsecureField>
{
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.isReadOnly,
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty)
        {
          return widget.errorText;
        }else if(value.length < 8){
          return "Password terlalu pendek, masukan minimal 8 karakter";
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10),
          labelText: widget.title,
          labelStyle: const TextStyle(fontSize: 15),
          errorText: widget.extErrorText,
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isShow = !isShow;
                });
              },
              icon: isShow
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0))),
      obscureText: !isShow,
    );
  }
}