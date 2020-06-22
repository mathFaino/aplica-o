import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psicoapp/widgets/textCamp.dart';

class AppointmentCard extends StatelessWidget {

  AppointmentCard({this.nome, this.data, this.situacao, this.cod});

  final String nome;
  final String data;
  final bool situacao;
  final int cod;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Color(0xFFE9E3E3),
        elevation: 5,
        shape: Border(left: BorderSide(color: situacao == null ? Colors.red : Colors.green, width: 6,)),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
               Padding(
                 padding: EdgeInsets.only(left: 10, top: 3),
                 child:  Container(

                   padding: EdgeInsets.only(left: 4),
                   width: 70,
                   height: 20,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(40),
                     color: Color(0xFFE9E3E3),
                     boxShadow: [BoxShadow(
                       color: Colors.grey,
                       blurRadius: 5
                     )]
                   ),
                   child: Row(
                     children: <Widget>[
                       Text(
                         "Nº: ",
                         style: TextStyle(
                             color: Colors.black54,
                             fontSize: 14
                         ),
                       ),
                      Flexible(
                        child:  Text(
                          cod.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14
                          ),
                        ),
                      )
                     ],
                   ),
                 ),
               ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 6, top: 5,),
              child: Text(
                nome,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    data,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                    ),
                  ),
                Container(

                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Color(0xFFE9E3E3),

                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0
                      )],
                  ),
                  child: Center(
                    heightFactor: 30,
                    widthFactor: 30,
                    child:  Icon(
                      situacao == null ? Icons.report_problem : Icons.check_box,
                      color: situacao == null ? Colors.red : Colors.green,
                    ),
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        print("Tap'ado'");
        Navigator.of(context).pushNamed('/Consulta');
      },
    );
  }
}