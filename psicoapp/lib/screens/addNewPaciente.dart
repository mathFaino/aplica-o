import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:psicoapp/stores/paciente_store.dart';
import 'package:psicoapp/stores/perfil_store.dart';
import 'package:psicoapp/widgets/textCamp.dart';

class AddnewPaciente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PacienteStore pacienteStore = PacienteStore();
    PerfilStore perfilStore = Provider.of<PerfilStore>(context);
    final double largura = MediaQuery.of(context).size.width;

    void seeDialog(context) {
      showDialog(
        context: context,
        child: Observer(
          builder: (_) {
            return pacienteStore.cadastrado == null
                ? AlertDialog(
                    title: Text('Carregando!'),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[CircularProgressIndicator()],
                    ),
                  )
                : pacienteStore.cadastrado == true
                    ? AlertDialog(
                        title: Text('Cadastrado com Sucesso!'),
                        content: Text(
                          'Você já pode verificar o paciente na página de pacientes!',
                          maxLines: 2,
                        ),
                        actions: <Widget>[
                          FlatButton(
                            color: Colors.green,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            onPressed: () {
                              perfilStore.recarregarPerfil();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.check,
                              color: Color(0xFFE9E3E3),
                            ),
                          )
                        ],
                      )
                    : AlertDialog(
                        title: Text('Erro ao cadastrar!'),
                        content: Text(
                          'Verifique as seguintes informações: \n' +
                              '\n' +
                              ' • Os campos devem ser preenchidos;\n',
                          maxLines: 10,
                        ),
                        actions: <Widget>[
                          FlatButton(
                            color: Color(0xFF7D2941),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.close,
                              color: Color(0xFFE9E3E3),
                            ),
                          )
                        ],
                      );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4B2637),
        elevation: 2,
        title: Text("Adicionar Novo Paciente"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xFFE9E3E3),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              TextFormField(
                enabled: true,
                onChanged: pacienteStore.changeNomeP,
                maxLines: 1,
                cursorColor: Color(0xFF7D2941),
                keyboardType: TextInputType.text,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4B2637),width: 2.5)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF7D2941), width: 2.5)
                  ),
                  prefixIcon: Icon(Icons.person, color: Color(0xFFB3A2A2), ),
                  labelText: 'Nome',
                  hoverColor: Color(0xFFB3A2A2),
                  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
              SizedBox(
                height: 10,
              ),
              TextCamp(
                enabledCamp: true,
                inputType: TextInputType.text,
                label: "CPF: ",
                prefix: Icons.recent_actors,
                onChanged: pacienteStore.changeCPF,
              ),
              SizedBox(
                height: 10,
              ),
              TextCamp(
                enabledCamp: true,
                inputType: TextInputType.text,
                label: "Cartão SUS: ",
                prefix: Icons.branding_watermark,
                onChanged: pacienteStore.changeSUS,
              ),
              SizedBox(
                height: 10,
              ),
              TextCamp(
                enabledCamp: true,
                inputType: TextInputType.text,
                label: "Data de Nascimento: ",
                prefix: Icons.event,
                onChanged: pacienteStore.changeDataNasc,
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                padding: EdgeInsets.only(
                    left: (largura * (10 / 100)),
                    right: (largura * (10 / 100)),
                    bottom: (largura * (4 / 100)),
                    top: (largura * (4 / 100))),
                color: Color(0xFF7D2941),
                onPressed: () {
                  pacienteStore.registrarPaciente(perfilStore.especialista.id);
                  seeDialog(context);
                },
                child: Text(
                  "Salvar",
                  style: TextStyle(fontSize: 18, color: Color(0xFFE9E3E3)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
