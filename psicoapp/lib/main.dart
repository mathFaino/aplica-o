import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psicoapp/screens/addPaciente.dart';
import 'package:psicoapp/screens/chooseVideo.dart';
import 'package:psicoapp/screens/consulta.dart';
import 'package:psicoapp/screens/home.dart';
import 'package:psicoapp/screens/listaConsultas.dart';
import 'package:psicoapp/screens/listaPacientes.dart';
import 'package:psicoapp/screens/perfil.dart';
import 'package:psicoapp/screens/addNewPaciente.dart';
import 'package:psicoapp/screens/addNewConsulta.dart';
import 'package:psicoapp/screens/addPaciente.dart';
import 'package:psicoapp/screens/perfilPaciente.dart';
import 'package:psicoapp/screens/cadastroEspecialista.dart';
import 'package:psicoapp/screens/login.dart';
import 'package:psicoapp/models/key.dart';
import 'package:psicoapp/stores/consulta_list_store.dart';
import 'package:psicoapp/stores/consulta_reg_store.dart';
import 'package:psicoapp/stores/consulta_store.dart';
import 'package:psicoapp/stores/login_store.dart';
import 'package:psicoapp/stores/perfil_store.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  static const String titulo = 'Psico-APP';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode actFocus = FocusScope.of(context);
        if (!actFocus.hasPrimaryFocus) {
          actFocus.unfocus();
        }
      },
      child: MultiProvider(
        providers: [
          Provider<LoginStore>(
            create: (_) => LoginStore(),
          ),
          Provider<PerfilStore>(
            create: (_) => PerfilStore(),
          ),
          Provider<ConsultaStore>(
            create: (_) => ConsultaStore(),
          ),
          Provider<ConsultaListStore>(
            create: (_) => ConsultaListStore(),
          ),
          Provider<ConsultaRegStore>(
            create: (_) => ConsultaRegStore(),
            dispose: ConsultaRegStore().dispose(),
          ),
        ],
        child: MaterialApp(
          title: titulo,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          home: Login(title: titulo),
          routes: <String, WidgetBuilder>{
            "/AddNewPaciente": (BuildContext context) => AddnewPaciente(),
            "/AddNewConsulta": (BuildContext context) => AddNewConsulta(),
            "/AddPaciente": (BuildContext context) => AddPaciente(),
            "/PerfilPaciente" : (BuildContext context) => PerfilPaciente(),
            "/Consulta": (BuildContext context) => Consulta(),
            "/Login": (BuildContext context) => Login(
                  title: titulo,
                ),
            "/Cadastro": (BuildContext context) => CadastroEspecialista(),
            "/Home": (BuildContext context) => MyHomePage(
                  title: titulo,
                ),
            "/Video" : (BuildContext context) => ChooseVideo()
          },
        ),
      ),
    );
  }
}
