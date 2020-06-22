import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:psicoapp/stores/consulta_list_store.dart';
import 'package:psicoapp/stores/consulta_store.dart';
import 'package:psicoapp/stores/perfil_store.dart';
import 'package:psicoapp/widgets/analised_video.dart';
import 'package:psicoapp/widgets/myCustomCheckbox.dart';

class Consulta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConsultaStore consultaStore = Provider.of<ConsultaStore>(context);
    PerfilStore perfilStore = Provider.of<PerfilStore>(context);
    ConsultaListStore consultaListStore = Provider.of<ConsultaListStore>(context);
    var id = consultaStore.item;
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta"),
        backgroundColor: Color(0xFF4B2637),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        decoration: BoxDecoration(color: Color(0xFFE9E3E3)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Observer(
                builder: (_) {
                  return Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Paciente: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Flexible(
                            child: Text(
                              consultaListStore.consultas.consulta[id].paciente.nome,
                              style: TextStyle(fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Color(0xFF7D2941),
                      ),
                      Card(
                          color: Color(0xFFE9E3E3),
                          elevation: 10,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Especialista: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Flexible(
                                      child: Text(
                                        perfilStore.especialista.nome,
                                        style: TextStyle(fontSize: 18),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "CRM/CRP: ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Flexible(
                                      child: Text(
                                        perfilStore.especialista.crp == ''
                                            ? perfilStore.especialista.crm
                                            : perfilStore.especialista.crp,
                                        style: TextStyle(fontSize: 18),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: ShapeDecoration(
                            shape: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF7D2941), width: 2.5))),
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width - 10,
                        height: 180,
                        child: SingleChildScrollView(
                          child: Text(
                            consultaListStore.consultas.consulta[id].relatorio,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 100,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 18),
                          ),
                          physics: BouncingScrollPhysics(),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      MyCustomCheckbox(
                        prefix: Icons.airline_seat_individual_suite,
                        text: "Sono Alterado",
                        onChanged: (_) {},
                        ativo: consultaListStore.consultas.consulta[id].sonoAlterado,
                      ),
                      MyCustomCheckbox(
                        prefix: Icons.fastfood,
                        text: "Apetite Alterado",
                        onChanged: (_) {},
                        ativo: consultaListStore.consultas.consulta[id].apetiteAlterado,
                      ),
                      MyCustomCheckbox(
                        prefix: Icons.fitness_center,
                        text: "Peso Alterado",
                        onChanged: (_) {},
                        ativo: consultaListStore.consultas.consulta[id].pesoAlterado,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Data: ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Flexible(
                            child: Text(
                              consultaListStore.consultas.consulta[id].data
                                      .split('T')
                                      .first
                                      .split('-')
                                      .first +
                                  "/" +
                                  consultaListStore.consultas.consulta[id].data
                                      .split('T')
                                      .first
                                      .split('-')[1] +
                                  "/" +
                                  consultaListStore.consultas.consulta[id].data
                                      .split('T')
                                      .first
                                      .split('-')
                                      .last,
                              style: TextStyle(fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
              Observer(
                builder: (_) {
                  return consultaListStore.consultas.consulta[id].analiseVideo != null
                      ? AnaliseVideo(
                          depressao: consultaListStore.consultas.consulta[id].analiseVideo.possivelDepressao,
                          emotion1: consultaListStore.consultas.consulta[id].analiseVideo.porcentagemEmocao1,
                          emotion2: consultaListStore.consultas.consulta[id].analiseVideo.porcentagemEmocao2,
                          emotion3: consultaListStore.consultas.consulta[id].analiseVideo.porcentagemEmocao3,
                          dataAnalise: '10/06/2020',
                        )
                      : consultaStore.analisando == false
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  color: Color(0xFF4B2637),
                                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                                  child: Text(
                                    'Fazer Análise de Vídeo',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFFE9E3E3)),
                                  ),
                                  onPressed: () {
                                    consultaStore.analisarVideo(consultaListStore.consultas.consulta[id].video,
                                      consultaListStore.consultas.consulta[id].id,
                                      perfilStore.especialista.id,
                                      consultaListStore.recarregarConsultas,);
                                  },
                                )
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircularProgressIndicator()
                                  ],
                                )
                              ],
                            );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
