import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextCamp extends StatelessWidget{

  TextCamp({this.label, this.prefix, this.sufix, this.onChanged, this.inputType, this.obscure, this.controller, this.enabledCamp});

  final String label;
  final IconData prefix;
  final Icon sufix;
  final Function (String) onChanged;
  final TextInputType inputType;
  final bool obscure;
  final bool enabledCamp;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure == null ? false : obscure,
      enabled: enabledCamp == null ? true : enabledCamp,
      controller: controller,
      onChanged: onChanged,
      maxLines: 1,
      cursorColor: Color(0xFF7D2941),
      keyboardType: inputType,
      textAlign: TextAlign.left,
      decoration: InputDecoration(

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF4B2637),width: 2.5)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF7D2941), width: 2.5)
        ),
        prefixIcon: Icon(prefix, color: Color(0xFFB3A2A2), ),
        labelText: label,
        suffixIcon: sufix,
        hoverColor: Color(0xFFB3A2A2),
        labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
             ),
      style: TextStyle(color: Colors.black, fontSize: 18.0),
    );
  }
}