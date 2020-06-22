import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final IconData icone;
  final String titulo;
  //final PageController controller;
  final String valor;

  ItemTile({this.icone, this.titulo, this.valor});

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.only(left: 5),
          height: 38,
          color: Colors.transparent,
          child: Row(
            children: <Widget>[
              Icon(
                icone,
                color: Color(0xFFB3A2A2),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "$titulo: ",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 5),
             Flexible(
               child:  Text(
                 valor,
                 overflow: TextOverflow.ellipsis,
                 style: TextStyle(
                   fontSize: 18,
                   color: Color(0xFF7D2941),
                 ),
               ),
             )
            ],
          ),

    );
  }
}
