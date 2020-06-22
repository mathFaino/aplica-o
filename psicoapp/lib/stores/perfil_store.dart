import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:psicoapp/consts/constsAPI.dart';
import 'package:psicoapp/models/especialista.dart';
import 'package:psicoapp/models/trueSpecialist.dart';

part 'perfil_store.g.dart';

class PerfilStore = _PerfilStore with _$PerfilStore;

abstract class _PerfilStore with Store{
  @observable
  int posPaciente;

  @observable
  Especialista especialista;

  @observable
  int id;

  @action
  recarregarPerfil(){
    buscaEspecialista(id.toString()).then((value) {
      if(value != null){
        especialista = value;
      }
    });
  }

  @action
  setPerfil(v){
    id = v;
    buscaEspecialista(v.toString()).then((value) {
      if(value != null){
        especialista = value;
      }
    });
  }

  Future<Especialista> buscaEspecialista(id) async{
    try{
      final response = await http.get(ConstsAPi.baseApiURL+'especialista/?usuario=' + id);
      var trueResponse = response.body;
      var decodedJson = jsonDecode(trueResponse);
      TrueSpecialist person = TrueSpecialist.fromJson(decodedJson);
      return person.especialista[0];
    }catch(_){
      print(_);
      return null;
    }
  }

}