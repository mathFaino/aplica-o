import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:psicoapp/consts/constsAPI.dart';
import 'package:psicoapp/models/consultas.dart';
import 'package:psicoapp/models/especialista.dart';
import 'package:psicoapp/models/trueSpecialist.dart';

part 'consulta_list_store.g.dart';

class ConsultaListStore = _ConsultaListStore with _$ConsultaListStore;

abstract class _ConsultaListStore with Store{
  @observable
  Consultas _consultas;

  @computed
  Consultas get consultas => _consultas;

  @action
  listConsultas(id){
    buscaEspecialista(id).then((value) {
      if(value != null){
        buscaConsultas(value.id.toString()).then((consult) {
          if(consult != null){
            _consultas = consult;
          }
        });
      }
    });
  }
  @action
  recarregarConsultas(id){
    buscaConsultas(id.toString()).then((consult) {
      if(consult != null){
        _consultas = consult;
      }
    });
  }

  Future<Consultas> buscaConsultas(n) async{
    try{
      final response = await http.get(ConstsAPi.baseApiURL+'consulta/?especialista='+ n,);
      var decodedJson = jsonDecode(response.body);
      return Consultas.fromJson(decodedJson);
    }catch(_){
      print(_);
      return null;
    }
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
