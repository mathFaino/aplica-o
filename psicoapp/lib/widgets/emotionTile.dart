import 'package:flutter/material.dart';

class EmotionTile extends StatelessWidget {
  final String valor;


  EmotionTile({this.valor});

  @override
  Widget build(BuildContext context) {

    var palavras = valor.replaceAll(':', '').split(' ');

    return Container(
      margin: EdgeInsets.only(left: 5),
      width: MediaQuery.of(context).size.width - 10,
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Emoção: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                palavras[0] + " -",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    ),
              ),
              SizedBox(width: 5),
              Flexible(
                child:  Text(
                  palavras[1] + '%',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black
                    // Color(0xFF7D2941)
                    ,
                  ),
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}
