import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:provider/provider.dart';
import 'package:psicoapp/screens/perfil.dart';
import 'package:psicoapp/stores/login_store.dart';

import 'listaConsultas.dart';
import 'listaPacientes.dart';

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginStore loginStore = Provider.of<LoginStore>(context);
    return Scaffold(
      /*appBar:
        AppBar(
          title:
            Text("Psico",
              style:
                TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25
                ),
          ),centerTitle: true,
        ),
*/    floatingActionButton: BoomMenu(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      //child: Icon(Icons.add),
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      scrollVisible: true,
      overlayColor: Colors.black,
      overlayOpacity: 0.7,
      backgroundColor: Color(0xFF7D2941),
      children: [
        MenuItem(
          child: Icon(Icons.event_seat, color: Colors.black),
          title: "Consultas",
          titleColor: Colors.white,
          subtitle: "Você pode registrar novas consultas",
          subTitleColor: Colors.white,
          backgroundColor: Color(0xFF7D2941),
          onTap: (() => Navigator.of(context).pushNamed('/AddNewConsulta')),
        ),
        MenuItem(
          child: Icon(Icons.person, color: Colors.black),
          title: "Pacientes",
          titleColor: Colors.white,
          subtitle: "Adicionar paciente já registrado",
          subTitleColor: Colors.white,
          backgroundColor: Colors.blue[900],
          onTap: (() => Navigator.of(context).pushNamed('/AddPaciente')),
        ),
        MenuItem(
          child: Icon(Icons.person_add, color: Colors.black),
          title: "Pacientes",
          titleColor: Colors.white,
          subtitle: "Adicionar novo paciente",
          subTitleColor: Colors.white,
          backgroundColor: Colors.blue[900],
          onTap: (() => Navigator.of(context).pushNamed('/AddNewPaciente')),
        ),
      ],
    ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            ListaConsultas(id: loginStore.user.id,),
            Perfil(id: loginStore.user.id),
            ListaPaciente(id: loginStore.user.id),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        backgroundColor: Color(0xFF4B2637),
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Consultas'),
              icon: Icon(Icons.event_seat),
              activeColor: Color(0xFFE9E3E3)
          ),
          BottomNavyBarItem(
              title: Text('Perfil'),
              icon: Icon(Icons.person),
              activeColor: Color(0xFFE9E3E3)
          ),
          BottomNavyBarItem(
              title: Text('Pacientes'),
              icon: Icon(Icons.assignment),
              activeColor: Color(0xFFE9E3E3)
          ),
        ],
      ),
    );
  }

}