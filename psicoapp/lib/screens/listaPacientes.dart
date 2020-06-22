import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:psicoapp/stores/perfil_store.dart';
import 'package:psicoapp/widgets/myCustomClip.dart';
import 'package:psicoapp/widgets/patientTile.dart';

class ListaPaciente extends StatelessWidget {
  const ListaPaciente({Key key, this.id}) : super(key: key);
  final id;
  @override
  Widget build(BuildContext context) {
    PerfilStore perfilStore = Provider.of<PerfilStore>(context);
    if(perfilStore.especialista == null) {
      perfilStore.setPerfil(id);
    }
    return Stack(
      children: <Widget>[
        Container(
          //height: MediaQuery.of(context).size.height - 56,
          padding: EdgeInsets.fromLTRB(10, 110, 10, 0),
          color: Color(0xFFE9E3E3),
          child: Observer(
            builder: (_){
              return perfilStore.especialista == null ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                  ),
                  CircularProgressIndicator()
                ],
              )
                :
                perfilStore.especialista.atende == null ?
                  Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     SizedBox(
                       width: MediaQuery.of(context).size.width,
                     ),
                     Icon(Icons.assignment_late, color: Colors.amber, size: 80,),
                     Text('Ainda não há pacientes relacionados!',
                       style: TextStyle(fontSize: 18),),

                   ],
                  )
                  :
              ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemCount: perfilStore.especialista.atende.length,
                  itemBuilder: (context, index){
                    return  PatienteTile(nome: perfilStore.especialista.atende[index].paciente.nome,
                    data: perfilStore.especialista.atende[index].data.split('-').last +
                        "/" + perfilStore.especialista.atende[index].data.split('-')[1] +
                      "/" + perfilStore.especialista.atende[index].data.split('-').first
                      , func: (){
                        perfilStore.posPaciente = index;
                        print("Perfil Paciente");
                        Navigator.of(context).pushNamed('/PerfilPaciente');
                      },
                    );
                  });
            },
          ),
        ),
        Positioned(
            top: 0,
            child: Column(
              children: <Widget>[
                Container(

                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 40, left: 10, right: 10),
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
    );
  }
}



/**/