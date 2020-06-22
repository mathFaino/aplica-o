import 'package:flutter/material.dart';
import 'package:psicoapp/widgets/myCustomClip.dart';
import 'package:psicoapp/widgets/patientTile.dart';

class AddPaciente extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Buscar Novo Paciente"),
        backgroundColor: Color(0xFF4B2637),
      ),
      body: Stack(
        children: <Widget>[
          Container(

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
            decoration: BoxDecoration(
                color: Color(0xFFE9E3E3),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 120,
                  ),
                  PatienteTile(nome: "Matheus da Silva", data: "20/10/2019",),
                  PatienteTile(nome: "Matheus Pereira", data: "20/10/2019",),
                  PatienteTile(nome: "Jõao Matheus Rocha", data: "20/10/2019",),
                  PatienteTile(nome: "Matheus Pedro Carvalho", data: "20/10/2019",),
                  PatienteTile(nome: "Theo Faino", data: "20/10/2019",),
                  PatienteTile(nome: "Matheus Faino", data: "20/10/2019",),
                  PatienteTile(nome: "João Pedro", data: "20/10/2019",),
                  PatienteTile(nome: "Cláudio Silva", data: "20/10/2019",),
                  PatienteTile(nome: "Luana Silva", data: "20/10/2019",),
                  PatienteTile(nome: "Monik Oliveira", data: "20/10/2019",),
                  PatienteTile(nome: "Scarlett Johanson", data: "20/10/2019",),
                  PatienteTile(nome: "Jackson Ferreira", data: "20/10/2019",),
                  PatienteTile(nome: "Ágata Marques", data: "20/10/2019",),
                  PatienteTile(nome: "Joan Watson", data: "20/10/2019",),
                ],
              ),
            ),
          ),
          Positioned(
              top: 0,
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                    height: 120,
                    decoration: BoxDecoration(
                      color: Color(0xFF4B2637),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width/1.35,
                          child: TextField(
                            maxLines: 1,
                            style: TextStyle(color: Color(0xFFE9E3E3)),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFE9E3E3)),borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green),borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                        MaterialButton(
                          height: 60,
                          child: Icon(Icons.search, color: Color(0xFFB3A2A2),size: 30,),
                          minWidth: MediaQuery.of(context).size.width/6,
                          onPressed: (){},
                          elevation: 5,
                          color: Color(0xFF7D2941),
                          shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(20)),
                        ),
                      ],
                    ),
                  ),

                  /*
                * Configurar o clipper após a construção
                * */
                  ClipPath(
                    clipper: MyCustomClip(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      //MediaQuery.of(context).size.height/5,
                      decoration: BoxDecoration(
                          color: Color(0xFF4B2637)
                      ),
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}