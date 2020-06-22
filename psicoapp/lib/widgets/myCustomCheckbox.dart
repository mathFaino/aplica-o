import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomCheckbox extends StatelessWidget{

  MyCustomCheckbox({this.text, this.prefix, this.onChanged, this.ativo});

  final String text;
  final IconData prefix;
  final Function onChanged;
  final bool ativo;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: ativo == null ? false : ativo,
          onChanged: onChanged,
          activeColor: Colors.green,
        ),
        Icon(prefix, color: Color(0xFFB3A2A2),),
        SizedBox(width: 5,),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}