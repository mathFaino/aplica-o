import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:psicoapp/stores/perfil_store.dart';
import 'package:psicoapp/widgets/itemTile.dart';

class Perfil extends StatelessWidget {
  Perfil({this.id});

  final id;

  @override
  Widget build(BuildContext context) {
    PerfilStore perfilStore = Provider.of<PerfilStore>(context);
    if(perfilStore.especialista == null){
      perfilStore.setPerfil(id);
    }
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: (MediaQuery.of(context).size.height - 56) / 3,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF4B2637),
              ),
              Container(
                height: (MediaQuery.of(context).size.height - 56) -
                    ((MediaQuery.of(context).size.height - 56) / 3),
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFE9E3E3),
              ),
            ],
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height - 56) / 5,
            child: Column(
              children: <Widget>[
                Observer(builder: (_) {
                  return Container(
                      child: perfilStore.especialista != null ?
                      CircleAvatar(
                        backgroundImage: perfilStore.especialista.imagemPerfil == null ?
                        AssetImage('images/imagem.jpg')
                            :
                        NetworkImage(perfilStore.especialista.imagemPerfil)
                        ,
                        radius: 101,
                        backgroundColor: Color(0xFFE9E3E3),
                      ) :
                          CircleAvatar(
                            backgroundColor:Color(0xFFE9E3E3) ,
                            radius: 101,
                            child: CircularProgressIndicator(),
                          ),
                      padding: const EdgeInsets.all(2.0), // borde width
                      decoration: BoxDecoration(
                        color: const Color(0xFF7D2941), // border color
                        shape: BoxShape.circle,
                      ));
                }),
                Observer(
                  builder: (_){
                    return perfilStore.especialista != null ?
                    Column(
                      children: <Widget>[
                        Text(
                          perfilStore.especialista.nome,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Card(
                            margin: EdgeInsets.all(10),
                            color: Color(0xFFE9E3E3),
                            elevation: 10,
                            shape: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ItemTile(
                                    icone: Icons.branding_watermark,
                                    titulo: "CRM",
                                    valor: perfilStore.especialista.crm,
                                  ),
                                  ItemTile(
                                    icone: Icons.recent_actors,
                                    titulo: "CRP",
                                    valor: perfilStore.especialista.crp,
                                  ),
                                  ItemTile(
                                    icone: Icons.contact_mail,
                                    titulo: "CPF",
                                    valor: perfilStore.especialista.cpf,
                                  ),
                                  ItemTile(
                                    icone: Icons.call,
                                    titulo: "Tel.",
                                    valor: perfilStore.especialista.telefone.toString(),
                                  ),
                                  ItemTile(
                                    icone: Icons.alternate_email,
                                    titulo: "Mail",
                                    valor: perfilStore.especialista.email,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ):
                        Padding(
                          padding: EdgeInsets.only(top: 100),
                          child: CircularProgressIndicator(),
                        );
                  },
                ),
              ],
            ),
          ),
          Positioned(
              right: 5,
              top: 35,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF7D2941),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.settings,
                      color: Color(0xFFE9E3E3),
                    ),
                  ),
                ),
                onTap: () {
                  print("teste");
                  perfilStore.especialista = null;
                  Navigator.of(context).popAndPushNamed('/Login');
                },
              )),
        ],
      ),
    );
  }
}

/*
* Positioned(
            left: 10,
            top: (MediaQuery.of(context).size.height - 56)/2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Nome: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Container(
                    child: Text(
                      "Jão Pedro Paulo de Paulina",
                      style: TextStyle(
                        color: Color(0xFF7D2941),
                        fontSize: 18,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color(0xFF4B2637), width: 4 )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "CRP: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Container(
                                child: Text(
                                  "21/12345",
                                  style: TextStyle(
                                    color: Color(0xFF7D2941),
                                    fontSize: 18,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Color(0xFF4B2637), width: 4 )),
                                ),
                              ),
                            ),
                          ]
                      ),
                      SizedBox(width: 20,),

                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "CRM: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Container(
                                child: Text(
                                  "21/123452",
                                  style: TextStyle(
                                    color: Color(0xFF7D2941),
                                    fontSize: 18,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Color(0xFF4B2637), width: 4 )),
                                ),
                              ),
                            ),
                          ]
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
* */
