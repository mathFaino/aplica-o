import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psicoapp/screens/perfilPaciente.dart';

class PatienteTile extends StatelessWidget{

  PatienteTile({this.nome,this.data, this.func});

  final String nome;
  final String data;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Card(
        color: Color(0xFFE9E3E3),
        elevation: 5,
        shape: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF7D2941)) ),
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5, top: 3),
              child: Text(
                nome,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Divider(
              color: Color(0xFF7D2941),
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(left: 5, bottom: 2),
                child: Row(
                  children: <Widget>[
                    Text("Adicionado em: "),
                    Text(data, style: TextStyle(color: Color(0xFF4B2637) ),),
                  ],
                ),
              ),
              onTap: (){print("Data consulta");}
            ),
          ],
        ),

      ),
    );
  }

}