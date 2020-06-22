import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psicoapp/widgets/emotionTile.dart';
import 'package:psicoapp/widgets/textCamp.dart';

class AnaliseVideo extends StatelessWidget {

  AnaliseVideo({this.depressao, this.emotion1, this.emotion2, this.emotion3, this.dataAnalise});

  final bool depressao;
  final String emotion1;
  final String emotion2;
  final String emotion3;
  final String dataAnalise;

  @override
  Widget build(BuildContext context) {
      return Card(
        color: Color(0xFFE9E3E3),
        shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent),borderRadius: BorderRadius.circular(20)),
        elevation: 14,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Checkbox(
                    onChanged: (bool){},
                    value: depressao == null ? false : depressao,
                    activeColor: Colors.red,
                  ),
                  SizedBox(width: 10,),
                  Text('Possível Depressão',style: TextStyle(fontSize: 18,color: Colors.black),)
                ],
              ),
              Divider(color: Color(0xFF7D2941),),
              EmotionTile(valor: emotion1,),
              Divider(color: Color(0xFF7D2941),),
              EmotionTile(valor: emotion2,),
              Divider(color: Color(0xFF7D2941),),
              EmotionTile(valor: emotion3,),
              Divider(color: Color(0xFF7D2941),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Data da análise: ",
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: Text(
                      dataAnalise,
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}