
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:psicoapp/stores/consulta_list_store.dart';
import 'package:psicoapp/stores/consulta_store.dart';
import 'package:psicoapp/stores/perfil_store.dart';

class ListaConsultas extends StatefulWidget {

  ListaConsultas({Key key, this.id}) : super(key: key);
  final int id;
  @override
  _ListaConsultasState createState() => _ListaConsultasState();
}

class _ListaConsultasState extends State<ListaConsultas> {

  @override
  Widget build(BuildContext context) {
    ConsultaListStore consultaListStore = Provider.of<ConsultaListStore>(context);
    consultaListStore.listConsultas(widget.id.toString());
    ConsultaStore consultaStore = Provider.of<ConsultaStore>(context);
    PerfilStore perfilStore = Provider.of<PerfilStore>(context);

    if(perfilStore.especialista == null){
      perfilStore.setPerfil(widget.id);
    }
    return Container(
      alignment: Alignment.center,
      /*
        * quando utilizar os dados vindo da API modificar o tamanho do container de acordo com a quantidade de itens
        * */
      height: MediaQuery.of(context).size.height - 56,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      color: Color(0xFFE9E3E3),
      child: Observer(
        builder: (BuildContext context){
          return (consultaListStore.consultas == null) ?
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(5),
            child:  CircularProgressIndicator(),
          ): consultaListStore.consultas.consulta.isEmpty ?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Icon(Icons.assignment_late, color: Colors.amber, size: 80,),
              Text('Ainda não foram realizadas consultas!',
                style: TextStyle(fontSize: 18),),
            ],
          )
              :
          ListView.builder(
            physics: BouncingScrollPhysics() ,
              itemCount: consultaListStore.consultas.consulta.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  child: Card(
                    color: Color(0xFFE9E3E3),
                    elevation: 5,
                    shape: Border(left: BorderSide(color: consultaListStore.consultas.consulta[index].analiseVideo == null ? Colors.red : Colors.green, width: 6,)),
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
                                        consultaListStore.consultas.consulta[index].id.toString(),
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
                            consultaListStore.consultas.consulta[index].paciente.nome.split(' ').first,
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
                                consultaListStore.consultas.consulta[index].data.split('T').first,
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
                                    consultaListStore.consultas.consulta[index].analiseVideo == null ? Icons.report_problem : Icons.check_box,
                                    color: consultaListStore.consultas.consulta[index].analiseVideo == null ? Colors.red : Colors.green,
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
                    print(consultaListStore.consultas.consulta[index].relatorio);
                    consultaStore.setConsulta(index);
                    Navigator.of(context).pushNamed('/Consulta');
                  },
                );
              });
        },
      )
    );
  }
}



/*
Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20,),
            AppointmentCard(nome: "Matheus Marques Faino", data: "20/10/2020", cod: 1, ),
            AppointmentCard(nome: "Theo Marques Faino", data: "20/10/2020", cod: 2),
            AppointmentCard(nome: "Matheus Marques Faino", data: "20/10/2020", situacao: true, cod: 3),
            AppointmentCard(nome: "Luana Borges", data: "20/10/2020", situacao: true, cod: 4),
            AppointmentCard(nome: "Matheus Marques Faino", data: "20/10/2020", situacao: true, cod: 5),
            AppointmentCard(nome: "Matheus Marques Faino", data: "20/10/2020", situacao: true, cod: 6),
            AppointmentCard(nome: "Matheus Marques Faino", data: "20/10/2020", situacao: true, cod: 7),
            AppointmentCard(nome: "Matheus Marques Faino", data: "20/10/2020", situacao: true, cod: 8),
            AppointmentCard(nome: "Matheus Marques Faino", data: "20/10/2020", situacao: true, cod: 9),
            AppointmentCard(nome: "Matheus Marques Faino", data: "20/10/2020", situacao: true, cod: 10),
            AppointmentCard(nome: "Matheus Marques Faino", data: "20/10/2020", situacao: null, cod: 11),
            AppointmentCard(nome: "Matheus Marques Faino", data: "20/10/2020", situacao: null,cod: 12),
          ],
        ),
 */