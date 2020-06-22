import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:psicoapp/stores/consulta_reg_store.dart';
import 'package:psicoapp/stores/perfil_store.dart';
import 'package:psicoapp/widgets/myCustomClipB.dart';

class PerfilPaciente extends StatelessWidget {

  int idPaciente;

  @override
  Widget build(BuildContext context) {
    PerfilStore perfilStore = Provider.of<PerfilStore>(context);
    ConsultaRegStore consultaRegStore = Provider.of<ConsultaRegStore>(context);
    idPaciente = perfilStore.posPaciente;
    print(idPaciente);
    print(perfilStore.especialista.atende[idPaciente].paciente.nome);
    return Scaffold(
      appBar:  AppBar(
        title: Text("Perfil do Paciente"),
        backgroundColor: Color(0xFF4B2637),
      ),
      body: Stack(
        children: <Widget>[
          Observer(
            builder: (context){
              return Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                color: Color(0xFFE9E3E3),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Icon(Icons.account_box, size: 80, color: Color(0xFFB3A2A2),),
                      ),
                      Text(perfilStore.especialista.atende[idPaciente].paciente.nome, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(height: 20,),
                      Card(
                          color: Color(0xFFE9E3E3),
                          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.transparent)),
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10,bottom: 10, top:10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.contact_mail, color: Color(0xFFB3A2A2),),
                                    SizedBox(width: 10,),
                                    Text('CPF:', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 10,),
                                    Text(perfilStore.especialista.atende[idPaciente].paciente.cPF, style: TextStyle(color: Color(0xFF7D2941), fontSize: 18),maxLines: 2),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.date_range, color: Color(0xFFB3A2A2),),
                                    SizedBox(width: 10,),
                                    Text('Data de Nascimento:', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 10,),
                                    Text( perfilStore.especialista.atende[idPaciente].paciente.dataNascimento.split('-').last +
                                        "/" + perfilStore.especialista.atende[idPaciente].paciente.dataNascimento.split('-')[1] +
                                        "/" + perfilStore.especialista.atende[idPaciente].paciente.dataNascimento.split('-').first
                                      , style: TextStyle(color: Color(0xFF7D2941), fontSize: 18),maxLines: 2),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.card_membership, color: Color(0xFFB3A2A2),),
                                    SizedBox(width: 10,),
                                    Text('SUS:', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 10,),
                                    Text(perfilStore.especialista.atende[idPaciente].paciente.sus.toString(), style: TextStyle(color: Color(0xFF7D2941), fontSize: 18),maxLines: 2,),
                                  ],
                                )
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
              bottom: 0,
              child: GestureDetector(
                onTap: (){
                  consultaRegStore.dispose();
                  Navigator.of(context).pushNamed('/AddNewConsulta');
                  },
                child:  Column(
                  children: <Widget>[
                    ClipPath(
                      clipper: MyCustomClipB(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        //MediaQuery.of(context).size.height/5,
                        decoration: BoxDecoration(
                            color: Color(0xFF4B2637)
                        ),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFF4B2637),
                        ),
                        child: Text(
                          "Adicionar Consulta",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
/**/